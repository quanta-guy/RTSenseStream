import cv2
import websockets
import asyncio
import base64
import os
import json


port = 5000
port2=8000
print("Started server on port : ", port)

image=''

async def transmit(websocket, path):
    print("Client Connected !")

    while True:            
        try:
            encoded = cv2.imencode('.jpg', cv2.imread("inference.jpg"))[1]
            cap = cv2.imread("inference.jpg")
            cv2.imwrite("temp.jpg",cap)
        except:
            if(os.path.isfile("temp.jpg")):
                continue
            else:
                encoded = cv2.imencode('.jpg', cv2.imread("temp.jpg"))[1]
            
                continue
        else:
            data = str(base64.b64encode(encoded))
            data = data[2:len(data)-1]
            await websocket.send(data)

            
async def StringExchange(websocket, path):
    print("Client Connected !")

    while True:            
        try:
           data="HelloWorld"
        except:
                continue
            
            
        else:
            data = str(base64.b64encode(data))
            data = data[2:len(data)-1]
            await websocket.send(data)

   
def getData(data):
    data=data 
start_server = websockets.serve(transmit, port=port)

asyncio.get_event_loop().run_until_complete(start_server)

asyncio.get_event_loop().run_forever()


