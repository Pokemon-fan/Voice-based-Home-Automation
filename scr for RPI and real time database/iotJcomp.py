import pyrebase
from gpiozero import LED

config = {
  "apiKey": "AIzaSyBffceS1ZH1mc1WtjwK-6BIPYjsz78Fo_s",
  "authDomain": "automate-327ab.firebaseapp.com",
  "databaseURL": "https://automate-327ab.firebaseio.com/",
  "storageBucket": "automate-327ab.appspot.com",
}

led=LED(4)

firebase = pyrebase.initialize_app(config)
db = firebase.database()
state=False
while True:
    users = db.child("Room1") .child("Light1").get()
    data=users.val()
    if data=='ON' and state==False:
        print('Turning On')
        led.on()
        state=True
    elif data=='OFF' and state==True:
        print('Turning Off')
        led.off()
        state=False
    
    
    
