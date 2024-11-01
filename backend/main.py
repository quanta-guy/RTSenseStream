
from flask import Flask, jsonify, request
from flask_cors import CORS, cross_origin

data={}
app = Flask(__name__)
CORS(app, supports_credentials=True)
#Search by word
@app.route('/data', methods=[ "GET","POST"])
@cross_origin(supports_credentials=True, origins='*')
def getAlert():
    data1 = request.args.get('data1')
    data2 = request.args.get('data2')
    data.update({'Alert1':data1,'Alert2':data2})
    print(data)
    return jsonify("Successful Hit")
    
@app.route('/alarm', methods=["POST"])
@cross_origin(supports_credentials=True, origins='*')
def postAlert():
    temp =data
    print(data)
    data.update({})
    return jsonify(temp)
    

if __name__ == '__main__':

    app.run(debug=True, host='0.0.0.0',port=8000)