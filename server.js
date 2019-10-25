let express = require('express');
let bodyParser = require('body-parser');
let socketio = require('socket.io');
let path = require('path');
let java = require('java');
java.classpath.push('./Scramble');
// let games = require('./actions/games');
const PORT = 3000;

let app = express();
let router = express.Router();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use(function(req, res, next) {
	res.header('Access-Control-Allow-Origin', '*'); // update to match the domain you will make the request from
	res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
	next();
});

/* app.get('/', function(req, res) {
	res.sendFile(`${__dirname}/app/index.html`);
});

app.use(express.static(`${__dirname}/app`)); */

let server = app.listen(PORT, () => {
	console.log(`Listening on port ${PORT}`);
	console.log(java);
});

var io = socketio.listen(server);
io.on('connection', (socket) => {
	console.log('CONNECTION');

	/* socket.on('GET_GAMES', async (data) => {
		console.log(data);
		let { err, rows } = await games.get();
		if (err) throw err;
		console.log(rows);
		socket.emit('GET_GAMES', rows);
	}); */
});
