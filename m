From: Song Liu <songliubraving@fb.com>
Date: Wed, 15 Apr 2020 07:23:02 +0000
Subject: Re: [PATCH -next] bpf: remove set but not used variable 'dst_known'
Message-Id: <F68FB33A-1B98-45C1-8056-457EFA52F84F@fb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200413113703.194287-1-maowenan@huawei.com>
 <C75FACD4-8549-4AD1-BDE6-1F5B47095E4C@fb.com>
 <2b2e0060-ef9b-5541-1108-e28464b47f0a@huawei.com>
In-Reply-To: <2b2e0060-ef9b-5541-1108-e28464b47f0a@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan <maowenan@huawei.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin Lau <kafai@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@chromium.org" <kpsingh@chromium.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

DQoNCj4gT24gQXByIDE0LCAyMDIwLCBhdCA2OjM3IFBNLCBtYW93ZW5hbiA8bWFvd2VuYW5AaHVh
d2VpLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyMDIwLzQvMTUgNjowNSwgU29uZyBMaXUgd3JvdGU6
DQo+PiANCj4+IA0KPj4+IE9uIEFwciAxMywgMjAyMCwgYXQgNDozNyBBTSwgTWFvIFdlbmFuIDxt
YW93ZW5hbkBodWF3ZWkuY29tPiB3cm90ZToNCj4+PiANCj4+PiBGaXhlcyBnY2MgJy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6DQo+Pj4gDQo+Pj4ga2VybmVsL2JwZi92ZXJpZmll
ci5jOjU2MDM6MTg6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmGRzdF9rbm93buKAmQ0KPj4+IHNldCBi
dXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdDQo+Pj4gDQo+Pj4gSXQgaXMg
bm90IHVzZWQgc2luY2UgY29tbWl0IGYxMTc0Zjc3YjUwYyAoImJwZi92ZXJpZmllcjoNCj4+PiBy
ZXdvcmsgdmFsdWUgdHJhY2tpbmciKQ0KPj4gDQo+PiBUaGUgZml4IG1ha2VzIHNlbnNlLiBCdXQg
SSB0aGluayBmMTE3NGY3N2I1MGMgaW50cm9kdWNlZCBkc3Rfa25vd24sIA0KPj4gc28gdGhpcyBz
dGF0ZW1lbnQgaXMgbm90IGFjY3VyYXRlLiANCj4+IA0KPiB0aGFua3MgZm9yIHJldmlldywgeWVz
LCBmMTE3NGY3N2I1MGMgaW50cm9kdWNlZCBkc3Rfa25vd24sIGFuZCBiZWxvdyBjb21taXQNCj4g
ZG9lc24ndCBkZWZlcmVuY2UgdmFyaWFibGUgZHN0X2tub3duLiBTbyBJIHNlbmQgdjIgbGF0ZXI/
DQo+IDNmNTBmMTMyZDg0MCAoImJwZjogVmVyaWZpZXIsIGRvIGV4cGxpY2l0IEFMVTMyIGJvdW5k
cyB0cmFja2luZyIpDQoNCkkgZG9uJ3QgdGhpbmsgd2UgbmVlZCB0byBiYWNrIHBvcnQgdGhpcyB0
byBzdGFibGUuIFNvIGl0IGlzIE9LIG5vdCB0byANCmluY2x1ZGUgRml4ZXMgdGFnLiBXZSBjYW4g
anVzdCByZW1vdmUgdGhpcyBzdGF0ZW1lbnQgaW4gdGhlIGNvbW1pdCBsb2cuDQoNCmJwZi1uZXh0
IGlzIG5vdCBvcGVuIHlldC4gUGxlYXNlIHNlbmQgdjIgd2hlbiBicGYtbmV4dCBpcyBvcGVuLiAN
Cg0KVGhhbmtzLA0KU29uZw0KDQo
