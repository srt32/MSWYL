/* =========================================================
 * bootstrap-modal.js v2.0.0
 * http://twitter.github.com/bootstrap/javascript.html#modals
 * =========================================================
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
 * ========================================================= */
!function(e){"use strict";function n(){var t=this,n=setTimeout(function(){t.$element.off(e.support.transition.end),r.call(t)},500);this.$element.one(e.support.transition.end,function(){clearTimeout(n),r.call(t)})}function r(e){this.$element.hide().trigger("hidden"),i.call(this)}function i(t){var n=this,r=this.$element.hasClass("fade")?"fade":"";if(this.isShown&&this.options.backdrop){var i=e.support.transition&&r;this.$backdrop=e('<div class="modal-backdrop '+r+'" />').appendTo(document.body),this.options.backdrop!="static"&&this.$backdrop.click(e.proxy(this.hide,this)),i&&this.$backdrop[0].offsetWidth,this.$backdrop.addClass("in"),i?this.$backdrop.one(e.support.transition.end,t):t()}else!this.isShown&&this.$backdrop?(this.$backdrop.removeClass("in"),e.support.transition&&this.$element.hasClass("fade")?this.$backdrop.one(e.support.transition.end,e.proxy(s,this)):s.call(this)):t&&t()}function s(){this.$backdrop.remove(),this.$backdrop=null}function o(){var t=this;this.isShown&&this.options.keyboard?e(document).on("keyup.dismiss.modal",function(e){e.which==27&&t.hide()}):this.isShown||e(document).off("keyup.dismiss.modal")}var t=function(t,n){this.options=e.extend({},e.fn.modal.defaults,n),this.$element=e(t).delegate('[data-dismiss="modal"]',"click.dismiss.modal",e.proxy(this.hide,this))};t.prototype={constructor:t,toggle:function(){return this[this.isShown?"hide":"show"]()},show:function(){var t=this;if(this.isShown)return;e("body").addClass("modal-open"),this.isShown=!0,this.$element.trigger("show"),o.call(this),i.call(this,function(){var n=e.support.transition&&t.$element.hasClass("fade");!t.$element.parent().length&&t.$element.appendTo(document.body),t.$element.show(),n&&t.$element[0].offsetWidth,t.$element.addClass("in"),n?t.$element.one(e.support.transition.end,function(){t.$element.trigger("shown")}):t.$element.trigger("shown")})},hide:function(t){t&&t.preventDefault();if(!this.isShown)return;var i=this;this.isShown=!1,e("body").removeClass("modal-open"),o.call(this),this.$element.trigger("hide").removeClass("in"),e.support.transition&&this.$element.hasClass("fade")?n.call(this):r.call(this)}},e.fn.modal=function(n){return this.each(function(){var r=e(this),i=r.data("modal"),s=typeof n=="object"&&n;i||r.data("modal",i=new t(this,s)),typeof n=="string"?i[n]():i.show()})},e.fn.modal.defaults={backdrop:!0,keyboard:!0},e.fn.modal.Constructor=t,e(function(){e("body").on("click.modal.data-api",'[data-toggle="modal"]',function(t){var n=e(this),r,i=e(n.attr("data-target")||(r=n.attr("href"))&&r.replace(/.*(?=#[^\s]+$)/,"")),s=i.data("modal")?"toggle":e.extend({},i.data(),n.data());t.preventDefault(),i.modal(s)})})}(window.jQuery);