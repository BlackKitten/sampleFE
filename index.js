const express = require('express')
const app = express()

var port = (process.env.PORT || process.env.OPENSHIFT_NODEJS_PORT || 4200);
app.use(express.static('dist'))

app.listen(port, () => console.log('Example app listening on port', port))
