# -*- coding: utf-8 -*-

'''
Created on 2011-7-2

@author: jian.fu
'''
import  sys, traceback
from bottle import request, redirect, HTTPError, HTTPResponse
from urlparse import urlparse

class FrontDoorPlugin(object):

    def __init__(self, logfile=sys.__stderr__, errorcode=500, backdoor='/invitation'):
        self.logfile = logfile
        self.errorcode = errorcode
        self.backdoor = backdoor
        self.app = None
        #=======================================================================
        # self.authorcodes = []
        # for _ in xrange(0, 100):
        #    self.authorcodes.append(str(uuid.uuid4()))
        # self.lables = {'chinese':{}, 'english':{}}
        #=======================================================================
        
    def setup(self, app):
        self.app = app

    def apply(self, callback, context):
        
        def wrapper(*args, **kwargs):
            '''check front door and catch exception'''
            if self.backdoor == None :
                # user
                session = request.environ['beaker.session']
                if not session.has_key('user'):
                    session['user'] = {"userid":11,"username":"阮成发", "authority":"A","department":"收发室","position":"组长"} 
                # language
                if not session.has_key('leftmenu'):
                    #session['leftmenu'] = ((u'表单录入',),(u'表单表单改印',),(u'表单查询',),(u'业务流转',),(u'证书管理',))
                    session['leftmenu'] = ((u'安全退出',),(u'安全退出',))
                # channel    
                if not session.has_key('channel'):
                    session['channel'] = None
                session.save()
                
                # access right check
                # request.url  -> function path -> access table yes / no 
                
                if not session.has_key('menumap'):
                    session['menumap'] = {u'学生桌面':'/studentsys',u'基础部分1':'/sframepart1',u'提高部分1':'/sframepart2',u'功能部分1':'/sframepart3',u'老师桌面':'/teachersys',u'基础部分2':'/tframepart1',u'提高部分2':'/tframepart2',u'功能部分2':'/tframepart3',u'管理员桌面':'/managersys',u'信息录入':'/mframepart1',u'实验管理':'/mframepart2',u'用户管理':'/mframepart3',u'安全退出':'/logout'}
                session.save()
                
                if not session.has_key('menuacess'):
                    urlacess=[]
                    rows=session['leftmenu']
                    menuurls=session['menumap']
                    for row in rows:
                        for col in row:
                            urlacess.append(menuurls.get(col))
                    session['menuacess']=urlacess
                    #print session['menuacess']
                    #print session['leftmenu']
                
                
                cururl=request.urlparts[2]
                #print cururl
                #print session
                
                allurl=session['menumap'].values() 
                urlacess=session['menuacess']             
                if (not(cururl in urlacess) and (cururl in allurl)):
                    redirect('/forbiddendsub')
                    
                
                #===============================================================
                # if not session.has_key('menuloaded'):
                #    session['menuloaded']= None
                # session.save()
                #===============================================================
                
                
                               
            
                # wraper exception   
                try:
                    rv = callback(*args, **kwargs)
                except HTTPResponse:
                    raise
                except Exception, ex:
                    error = traceback.format_exc()
                    if self.logfile:
                        print >> self.logfile, error
                    if self.errorcode:
                        raise HTTPError(self.errorcode, exception=ex, traceback=traceback)
                    else:
                        return error.replace('\n', '<br />')
                else:
                    return rv                
            else:
                redirect(self.backdoor)
                
        return wrapper
            
#===============================================================================
#    def open(self):
#        '''open the front door'''
#        authorcode = self.authorcodes[random.randint(0, len(self.authorcodes))]
#        response.set_cookie("authorcode", authorcode, secret='tuola')
# 
#    def get_label(self):
#        return self.lables[self.get_language()]
# 
#    def check_author_code(self):
#        '''check valid author code'''
#        authorcode = request.get_cookie("authorcode", secret='tuola')
#        for code in self.authorcodes:
#            if code == authorcode:
#                return True
#        return False
# 
#    def set_user(self, user):
#        session = request.environ['beaker.session']        
#        session['user'] = user or {'uid':None, 'email':None, 'username':None}
#        session.save()
# 
#    def get_user(self):
#        session = request.environ['beaker.session']        
#        return session.get('user', {'uid':None, 'email':None, 'username':None})
#    
#    def get_user_id(self):
#        uid = self.get_user().get('uid')
#        return self.USER_ID_ANONYMOUS if uid == None else uid
# 
#    def set_language(self, language):
#        session = request.environ['beaker.session']        
#        session['language'] = 'chinese' if language == None else language
#        session.save()
# 
#    def get_language(self):
#        session = request.environ['beaker.session']        
#        return session.get('language', 'chinese')
#===============================================================================
    def set_user(self, user):
        session = request.environ['beaker.session']        
        session['user'] = user or {"username":None, "authority":None}
        session.save()
 
    def get_user(self):
        session = request.environ['beaker.session']        
        return session.get('user')
    
    def set_leftmenu(self, leftmenu):
        session = request.environ['beaker.session']        
        session['leftmenu'] = leftmenu
        session.save()

    def get_leftmenu(self):
        session = request.environ['beaker.session']        
        return session.get('leftmenu')

    def set_channel(self, channel):    
        session = request.environ['beaker.session']
        session['channel'] = channel
        session.save()
        
    def get_channel(self):    
        session = request.environ['beaker.session']
        return session.get('channel')
    
    def set_menuaccess(self):
        session = request.environ['beaker.session']
        urlacess=[]
        rows=session['leftmenu']
        menuurls=session['menumap']
        for row in rows:
            for col in row:
                urlacess.append(menuurls.get(col))
        session['menuacess']=urlacess
        session.save()
        
    def get_menuaccess(self):
        session = request.environ['beaker.session']
        return session.get('menuacess')
        
        
