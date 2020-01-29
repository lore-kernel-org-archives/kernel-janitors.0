From: Peter Rosin <peda@axentia.se>
Date: Wed, 29 Jan 2020 08:06:32 +0000
Subject: Re: [PATCH][next][V2] i2c: xiic: fix indentation issue
Message-Id: <f8c236de-4ed6-49dc-e5b7-283ebb859199@axentia.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200127102303.44133-1-colin.king@canonical.com>
 <2dd84ab2-a7a3-fdd8-6bd6-07f1b3d5cd00@xilinx.com>
 <20200127120535.GC1847@kadam>
 <89661e5e-7662-81a5-ec36-57367825de5e@canonical.com>
 <35ed6501-3b26-36a9-d332-d4ed3366ebd8@axentia.se>
 <3b287fb5-e344-c13a-2803-09c2958b9b0d@canonical.com>
In-Reply-To: <3b287fb5-e344-c13a-2803-09c2958b9b0d@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>, Dan Carpenter <dan.carpenter@oracle.com>, Michal Simek <michal.simek@xilinx.com>, Johan Hovold <johan@kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

T24gMjAyMC0wMS0yOSAwMDoxMCwgQ29saW4gSWFuIEtpbmcgd3JvdGU6DQo+IE9uIDI4LzAxLzIw
MjAgMjE6NDUsIFBldGVyIFJvc2luIHdyb3RlOg0KPj4gT24gMjAyMC0wMS0yNyAxMzowOCwgQ29s
aW4gSWFuIEtpbmcgd3JvdGU6DQo+Pj4gT24gMjcvMDEvMjAyMCAxMjowNSwgRGFuIENhcnBlbnRl
ciB3cm90ZToNCj4+Pj4gT24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMTI6MDM6MDJQTSArMDEwMCwg
TWljaGFsIFNpbWVrIHdyb3RlOg0KPj4+Pj4gT24gMjcuIDAxLiAyMCAxMToyMywgQ29saW4gS2lu
ZyB3cm90ZToNCj4+Pj4+PiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmlj
YWwuY29tPg0KPj4+Pj4+DQo+Pj4+Pj4gVGhlcmUgaXMgYSBzdGF0ZW1lbnQgdGhhdCBpcyBpbmRl
bnRlZCBvbmUgbGV2ZWwgdG9vIGRlZXBseSwgcmVtb3ZlDQo+Pj4+Pj4gdGhlIGV4dHJhbmVvdXMg
dGFiLg0KPj4+Pj4+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGlu
LmtpbmdAY2Fub25pY2FsLmNvbT4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiBWMjogZml4IHR5cGUgaW4g
Y29tbWl0IG1lc3NhZ2UNCj4+Pj4+PiAtLS0NCj4+Pj4+PiAgZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy14aWljLmMgfCAyICstDQo+Pj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQ0KPj4+Pj4+DQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMteGlpYy5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy14aWljLmMNCj4+Pj4+PiBp
bmRleCBiMTdkMzBjOWFiNDAuLjkwYzFjMzYyMzk0ZCAxMDA2NDQNCj4+Pj4+PiAtLS0gYS9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLXhpaWMuYw0KPj4+Pj4+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMteGlpYy5jDQo+Pj4+Pj4gQEAgLTI2MSw3ICsyNjEsNyBAQCBzdGF0aWMgaW50IHhpaWNf
Y2xlYXJfcnhfZmlmbyhzdHJ1Y3QgeGlpY19pMmMgKmkyYykNCj4+Pj4+PiAgCQl4aWljX2dldHJl
ZzgoaTJjLCBYSUlDX0RSUl9SRUdfT0ZGU0VUKTsNCj4+Pj4+PiAgCQlpZiAodGltZV9hZnRlcihq
aWZmaWVzLCB0aW1lb3V0KSkgew0KPj4+Pj4+ICAJCQlkZXZfZXJyKGkyYy0+ZGV2LCAiRmFpbGVk
IHRvIGNsZWFyIHJ4IGZpZm9cbiIpOw0KPj4+Pj4+IC0JCQkJcmV0dXJuIC1FVElNRURPVVQ7DQo+
Pj4+Pj4gKwkJCXJldHVybiAtRVRJTUVET1VUOw0KPj4+Pj4+ICAJCX0NCj4+Pj4+PiAgCX0NCj4+
Pj4+PiAgDQo+Pj4+Pj4NCj4+Pj4+DQo+Pj4+PiBBcyB3YXMgc3VnZ2VzdGVkIGJ5IFBldGVyIHlv
dSBzaG91bGQgYWxzbyBhZGQgRml4ZXM6IDxzaGExPiAoInBhdGNoDQo+Pj4+PiBzdWJqZWN0IikN
Cj4+Pj4+DQo+Pj4+DQo+Pj4+IEl0J3Mgbm90IHJlYWxseSBhIGJ1Z2ZpeCwgaXQncyBqdXN0IGEg
Y2xlYW51cC4NCj4+Pg0KPj4+IEknbSBzdXJwcmlzZWQgaSB3YXNuJ3QgYXNrZWQgZm9yIGEgYnVn
IG51bWJlciB0b28uDQo+Pg0KPj4gVmVyeSBmdW5ueS4NCj4gDQo+IEFwb2xvZ2llcyBmb3IgYmVp
bmcgZmxpcHBhbnQuIEkgZGlkbid0IG1lYW4gdG8gb2ZmZW5kLiBNeSBiYWQgIzEuDQoNCkFwb2xv
Z3kgYWNjZXB0ZWQsIG5vIGhhcmQgZmVlbGluZ3MuIERvbid0IHdvcnJ5IGFib3V0IGl0LCBhbmQg
c29ycnkgb24gbXkNCnBhcnQgZm9yIGEgcG9zc2libGUgb3ZlcnJlYWN0aW9uIQ0KDQpDaGVlcnMs
DQpQZXRlcg0K
