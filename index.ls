{EitherT, Left, Right}:Either = require \fantasy-eithers
Promise = require \fantasy-promises

EitherPromise = EitherT Promise

module.exports = (fn)-> (...args)->
	EitherPromise new Promise (resolve)->
		fn ...args, (e, r)->
			resolve if e? then Left e else Right r
