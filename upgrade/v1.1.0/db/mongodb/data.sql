use commonbase;

db.getCollection("citys").insertMany([{
	"code": "440309",
	"layer": 3,
	"name": "龙华区",
	"pcode": "440300",
	"pcodes": [
		"440000",
		"440300",
		"440309"
	],
	"pnames": [
		"广东省",
		"深圳市",
		"龙华区"
	],
	"status": true
}, {
	"code": "440310",
	"layer": 3,
	"name": "坪山区",
	"pcode": "440300",
	"pcodes": [
		"440000",
		"440300",
		"440310"
	],
	"pnames": [
		"广东省",
		"深圳市",
		"坪山区"
	],
	"status": true
}, {
	"code": "440311",
	"layer": 3,
	"name": "光明区",
	"pcode": "440300",
	"pcodes": [
		"440000",
		"440300",
		"440311"
	],
	"pnames": [
		"广东省",
		"深圳市",
		"光明区"
	],
	"status": true
}]);