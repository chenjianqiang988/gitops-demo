from flask import Flask
import requests
app = Flask(__name__)

@app.route('/demo3')
def hello_world():
    # 通过HTTP请求访问demo2
    response = requests.get('http://gitops-demo1:5000/demo1')
    return f'Hello, World333333! Response from demo1: {response.text}'
  

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)