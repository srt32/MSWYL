/* ==========================================================
 * bootstrap-carousel.js v2.0.0
 * http://twitter.github.com/bootstrap/javascript.html#carousel
 * ==========================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================== */
!function(e){"use strict";var t=function(t,n){this.$element=e(t),this.options=e.extend({},e.fn.carousel.defaults,n),this.options.slide&&this.slide(this.options.slide)};t.prototype={cycle:function(){return this.interval=setInterval(e.proxy(this.next,this),this.options.interval),this},to:function(t){var n=this.$element.find(".active"),r=n.parent().children(),i=r.index(n),s=this;if(t>r.length-1||t<0)return;return this.sliding?this.$element.one("slid",function(){s.to(t)}):i==t?this.pause().cycle():this.slide(t>i?"next":"prev",e(r[t]))},pause:function(){return clearInterval(this.interval),this},next:function(){if(this.sliding)return;return this.slide("next")},prev:function(){if(this.sliding)return;return this.slide("prev")},slide:function(t,n){var r=this.$element.find(".active"),i=n||r[t](),s=this.interval,o=t=="next"?"left":"right",u=t=="next"?"first":"last",a=this;return this.sliding=!0,s&&this.pause(),i=i.length?i:this.$element.find(".item")[u](),!e.support.transition&&this.$element.hasClass("slide")?(this.$element.trigger("slide"),r.removeClass("active"),i.addClass("active"),this.sliding=!1,this.$element.trigger("slid")):(i.addClass(t),i[0].offsetWidth,r.addClass(o),i.addClass(o),this.$element.trigger("slide"),this.$element.one(e.support.transition.end,function(){i.removeClass([t,o].join(" ")).addClass("active"),r.removeClass(["active",o].join(" ")),a.sliding=!1,setTimeout(function(){a.$element.trigger("slid")},0)})),s&&this.cycle(),this}},e.fn.carousel=function(n){return this.each(function(){var r=e(this),i=r.data("carousel"),s=typeof n=="object"&&n;i||r.data("carousel",i=new t(this,s)),typeof n=="number"?i.to(n):typeof n=="string"||(n=s.slide)?i[n]():i.cycle()})},e.fn.carousel.defaults={interval:5e3},e.fn.carousel.Constructor=t,e(function(){e("body").on("click.carousel.data-api","[data-slide]",function(t){var n=e(this),r,i=e(n.attr("data-target")||(r=n.attr("href"))&&r.replace(/.*(?=#[^\s]+$)/,"")),s=!i.data("modal")&&e.extend({},i.data(),n.data());i.carousel(s),t.preventDefault()})})}(window.jQuery);