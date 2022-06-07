//# region For Variable Collection
const _dist_time_rest = ["COUNTING", "EXPIRED"];
String.prototype.splitInIdx = function (d, i) {
	let r = this.split(d);
	return r[i];
}
String.prototype.padZero = function (len, c) {
    var s = '', c = c || '0', len = (len || 2) - this.length;
    while (s.length < len) s += c;
    return s + this;
}
Number.prototype.padZero = function (len, c) {
    return String(this).padZero(len, c);
}

if (typeof jQuery !== 'undefined') {
    console.log("jQuery Version", jQuery.fn.jquery);
} else {
    console.log("jQuery library is not found!");
}

//# endregion
//# region For Hijri Calendar Kuwaiti
function gmod(n,m){
	return ((n%m)+m)%m;
}
function kuwaiticalendar(adjust){
	var today = new Date();
	if(adjust) {
		adjustmili = 1000*60*60*24*adjust;
		todaymili = today.getTime()+adjustmili;
		today = new Date(todaymili);
	}
	day = today.getDate();
	month = today.getMonth();
	year = today.getFullYear();
	m = month+1;
	y = year;
	if(m<3) {
		y -= 1;
		m += 12;
	}

	a = Math.floor(y/100.);
	b = 2-a+Math.floor(a/4.);
	if(y<1583) b = 0;
	if(y===1582) {
		if(m>10)  b = -10;
		if(m===10) {
			b = 0;
			if(day>4) b = -10;
		}
	}

	jd = Math.floor(365.25*(y+4716))+Math.floor(30.6001*(m+1))+day+b-1524;

	b = 0;
	if(jd>2299160){
		a = Math.floor((jd-1867216.25)/36524.25);
		b = 1+a-Math.floor(a/4.);
	}
	bb = jd+b+1524;
	cc = Math.floor((bb-122.1)/365.25);
	dd = Math.floor(365.25*cc);
	ee = Math.floor((bb-dd)/30.6001);
	day =(bb-dd)-Math.floor(30.6001*ee);
	month = ee-1;
	if(ee>13) {
		cc += 1;
		month = ee-13;
	}
	year = cc-4716;

	if(adjust) {
		wd = gmod(jd+1-adjust,7)+1;
	} else {
		wd = gmod(jd+1,7)+1;
	}

	iyear = 10631./30.;
	epochastro = 1948084;
	epochcivil = 1948085;

	shift1 = 8.01/60.;

	z = jd-epochastro;
	cyc = Math.floor(z/10631.);
	z = z-10631*cyc;
	j = Math.floor((z-shift1)/iyear);
	iy = 30*cyc+j;
	z = z-Math.floor(j*iyear+shift1);
	im = Math.floor((z+28.5001)/29.5);
	if(im===13) im = 12;
	id = z-Math.floor(29.5001*im-29);

	var myRes = new Array(8);

	myRes[0] = day; //calculated day (CE)
	myRes[1] = month-1; //calculated month (CE)
	myRes[2] = year; //calculated year (CE)
	myRes[3] = jd-1; //julian day number
	myRes[4] = wd-1; //weekday number
	myRes[5] = id; //islamic date
	myRes[6] = im-1; //islamic month
	myRes[7] = iy; //islamic year

	return myRes;
}
function writeIslamicDate(adjustment) {
	const wdNames = ["Ahad","Ithnin","Thulatha","Arbaa","Khams","Jumuah","Sabt"];
	const iMonthNames = ["Muharram","Safar","Rabi'ul Awwal","Rabi'ul Akhir",
	"Jumadal Ula","Jumadal Akhira","Rajab","Sha'ban",
	"Ramadan","Shawwal","Dhul Qa'ada","Dhul Hijja"];
	let iDate = kuwaiticalendar(adjustment);
	// var outputIslamicDate = wdNames[iDate[4]] + ", " + iDate[5] + " " + iMonthNames[iDate[6]] + " " + iDate[7] + " AH";
	return iDate[5] + " " + iMonthNames[iDate[6]] + " " + iDate[7];
}
//# endregion
//# region For Datetime
function setZeroTime(i) {
  if (i < 10) {i = "0" + i}  // add zero in front of numbers < 10
  return i;
}
function checkDayName(i){
	// const weekdays = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
	const weekdays = ["Minggu","Senin","Selasa","Rabu","Kamis","Jumat","Sabtu"];
	return weekdays[i];
}
function checkMonthName(i){
	// const month = ["January","February","March","April","May","June","July","August","September","October","November","December"];
	const month = ["Jan","Feb","Mar","Apr","Mei","Jun","Jul","Aug","Sep","Okt","Nov","Des"];
	return month[i];
}

function distanceTime(dt) {
	// Get today's date and time
	// let now = abd.dt.getNowTime();

	// Find the distance between now and the count down date
	let distance = abd.dt.getDistance.val(dt);

	// Time calculations for days, hours, minutes and seconds
	let h = abd.dt.getDistance.hours(distance);
	let m = abd.dt.getDistance.minutes(distance);
	let s = abd.dt.getDistance.seconds(distance);

	// Output the result in an element with id="demo"
	let r = m + ":" + s.padZero(2, '0');
	if(distance < 0) {
		r = "EXPIRED";
	}
	// console.log(h + ':' + m + ':' + s)
	if(h >= 0 && m > 5) {
		r = "COUNTING"
	}
	// r = distance.toString();
	return r;
}
function beforePrayTime(dt) {
	// Get today's date and time
	// let now = new Date().getTime();

	// Find the distance between now and the count down date
	let distance = abd.dt.getDistance.val(dt);

	// Time calculations for days, hours, minutes and seconds
	let h = abd.dt.getDistance.hours(distance);
	let m = abd.dt.getDistance.minutes(distance);
	let s = abd.dt.getDistance.seconds(distance);

	// Output the result in an element with id="demo"
	let r = m + ":" + s.padZero(2, '0');
	if(distance < 0) {
		r = "EXPIRED";
	}
	// console.log(h + ':' + m + ':' + s)
	if(h >= 0 && m > 2) {
		r = "COUNTING"
	}
	// r = distance.toString();
	return r;
}
function beforeIqomatTime(dt) {
	// Get today's date and time
	// let now = new Date().getTime();

	// Find the distance between now and the count down date
	let distance = abd.dt.getDistance.val(dt);

	// Time calculations for days, hours, minutes and seconds
	let h = abd.dt.getDistance.hours(distance);
	let m = abd.dt.getDistance.minutes(distance);
	let s = abd.dt.getDistance.seconds(distance);

	// Output the result in an element with id="demo"
	let r = m + ":" + s.padZero(2, '0');
	if(distance < 0) {
		r = "EXPIRED";
	}
	// console.log(h + ':' + m + ':' + s)
	if(h >= 0 && m > 1) {
		r = "COUNTING"
	}
	// r = distance.toString();
	return r;
}
//# endregion
//# region For All Collection
let abd = {
    validate: {
        isEmailAddress: function (str) {
            var pattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            return pattern.test(str);  // returns a boolean
        },
        isEmptyVal: function (str) {
            var pattern = /\S+/;
            return str === null ? true : !pattern.test(str) === true;  // returns a boolean
        },
        isNumVal: function (str) {
            var pattern = /^\d+$/;
            return pattern.test(str);  // returns a boolean
        },
        is123: function (str) {
            var pattern = /^[0-2]+$/;
            return pattern.test(str);  // returns a boolean
        },
        isEqualVal: function (str1, str2) {
            return str1 === str2;
        }
    }
    , dt: {
		/**
		 * @return Sat May 14 2022 15:29:44 GMT+0700 (Indochina Time)
		 */
		getNowDate: function () {
			return new Date();
		}
		/**
		 * @return 1652516996130
		 */
    	, getNowTime: function () {
			return new Date().getTime();
		}
		, changeNowTime: function (t) {
    		let r = abd.dt.getNowDate();
    		if(t.includes(':')) {
				r.setHours(Number.parseInt(t.splitInIdx(':', 0)));
				r.setMinutes(Number.parseInt(t.splitInIdx(':', 1)));
				r.setSeconds(0);
			}
			return r;
		}
		, getDistance: {
    		val: function (dt) {
    			return dt - abd.dt.getNowTime();
			}
			, days: function (dist) {
				return Math.floor(dist / (1000 * 60 * 60 * 24));
			}
			, hours: function (dist) {
    			return Math.floor((dist % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
			}
			, minutes: function (dist) {
    			return Math.floor((dist % (1000 * 60 * 60)) / (1000 * 60));
			}
			, seconds: function (dist) {
    			return Math.floor((dist % (1000 * 60)) / 1000);
			}
		}
		, getInterval: {
    		day: function (i) {
    			return i * 24 * 60 * 60 * 1000
			}
			, hour: function (i) {
    			return i * 60 * 60 * 1000
			}
			, minute: function (i) {
    			return i * 60 * 1000
			}
			, second: function (i) {
    			return i * 1000
			}
		}
	}
	// , str: {
    // 	split: function (s, d) {
    // 		return s.split(d)
	// 	}
	// }
	/**
	 * For element manipulation
	 */
	, elem: {
		addCls: function (id, cls) {
			document.getElementById(id).classList.add(cls);
		}
		, removeCls: function (id, cls) {
			document.getElementById(id).classList.remove(cls);
		}
		, changeCls: function (id, clsO, clsN) {
			abd.elem.removeCls(id, clsO);
			abd.elem.addCls(id, clsN);
		}
		, getHtmlId: function (id) {
			return document.getElementById(id).innerHTML;
		}
		, setHtmlId: function (id, val) {
			document.getElementById(id).innerHTML = val;
		}
		, getSrcId: function (id) {
			return document.getElementById(id).src;
		}
		, setSrcId: function (id, val) {
			document.getElementById(id).src = val;
		}
	}
    , openNewTab(purl) {
        window.open(purl, '_blank');
    }
    , openUrl(purl) {
        window.location.href = purl;
    }
    , getIdValue(sid) {
        return $('#' + sid).val();
    }
    , getIdValDate(el) {
        var par = $('#' + el).val();
        var ispar = abd.validate.isEmptyVal(par);
        var ret = '';

        if (!ispar) {
            ret = par;
        } else {
            ret = '2000-01-01';
        }

        return ret;
    }
    , getIdValTime(el) {
        var par = $('#' + el).val();
        var ispar = abd.validate.isEmptyVal(par);
        var ret = '';

        if (!ispar) {
            ret = par;
        } else {
            ret = '00:00:00';
        }

        return ret;
    }
    , setIdVal(el, val) {
        return $('#' + el).val(val);
    }
    , getIdText(el) {
        return $('#' + el).text();
    }
    , setIdText(el, val) {
        return $('#' + el).text(val);
    }
    , getIdHtml(el) {
        return $('#' + el).html();
    }
    , setIdHtml(el, val) {
        return $('#' + el).html(val);
    }
    , setIdVisible(el, val) {
        if (val === true) {
            $('#' + el).show();
        } else {
            $('#' + el).hide();
        }
    }
	, getSelect2ID(el){
        var dat = $('#' + el).select2('data');
        console.log(dat);
			// dat[0].text
        //return dat[0].id;
    }
	, getSelect2Text(el){
        var dat = $('#' + el).select2('data');
			// dat[0].id
        return dat[0].text;
    }
    , getClsVal(el) {
        return $('.' + el).val();
    }
    , setClsVal(el, val) {
        return $('.' + el).val(val);
    }
    , getClsText(el) {
        return $('.' + el).val();
    }
    , setClsText(el, val) {
        return $('.' + el).val(val);
    }
    , getClsHtml(el) {
        return $('.' + el).html();
    }
    , setClsHtml(el, val) {
        return $('.' + el).html(val);
    }
    , setClsVisible(el, val) {
        if (val === true) {
            $('.' + el).show();
        } else {
            $('.' + el).hide();
        }
    }
    , addClsById(id, cls) {
    	document.getElementById(id).classList.add(cls);
	}
    , removeClsById(id, cls) {
    	document.getElementById(id).classList.remove(cls);
	}
}

//# endregion