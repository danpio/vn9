var CryptoJS=CryptoJS||function(e,m){var p={},j=p.lib={},l=function(){},f=j.Base={extend:function(a){l.prototype=this;var c=new l;a&&c.mixIn(a);c.hasOwnProperty("init")||(c.init=function(){c.$super.init.apply(this,arguments)});c.init.prototype=c;c.$super=this;return c},create:function(){var a=this.extend();a.init.apply(a,arguments);return a},init:function(){},mixIn:function(a){for(var c in a)a.hasOwnProperty(c)&&(this[c]=a[c]);a.hasOwnProperty("toString")&&(this.toString=a.toString)},clone:function(){return this.init.prototype.extend(this)}},
n=j.WordArray=f.extend({init:function(a,c){a=this.words=a||[];this.sigBytes=c!=m?c:4*a.length},toString:function(a){return(a||h).stringify(this)},concat:function(a){var c=this.words,q=a.words,d=this.sigBytes;a=a.sigBytes;this.clamp();if(d%4)for(var b=0;b<a;b++)c[d+b>>>2]|=(q[b>>>2]>>>24-8*(b%4)&255)<<24-8*((d+b)%4);else if(65535<q.length)for(b=0;b<a;b+=4)c[d+b>>>2]=q[b>>>2];else c.push.apply(c,q);this.sigBytes+=a;return this},clamp:function(){var a=this.words,c=this.sigBytes;a[c>>>2]&=4294967295<<
32-8*(c%4);a.length=e.ceil(c/4)},clone:function(){var a=f.clone.call(this);a.words=this.words.slice(0);return a},random:function(a){for(var c=[],b=0;b<a;b+=4)c.push(4294967296*e.random()|0);return new n.init(c,a)}}),b=p.enc={},h=b.Hex={stringify:function(a){var c=a.words;a=a.sigBytes;for(var b=[],d=0;d<a;d++){var f=c[d>>>2]>>>24-8*(d%4)&255;b.push((f>>>4).toString(16));b.push((f&15).toString(16))}return b.join("")},parse:function(a){for(var c=a.length,b=[],d=0;d<c;d+=2)b[d>>>3]|=parseInt(a.substr(d,
2),16)<<24-4*(d%8);return new n.init(b,c/2)}},g=b.Latin1={stringify:function(a){var c=a.words;a=a.sigBytes;for(var b=[],d=0;d<a;d++)b.push(String.fromCharCode(c[d>>>2]>>>24-8*(d%4)&255));return b.join("")},parse:function(a){for(var c=a.length,b=[],d=0;d<c;d++)b[d>>>2]|=(a.charCodeAt(d)&255)<<24-8*(d%4);return new n.init(b,c)}},r=b.Utf8={stringify:function(a){try{return decodeURIComponent(escape(g.stringify(a)))}catch(c){throw Error("Malformed UTF-8 data");}},parse:function(a){return g.parse(unescape(encodeURIComponent(a)))}},
k=j.BufferedBlockAlgorithm=f.extend({reset:function(){this._data=new n.init;this._nDataBytes=0},_append:function(a){"string"==typeof a&&(a=r.parse(a));this._data.concat(a);this._nDataBytes+=a.sigBytes},_process:function(a){var c=this._data,b=c.words,d=c.sigBytes,f=this.blockSize,h=d/(4*f),h=a?e.ceil(h):e.max((h|0)-this._minBufferSize,0);a=h*f;d=e.min(4*a,d);if(a){for(var g=0;g<a;g+=f)this._doProcessBlock(b,g);g=b.splice(0,a);c.sigBytes-=d}return new n.init(g,d)},clone:function(){var a=f.clone.call(this);
a._data=this._data.clone();return a},_minBufferSize:0});j.Hasher=k.extend({cfg:f.extend(),init:function(a){this.cfg=this.cfg.extend(a);this.reset()},reset:function(){k.reset.call(this);this._doReset()},update:function(a){this._append(a);this._process();return this},finalize:function(a){a&&this._append(a);return this._doFinalize()},blockSize:16,_createHelper:function(a){return function(c,b){return(new a.init(b)).finalize(c)}},_createHmacHelper:function(a){return function(b,f){return(new s.HMAC.init(a,
f)).finalize(b)}}});var s=p.algo={};return p}(Math);
(function(){var e=CryptoJS,m=e.lib,p=m.WordArray,j=m.Hasher,l=[],m=e.algo.SHA1=j.extend({_doReset:function(){this._hash=new p.init([1732584193,4023233417,2562383102,271733878,3285377520])},_doProcessBlock:function(f,n){for(var b=this._hash.words,h=b[0],g=b[1],e=b[2],k=b[3],j=b[4],a=0;80>a;a++){if(16>a)l[a]=f[n+a]|0;else{var c=l[a-3]^l[a-8]^l[a-14]^l[a-16];l[a]=c<<1|c>>>31}c=(h<<5|h>>>27)+j+l[a];c=20>a?c+((g&e|~g&k)+1518500249):40>a?c+((g^e^k)+1859775393):60>a?c+((g&e|g&k|e&k)-1894007588):c+((g^e^
k)-899497514);j=k;k=e;e=g<<30|g>>>2;g=h;h=c}b[0]=b[0]+h|0;b[1]=b[1]+g|0;b[2]=b[2]+e|0;b[3]=b[3]+k|0;b[4]=b[4]+j|0},_doFinalize:function(){var f=this._data,e=f.words,b=8*this._nDataBytes,h=8*f.sigBytes;e[h>>>5]|=128<<24-h%32;e[(h+64>>>9<<4)+14]=Math.floor(b/4294967296);e[(h+64>>>9<<4)+15]=b;f.sigBytes=4*e.length;this._process();return this._hash},clone:function(){var e=j.clone.call(this);e._hash=this._hash.clone();return e}});e.SHA1=j._createHelper(m);e.HmacSHA1=j._createHmacHelper(m)})();

var kategorie =new Array()
kategorie['popular']="Popular now";
kategorie['promoted']="Promoted";
kategorie['magic']="Magic";
kategorie['howto']="Howto";
kategorie['soon']="Soon";

function  strtok( s, chars, rtl ) {

    var n, i = chars.length;
    rtl = true === rtl;
    while ( i-- ) {
        n = s.indexOf(chars[i]);
        s = n < 0 ? s : rtl
            ? s.substr(++n)
            : s.substr(0, n);
    }

    return s;
}
var key=""
function saveFile(data, path) {

//    console.log("data "+data)

}


function lodavinevideo(userId,key,url){
 var url_user = 'https://api.vineapp.com/timelines/users/'+userId;

    console.log(url)
    var doc = new XMLHttpRequest();


                        doc.onreadystatechange = function() {
                            if (doc.readyState == XMLHttpRequest.DONE) {
                                var jsresp = JSON.parse(doc.responseText);
                              //  console.log(doc.responseText)
                                var len = 1
                                var records= jsresp.data.records

                                var vi=1;
                                var i=1;
                                var count = jsresp.data.count

                                console.log('do pobrania filmow '+count)

                                var count = 19
for(var a=0;a<=count;a++)
                                {

var likes = jsresp.data.records[a].likes
var likes_count=likes.count
var comments=jsresp.data.records[a].comments

    //console.log("komentarzy: "+comments.count)
    for(var comcount=0;comcount<=(comments.suze-1);comcount++){

        komentarz_model.append({
userId:(function() {try {return(jsresp.data.records[a].userId);}catch(e) { return("(no userId)"); }})(),
username:(function() {try {return(comments.records[comcount].username);}catch(e) { return("(no username)"); }})(),
comment:(function() {try {return(comments.records[comcount].comment);}catch(e) { return("(no comment)"); }})(),

                    })

        console.log("komentarz: "+jsresp.data.records[a].userId+" "+comments.records[comcount].username+" "+comments.records[comcount].comment)

    }

rssModel.append( {

number: i + 1,
created:(function() {try {return(jsresp.data.records[a].created);}catch(e) { return("(no created)"); }})(),
location:(function() {try {return(jsresp.data.records[a].location);}catch(e) { return("(no location)"); }})(),
longitude:(function() {try {return(jsresp.data.records[a].longitude);}catch(e) { return("(no longitude)"); }})(),
latitude:(function() {try {return(jsresp.data.records[a].latitude);}catch(e) { return("(no latitude)"); }})(),
postId:(function() {try {return(jsresp.data.records[a].postId);}catch(e) { return("(no postId)"); }})(),
postToFacebook:(function() {try {return(jsresp.data.records[a].postToFacebook);}catch(e) { return("(no postToFacebook)"); }})(),
postToTwitter:(function() {try {return(jsresp.data.records[a].postToTwitter);}catch(e) { return("(no postToTwitter)"); }})(),
promoted:(function() {try {return(jsresp.data.records[a].promoted);}catch(e) { return("(no promoted)"); }})(),
tags:(function() {try {return(jsresp.data.records[a].tags);}catch(e) { return("(no tags)"); }})(),
thumbnail_url:                  (function() {try {return(jsresp.data.records[a].thumbnailUrl.replace("https://","http://"));}catch(e) { return("(no title)"); }})(),
id:                             (function() {try {return(jsresp.data.records[a].userId);}catch(e) { return("(no id)"); }})(),
username:               (function() {try {return(jsresp.data.records[a].username);} catch(e) { return("(no username)"); }})(),
description:            (function() {try {return(jsresp.data.records[a].description);} catch(e) { return("(no description)"); }})(),
profile_background_image_url:   (function() {try {return(jsresp.data.records[a].description);}catch(e) { return("(no profile_background_image_url)"); }})(),
expanded_url:                   (function() {try {return(jsresp.data.records[a].shareUrl);}catch(e) { return("(no expanded_url)"); }})(),
avatarUrl:              (function() {try {return(jsresp.data.records[a].avatarUrl);} catch(e) { return("(no profile_image_url)"); }})(),
video_url_org:              (function() {try {return(jsresp.data.records[a].videoUrl.replace("https://","http://"));} catch(e) { return("(no profile_image_url)"); }})(),


video_url:                      (function() {try {

 var video_url_=jsresp.data.records[a].videoUrl.replace("https://","http://");
 ApplicationData.downloadFile(video_url_);

var video_file;
var iLen = jsresp.data.records[a].videoUrl.length;
var gdzie_mp4=jsresp.data.records[a].videoUrl.search("mp4")+3;

var gdzie_slash=jsresp.data.records[a].videoUrl.search("videos/")+7;

video_file=jsresp.data.records[a].videoUrl.substring(0,gdzie_mp4);

video_file=video_file.substring(gdzie_slash,video_file.length)

//console.log(video_file)

return(video_file);}catch(e) { return("(no title)"); }})(),

});

//lista_end()
                                }

                           //    console.log("Successfully")
                                }



                        }

        doc.open("GET", url);
    doc.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    doc.setRequestHeader('User-Agent','iphone/110 (iPhone; iOS 7.0.4; Scale/2.00)');
    doc.setRequestHeader("vine-session-id", key);
    doc.setRequestHeader("Connection", "close");

        doc.send();


   }

function trimString(string, limit) {
           if(string.length > limit)
           {
                   string = string.substr(0, (limit - 3)) + "...";
           }
           return string;
}

function login(){



}

function lista(kategoria,tag,userid2){
    var url=""


    var username ="n9@dks.net.pl"
    var password ="918939032"


    var loginUrl =  "https://api.vineapp.com/users/authenticate";
        username=encodeURIComponent(username);
        password=encodeURIComponent(password);

    var token = CryptoJS.SHA1(username);

    var postFields = "deviceToken="+token+"&password="+password+"&username="+username;



    var doc = new XMLHttpRequest();

    doc.open("POST", loginUrl,true);
    doc.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    doc.setRequestHeader("Content-length", postFields.length);
    doc.setRequestHeader('User-Agent','iphone/110 (iPhone; iOS 7.0.4; Scale/2.00)');
    doc.setRequestHeader("Connection", "close");
    doc.onreadystatechange = function() {//Call a function when the state changes.




                if (doc.readyState == XMLHttpRequest.DONE) {
                var jsresp = JSON.parse(doc.responseText);

                    if(jsresp.data.key!=='') {
                     key=jsresp.data.key
                   // console.log('key z funckji:'+key)
                     var userId = strtok(key,'-',false);
                   // console.log('userId z funckji:'+userId)


                               rssModel.clear();
                        console.log(kategoria)
                        switch(kategoria){

                        case 'popular':
                         url = 'https://api.vineapp.com/timelines/popular'
                            break

                        case 'promoted':
                         url = 'https://api.vineapp.com/timelines/promoted'
                         break;
                        case 'magic':
                         url = 'https://api.vineapp.com/timelines/tags/magic'
                         break;
                        case 'howto':
                         url = 'https://api.vineapp.com/timelines/tags/howto'
                         break;

                        case 'soon':
                         url = 'https://api.vineapp.com/timelines/tags/soon'
                         break;
                        case 'timelines':
                            url="https://api.vineapp.com/timelines/users/"
                        break;
                        case 'profiles':
                            url="https://api.vineapp.com/users/profiles/"+userid2
                        break;
                        case 'me':
                             url="https://api.vineapp.com/users/me"
                        break;

                        case 'tag':

                            url="https://api.vineapp.com/timelines/tags/"+tag
                         break;

                        }





                        lodavinevideo(userId,key,url);

                    }
                }


}
    doc.send(postFields);





}
