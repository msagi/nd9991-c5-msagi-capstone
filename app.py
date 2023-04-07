""" Capstone Project Application """
from flask import Flask
from flask import json
from flask import jsonify
from flask import redirect
from flasgger import Swagger

app = Flask(__name__)

Swagger(app)

@app.route('/')
def root():
    """Redirect to API Docs.

        GET /
        ---
        responses:
            302:
                description: Redirect to API Docs.
                headers:
                    Location:
                        type: "string"

    """
    return redirect("/apidocs")


@app.route('/status')
def healthcheck():
    """Return health check status.


        GET /status
        ---
        responses:
            200:
                description: Returns OK if service is healthy.


    """
    response = app.response_class(
            response=json.dumps({"result":"OK"}),
            status=200,
            mimetype='application/json'
    )

    return response


@app.route('/api/v1')
def api_root():
    """Return Hello World!


        GET /api/v1
        ---
        responses:
            200:
                description: Returns Hello World!


    """
    return jsonify({'message': 'Hello World!'})


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=False)
