fantasy-async
=============

Wraps functions that want callbacks in pure functional promises.

example
-------
```javascript
var async = require('fantasy-async');

var get = async(request);
var write = async(fs.writeFile);

var requestPromise = get('/post/123')
.chain(function(post) { return get('/user/'+post.author); })
.fold(
	function error() { return Request.notFound() },
	function done(user) { return Request.ok(JSON.stringify(user)) }
);
```

install
-------
```npm install fantasy-async```

api
---
### ``async :: (a → (e → r → ()) → ()) → a → EitherT Promise e r``
Given a function that takes a Node-style ``function (err, result)`` callback, returns a function that takes the same arguments and returns an ``EitherT Promise`` wrapping the error as ``Left`` or the result as ``Right``.

See [the code for EitherT](https://github.com/quarterto/fantasy-eithers/blob/master/src/either.js#L99) for the complete API.

licence
-------
[MIT](/licence.md)