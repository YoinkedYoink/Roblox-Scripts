# Why is mousemove broken on every executor

import asyncio
import win32api
import win32con
import websockets

async def handler(websocket, path):
    data = await websocket.recv()
    print("Got move mouse: "+ str(data))
    XandY = data.split()
    X = float(XandY[0])
    Y = float(XandY[1])
    win32api.mouse_event(win32con.MOUSEEVENTF_MOVE, int(X),int(Y),0,0)
    #await websocket.send(reply)


start_server = websockets.serve(handler, "127.0.0.1", 6969)
print("## Started Server ##")

asyncio.get_event_loop().run_until_complete(start_server)
asyncio.get_event_loop().run_forever()
