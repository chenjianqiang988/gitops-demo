from flask import Flask
import requests
app = Flask(__name__)

@app.route('/demo1')
def hello_world():
        # 通过HTTP请求访问demo2
    response = requests.get('http://gitops-demo2:5000/demo2')
    return f'Hello, World11! Response from demo2: {response.text}'
  

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)