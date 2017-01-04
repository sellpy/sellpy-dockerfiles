import requests
import json
import sys
import time
import subprocess
import gphoto2 as gp
import logging
import os

class robotControl:

    def __init__(self, address = "http://172.13.1.227"):
        self.address = address
        self.move_one = "/api/movemodule/move_step_one"
        self.status_path = "/api/status"
        self.system_path = "/api/system"

    def build_json(self, path, angle="45", directioncw=True):
        return self.address+path, json.dumps({"angle":angle,"speed":100,"pause":1000,"trigger":0,"directioncw":directioncw,"elevator":10,"iselevating":False,"triggeradvance":0,"triggertimeout":50})

    def spin_one(self, url, payload):
        requests.post(url, data = payload)
        self.isMoving()

    def isMoving(self,timeout=0):
        r = requests.get(self.address+self.status_path)
        if timeout > 500:
            raise BaseException("Stuck in a spin")
            return True
            
        if json.loads(r.text)["movemodulestatus"]["ismoving"] == True:
            time.sleep(0.25)
            return self.isMoving(timeout+1)
        else:
            return False
        

class cameraControl:

    def __init__(self):
        self.p = ""
        self.shuttertime_s = 1

    def init_camera():
        return 0

    def force_settings(self):
        #subprocess.run(["gphoto2","--set-config", "flashmode=1"])
        subprocess.run(["gphoto2","--set-config", "iso=5"])
        subprocess.run(["gphoto2","--set-config", "focusmetermode=0"])
        subprocess.run(["gphoto2","--set-config", "exposuremetermode=0"])
        subprocess.run(["gphoto2","--set-config", "exposurecompensation=12"])
        subprocess.run(["gphoto2","--set-config", "whitebalance=4"])
        subprocess.run(["gphoto2","--set-config", "f-number=2"])
        #subprocess.run(["gphoto2","--set-config", "shutterspeed=17"])
        self.shuttertime_s = float(subprocess.run(["gphoto2","--get-config", "shutterspeed"],stdout=subprocess.PIPE).stdout.decode("utf-8").split("\n")[2].split(":")[1].strip()[0:-1].replace(",","."))

    def take_photo(self, filename):

        

        self.p = subprocess.Popen(["gphoto2","--capture-image-and-download", "--filename",filename, "--force-overwrite"], stdin = subprocess.PIPE, stdout = subprocess.PIPE, stderr = subprocess.PIPE, shell = False) 
        time.sleep(self.shuttertime_s+1)
        try:
            print(self.p.stdout.read())
        except:
            pass

    def take_photo_python(self,filename):
        logging.basicConfig(
        format='%(levelname)s: %(name)s: %(message)s', level=logging.WARNING)
        gp.check_result(gp.use_python_logging())
        context = gp.gp_context_new()
        camera = gp.check_result(gp.gp_camera_new())
        gp.check_result(gp.gp_camera_init(camera, context))
        print('Capturing image')
        file_path = gp.check_result(gp.gp_camera_capture(
            camera, gp.GP_CAPTURE_IMAGE, context))
        print('Camera file path: {0}/{1}'.format(file_path.folder, file_path.name))
        camera_file = gp.check_result(gp.gp_camera_file_get(
                camera, file_path.folder, file_path.name,
                gp.GP_FILE_TYPE_NORMAL, context))
        gp.check_result(gp.gp_file_save(camera_file, './'+filename))
        #time.sleep(self.shuttertime_s+1)
        #subprocess.call(['xdg-open', target])
        #gp.check_result(gp.gp_camera_exit(camera, context))

if __name__ == "__main__":
  cc = cameraControl()
  rc = robotControl("http://172.13.1.227")
  cc.force_settings()

  cc.take_photo("1.jpg")
  url, payload = rc.build_json(rc.move_one,"45")
  rc.spin_one(url, payload)

  cc.take_photo("2.jpg")
  url, payload = rc.build_json(rc.move_one,"135")
  rc.spin_one(url, payload)

  cc.take_photo("3.jpg")
  url, payload = rc.build_json(rc.move_one,"180")
  rc.spin_one(url, payload)
