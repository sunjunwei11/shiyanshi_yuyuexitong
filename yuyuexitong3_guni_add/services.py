# -*- coding: utf-8 -*-



import random,exceptions
from exceptions import Exception
import re
import json
import time, datetime, logging, sqlite3, os, string, sys, StringIO, urllib,urlparse,shutil
from datetime import date
from datetime import *
from json import JSONDecoder
import bottle
from bottle import run, request,response, post, get, template, route, static_file, redirect, Bottle, HTTPResponse, HTTPError,debug,SimpleTemplate,abort
from beaker.middleware import SessionMiddleware
from plugins.bottle_MySQLPlugin import MySQLPlugin
from plugins.bottle_frontdoor import FrontDoorPlugin
from decimal import *
import MySQLdb
import base64 
#from cherrypy._cpwsgi import downgrade_wsgi_ux_to_1x
app = bottle.default_app()

#--------------------------------------------------------------------------------
from beaker.middleware import SessionMiddleware
import gevent
import datetime
import bottle,os
import mysql.connector
import json
from mysql.connector import connect
from bottle import run,route,template,static_file,request,error,Bottle,abort,\
    response,SimpleTemplate,debug,post,get
from bottle.ext.websocket import GeventWebSocketServer
from bottle.ext.websocket import websocket
#数据结构定义
ws_set = set()
app = Bottle()
Users_init = dict()#用于群聊，是初始用户列表
Usersid_group_inf=dict()
Usersname_group_inf=dict()
Usersgroup_shiyan_date=dict()#存放各小组的实验日期和时间
Users_init2 = list()#用于单独的私聊窗口，是初始用户列表
opposite = ''#用于存放私聊对象
Users_private = list()#用于私聊
Users_group = list()#用于小组讨论
Users_group1 = list()
Users_group2 = list()
shiyanzu1 = ['老师','学生1','学生2']
shiyanzu2 = ['老师','学生2','学生3']
pairs = []#用于存放聊天双方用户
members = []
group1 = []
group2 = []
siliaouser = ''#用来存放请求私聊的用户名字
ANWSER = []

class User:
    def __init__(self,wsocket):
        self.student_group = ''
        self.username = ''
        self.userid = ''
        self.wsocket = wsocket
        self.wsid = str(id(wsocket))
        self.date = ''
        self.message = ''
        self.datetime = ''
        self.status = '1'
        self.siliao = '0'

'''@app.route('/lib/<path:path>')
def server_lib(path): 
    return static_file(path, root='./html/lib/')'''

@app.route('/<name>')
def gethtml(name):    
    return static_file(name,root = './html/')

@app.route('/source/<name>')
def src_files(name):
    return static_file(name,root = './html/source/')

@app.route('/source/images/<name>')
def serv_images(name):
    return static_file(name,root = './html/source/images/')
#------------------------------------------------------------------------------------
@app.route('/tabs_daohanglan/:path#.+#')#老师聊天界面所需的东西
def server_tabs_daohanglan(path):
    return static_file(path,root='./tabs_daohanglan/')

@app.route('/js/:path#.+#')
def server_js(path):
    return static_file(path,root='js')

@app.route('/js-pub/:path#.+#')
def server_js_pub(path):
    return static_file(path,root='js-pub')

@app.route('/img/:path#.+#')
def server_img(path): 
    return static_file(path, root='img')

@app.route('/views/:path#.+#')
def server_views(path):
    return static_file(path,root='/views')

@app.route('/images/:path#.+#')
def server_images(path):
    return static_file(path,root='images')

@app.route('/lib/:path#.+#')
def server_lib2(path): 
    return static_file(path, root='lib')

@app.route('/themes/:path#.+#')
def server_themes(path):
    return static_file(path,root='themes')

@app.route('/test1/:path#.+#')
def server_test1(path):
    return static_file(path,root='test1')



@app.route('/css/:path#.+#')
def server_css(path):
    return static_file(path,root='css')

@app.route('/plugins/:path#.+#')
def server_plugins(path):
    return static_file(path,root='plugins')

@app.route('/kindeditor-4.1.10/:path#.+#')
def server_kindeditor(path):
    return static_file(path,root='kindeditor-4.1.10')


#测试SQLitePlugin插件为mysql插件做准备 
#sqlite = SQLitePlugin(dbfile='./tmpdb/test.db')
#app.install(sqlite)
frontdoor = FrontDoorPlugin(errorcode=None, backdoor=None)
app.install(frontdoor)
mysql = MySQLPlugin(dbfile='labtest')
app.install(mysql)

#-----------------------------上传及下载文件-------------------------------------------------
@app.route('/download')
def get_downloadfile(db):
    cr=db.cursor()
    cr.execute('''SELECT COUNT(filename) FROM savefiles''')
    file_number = cr.fetchall()
    file_number = file_number[0][0]
    print "一共可下载的文件数量: ",file_number
    cr.execute('''SELECT filename FROM savefiles''')
    file_names = cr.fetchall()
    print "可下载的文件的名字",file_names
    file_lists = []
    for i in file_names:
        file_lists.append(str(i[0]))
    print "file_lists: ",file_lists
    cr.close()
    return template('./html/download_file',file_number=file_number,file_lists=file_lists)

@app.route('/download/<filename>')
def server_download(filename):
    return static_file(filename,root='for_upload_download/',download=True)


upload_path = './for_upload_download'
@app.route('/upload',method='POST')
def do_upload(db):
    uploadfile=request.files.get('data') #获取上传的文件
    full_name=uploadfile.filename
    name,ext=os.path.splitext(full_name)
    print "文件名字",name,"后缀",ext
    try:
        uploadfile.save(upload_path,overwrite=False)#overwrite参数是指覆盖同名文件
        cr = db.cursor()
        cr.execute('''INSERT INTO savefiles (filename) VALUES (%(filename)s)''',{"filename":full_name})
        cr.close()
        return u"上传成功,文件名为：%s，文件类型为：%s"% (uploadfile.filename,uploadfile.content_type)
    except IOError:
        return u"该文件名已存在，若要继续上传，请更改文件名"

    
#-----------------------------上传及下载文件------------------+++++++++++++++++++++++++++++++
#++++++++++++++++++++++聊天部分内容==================================================================
@app.route('/hello/:name/:name2')#测试
def hello(name,name2): 
    return name+name2

@app.route('/get_session',method='POST')
def get_session():
    username=request.POST.get('username')
    mima=request.POST.get('mima')
    user_id = request.POST.get('user_id')
    print username,mima,user_id
    session =  request.environ['beaker.session']
    print "get_session sessionid:",id(session)
    session["user"]["username"] = username
    session["user"]["password"] = mima
    session["user"]["userid"] = user_id
    output = {"fistName":"true"}
    return output

@app.route('/liaotianui/:name/:screen_height')#返回聊天界面
def liaotianui(name,screen_height,db): 
    screen_height = int(screen_height)
    shiyan_name = name
    session =  request.environ['beaker.session']
    student_name = session["user"]["username"]
    student_id = session["user"]["userid"]
    print shiyan_name,student_name,student_id
    taolunzu_dict = {"guokong_shangshuixiang":"上水箱实验讨论组","guokong_danbihuan":"单闭环实验讨论组",
                     "guokong_chuanjikongzhi":"串级控制实验讨论组","guokong_shimisi":"史密斯实验讨论组"}#根据点击相应的讨论组，返回该讨论组的名称并显示
    taolunzu_name = taolunzu_dict[shiyan_name]#根据shiyan_name返回该讨论组的名称
    cr = db.cursor()
    cr.execute('''SELECT group_id FROM groupinf WHERE shiyan=%(shiyan_name)s AND stu_id=%(student_id)s''',
                  {"shiyan_name":shiyan_name,"student_id":student_id})#根据学生所做的实验名称和学生id，取出学生所在实验组的id，确认学生所在的聊天组
    group_id = cr.fetchall()
    cr.close()
    if (group_id):
        group_id = group_id[0][0]
    else:
        return "您不在此讨论组内，请选择合适的讨论组！"
    student_group = shiyan_name + str(group_id)
    shiyan_time = Usersgroup_shiyan_date[shiyan_name][student_group]
    print "shiyantime:",shiyan_time
    session["user"]["student_group"] = student_group
    print "group_id",group_id,"student_group",student_group,"session[user][student_group]:",session["user"]["student_group"]
    """for i in Usersid_group_inf[student_group]:
        print i
    for i in Usersname_group_inf[student_group]:
        print i"""
    student = {}
    k = len(Usersid_group_inf[student_group])
    print "lengtn",k
    for i in range(k):
        student[Usersid_group_inf[student_group][i]] = Usersname_group_inf[student_group][i]
    print "student:",student
    #student = {"黄莹莹":["黄莹莹","zhi1"],"李明闻":["李明闻","zhi2"],"伍浩":["伍浩","zhi3"],"邱艺铭":["邱艺铭","zhi3"]}
    if (screen_height>=1000):
        print "屏幕高度像素大于1000,screen_height:",screen_height,type(screen_height)
        return template('views/liaotianui',student=student,session = session,taolunzu_name= taolunzu_name,shiyan_time= shiyan_time)
    else:
        print "屏幕分辨率高度像素低于1000，返回像素较小的聊天界面 ,screen_height:",screen_height,type(screen_height)
        return template('views/liaotianuixiao',student=student,session = session,taolunzu_name= taolunzu_name,shiyan_time = shiyan_time)

@app.route('/teacher_liaotianui/:name')#返回老师查看所有聊天组的大界面
def teacher_liaotianui(name,db): 
    student_group = name
    session =  request.environ['beaker.session']
    student_name = session["user"]["username"]
    student_id = session["user"]["userid"]
    print student_name,student_id
    student_group_length = len(student_group)
    for i in range(student_group_length):
        if student_group[i] in ['0','1','2','3','4','5','6','7','8','9']:
            shiyan_length = i
            break
    shiyan_name = student_group[0:i]
    shiyan_time = Usersgroup_shiyan_date[shiyan_name][student_group]
    taolunzu_dict = {"guokong_shangshuixiang":"上水箱实验讨论组","guokong_danbihuan":"单闭环实验讨论组",
                     "guokong_chuanjikongzhi":"串级控制实验讨论组","guokong_shimisi":"史密斯实验讨论组"}#根据点击相应的讨论组，返回该讨论组的名称并显示
    taolunzu_name = taolunzu_dict[shiyan_name]#根据shiyan_name返回该讨论组的名称
    session["user"]["student_group"] = student_group
    print "student_group",student_group,"session[user][student_group]:",session["user"]["student_group"]
    """for i in Usersid_group_inf[student_group]:
        print i
    for i in Usersname_group_inf[student_group]:
        print i"""
    student = {}
    k = len(Usersid_group_inf[student_group])
    print "lengtn",k
    for i in range(k):
        student[Usersid_group_inf[student_group][i]] = Usersname_group_inf[student_group][i]
    print "student:",student
    return template('views/liaotianui',student=student,session = session,taolunzu_name= taolunzu_name,shiyan_time = shiyan_time)


@app.route('/teacherui')
def teacherui(db):
    session =  request.environ['beaker.session']
    teacher_name = session["user"]["username"]
    teacher_id = session["user"]["userid"]
    print "teacher_information:",teacher_name,teacher_id
    wenjianshu_dict = {"guokong_shangshuixiang":["上水箱对象特性","上水箱讨论组"],"guokong_danbihuan":["液位单闭环控制","单闭环讨论组"],
                     "guokong_chuanjikongzhi":["流量液位串级控制","串级控制讨论组"],"guokong_shimisi":["史密斯预估实验","史密斯讨论组"]}
    return template('tabs_daohanglan/demo/teacherui.tpl',session = session,Usersgroup_shiyan_date=Usersgroup_shiyan_date,wenjianshu_dict=wenjianshu_dict)

@app.route('/teacherbaogao')
def teacherbaogao():
    return template('tabs_daohanglan/demo/teacherbaogao.tpl')

@app.route('/groupchat',apply=[websocket])
def groupchat(ws,db):
    print "groupchat begin"
    global Users_init
    global opposite
    cr=db.cursor()
    """cr.execute('''SELECT studentsinf.`password` FROM studentsinf WHERE studentsinf.studentid = %s'''%"0121017550524")
    row=cr.fetchone()
    print row
    cr.close()"""
    userepeat = ''#判断当前用户是否重复参与的标志位
    wsock = ws
    #config = {'user':'root', 'password':'312312','host':'localhost','database':'liaotian','charset':'utf8','raw':True}#初始化数据库参数
    #cnx = connect(**config)#新建连接

    if not wsock:
        abort(400, 'Expected WebSocket request.')#如果出现错误则用http响应报文返回，相当于还是在用http服务
    else:
        userx = User(wsock)#userx代表当前上传会话的用户
        
        userx.userid = userx.wsocket.receive()
        userx.datetime = userx.wsocket.receive()
        userx.message = userx.wsocket.receive()
        userx.mima = userx.wsocket.receive()
        userx.username = userx.wsocket.receive()#获取该用户的用户名(浏览器中点击参与按钮)
        userx.student_group = userx.wsocket.receive()#获得该学生该讨论组唯一的id
        student_group = userx.student_group
        student_group_length = len(student_group)
        for i in range(student_group_length):
            if student_group[i] in ['0','1','2','3','4','5','6','7','8','9']:
                shiyan_length = i
                break
        shiyan = userx.student_group[0:i]
        group_id = userx.student_group[i:]
        print "shiyan,group_id:",shiyan,group_id,type(group_id)
        print userx.username,userx.userid,userx.datetime,userx.message,userx.mima,student_group,"userx.userid"
 
        """cr.execute("select count(studentid) FROM studentsinf where studentid=%(studentid)s",{'studentid':userx.userid})#读取数据库中username
        liebiao1 = cr.fetchall() 
        print liebiao1,"liebiao1" #将从数据库得来的表格存进liebiao
        biaozhi1 = 0
        for k in liebiao1:
            if k[0] == 1:  
                biaozhi1 = 1 
                print "to here"                                              
        if biaozhi1 == 0: 
            userx.wsocket.send('biaozhi'+'Lto/Gqr3TV2xdQ0I1Su9yQ'+u'您不能登入该聊天系统')   
            userx.wsocket.close()                                               
            cr.close()#关闭游标
        
        
        cr.execute("select password FROM studentsinf where studentid=%(studentid)s",{'studentid':userx.userid})#读取数据库中username
        liebiao2 = cr.fetchall()
        password = base64.decodestring(liebiao2[0][0])
        print liebiao2,"liebiao2",password
        biaozhi2 = 0
        if password == userx.mima:  
            biaozhi2 = 1                                               
        if biaozhi2 == 0: 
            userx.wsocket.send('biaozhi2'+'Lto/Gqr3TV2xdQ0I1Su9yQ'+u'密码错误！')   
            userx.wsocket.close()
            del userx   
            del wsock                                            
            cr.close()#关闭游标   """
        
        
        
        #更新数据库

        for i in Users_init[student_group]:
            if i.userid == userx.userid:
                userx.wsocket.send('repeat'+'Lto/Gqr3TV2xdQ0I1Su9yQ'+u'您在其他地方的登陆已经被取消！')
                del_name = i.username 
                del_id = i.userid
                for k in Users_init[student_group]:
                    try: #防止有的websocket意外关闭而终止整个程序的运行                   
                        k.wsocket.send('statustart'+'Lto/Gqr3TV2xdQ0I1Su9yQ'+json.dumps({del_id:'0'}))#在删除该对象之前将该用户的状态广播出去
                    except Exception,e:#出错则说明k的websocket连接已经断掉，向其他用户广播其断掉的信息并在列表里移除该连接
                        print "Websocket Error 2",e                     
                        for i in Users_init[student_group]:#用户重复登陆时先要断开原先登陆账号的websocket，并向其他用户显示为已离线
                            try:#这里再加一个try语句是为了防止还有意外关闭的连接，从而导致程序出错
                                i.wsocket.send('statustart'+'Lto/Gqr3TV2xdQ0I1Su9yQ'+json.dumps({k.userid:'0'}))#在删除该对象之前将该用户的状态广播出去，其他用户看到为已离线
                            except:
                                pass
                        Users_init[student_group].remove(k)#从列表中删除有错误的WebSocket对象
                try:
                    i.wsocket.send('closewebsocket'+'Lto/Gqr3TV2xdQ0I1Su9yQ'+json.dumps({del_id:'0'}))
                    i.wsocket.close()
                except Exception:
                    print "Websocket Error 3"
                try:
                    Users_init[student_group].remove(i)#从列表中删除离线对象
                except Exception:
                    print "由于websocket错误关闭，所以在上面的for循环里已经把这个连接移出了，未错误关闭而重复登录则用该语句移出重复的连接"
                Users_init[student_group].append(userx)
                break#万一此用户已将在列表中，则中断for循环，else语句不会执行，从而该用户不会被添加到列表中

        else:
            
            Users_init[student_group].append(userx)#for循环正常结束则执行这条语句，说明该用户没有在之前的列表中则将该对象放入用户列表中 
        status_start = {}#存储用户状态的字典，用于向其他用户广播
        for i in Users_init[student_group]:
            status_start[i.userid] = i.status

        for i in Users_init[student_group]:
            try:
                i.wsocket.send('statustart'+'Lto/Gqr3TV2xdQ0I1Su9yQ'+json.dumps(status_start))#在删除该对象之前将该用户的状态广播出去
            except Exception,e:
                print "有websocket意外关闭断掉",e
                Users_init[student_group].remove(i)#删除未被正确关闭的WebSocket
                
                                   
                                    
        int_groupid = int(group_id)               
        cr.callproc('group_chat_messages', (userx.student_group,shiyan,int_groupid,userx.userid))         
        messages = cr.fetchall()
        print "ppppppppppppppppppppp",messages
        for k in messages:
            str_time = str(k[4])
            userx.wsocket.send('statusend'+'Lto/Gqr3TV2xdQ0I1Su9yQ'+k[2]+'Lto/Gqr3TV2xdQ0I1Su9yQ'+str_time+'Lto/Gqr3TV2xdQ0I1Su9yQ'+k[3])
                    
        '''for result in cr.stored_results():
            once = result.fetchone()
            print once
            while once is not None:
                print once
                userx.wsocket.send('statusend'+'Lto/Gqr3TV2xdQ0I1Su9yQ'+once[0]+'Lto/Gqr3TV2xdQ0I1Su9yQ'+str(once[1])+'Lto/Gqr3TV2xdQ0I1Su9yQ'+once[2])
                once = result.fetchone()'''
                
#        cursor.execute("delete from usrstatchgupd4 where username=%(username)s",{'username':userx.username})#当用户的消息被推送出去之后，应立刻把记录用户状态变化表中该用户的所有记录删除，防止该表内容不断增多
       # cr.commit()#同样当删除操作完成后，应
        cr.close()
        
    print Users_init[student_group]
    while True:
        
        try:
            userx.datetime = userx.wsocket.receive()#此处在会话过程中进行
            userx.message = userx.wsocket.receive()
                
            print userx.wsid
            print userx.username
            print userx.datetime
            print userx.message
            print userx.status,userx.student_group,userx.userid
            userx.datetime = str(userx.datetime)
            
        except:
            break
        print len(Users_init[student_group])
        #更新用户状态，此工作在receive之后和send之前进行，保证数据库根据receive的内容更新用户状态，并在提取用户信息以用于send之前进行更新
        if userx.message[0:22] == 'Lto/Gqr3TV2xdQ0I1Su9yQ':#当用户点击离线按钮时执行   
            cr = db.cursor()
            cr.execute('''INSERT INTO group_chat_inf   
                          (student_group,userid,username,message,message_time) VALUES 
                          (%(student_group)s,%(userid)s,%(username)s,%(message)s,%(message_time)s)''',
                          {"student_group":userx.student_group,"userid":userx.userid,"username":userx.username,
                           "message":userx.message,"message_time":userx.datetime})#将消息保存到group_chat_inf表里
            cr.execute('''UPDATE groupinf SET last_time=%(message_time)s WHERE 
                          (shiyan=%(shiyan)s AND group_id=%(group_id)s AND stu_id=%(stu_id)s)''',
                          {"message_time":userx.datetime,"shiyan":shiyan,
                           "group_id":group_id,"stu_id":userx.userid})#用户离线时更新groupinf表里该用户在该讨论组出现的最后的时间，下次登陆时自动推送该时间之后的消息
            db.commit()
            cr.close()
            print "youduandiao"         
            userx.status = '0'                                              
                                                                
        if (userx.message[0:7] == 'qunliao') :
            cr = db.cursor()
            cr.execute('''INSERT INTO group_chat_inf 
                         (student_group,userid,username,message,message_time) VALUES 
                         (%(student_group)s,%(userid)s,%(username)s,%(message)s,%(message_time)s)''',
                        {"student_group":userx.student_group,"userid":userx.userid,"username":userx.username,"message":userx.message[7:],"message_time":userx.datetime})
            db.commit()
            cr.close()                                                          
        if userx.status == '1':
            if (userx.message[0:7] == 'qunliao'):
                for i in Users_init[student_group]:#检查初始Users_init中哪个用户状态为离线，把未离线的用户提取出来，方便后面将信息在在线的用户中广播，不在线的用户将无法接收到消息
                    try:
                        i.wsocket.send('statusend'+'Lto/Gqr3TV2xdQ0I1Su9yQ'+userx.username+'Lto/Gqr3TV2xdQ0I1Su9yQ'+userx.datetime+'Lto/Gqr3TV2xdQ0I1Su9yQ'+userx.message[7:])#+'Lto/Gqr3TV2xdQ0I1Su9yQ'+'Lto/Gqr3TV2xdQ0I1Su9yQ'.join(status_end))#此处必须用复杂字符串来分隔不同的消息，避免message中出现，。！？等特殊字符,增加前缀为了区分不同的消息类型
                    except Exception,e:#在聊天过程中如果发现某个用户的websocket连接意外断开，则在websocket列表里删除该用户，并向其他用户显示该用户已经离线
                        print "出现了websocketerror",e
                        for k in Users_init[student_group]:
                            try:#这里再加一个检查错误语句是为了防止意外断开的用户不止一个，从而引发错误，中断程序的运行
                                k.wsocket.send('statustart'+'Lto/Gqr3TV2xdQ0I1Su9yQ'+json.dumps({i.userid:'0'}))#在删除该对象之前将该用户的状态广播出去
                            except:
                                pass
                        Users_init[student_group].remove(i)#从列表中删除有错误的WebSocket对象
                
 
                    
        
        else:
            Users_init[student_group].remove(userx)#从列表中删除离线对象
            for i in Users_init[student_group]:
                    i.wsocket.send('statustart'+'Lto/Gqr3TV2xdQ0I1Su9yQ'+json.dumps({userx.userid:userx.status}))#在删除该对象之前将该用户的状态广播出去
            userx.wsocket.close()
            del userx#删除该对象，从而使其在后面程序中不能向其他用户发送信息
            del wsock


            
#++++++++++++++++++++++聊天部分内容==================================================================


@app.route('/homepages')
def homepages():
    print "homepages"
    return template('homepages_template')

@app.route('/homepagestest')  #网页门户页面(测试版)
def homepagestest():
    print "homepagestest"
    return template('homepagestest_template')

@app.post('/resign')   #登陆功能
def resign(db): 
    print "resign"   
    userid=request.POST.get('userid')
    print "userid:",userid
    password=request.POST.get('password')
    position=request.POST.get('position')
    cr=db.cursor()
    if position=="学生":
        cr.execute('''SELECT studentsinf.`password` FROM studentsinf WHERE studentsinf.studentid = %s'''%(userid))
        row=cr.fetchone()
    elif position=="老师":
        cr.execute('''SELECT teachersinf.`password` FROM teachersinf WHERE teachersinf.teacherid = %s'''%(userid))
        row=cr.fetchone()
    else:
        cr.execute('''SELECT admininf.`password` FROM admininf WHERE admininf.adminid=%s'''%(userid))
        row=cr.fetchone() 
    cr.close()
    if row!=None:               #该用户存在
        rows=list(row)
        password_=rows[0]       #取出数据库中对应密码
        password_=base64.decodestring(password_)  #将从数据库中取出的password解密
        nothisuser=False
    else:                      #该用户不存在
        nothisuser=True      
        password_=None
    output={}
    if  nothisuser==False and password!=password_:  #密码错误
        output["meg"]="用户名或密码错误"
    elif nothisuser:          #用户不存在
        output["meg"]="该用户不存在"
    else:
        cr=db.cursor()
        if position=="学生":
            cr.execute('''SELECT studentsinf.studentname,studentsinf.password,studentsinf.quanxian,studentsinf.class,studentsinf.position FROM studentsinf WHERE studentsinf.studentid = %s'''%(userid))
            row=cr.fetchone()
            for i in row:
                print "row",i
        elif position=="老师":
            cr.execute('''SELECT teachersinf.teachername,teachersinf.password,teachersinf.quanxian,teachersinf.school,teachersinf.position FROM teachersinf WHERE teachersinf.teacherid = %s'''%(userid))
            row=cr.fetchone()   
        else:
            cr.execute('''SELECT admininf.adminname,admininf.password,admininf.quanxian,admininf.school,admininf.position FROM admininf WHERE admininf.adminid = %s'''%(userid))
            row=cr.fetchone()    
        cr.close()
        #print row
        #print row
        username_=row[0]
        password = row[1]
        password=base64.decodestring(password)
        quanxian_=row[2]
        department_=row[3] 
        position_=row[4]
        output["position"]=position_ 
        print  'output["position"]',output["position"]   
        session = request.environ['beaker.session']
        tmpmap=session.get('menumap')
        frontdoor.set_user({'userid':userid,'username':username_,'password':password,'authority':quanxian_,'department':department_,'position':position_})
        tmp=frontdoor.get_user()
        cr=db.cursor();
        if position=="学生":
            cr.execute('''SELECT authority.xiangmu FROM authority ,studentsinf WHERE authority.quanxian = studentsinf.quanxian AND studentsinf.studentid = %s'''%(userid))
            rows=cr.fetchall()
        elif position=="老师":
            cr.execute('''SELECT authority.xiangmu FROM authority ,teachersinf WHERE authority.quanxian = teachersinf.quanxian AND teachersinf.teacherid = %s'''%(userid))
            rows=cr.fetchall()
        else:
            cr.execute('''SELECT authority.xiangmu FROM authority ,admininf WHERE authority.quanxian = admininf.quanxian AND admininf.adminid = %s'''%(userid))
            rows=cr.fetchall()
        cr.close()
        print 'rows', rows
        frontdoor.set_leftmenu(rows)
        tmpleft=session.get('leftmenu')
        frontdoor.set_menuaccess()
        #=======================================================================
        # for index1, rows in enumerate(tmpleft):
        #    for index2, row in enumerate(rows):
        #        print tmpleft[index1][index2]
        #        print tmpmap.get(tmpleft[index1][index2])
        #=======================================================================
        
        for rows in tmpmap:
            print rows
        for rows in tmpleft:
            for row in rows:
                print row
                print tmpmap.get(row)
    return output

@app.route('/defaultsub')   
def defaultsub(db):
    session = request.environ['beaker.session']
    frontdoor.set_channel("")
    return template('defaultsub_template',title='过程控制实验室',session=session)

@app.route('/forbiddendsub')
def forbiddendsub(db):
    session = request.environ['beaker.session']
    frontdoor.set_channel("")
    return template('forbiddendsub_template',title='权限禁止访问页面',session=session)

@app.route('/logout')    #安全退出功能
def lougot(db):
    session = request.environ['beaker.session']
    session.clear()
    print "logout",session
    redirect("/homepagestest")
    
    
@app.route('/zhuye')  
def zhuye():
    print "zhuye"
    return template('zhuye_template')

@app.route('/temporary')  
def temporary():
    print "temporary"
    return template('temporary_template')
    
@app.route('/studentstest')  #studentsys页面的测试页面
def studentstest():
    print "studentstest"
    return template('studentstest_template')

@app.route('/teachersettest')  #老师设置课程的测试页面
def teachersettest():
    print "teachersettest"
    session = request.environ['beaker.session']
    return template('teachersettest_template',session=session)

@app.route('/settestinquiry')  #老师设置课程的查询和删除
def settestinquiry():
    print "settestinquiry"
    session = request.environ['beaker.session']
    return template('settestinquiry_template',session=session)

@app.route('/modifycourse')  #老师设置课程的修改
def modifycourse():
    print "modifycourse"
    session = request.environ['beaker.session']
    return template('modifycourse_template',session=session)

@app.route('/test')
def test():
    print "test"
    return template('test_template')

@app.route('/test1')
def test1():
    session = request.environ['beaker.session']
    print "test1"
    return template('test1_template',session=session)

@app.route('/labreport')
def labreport():
    print "labreport"
    return template('labreport_template')

@app.route('/test2')
def test2():
    print "test2"
    #session = request.environ['beaker.session']
    return template('test2_template')


@app.route('/studentsys')  #学生框架metro ui个人桌面风格页面
def studentsys():
    session = request.environ['beaker.session']
    frontdoor.set_channel(u'学生桌面')
    return template('studentsys_template',title='学生桌面',session=session)

@app.route('/sframepart1') #学生框架基础部分页面
def sframepart1():
    session = request.environ['beaker.session']
    frontdoor.set_channel(u'基础部分1')
    return template('sframepart1_template',session=session)

###############上水箱对象特性实验####################
@app.route('/shangsxdxtxyx') #过程控制上水箱特性实验-预习页面（多个实验的页面还未写完？？？）
def shangsxdxtxyx():
    #print "shangsxdxtxyx"
    session = request.environ['beaker.session']
    return template('shangsxdxtxyx_template',session=session)

@app.post('/statecheckForYuxi')
def statecheckForYuxi(db):
    session = request.environ['beaker.session']
    userid=session.get("user")["userid"]    
    #print userid
    cr=db.cursor()
    cr.execute("SELECT state FROM questionnairestate WHERE userid=%(userid)s",{"userid":userid})
    result1=cr.fetchall()
    #print result1
    #result2=list(result1)
    result=list(result1)
    print result
    if  result:
        msg=1
    else:
        msg=0    
    return {"msg":msg}
    
@app.post('/yuxijiancha')
def yuxijiancha(db):
    studentid=request.POST.get("studentid")
    #print studentid
    studentname=request.POST.get("studentname")
    couname=request.POST.get("couname")
    subname=request.POST.get("subname")
    #print subname
    cr=db.cursor()
    cr.execute("select * from processbiao where studentid=%s AND studentname=%s AND coursename=%s AND subexperimentname=%s",(studentid,studentname,couname,subname))
    rows=cr.fetchall()
    #print rows
    resul=list(rows)
    #print resul
    #print "11"
    sql1='''INSERT INTO processbiao(studentid,studentname,coursename,subexperimentname,status,createtime,path,modifiedby) VALUES(%s,%s,%s,%s,%s,NOW(),%s,%s)'''
    sql2="select status from processbiao where studentid=%s AND studentname=%s AND coursename=%s AND subexperimentname=%s"
    if  resul:
        cr.execute(sql2,(studentid,studentname,couname,subname))
        row1=cr.fetchall()
        row1=list(row1)
        print row1
    else:
        cr.execute(sql1,(studentid,studentname,couname,subname,"预习","00A",studentid))
        row1="预习"
        print row1
    cr.close()
    output={"row1":row1}
    return output

@app.post('/yuxibufen1')   #记录状态
def yuxibufen1(db):
    studentname=request.POST.get('studentname')
    studentid=request.POST.get("studentid")
    couname=request.POST.get("couname")
    subname=request.POST.get("subname")
    #print action,studentid,subname,couname
    print "00"
    cr=db.cursor()
    #print "00"
    sql_1='''INSERT INTO processbiao(studentid,studentname,coursename,subexperimentname,status,createtime,path,modifiedby,lastModifiedTime) VALUES(%s,%s,%s,%s,%s,NOW(),%s,%s,NOW())'''
    #print "11"
    try:
        #print "22"
        cr.execute(sql_1,(studentid,studentname,couname,subname,"预习完成","00A",studentid))
        msg=subname+":"+"状态改变成功"
        #print msg
    except Exception,e:
        msg=subname+":"+"操作失败" 
    cr.close()     
    return {"msg":msg}

@app.post('/yuxibufen')   #记录状态
def yuxibufen(db):
    action=request.POST.get('action')
    studentid=request.POST.get("studentid")
    couname=request.POST.get("couname")
    subname=request.POST.get("subname")
    #print action,studentid,subname,couname
    #print "00"
    cr=db.cursor()
    #print "00"
    sql_1="CALL statuschange(%s,%s,%s,%s)"
    #print "11"
    try:
        #print "22"
        cr.execute(sql_1,(studentid,couname,subname,action))
        msg=subname+":"+"状态改变成功"
        #print msg
    except Exception,e:
        msg=subname+":"+"操作失败" 
    cr.close()     
    return {"msg":msg}
      
@app.route('/shangsxdxtxcs')   #过程控制上水箱特性实验-测试页面
def shangsxdxtxcs(db):
    session = request.environ['beaker.session']
    return template('shangsxdxtxcs_template',session=session)


@app.post('/ceshijiancha')
def ceshijiancha(db):
    studentid=request.POST.get("studentid")
    print studentid
    studentname=request.POST.get("studentname")
    couname=request.POST.get("couname")
    print couname
    subname=request.POST.get("subname")
    cr=db.cursor()
    sql2="select status from processbiao where studentid=%s AND studentname=%s AND coursename=%s AND subexperimentname=%s"
    cr.execute(sql2,(studentid,studentname,couname,subname))
    rows=cr.fetchall()
    print rows
    cr.close()
    resul={"resul":rows}
    print resul
    return resul

@app.post('/ceshibufen')
def ceshibufen(db):
    action=request.POST.get('action')
    studentid=request.POST.get("studentid")
    couname=request.POST.get("couname")
    subname=request.POST.get("subname")
    print action,studentid,subname,couname
    cr=db.cursor()
    sql_1="CALL statuschange(%s,%s,%s,%s)"
    try:
        cr.execute(sql_1,(studentid,couname,subname,action))
        msg=subname+":"+"状态改变成功"
    except Exception,e:
        msg=subname+":"+"操作失败" 
    cr.close()     
    return {"msg":msg}


@app.route('/shangsxdxtxbg')     #过程控制上水箱特性实验-提交报告页面
def shangsxdxtxbg():
    session = request.environ['beaker.session']
    return template('shangsxdxtxbg_template',session=session)

#############液位单闭环实验##############
@app.route('/ywdbhkzyx')               #液位单闭环实验--预习页面
def ywdbhkzyx():
    session=request.environ['beaker.session']
    return template('ywdbhkzyx_template',session=session)

@app.route('/ywdbhkzcs')               #液位单闭环实验--测试页面
def ywdbhkzcs():
    session=request.environ['beaker.session']
    return template('ywdbhkzcs_template',session=session)

@app.route('/ywdbhkzbg')               #液位单闭环实验--报告页面
def ywdbhkzbg():
    session=request.environ['beaker.session']
    return template('ywdbhkzbg_template',session=session)



##############流量液位串级控制####################
@app.route('/llywcjkzyx')                #流量液位串级控制--预习页面
def llywcjkzyx():
    session=request.environ['beaker.session']
    return template('llywcjkzyx_template',session=session)

@app.route('/llywcjkzcs')               #流量液位串级控制--测试页面
def llywcjkzcs():
    session=request.environ['beaker.session']
    return template('llywcjkzcs_template',session=session)

@app.route('/llywcjkzbg')               #流量液位串级控制--报告页面
def llywcjkzbg():
    session=request.environ['beaker.session']
    return template('llywcjkzbg_template',session=session)


##############史密斯预估（不加盘管）###################
@app.route('/smsygsyyx')                 #史密斯预估实验（不加盘管）--预习页面
def smsygsyyx():
    session=request.environ['beaker.session']
    return template('smsygsyyx_template',session=session)

@app.route('/smsygsycs')               #史密斯预估实验（不加盘管）--测试页面
def smsygsycs():
    session=request.environ['beaker.session']
    return template('smsygsycs_template',session=session)

@app.route('/smsygsybg')               #史密斯预估实验（不加盘管）--报告页面
def smsygsybg():
    session=request.environ['beaker.session']
    return template('smsygsybg_template',session=session)

    

    


@app.route('/sframepart2') #学生框架提高部分页面
def sframepart2():
    session = request.environ['beaker.session']
    frontdoor.set_channel(u'提高部分1')
    return template('sframepart2_template',session=session)

@app.route('/sframepart3') #学生框架功能部分页面
def sframepart3():
    session = request.environ['beaker.session']
    frontdoor.set_channel(u'功能部分1')
    return template('sframepart3_template',session=session)



@app.route('password')              #学生部分密码修改
def password():
    session=request.environ['beaker.session']
    return template('password_template',session=session)

@app.route('/teachersys')  #老师框架metro ui个人桌面风格页面
def teachersys():
    session = request.environ['beaker.session']
    frontdoor.set_channel(u'老师桌面')
    return template('teachersys_template',session=session)

@app.route('/tframepart1')   
def tframepart1():
    session=request.environ['beaker.session']
    frontdoor.set_channel(u'基础部分2')
    return template('tframepart1_template',session=session)


@app.route('/ligeruibg')      #老师查询已选的实验
def ligeruibg():
    session=request.environ['beaker.session']
    return template('ligeruibg_template',session=session)

@app.route('/bg',method='POST')#返回html元素到当前打开的网页中，用于服务端显示
def bg(db):
    print "bbg"
    userid=request.POST.get("userid")
    print userid
    cr=db.cursor()
    cr.execute("select coursename from course where teacherid=%s",userid)
    trows=cr.fetchall()
    resul=[]
    for trow in trows:
        coursename=trow
        cr.execute("SELECT studentid,studentname,coursename,experimentname,subexperimentname,date,startTime,xiakeTime,equipment FROM appointmentsheet where coursename=%s",coursename)
        bg=cr.fetchall()
        flist_1=list(bg)
        print flist_1
        resul+=flist_1
        print resul
    resul_len=len(resul)
    fkey=["studentid","studentname","coursename","experimentname","subexperimentname","date","startTime","xiakeTime","equipment"]
    for i in range(resul_len):
        #print resul_len
        fvalue=list(resul[i])
        flist=zip(fkey,fvalue)
        fdict=dict(flist)
        resul[i]=fdict
    resuldict={"resul_len":resul}
    print resuldict
    return resuldict  

@app.route('/tscrinquery')      #老师查询学生的测试成绩
def tscrinquery():
    session=request.environ['beaker.session']
    return template('tscrinquery_template',session=session)

@app.post('/ceshiscore') #老师部分测试查询
def ceshiscore(db):
    print "ceshiscore"
    userid=request.POST.get("userid")
    print userid
    position=request.POST.get("position")
    print position
    if position=="老师":
        cr=db.cursor()
        cr.execute("select coursename from course where teacherid=%s",userid) #可增加根据时间取最近的授课记录
        rows=cr.fetchall()
        print rows
        #fdict={}
        flist=[]
        for row in rows:
            print row
            coursename=row
            cr=db.cursor(MySQLdb.cursors.DictCursor)  #将记录的列名和值按键值对形式取出
            cr.execute("select * from view_tscrinquery where coursename=%s",coursename)
            row1=cr.fetchall()
            print row1
            flist_1=list(row1)
            print flist_1
            flist+=flist_1
            print flist
        resul={"scoredata":flist}
    elif position=="学生":
        cr=db.cursor()
        cr=db.cursor(MySQLdb.cursors.DictCursor)  #将记录的列名和值按键值对形式取出
        cr.execute("select * from view_tscrinquery where studentid=%s",userid)
        rows=cr.fetchall()
        print rows
        flist=list(rows)
        print flist
        resul={"scoredata":flist}
    else :
        resul["meg"]="无权限查询"
    print resul
    return resul 

@app.route('/tframepart2')
def tframepart2():
    session=request.environ['beaker.session']
    frontdoor.set_channel(u'提高部分2')
    return template('tframepart2_template',session=session)

@app.route('/tframepart3')
def tframepart3():
    session=request.environ['beaker.session']
    frontdoor.set_channel(u'功能部分2')
    return template('tframepart3_template',session=session)


@app.route('/managersys')  #管理员框架metro ui个人桌面风格页面
def managersys():
    session = request.environ['beaker.session']
    frontdoor.set_channel(u'管理员桌面')
    return template('managersys_template',session=session)

@app.route('/mframepart1')   #管理员信息录入部分
def mframepart1():
    session = request.environ['beaker.session']
    frontdoor.set_channel(u'信息录入')
    return template('mframepart1_tempalte',session=session)

@app.route('/sfrominput')
def sfrominput():
    session=request.environ['beaker.session']
    return template('sfrominput_template',session=session)

@app.route('/mframepart2')   #管理员实验管理部分
def mframepart2():
    session = request.environ['beaker.session']
    frontdoor.set_channel(u'实验管理')
    return template('mframepart2_tempalte',session=session)

@app.route('/mframepart3')   #管理员用户管理部分
def mframepart3():
    session = request.environ['beaker.session']
    frontdoor.set_channel(u'用户管理')
    return template('mframepart3_tempalte',session=session)


@app.route('/yuyueyemian')  #预约页面
def yuyueyemian():
    session = request.environ['beaker.session']
    print "yeyueyemian"
    return template('yuyueyemian_template',session=session)

@app.route('/yuyuechaxun')  #预约查询页面
def yuyuechaxun():
    session = request.environ['beaker.session']
    print "yuyuechaxun"
    return template('yuyuechaxun_template',session=session)



##老师可以查看当前可以预约的所授课程的所有时间段，但不能预约。
@app.post('/tyuyue')
def tyuyue(db):
    userid=request.POST.get("userid")
    cr=db.cursor()
    cr.execute("select coursename from course where teacherid=%(userid)s",{"userid":userid})
    rows=cr.fetchall()
    resul=[]
    for row in rows:
        coursename=row
        cr.execute("SELECT distinct subexperimentname FROM setcourse WHERE coursename=%s and zt=1",coursename)
        rowsdata=cr.fetchall()
        courselist=list(rowsdata)
        resul+=courselist
        print resul
    resul_len=len(resul)
    urllist=[]
    for i in range(resul_len):
        subname=resul[i]
        cr=db.cursor(MySQLdb.cursors.DictCursor)
        cr.execute("select urladress.coursename,urladress.subexperimentname,urladress.yuyueurl from urladress where subexperimentname=%s",subname)
        urldata=cr.fetchall()
        urldatalist=list(urldata)
        urllist+=urldatalist
    print urllist
    cr.close()
    fdict={"urldata":urllist}
    print fdict
    return fdict
    
    


#########预约部分数据#############
#用于相应浏览器ajax请求，用于将数据库中的数据检索传给浏览器
#用于相应浏览器ajax请求，用于将数据库中的数据检索传给浏览器
@app.route('/show',method='POST')#返回html元素到当前打开的网页中，用于服务端显示
def show(db):
    print "预约部分数据库！！！"
    j=0
    exp={}#将post过来的数据封装成字典
    for i in request.forms:
        exp[i]=request.forms[i]
    print exp['subexperimentname']
    cr=db.cursor()

    #执行sql语句检索表格 
    cr.execute("SELECT * FROM setcourse WHERE coursename=%s and subexperimentname=%s and zt=1",(exp['coursename'],exp['subexperimentname']))
    #将从数据库得来的表格存进raws
    rows=cr.fetchall()
    cr.close()#关闭游标
    # num=len(rows)
    resul=list(rows)
    resul_len=len(resul)
    fkey=["coursename","experimentname","subexperimentname","setTime","endTime","zt","startTime","xiakeTime","maxnumber","eqrule"]
    for i in range(resul_len):
        #print resul_len
        fvalue=list(resul[i])
        flist=zip(fkey,fvalue)
        fdict=dict(flist)
        resul[i]=fdict
    resuldict={resul_len:resul} 
    print "预约部分数据库！！！",resuldict
    return resuldict

#用于浏览器向数据库传送数据
@app.route('/choose',method='POST')#此处post方法必须与ajax的post方法相同，注意方法名为全为大写字母
def choose(db):
    mes_body={}#将post过来的数据封装成字典
    for i in request.forms:
        mes_body[i]=request.forms[i]
    #print mes_body
    #maxnumber=round(int(mes_body['maxnumber']))
    maxnumber=int(mes_body['maxnumber'])  #最多可以进行实验的人数
    #print maxnumber
    bz=0
    status="测试完成"
    status1="预约完成"
    action=0
    studentid=mes_body["studentid"]
    couname=mes_body["coursename"]
    print couname
    subname=mes_body["subexperimentname"]
    print subname
    #服务器与数据库连接并对数据库操作
    cr=db.cursor()
    cr.execute("SELECT COUNT(*) FROM appointmentsheet WHERE subexperimentname=%s and date=%s and startTime=%s and xiakeTime=%s",(mes_body['subexperimentname'],mes_body['date'],mes_body['startTime'],mes_body['xiakeTime']))           
    rows=cr.fetchall()
    cr.execute("SELECT COUNT(*) FROM appointmentsheet WHERE studentid=%s and date=%s and startTime=%s and xiakeTime=%s",(mes_body['studentid'],mes_body['date'],mes_body['startTime'],mes_body['xiakeTime']))
    user_exp=cr.fetchall()
    cr.execute("SELECT COUNT(*) FROM appointmentsheet WHERE studentid=%s and subexperimentname=%s",(mes_body['studentid'],mes_body['subexperimentname']))
    user1_exp=cr.fetchall()
    cr.execute("SELECT COUNT(*) FROM processbiao WHERE studentid=%s and subexperimentname=%s and status=%s",(mes_body['studentid'],mes_body['subexperimentname'],status))
    state1=cr.fetchall()
    cr.execute("SELECT COUNT(*) FROM processbiao WHERE studentid=%s and subexperimentname=%s and status=%s",(mes_body['studentid'],mes_body['subexperimentname'],status1))
    state2=cr.fetchall()
    print state1
    if(state1[0][0]==1 or state2[0][0]==1): 
            if(user_exp[0][0]==0 and user1_exp[0][0]==0):
                cr.execute("SELECT deviceid,state FROM equipmentinf1 ")
                state=cr.fetchall()
                print state[0][1]
                cr.execute("SELECT COUNT(*) FROM equipmentinf1 WHERE state=%s",('1'))
                eqnum1=cr.fetchall()
                if (eqnum1[0][0]!=0):
                    evnum=maxnumber/eqnum1[0][0]
                    print eqnum1
                    cr.execute("SELECT COUNT(*) FROM equipmentinf1 WHERE state=%s",('0'))
                    eqnum0=cr.fetchall()
                    cr.execute("SELECT deviceid FROM equipmentinf1 WHERE state=%s",('1'))
                    eq1=cr.fetchall()
                    #print eq1[0][0]
                    cr.execute("SELECT deviceid FROM equipmentinf1 WHERE state=%s",('0'))
                    eq0=cr.fetchall()
                    equipment=['0','1','2','3']
                    for i in range(eqnum1[0][0]):
                        equipment[i]=eq1[i][0]
                    for i in range(eqnum0[0][0]):
                        equipment.append(eq0[i][0])
                
                #for i in state:
                 #   print i 
                  #  for j in i:
                   #     print j 
                #print rows[0][0]
                    if (rows[0][0]>=maxnumber):
                        print "设备已满"
                        mes_body['equipment']='无设备'
                    elif (rows[0][0]<maxnumber and mes_body['eqrule']=='设备节约' ):
                        if (rows[0][0]<evnum):          #设备节约原则分配
                          mes_body['equipment']=equipment[0]
                        elif (rows[0][0]<2*evnum):
                          mes_body['equipment']=equipment[1]
                          
                        elif (rows[0][0]<3*evnum):
                          mes_body['equipment']=equipment[2]
                        else:
                          mes_body['equipment']=equipment[3]
                        #print mes_body['equipment']
                        sql="INSERT INTO appointmentsheet VALUE (%(studentid)s,%(studentname)s,%(coursename)s,%(experimentname)s,%(subexperimentname)s,%(date)s,%(startTime)s,%(xiakeTime)s,%(equipment)s)"   
                        cr.execute(sql,mes_body) #执行sql语句，将预约信息存进表格 
                        cr.execute("CALL statuschange(%s,%s,%s,%s)",(studentid,couname,subname,action))
                        cr.close()
                        print "mes_body内容:",mes_body
                        cr = db.cursor()
                        cr.execute('''SELECT DISTINCT shiyan,group_id FROM groupinf WHERE(shiyan_date=%(dateee)s AND start_time=%(startTime)s)''',{"dateee":mes_body["date"],"startTime":mes_body["startTime"]})
                        shiyan_and_groupid = cr.fetchall()#根据预约时间取得实验和唯一的组id信息，因为确定了时间则确定了该时间所做的实验
                        shiyan = shiyan_and_groupid[0][0]
                        group_id = str(shiyan_and_groupid[0][1])
                        student_group = shiyan+group_id
                        print "shiyan,group_id:",shiyan_and_groupid
                        if student_group in Usersid_group_inf:#当有新的学生预约了实验后，则同步更新学生的分组信息
                            mes_body["studentid"] = unicode(mes_body["studentid"], "utf-8")
                            Usersid_group_inf[student_group].append(mes_body["studentid"])
                            print "Usersid_group_inf[student_group]",Usersid_group_inf[student_group]
                            mes_body["studentname"] = unicode(mes_body["studentname"], "utf-8")
                            Usersname_group_inf[student_group].append(mes_body["studentname"])
                            print "Usersname_group_inf[student_group]",Usersname_group_inf[student_group]
                            for i in Users_init[student_group]:#向该新预约的学生的所在组，并且在线的组员发送消息，更新聊天界面组员列表
                                try:
                                    i.wsocket.send('add_student'+'Lto/Gqr3TV2xdQ0I1Su9yQ'+mes_body["studentid"]+'Lto/Gqr3TV2xdQ0I1Su9yQ'+mes_body["studentname"])
                                except Exception,e:
                                    print "有websocket意外断掉",e
                        
                        else:
                            if shiyan in Usersgroup_shiyan_date:
                                Usersgroup_shiyan_date[shiyan][student_group]=mes_body["date"]+" "+mes_body["startTime"]
                            else:
                                Usersgroup_shiyan_date[shiyan] = {}
                                Usersgroup_shiyan_date[shiyan][student_group]=mes_body["date"]+" "+mes_body["startTime"]
                            Usersid_group_inf[student_group] = []
                            Usersname_group_inf[student_group] = []
                            Users_init[student_group] = []  
                            mes_body["studentid"] = unicode(mes_body["studentid"], "utf-8")
                            mes_body["studentname"] = unicode(mes_body["studentname"], "utf-8")
                            Usersid_group_inf[student_group].append(mes_body["studentid"])
                            Usersid_group_inf[student_group].append("13")
                            Usersname_group_inf[student_group].append(mes_body["studentname"])
                            Usersname_group_inf[student_group].append("傅剑老师")
                        cr.close()
                    elif (rows[0][0]<maxnumber and mes_body['eqrule']=='设备平均'):
                        cr.execute("SELECT COUNT(*) FROM appointmentsheet WHERE subexperimentname=%s and date=%s and startTime=%s and xiakeTime=%s",(mes_body['subexperimentname'],mes_body['date'],mes_body['startTime'],mes_body['xiakeTime']))
                        row=cr.fetchall()
                        number=row[0][0]
                        
                        if (number<eqnum1[0][0]):
                            mes_body['equipment']=equipment[number]    
                        else:
                            i=number%eqnum1[0][0]
                            mes_body['equipment']=equipment[i]
                           
                        sqll="INSERT INTO appointmentsheet VALUE (%(studentid)s,%(studentname)s,%(coursename)s,%(experimentname)s,%(subexperimentname)s,%(date)s,%(startTime)s,%(xiakeTime)s,%(equipment)s)"   
                        print 'zhuyi'
                         #print mes_body['equipment']
                        cr.execute(sqll,mes_body)
                        cr.execute("CALL statuschange(%s,%s,%s,%s)",(studentid,couname,subname,action))
                        cr.close()
                        print "mes_body内容:",mes_body
                        cr = db.cursor()
                        cr.execute('''SELECT DISTINCT shiyan,group_id FROM groupinf WHERE(shiyan_date=%(dateee)s AND start_time=%(startTime)s)''',{"dateee":mes_body["date"],"startTime":mes_body["startTime"]})
                        shiyan_and_groupid = cr.fetchall()#根据预约时间取得实验和唯一的组id信息，因为确定了时间则确定了该时间所做的实验
                        shiyan = shiyan_and_groupid[0][0]
                        group_id = str(shiyan_and_groupid[0][1])
                        student_group = shiyan+group_id
                        print "shiyan,group_id:",shiyan_and_groupid
                        if student_group in Usersid_group_inf:#当有新的学生预约了实验后，则同步更新学生的分组信息
                            mes_body["studentid"] = unicode(mes_body["studentid"], "utf-8")
                            Usersid_group_inf[student_group].append(mes_body["studentid"])
                            print "Usersid_group_inf[student_group]",Usersid_group_inf[student_group]
                            mes_body["studentname"] = unicode(mes_body["studentname"], "utf-8")
                            Usersname_group_inf[student_group].append(mes_body["studentname"])
                            print "Usersname_group_inf[student_group]",Usersname_group_inf[student_group]
                            for i in Users_init[student_group]:#向该新预约的学生的所在组，并且在线的组员发送消息，更新聊天界面组员列表
                                try:
                                    i.wsocket.send('add_student'+'Lto/Gqr3TV2xdQ0I1Su9yQ'+mes_body["studentid"]+'Lto/Gqr3TV2xdQ0I1Su9yQ'+mes_body["studentname"])
                                except Exception,e:
                                    print "有websocket意外断掉",e
                        
                        else:
                            if shiyan in Usersgroup_shiyan_date:
                                Usersgroup_shiyan_date[shiyan][student_group]=mes_body["date"]+" "+mes_body["startTime"]
                            else:
                                Usersgroup_shiyan_date[shiyan] = {}
                                Usersgroup_shiyan_date[shiyan][student_group]=mes_body["date"]+" "+mes_body["startTime"]
                            Usersid_group_inf[student_group] = []
                            Usersname_group_inf[student_group] = []
                            Users_init[student_group] = []  
                            mes_body["studentid"] = unicode(mes_body["studentid"], "utf-8")
                            mes_body["studentname"] = unicode(mes_body["studentname"], "utf-8")
                            Usersid_group_inf[student_group].append(mes_body["studentid"])
                            Usersid_group_inf[student_group].append("13")
                            Usersname_group_inf[student_group].append(mes_body["studentname"])
                            Usersname_group_inf[student_group].append("傅剑老师")
                        cr.close()
                else:
                    mes_body['equipment']='无设备'
                    print 'bunenhg'
            else:
                   if(user1_exp[0][0]!=0):
                       mes_body['equipment']='重复选择实验'
                   else:
                       mes_body['equipment']='时间冲突'
                   mes_body['studentname']='选择实验时间冲突'
            eq="equipment"
            studentname="studentname"
            numdict={maxnumber:rows[0][0],eq:mes_body['equipment'],studentname:mes_body['studentname']}
    else:
            numdict={"实验完成状态":"未完成测试"}
    #print mes_body['studentname']
    print numdict
    return numdict
    




@app.route('/upstate',method='POST')#此处post方法必须与ajax的post方法相同，注意方法名为全为大写字母
def upstate(db):
    subexperimentname=request.POST.get('subexperimentname')
    state=request.POST.get('yuyuewancheng')
    studentid=request.POST.get('studentid')
    cr=db.cursor()
    cr.execute("UPDATE processbiao SET status=%s WHERE studentid=%s and subexperimentname=%s",(state,studentid,subexperimentname))
    cr.close()
    print(studentid);
    return "ok"       

@app.route('/state',method='POST')#此处post方法必须与ajax的post方法相同，注意方法名为全为大写字母
def state(db):
    subexperimentname=request.POST.get('subexperimentname')
    #print subexperimentname
    date=request.POST.getall('date') 
    startTime=request.POST.getall('startTime')
    xiakeTime=request.POST.getall('xiakeTime')
    print date
    #print startTime
    #print xiakeTime
    startTime_len=len(startTime)
    #print startTime[0]
    #print startTime_len
    cr=db.cursor()
    j=0
    
    chosednum={}#将每一天已选人数过来的数据封装成字典
    
    for i in range(startTime_len):
        a=date[i].split(",")
        #print a
        for date1 in a:
                cr.execute("SELECT COUNT(*) FROM appointmentsheet WHERE subexperimentname=%s and date=%s and startTime=%s and xiakeTime=%s",(subexperimentname,date1,startTime[i],xiakeTime[i]))           
                rows=cr.fetchall()
                chosednum[j]=rows[0][0]
                #print chosednum[j]
                j=j+1
    cr.close()
    return chosednum        

@app.route('/chaxun',method='POST')#此处post方法必须与ajax的post方法相同，注意方法名为全为大写字母
def chaxun(db): 
    userexp={}#将post过来的数据封装成字典
    for i in request.forms:
      userexp[i]=request.forms[i]
    print userexp["studentid"]
    cr=db.cursor()
    cr.execute("SELECT * FROM appointmentsheet WHERE studentid=%s",(userexp['studentid'],))
    rows=cr.fetchall()
    cr.close()
    resul=list(rows)
    resul_len=len(resul)
    fkey=["studentname","coursename","experimentname","subexperimentname","date","startTime","xiakeTime","equipment"]
    for i in range(resul_len):
        #print resul_len
        fvalue=list(resul[i])
        flist=zip(fkey,fvalue)
        fdict=dict(flist)
        resul[i]=fdict
    resuldict={resul_len:resul} 
    print resuldict
    return resuldict      


@app.route('/delete',method='POST')#此处post方法必须与ajax的post方法相同，注意方法名为全为大写字母
def delete(db):
    studentname=request.POST.get('studentname')
    studentid=request.POST.get('studentid')
    date=request.POST.get('date')
    startTime=request.POST.get('startTime')
    xiakeTime=request.POST.get('endTime')
    print xiakeTime
    print startTime
    state="测试完成"
    cr=db.cursor()
    cr.execute('''SELECT DISTINCT stu_name FROM groupinf WHERE stu_id=%(studentid)s''',{"studentid":studentid})
    studentname = cr.fetchall()[0][0]
    cr.execute('''SELECT DISTINCT shiyan,group_id FROM groupinf WHERE(shiyan_date=%(dateee)s AND start_time=%(startTime)s)''',{"dateee":date,"startTime":startTime})
    shiyan_and_groupid = cr.fetchall()
    shiyan = shiyan_and_groupid[0][0]
    group_id = str(shiyan_and_groupid[0][1])
    student_group = shiyan+group_id
    print "student_group:",student_group,type(studentid),studentname,studentid
    cr.execute("SELECT subexperimentname FROM appointmentsheet WHERE studentid=%s and date=%s and startTime=%s and xiakeTime=%s",(studentid,date,startTime,xiakeTime))
    rows=cr.fetchall()
    cr.execute("DELETE FROM appointmentsheet WHERE studentid=%s and date=%s and startTime=%s and xiakeTime=%s",(studentid,date,startTime,xiakeTime))
    print rows
    subexperimentname=rows[0][0]
    cr.execute("UPDATE processbiao SET status=%s WHERE studentid=%s and subexperimentname=%s",(state,studentid,subexperimentname))
    cr.close() 
    key="取消成功!"  
    quxiao={key:studentname}   
    if student_group in Usersid_group_inf:
        Usersid_group_inf[student_group].remove(studentid)#取消预约后在保存学生分组的列表里也移除相对应的学生
        Usersname_group_inf[student_group].remove(studentname)

        for i in Users_init[student_group]:
            if (i.userid == studentid):
                try:
                    i.wsocket.send('delete_this_student'+'Lto/Gqr3TV2xdQ0I1Su9yQ'+studentid+'Lto/Gqr3TV2xdQ0I1Su9yQ'+studentname)#若用户在线，取消预约后向该用户发送消息，断掉该用户的websocket连接
                except Exception,e:
                    Users_init[student_group].remove(i)#若报错则说明该用户未正常关闭websocket连接，主动在websocket的列表里移除该连接
                    print "有websocket断掉",e
            else: 
                try:
                    i.wsocket.send('delete_student'+'Lto/Gqr3TV2xdQ0I1Su9yQ'+studentid+'Lto/Gqr3TV2xdQ0I1Su9yQ'+studentname) 
                except Exception,e:
                    print "有websocket断掉",e   
    return quxiao
 
 
############################      


@app.post('/kechengshezhi') 
def kechengshezhi(db):   #fetch thecoursename  from client according to the status option
    cr=db.cursor()
    cr.execute("SELECT coursename,denotation FROM course")
    rows=cr.fetchall()
    cr.close
    print rows
    #fvalue=list()
    #for item in rows:
    #   fvalue.append(item)    
    #fvalue=list()
    #print fvalue
    #fdict={"coursename":fvalue}
    #print fdict.items()
    resul=list(rows)
    print resul
    resul_len=len(resul)
    print resul_len
    fkey=["label","abst"]
    print fkey
    for row in range(resul_len):
        print row
        a1=list(resul[row])
        print a1
        fvalue=a1+a1
        print fvalue
        flist=zip(fkey,fvalue)
        print flist
        fdict=dict(flist)
        print fdict
        resul[row]=fdict
        print resul
    resuldict={"coursename":resul} 
    print resuldict  
    return resuldict
    

@app.post('/testserver1') 
def testserver1(db): # fetch all the information from client according to the choice 
    coursename = request.POST.get("choice1")
    print coursename
    cr=db.cursor()
    cr=db.cursor(MySQLdb.cursors.DictCursor)
    sql="SELECT distinct totalcourse.experimentname FROM totalcourse WHERE totalcourse.coursename= %(coursename)s"
    cr.execute(sql,{"coursename":coursename})
    rows=cr.fetchall()
    cr.close()
    print 'rows', rows
    resul=list(rows)
    print resul
    print "111"
    fdict={"coursename1":resul}
    print fdict
    return fdict

@app.post('/testserver2') 
def testserver2(db): # fetch all the information from client according to the choice 
    tp = request.POST.get("choice2")
    print tp
    tp=urllib.unquote(tp)
    print tp
    tp=urlparse.parse_qsl(tp)
    print tp
    courseinf=dict(tp)
    cr=db.cursor()   
    sql1="SELECT totalcourse.subexperimentname FROM totalcourse WHERE totalcourse.coursename=%s AND totalcourse.experimentname=%s"
    cr.execute(sql1,(courseinf["coursename"],courseinf["subcoursename"]))
    rows=cr.fetchall()
    cr.close()
    print 'rows', rows
    resul=list(rows)
    print resul
    print "111"
    resul_len=len(resul)
    print resul_len
    fkey=["content"]
    for row in range(resul_len):
        fvalue=list(resul[row])
        flist=zip(fkey,fvalue)
        fdict=dict(flist)
        resul[row]=fdict
    resuldict={"coursename2":resul}
    print resuldict
    return resuldict

@app.post('/savecinfo') # save client info into client table
def savecinfo(db):
    teacherid = request.POST.get("userid")
    print teacherid
    tp = request.POST.get("saveinfo")
    #print "1"
    tp=urllib.unquote(tp)
    #print "2"
    tp=urlparse.parse_qsl(tp,1)
    #print "3"
    cinfo=dict(tp)
    cinfo1 = {}
    for i in cinfo.items():
        cinfo1[i[0]] = i[1]
    print cinfo.items()
    cr=db.cursor()
    cr.execute('''select coursename from course where teacherid=%(teacher)s''',{"teacher":teacherid})
    rows=cr.fetchall()
    rows_list=list(rows)
    print rows_list 
    rows_list1 = []
    for i in rows_list:
        rows_list1.append(i[0])
    print "rows_list1: ",rows_list1
    #if cinfo["coursename"]  in rows_list1:
    #    print "cursename in rows_list1"
    cinfo1["coursename"] = unicode(cinfo1["coursename"], "utf-8")
    if cinfo1["coursename"] not in rows_list1:
        print cinfo["coursename"]
        remsg={"msg":"请选择您所担任课程的实验内容！"}
        return remsg
    else :
        str1_split=cinfo["sxTime"].split(",")
        str1=list(str1_split)
        print str1_split
        print str1
        pattern=re.compile(r'^(2[0-3]|[01]?[0-9]):([0-5]?[0-9])-(2[0-3]|[01]?[0-9]):([0-5]?[0-9])')
        remsg={"msg":"ok"}
        for item in str1:
            print item
            match=pattern.match(item)
            #print match
            if match:
                str2_split=match.group().split("-")
                str2=list(str2_split)
                print str2
                cinfo["startTime"]=str2[0]
                cinfo["xiakeTime"]=str2[1]
                print cinfo
                sql1="SELECT COUNT(*) FROM setcourse WHERE setcourse.coursename=%s AND setcourse.experimentname=%s AND setcourse.subexperimentname=%s AND setcourse.setTime=%s AND setcourse.endTime=%s AND setcourse.zt=%s AND setcourse.startTime=%s AND setcourse.xiakeTime=%s AND setcourse.maxnumber=%s AND setcourse.eqrule=%s"
                cr.execute(sql1,(cinfo["coursename"],cinfo["experimentname"],cinfo["subexperimentname"],cinfo["setTime"],cinfo["endTime"],cinfo["zt"],cinfo["startTime"],cinfo["xiakeTime"],cinfo["maxnumber"],cinfo["eqrule"]))
                row=cr.fetchone()
                print row
                fvalue=list()
                print fvalue
                for item in row:
                    fvalue.append(item)
                fkey=["count"]
                print fkey
                flist=zip(fkey,fvalue)
                print flist
                fdict=dict(flist)
                print fdict
                if fdict["count"]==1:
                    remsg["msg"]="库中已存在该记录！"
                elif fdict["count"]==0:
                    sql='''INSERT INTO setcourse(setcourse.coursename,setcourse.experimentname, setcourse.subexperimentname,setcourse.setTime,setcourse.endTime,setcourse.zt,setcourse.startTime,setcourse.xiakeTime,setcourse.maxnumber,setcourse.eqrule) values
                        (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)'''
                    try:
                        cr.execute(sql,(cinfo["coursename"],cinfo["experimentname"],cinfo["subexperimentname"],cinfo["setTime"],cinfo["endTime"],cinfo["zt"],cinfo["startTime"],cinfo["xiakeTime"],cinfo["maxnumber"],cinfo["eqrule"]))            
                    except Exception,e:
                        db.rollback()
                        print "Error %d: %s" % (e.args[0],e.args[1])
                        sys.exit(1)
                    remsg["msg"]="课程信息添加成功！"

    cr.close()
#    remsg["msg"]="课程信息添加成功！"
#    cr=db.cursor()
#    cr.execute('''SELECT COUNT( setcourse.subexperimentname) FROM setcourse WHERE setcourse.subexperimentname=%s''' , cinfo["subexperimentname"])
#    row=cr.fetchone()
#    cr.close()
    #print "11"
#    print row
    #print "22"
#    fvalue=list()
#    for item in row:
#           fvalue.append(item)
#    fkey=["count"]
#    print fkey
#    flist=zip(fkey,fvalue)
#    print flist
    #print flist        
#    fdict=dict(flist)
#    print fdict
#    remsg={"msg":"ok"}
#    cr=db.cursor()
#    if fdict["count"]==1:
#        for k,v in cinfo.items():
#            if len(v)==0:
#                cinfo[k]=None 
#        print fdict       
#        sql='''UPDATE setcourse SET setcourse.coursename=%s,setcourse.experimentname=%s,setcourse.setTime=%s,setcourse.endTime=%s,setcourse.zt=%s
#                WHERE setcourse.subexperimentname=%s'''
#        try:
#            cr.execute(sql,(cinfo["coursename"],cinfo["experimentname"],cinfo["setTime"],cinfo["endTime"],cinfo["zt"],cinfo["subexperimentname"]))            
#        except Exception,e:
#            db.rollback()
#            print "Error %d: %s" % (e.args[0],e.args[1])
#            sys.exit(1)
#        cr.close()
#        remsg["msg"]="课程信息更新成功！"
#    elif fdict["count"]==0:
#        str1_split=cinfo["sxTime"].split(",")
#        str1=list(str1_split)
#        print str1_split
#        print str1
#        pattern=re.compile(r'^(2[0-3]|[01]?[0-9]):([0-5]?[0-9])-(2[0-3]|[01]?[0-9]):([0-5]?[0-9])')
#        for item in str1:
#            print item
#            match=pattern.match(item)
#            #print match
#            if match:
#                str2_split=match.group().split("-")
#                str2=list(str2_split)
#                print str2
#                cinfo["startTime"]=str2[0]
#                cinfo["xiakeTime"]=str2[1]
#                print cinfo
#                sql='''INSERT INTO setcourse(setcourse.coursename,setcourse.experimentname, setcourse.subexperimentname,setcourse.setTime,setcourse.endTime,setcourse.zt,setcourse.startTime,setcourse.xiakeTime) values
#                       (%s,%s,%s,%s,%s,%s,%s,%s)'''
#                try:
#                    cr.execute(sql,(cinfo["coursename"],cinfo["experimentname"],cinfo["subexperimentname"],cinfo["setTime"],cinfo["endTime"],cinfo["zt"],cinfo["startTime"],cinfo["xiakeTime"]))            
#                except Exception,e:
#                    db.rollback()
#                    print "Error %d: %s" % (e.args[0],e.args[1])
#                    sys.exit(1)
#        cr.close()
#        remsg["msg"]="课程信息添加成功！"
#    else:
#        cr.close()
#        remsg["msg"]="库中存在多条重复记录，无法更新！" 
    return remsg

@app.post('/savemodcinfo')      #老师保存已修改的课程
def savemodcinfo(db):
    teacherid = request.POST.get("userid")
    tpnew = request.POST.get("savenewinfo")  #修改后的数据
    print "数据：",tpnew
    tpnew=urllib.unquote(tpnew)
    tpnew=urlparse.parse_qsl(tpnew,1)
    cinfonew=dict(tpnew)
    tpold= request.POST.get("saveoldinfo") #修改前的数据
    tpold=urllib.unquote(tpold)
    tpold=urlparse.parse_qsl(tpold,1)
    cinfoold=dict(tpold)
    cinfonew1 = {}
    for i in cinfonew.items():
        cinfonew1[i[0]] = i[1]
    print "cinfonew1:",cinfonew1
    print "cinfonew 数据：",cinfonew.items()
    print cinfoold.items()
    cr=db.cursor()
    cr.execute("select coursename from course where teacherid=%(teacherid)s",{"teacherid":teacherid})
    rows_list=cr.fetchall()
    print rows_list 
    rows_list1 = []
    for i in rows_list:
        rows_list1.append(i[0])
    print "rows_list1: ",rows_list1
    print "cinfonew1['coursename']" ,cinfonew1["coursename"]
    for k in rows_list1:
        print k
    cinfonew1["coursename"] = unicode(cinfonew1["coursename"], "utf-8")
    if cinfonew1["coursename"] not in rows_list1:
        remsg={"msg":"请选择您所担任课程的实验内容！"}
        return remsg
    else:
        str1_split=cinfonew["sxTime"].split(",")
        str1=list(str1_split)
        print str1_split
        print str1
        pattern=re.compile(r'^(2[0-3]|[01]?[0-9]):([0-5]?[0-9])-(2[0-3]|[01]?[0-9]):([0-5]?[0-9])')
        remsg={"msg":"ok"}
        cr=db.cursor()
        for item in str1:
            print item
            match=pattern.match(item)
            #print match
            if match:
                str2_split=match.group().split("-")
                str2=list(str2_split)
                print str2
                cinfonew["startTime"]=str2[0]
                cinfonew["xiakeTime"]=str2[1]
                print cinfonew
                sql1="SELECT COUNT(*) FROM setcourse WHERE setcourse.coursename=%s AND setcourse.experimentname=%s AND setcourse.subexperimentname=%s AND setcourse.setTime=%s AND setcourse.endTime=%s AND setcourse.zt=%s AND setcourse.startTime=%s AND setcourse.xiakeTime=%s AND setcourse.maxnumber=%s AND setcourse.eqrule=%s"
                cr.execute(sql1,(cinfonew["coursename"],cinfonew["experimentname"],cinfonew["subexperimentname"],cinfonew["setTime"],cinfonew["endTime"],cinfonew["zt"],cinfonew["startTime"],cinfonew["xiakeTime"],cinfonew["maxnumber"],cinfonew["eqrule"]))
                row=cr.fetchone()
                print row
                fvalue=list()
                print fvalue
                for item in row:
                    fvalue.append(item)
                fkey=["count"]
                print fkey
                flist=zip(fkey,fvalue)
                print flist
                fdict=dict(flist)
                print fdict
                if fdict["count"]==1:
                    remsg["msg"]="库中已存在该记录！"
                elif fdict["count"]==0:
                    sql2='''UPDATE setcourse SET coursename=%s,experimentname=%s,subexperimentname=%s,setTime=%s,endTime=%s,zt=%s,startTime=%s,xiakeTime=%s,maxnumber=%s,eqrule=%s 
                            WHERE setcourse.coursename=%s AND setcourse.experimentname=%s AND setcourse.subexperimentname=%s AND setcourse.setTime=%s AND setcourse.endTime=%s AND setcourse.zt=%s 
                            AND setcourse.startTime=%s AND setcourse.xiakeTime=%s AND setcourse.maxnumber=%s AND setcourse.eqrule=%s'''
                    try:
                        cr.execute(sql2,(cinfonew["coursename"],cinfonew["experimentname"],cinfonew["subexperimentname"],cinfonew["setTime"],cinfonew["endTime"],cinfonew["zt"],cinfonew["startTime"],cinfonew["xiakeTime"],cinfonew["maxnumber"],cinfonew["eqrule"],cinfoold["coursename"],cinfoold["experimentname"],cinfoold["subexperimentname"],cinfoold["setTime"],cinfoold["endTime"],cinfoold["zt"],cinfoold["startTime"],cinfoold["xiakeTime"],cinfoold["maxnumber"],cinfoold["eqrule"]))            
                    except Exception,e:
                        db.rollback()
                        print "Error %d: %s" % (e.args[0],e.args[1])
                        sys.exit(1)
                    remsg["msg"]="课程信息修改成功！"
    cr.close() 
    return remsg  

@app.post('/testserver3')
def testserver3(db):
    cr=db.cursor()
    cr.execute('''SELECT distinct labtest.studentsinf.class,labtest.studentsinf.classdenotation FROM labtest.studentsinf''')
    rows=cr.fetchall()
    cr.close()
    print rows
    resul=list(rows)
    print resul
    fkey=["label","abst"]
    print fkey
    for row in range(len(resul)):
        print len(resul)
        fvalue=list(resul[row])
        print fvalue
        flist=zip(fkey,fvalue)
        print flist
        fdict=dict(flist)
        print fdict
        resul[row]=fdict
    resuldict={"banjiname":resul}
    return resuldict


    
        
@app.post('/testserver4')
def testserver4(db):
    classname=request.POST.get("choice4")
    print classname
    cr=db.cursor()
    cr=db.cursor(MySQLdb.cursors.DictCursor)
    sql="SELECT labtest.studentsinf.studentname,labtest.studentsinf.studentid FROM labtest.studentsinf WHERE labtest.studentsinf.class=%s"
    cr.execute(sql,classname)
    rows=cr.fetchall()
    cr.close
    print rows
    resul=list(rows)
    print resul
    fkey=["id","name"]
    for row in range(len(resul)):
        resul[row]["id"]=resul[row]["studentid"]
        resul[row]["name"]=resul[row]["studentid"]+"-"+resul[row]["studentname"]
        print resul[row]
    print resul    
    fdict={"studentname1":resul}
    print fdict
    return fdict



@app.post('/saveTappoint')
def saveTappoint(db):
    tp=request.POST.get("choice")
    tp=urllib.unquote(tp)
    tp=urlparse.parse_qsl(tp)
    appointinf=dict(tp)
    print appointinf 
    for k,v in appointinf.items():
        print k,v,len(v)
        if len(v)==0:
           appointinf[k]=None    
    studentsname=appointinf["studentsname"]
    #print studentsname
    studentname=list(studentsname.split(','))
    print studentname
    remsg={"msg":"ok"}
    cr=db.cursor()
    sql="INSERT INTO appointmentsheet_old(studentid,studentname,deviceid,coursename,experimentname,subexperimentname,ADate,StartTime,EndTime,classname,status,path,CreateBy,CreateTime) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,NOW())"
    for i in range(len(studentname)):
        aa=studentname[i].split("-")
        appointinf["studentid"]=aa[0]
        appointinf["studentname"]=aa[1]
        cr.execute(sql,(appointinf["studentid"],appointinf["studentname"],appointinf["devicenum"],appointinf["coursename"],appointinf["experimentname"],appointinf["subexperimentname"],appointinf["ADate"],appointinf["StartTime"],appointinf["EndTime"],appointinf["classname"],'有效',appointinf["path"],'老师指定'))
    remsg["msg"]="提交成功，已录入数据库！"
    return remsg    
    
   
    
@app.post('/saveztreedata1') 
def ztreedata(db):
    str_1=request.POST.get("choice") 
    print str_1
    aa=str_1.split(",")
    print aa
    fkey=["id","pId","name"]
    #cr=db.cursor();
    for i in range(len(aa)-1):
        fvalue=list(aa[i].split("&"))
        print fvalue
        ztreedata=zip(fkey,fvalue)
        ztreedata=dict(ztreedata)
        print ztreedata["name"]
        cr=db.cursor()
        cr.execute("SELECT COUNT(ztreedata.name) FROM ztreedata WHERE ztreedata.name=%s",ztreedata["name"])
        row=cr.fetchone()
        print row
        fvalue1=list()
        for item in row:
            fvalue1.append(item)
            print fvalue1
        fkey1=["count"]
        flist1=zip(fkey1,fvalue1)
        print flist1
        fdict1=dict(flist1)
        remsg={"msg":"ok"}
        if fdict1["count"]==1:
            sql='''UPDATE ztreedata SET ztreedata.id=%s WHERE ztreedata.name=%s'''
            try:
                cr.execute(sql,(ztreedata["id"],ztreedata["name"]))
            except Exception,e:
                db.rollback()
                print "Error %d: %s" % (e.args[0],e.args[1])  
                sys.exit(1)
            remsg["msg"]="ztreedata表更新成功！"
        elif fdict1["count"]==0:
            print fdict1["count"]
            sql1='''INSERT INTO ztreedata (id,pId,name) VALUES (%s,%s,%s)'''
            try:
                cr.execute(sql1,(ztreedata["id"],ztreedata["pId"],ztreedata["name"]))
            except Exception,e:
                db.rollback()
                print "Error %d: %s" % (e.args[0],e.args[1])
                sys.exit(1)
            remsg["msg"]="新节点保存成功！"
        else:
           remsg["msg"]="库中"+ztreedata["name"]+"存在多条重复记录，无法更新！"    
        cr.close()
    return remsg
        
@app.post('/saveztreedata')
def saveztreedata1(db):
    cr=db.cursor()
    cr.execute("DELETE  FROM ztreedata WHERE ztreedata.pId='2'")
    cr.close()
    str_1=request.POST.get("choice") 
    print str_1
    aa=str_1.split(",")
    print aa
    fkey=["id","pId","name"]
    #cr=db.cursor();
    remsg={"msg":"ok"}
    for i in range(len(aa)-1):
        fvalue=list(aa[i].split("&"))
        print fvalue
        ztreedata=zip(fkey,fvalue)
        ztreedata=dict(ztreedata)
        print ztreedata["name"]  
        cr=db.cursor()
        sql1='''INSERT INTO ztreedata (id,pId,name) VALUES (%s,%s,%s)'''
        try:
            cr.execute(sql1,(ztreedata["id"],ztreedata["pId"],ztreedata["name"]))
        except Exception,e:
            db.rollback()
            print "Error %d: %s" % (e.args[0],e.args[1])  
            sys.exit(1)
    remsg["msg"]="ztreedata表更新成功！"
    return remsg
    
    
    
    
@app.post('/getzTree')  
def getzTree(db):
    cr=db.cursor()
    cr=db.cursor(MySQLdb.cursors.DictCursor)
    cr.execute('''SELECT * FROM labtest.ztreedata''')
    rows=cr.fetchall()
    cr.close()
    print rows
    resul=list(rows)
    print resul
    fdict={"zTreedata1":resul}
    print fdict
    return fdict

#（老师）课程设置显示、修改和删除部分

@app.post('/kechengxianshi')
def kechengxianshi(db):
    userid=request.POST.get("userid")
    print userid
    cr=db.cursor()
    cr.execute("select coursename from course where teacherid=%(userid)s",{"userid":userid})
    rows=cr.fetchall()
    print rows
    resul=[]
    for row in rows:
        print row
        coursename=row
        #cr=db.cursor(MySQLdb.cursors.DictCursor)
        cr.execute("select * from setcourse where coursename=%s",coursename)
        row1=cr.fetchall()
        print row1
        flist_1=list(row1)
        print flist_1
        resul+=flist_1
        print resul
        ##########
    resul_len=len(resul)
    print resul_len
    fkey=["coursename","experimentname","subexperimentname","setTime","endTime","zt","startTime","xiakeTime","maxnumber","eqrule","devicenum"]
    for i in range(resul_len):
        fvalue=list(resul[i])
        flist=zip(fkey,fvalue)
        fdict=dict(flist)
        resul[i]=fdict
    resuldict={resul_len:resul}
    print resuldict
    return resuldict

@app.post('/kechengdelete')      #（老师）课程设置查询及修改的删除功能  
def kechengdelete(db):
    tp=request.POST.get('data') 
    ddata=json.loads(tp)
    print ddata
    cr=db.cursor()
    sql1='''delete from setcourse where coursename=%s and experimentname=%s and subexperimentname=%s and 
    setTime=%s and endTime=%s and zt=%s and startTime=%s and xiakeTime=%s and maxnumber=%s and
    eqrule=%s'''
    for i in ddata:
        coursename=i["coursename"]
        #print coursename
        experimentname=i["experimentname"]
        subexperimentname=i["subexperimentname"]
        setTime=i["setTime"]
        endTime=i["endTime"]
        zt=i["zt"]
        startTime=i["startTime"]
        xiakeTime=i["xiakeTime"]
        maxnumber=i["maxnumber"]
        eqrule=i["eqrule"]
        cr.execute(sql1,(i["coursename"],i["experimentname"],i["subexperimentname"],i["setTime"],i["endTime"],i["zt"],i["startTime"],i["xiakeTime"],i["maxnumber"],i["eqrule"]))
    output={"mesg":"成功删除数据"}
    return output
        
    
    
           
#######################################                
@app.post('/shiyandata')
def shiyandata(db):
    name=request.POST.get("name")
    print name,type(name),len(name)
    cr=db.cursor()
    cr=db.cursor(MySQLdb.cursors.DictCursor)    
    cr.execute('''SELECT DISTINCT subexperimentname FROM setcourse WHERE coursename =%(coursename)s''',{'coursename':name})
    rows=cr.fetchall()
    cr.close()
    print rows
    
    resul=list(rows)
    print resul
    cr=db.cursor()
    cr=db.cursor(MySQLdb.cursors.DictCursor)
    cr.execute('''select distinct urladress.subexperimentname,urladress.yuxiurl,urladress.ceshiurl,
                  urladress.yuyueurl,urladress.baogaourl,urladress.liaotianurl,urladress.group_name from urladress,setcourse where 
                  urladress.subexperimentname=setcourse.subexperimentname and setcourse.coursename=%(coursename)s''',{"coursename":name})
    rows=cr.fetchall()
    cr.close()
    urlresl=list(rows)
    print urlresl
    fdict={"shiyandata1":resul,"urldata":urlresl,"coursename":name}
    print fdict
    return fdict 
       
    

@app.post('/getdb') 
def getdb(db):
    cr=db.cursor(MySQLdb.cursors.DictCursor)
    cr.execute("SELECT * FROM lenrm")
    result1=cr.fetchall()
    result1=list(result1)
    
    print result1
    cr.execute("SELECT * FROM forcerm")
    result2=cr.fetchall()
    result2=list(result2)
    print result2
    return {"lenrm":result1,"forcerm":result2}


@app.route('/labfeedback')    #实验问卷调查板块
def labfeedback(db):
    session = request.environ['beaker.session']
    #frontdoor.set_channel(u'labfeedback')
    return template('labfeedback_template',session=session)

@app.post('/getdiaochabiao')
def diaochabiao(db):
    session = request.environ['beaker.session']
    userid=session.get("user")["userid"]    
    tp = request.POST.get('diaochabiaodata')
    print tp
    tp=urllib.unquote(tp)
    tp=urlparse.parse_qsl(tp)
    diaocha=dict(tp)
    print dict(tp)
    if diaocha.has_key('neirong0'):
        print "zai"
        diaocha["neirong0"]=diaocha["neirong0"]
    else:
        print "no"
        diaocha["neirong0"]=''
    if diaocha.has_key('neirong1'):
        print "zai"
        diaocha["neirong1"]=diaocha["neirong1"]
    else:
        print "no"
        diaocha["neirong1"]=''
    if diaocha.has_key('neirong2'):
        print "zai"
        diaocha["neirong2"]=diaocha["neirong2"]
    else:
        print "no"
        diaocha["neirong2"]=''
    #conn = MySQLdb.connect(host="localhost",user="root",passwd="312312",db="lab",charset='utf8')   
    #cursor=conn.cursor()
    cr=db.cursor()
    sql='''INSERT INTO diaochabiao(userid,question1,question2,question3,question4,question5,question6,question7,question8,question9,question10,time) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,NOW())'''
    try:
        cr.execute(sql,(userid,diaocha["data[0]"],diaocha["data[1]"],diaocha["data[2]"],diaocha["data[3]"],diaocha["data[4]"],diaocha["data[5]"],diaocha["data[6]"],diaocha["neirong0"],diaocha["neirong1"],diaocha["neirong2"]))
        db.commit()
        msg="调查表已提交，谢谢你的参与!"
    except Exception,e:
        msg="提交失败！"
    cr.close()
    print msg
    return {"msg":msg}

@app.post('/if_submitted')
def if_submitted(db):
    session = request.environ['beaker.session']
    userid=session.get("user")["userid"]    
    typefor=request.POST.get('type')
    cr=db.cursor()
    cr.execute("SELECT * FROM anwsers WHERE userid=%s AND anwserfor=%s",(userid,typefor))
    result=cr.fetchall()
    print result
    if not result:
        msg=1
    else:
        msg=0    
    return {"msg":msg}

@app.post('/state_enquiry')
def state_enquiry(db):
    session = request.environ['beaker.session']
    userid=session.get("user")["userid"]    
    print userid
    cr=db.cursor()
    cr.execute('''SELECT status FROM processbiao WHERE studentid=%s'''%(userid))
    result1=cr.fetchall()
    result2=list(result1)
    result3=list(result2)
    result=result3[0]
    print result
    if (result=="预约完成"):
        msg=1
    else:
        msg=0    
    return {"msg":msg}

@app.route('/password')  #学生密码修改部分
def yuyuechaxun2():
    session = request.environ['beaker.session']
    print "xiugaimima"
    return template('password_template',session=session)
#########预约部分数据#############
#用于相应浏览器ajax请求，用于将数据库中的数据检索传给浏览器
@app.route('/duquyuanmima',method='POST')#返回html元素到当前打开的网页中，用于服务端显示
def duquyuanmima(db):
    print "1924721"
    cr=db.cursor()
    exp={}#将post过来的数据封装成字典
    for i in request.forms:
        exp[i]=request.forms[i]
    #执行sql语句检索表格 
    cr.execute("SELECT password FROM studentsinf WHERE studentid=%s ",(exp['studentid'],))
    #将从数据库得来的表格存进raws
    rows=cr.fetchall()
    cr.close()#关闭游标
    print rows
    password=rows[0][0]
    password_=base64.decodestring(password)
    
    key="nihao"
    resuldict={key: password_} 
    #print resuldict
    return resuldict
#########预约部分数据#############
@app.route('/xiugaimima',method='POST')#返回html元素到当前打开的网页中，用于服务端显示
def xiugaimima(db):
    #print "1924721"
    cr=db.cursor()
    exp={}#将post过来的数据封装成字典
    for i in request.forms:
        exp[i]=request.forms[i]
        #print exp[i]
    #执行sql语句检索表格 
    exp['newpassword']= base64.encodestring(exp["newpassword"])
    cr.execute("UPDATE studentsinf SET password=%s WHERE studentid=%s",(exp['newpassword'],exp['studentid']))
    cr.execute("SELECT password FROM studentsinf WHERE studentid=%s ",(exp['studentid'],))
    rows=cr.fetchall()
    #将从数据库得来的表格存进raws
    #rows=cr.fetchall()
    cr.close()#关闭游标
    password=rows[0][0]
    password_=base64.decodestring(password)
    print password_ 
    key="修改成功"
    resuldict={key: password_} 
    #print resuldict
    return resuldict

@app.route('/questionnaire')
def questionnaire():
    session = request.environ['beaker.session']
    return template('questionnaire_template',session=session)

@app.route('/questionnaire1')
def questionnaire1():
    session = request.environ['beaker.session']
    return template('questionnaire1_template',session=session)

@app.route('/questions',method='POST')
def questions(db):
    typefor=request.POST.get('type')
    cr=db.cursor()
    cr.execute("SELECT Name FROM itembank WHERE questiontype=%(typefor)s",{"typefor":typefor})
    rows=cr.fetchall()
    cr.close()
    
    question=list(rows)
    keylist=["1","2","3","4","5","6","7","8","9","10"]
    questionlist=zip(keylist,question)
    qdict=dict(questionlist)
    rdict={"10":qdict}
    print rdict
    
    return rdict

@app.post('/saveanwser')
def saveanswer(db):
    session = request.environ['beaker.session']
    userid=session.get("user")["userid"]    
    tp = request.POST.get('anwser')
    
    tp=urllib.unquote(tp)
    tp=urlparse.parse_qsl(tp)
    diaocha=dict(tp)
    state="已完成"
    cr=db.cursor()
    cr.execute("INSERT INTO questionnairestate(userid,state) VALUES (%s,%s)",(userid,state))
    sql='''INSERT INTO anwsers(userid,anwserfor,question1,question2,question3,question4,question5,question6,question7,question8,question9,question10,time) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,NOW())'''
    try:
        cr.execute(sql,(userid,diaocha["type"],diaocha["0"],diaocha["1"],diaocha["2"],diaocha["3"],diaocha["4"],diaocha["5"],diaocha["6"],diaocha["7"],diaocha["8"],diaocha["9"]))
        db.commit()
        msg="调查表已提交，谢谢你的参与!"
    except Exception,e:
        msg="提交失败！"
    
    cr.close()
    return {"msg":msg}

@app.route('/testing')
def testing():
    session = request.environ['beaker.session']
    return template('testing_template',session=session)

@app.route('/testquestionseditor')
def testquestionseditor():
    session = request.environ['beaker.session']
    return template('testquestionseditor_template',session=session)

@app.route('/testquestionsinquiry')
def testquestionsinquiry():
    session = request.environ['beaker.session']
    return template('testquestionsinquiry_template',session=session)

@app.route('/testingquestions',method='POST')
def testingquestions(db):
    global ANWSER
    subname=request.POST.get("subname")
    print subname
    cr=db.cursor()
    cr.execute("SELECT question,optionA,optionB,optionC,optionD FROM testingquestions WHERE experiment=%(subname)s",{"subname":subname})
    rows=cr.fetchall()
    cr.close()
    data=list(rows)
    print data
    data_len=len(data)
    key=["question","optionA","optionB","optionC","optionD"]
    #datadic=zip(key,data)
    for i in range(data_len):
        #print resul_len
        value=list(data[i])
        ANWSER.append(value[5])
        datalist=zip(key,value)
        datadict=dict(datalist)
        data[i]=datadict
    resuldata={data_len:data} 
    print resuldata
    #print datadic
    return resuldata

@app.route('/questionsinquiry',method='POST')
def questionsinquiry(db):
    cr=db.cursor()
    cr.execute("SELECT number,couse,experiment,question,optionA,optionB,optionC,optionD,anwser FROM testingquestions")
    content=cr.fetchall()
    print content
    cr.close()
    resul=list(content)
    resul_len=len(resul)
    fkey=["序号","课程名称","实验名称","测试题目","选项A","选项B","选项C","选项D","正确答案"]
    for i in range(resul_len):
        #print resul_len
        fvalue=list(resul[i])
        flist=zip(fkey,fvalue)
        fdict=dict(flist)
        resul[i]=fdict
    resuldict={resul_len:resul} 
    print resuldict
    return resuldict
    
@app.route('/questiondelete',method='POST')
def questiondelete(db):
    print "12344"
    #AAA={}#将post过来的数据封装成字典
    #for i in request.forms:
    #    AAA[i]=request.forms[i]
    #print AAA["序号"]
    number=request.POST.get('序号')
    #experimentname = "已到"
    cr=db.cursor()
    cr.execute("DELETE FROM testingquestions WHERE number=%s",(number))
    cr.close()
    print(number);
    return "ok"
    


@app.route('/questionseditor',method='POST')
def questionseditor(db):
    print "测试"
    tp = request.POST.get('editor')
    tp=urllib.unquote(tp)
    tp=urlparse.parse_qsl(tp)
    content=dict(tp)
    print content
    #state="已完成"
    cr=db.cursor()
    
    sql='''INSERT INTO testingquestions(couse,experiment,question,optionA,optionB,optionC,optionD,anwser,modifytime) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,NOW())'''
    try:
        cr.execute(sql,(content["course"],content["experiment"],content["question"],content["A"],content["B"],content["C"],content["D"],content["anwser"]))
        db.commit()
        msg="题目已保存到数据库！"
    except Exception,e:
        msg="操作失败，题目未保存到数据库！"
    
    cr.close()
    return {"msg":msg}
    
@app.post('/if_havedone')
def if_havedone(db):
    session = request.environ['beaker.session']
    userid=session.get("user")["userid"] 
    subname=request.POST.get("subname")
    print subname
    cr=db.cursor()
    cr.execute("SELECT * FROM anwsers WHERE userid=%s AND anwserfor=%s",(userid,subname))
    data=cr.fetchall()
    print data
    cr.close()
    if not data:
        msg=1
    else:
        msg=0 
    return {"msg":msg}
    

@app.post('/getscore')
def getscore(db):
    print "success"
    session = request.environ['beaker.session']
    userid=session.get("user")["userid"] 
    subname=request.POST.get("subname")
    tp = request.POST.get('anwser')
    tp=urllib.unquote(tp)
    tp=urlparse.parse_qsl(tp)
    anwser=dict(tp)
    
    anwserlist=[]
    #for key,value in anwser.items():
     #   anwserlist.append(value)
    #print anwserlist
    anwserlist.append(anwser["0"])
    anwserlist.append(anwser["1"])
    anwserlist.append(anwser["2"])
    anwserlist.append(anwser["3"])
    anwserlist.append(anwser["4"])
    anwserlist.append(anwser["5"])
    anwserlist.append(anwser["6"])
    anwserlist.append(anwser["7"])
    anwserlist.append(anwser["8"])
    anwserlist.append(anwser["9"])
    #print anwserlist
    #correct=[]
    global ANWSER
    cr=db.cursor()
    #cr.execute("SELECT anwser FROM testingquestions WHERE experiment=%(subname)s",{"subname":subname})
    #data=cr.fetchall()
    #correct1=list(data)
   # for i in correct1:
     #   correct.append(list(i)[0])
    score=0
    for i in range(10):
        #if (anwserlist[i] == correct[i]): 
        if (anwserlist[i] == ANWSER[i]):   
            score=score+10
        else:
            
            score=score
    if (score>60):    
        sql='''INSERT INTO anwsers(userid,anwserfor,question1,question2,question3,question4,question5,question6,question7,question8,question9,question10,time,score) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,NOW(),%s)'''
        try:
            cr.execute(sql,(userid,subname,anwser["0"],anwser["1"],anwser["2"],anwser["3"],anwser["4"],anwser["5"],anwser["6"],anwser["7"],anwser["8"],anwser["9"],score))
            db.commit()
            msg="你已提交成功!"
        except Exception,e:
            msg="提交失败！"
        cr.close()
        return {2:[{"msg":msg,"score":score}]}
    else:
        return {2:[{"msg":"提交失败","score":score}]}
        
    

session_opts = {
    'session.type': 'file',
    'session.cookie_expires': True,
    'session.data_dir': os.path.join('/MyWorkspace/jcp1/ws', 'session'),
    'session.auto': True
}

app = SessionMiddleware(app, session_opts)

debug(True)

def Initialization(db):
    cr = db.cursor()    
    cr.execute("SELECT shiyan,group_id,shiyan_date,start_time,GROUP_CONCAT(stu_id) FROM groupinf GROUP BY shiyan,group_id")
    list1 =   cr.fetchall()
    cr.execute("SELECT shiyan,group_id,shiyan_date,start_time,GROUP_CONCAT(stu_name) FROM groupinf GROUP BY shiyan,group_id")
    list2 = cr.fetchall()
    cr.execute("SELECT DISTINCT shiyan FROM groupinf")
    list3 = cr.fetchall()
    for k in list1:
        Usersid_group_inf[k[0]+str(k[1])] = list(k[4].split(","))
        Users_init[k[0]+str(k[1])] = []
    for k in list2:
        Usersname_group_inf[k[0]+str(k[1])] = list(k[4].split(","))
    for k in list3:
        Usersgroup_shiyan_date[k[0]] = {}
        for i in list1:
            if i[0]==k[0]:
                Usersgroup_shiyan_date[k[0]][i[0]+str(i[1])]=i[2]+" "+i[3]
                #分组信息 格式为{A实验组：{A实验组1：实验时间，A实验组2：实验时间}，B实验组：{。。。。}}为加载老师界面文件树导航栏的时候用
    print list1
    print list3
    print Users_init
    print Usersid_group_inf
    print Usersname_group_inf
    print Usersgroup_shiyan_date
    

if __name__ == '__main__':
    db = MySQLdb.connect("localhost", "root", "312312","labtest",charset="utf8")
    Initialization(db)
    run(app, server=GeventWebSocketServer)     
    
db = MySQLdb.connect("localhost", "root", "312312","labtest",charset="utf8")
Initialization(db)
application = app
