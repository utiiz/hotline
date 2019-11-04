let express = require('express');
let bodyParser = require('body-parser');
let socketio = require('socket.io');
let path = require('path');
let graphqlHTTP = require('express-graphql');
let { graphql, buildSchema } = require('graphql');
let typeDefs = require('./models/schemas');
let resolvers = require('./models/resolvers');
let { makeExecutableSchema } = require('graphql-tools');

// Construct a schema, using GraphQL schema language
var schema = makeExecutableSchema({
	typeDefs,
	resolvers,
});

// The root provides a resolver function for each API endpoint
var root = {
	hello: () => {
		return 'Hello world!';
	},
};

// Run the GraphQL query '{ hello }' and print out the response
graphql(schema, '{ hello }', root).then((response) => {
	console.log(response);
});

// let games = require('./actions/games');
const PORT = 3000;

let app = express();
let router = express.Router();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use(function (req, res, next) {
	res.header('Access-Control-Allow-Origin', '*'); // update to match the domain you will make the request from
	res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
	next();
});

app.use('/graphql', graphqlHTTP({
	schema: schema,
	rootValue: root,
	graphiql: true,
}));

let server = app.listen(PORT, () => {
	console.log(`Listening on port ${PORT}`);
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
