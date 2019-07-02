From: Yonghong Song <yhs@fb.com>
Date: Tue, 02 Jul 2019 18:02:00 +0000
Subject: Re: [PATCH] bpf: Replace a seq_printf() call by seq_puts() in btf_enum_seq_show()
Message-Id: <6e3b1745-f5f7-7b0b-4bde-309c081bcd03@fb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <93898abe-9a7d-0c64-0856-094b62e07ba2@web.de>
In-Reply-To: <93898abe-9a7d-0c64-0856-094b62e07ba2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

DQoNCk9uIDcvMi8xOSAxMDoxMyBBTSwgTWFya3VzIEVsZnJpbmcgd3JvdGU6DQo+IEZyb206IE1h
cmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4NCj4gRGF0ZTogVHVl
LCAyIEp1bCAyMDE5IDE5OjA0OjA4ICswMjAwDQo+IA0KPiBBIHN0cmluZyB3aGljaCBkaWQgbm90
IGNvbnRhaW4gYSBkYXRhIGZvcm1hdCBzcGVjaWZpY2F0aW9uIHNob3VsZCBiZSBwdXQNCj4gaW50
byBhIHNlcXVlbmNlLiBUaHVzIHVzZSB0aGUgY29ycmVzcG9uZGluZyBmdW5jdGlvbiDigJxzZXFf
cHV0c+KAnS4NCj4gDQo+IFRoaXMgaXNzdWUgd2FzIGRldGVjdGVkIGJ5IHVzaW5nIHRoZSBDb2Nj
aW5lbGxlIHNvZnR3YXJlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWFya3VzIEVsZnJpbmcgPGVs
ZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0Pg0KDQpBY2tlZC1ieTogWW9uZ2hvbmcgU29uZyA8
eWhzQGZiLmNvbT4NCg0KPiAtLS0NCj4gICBrZXJuZWwvYnBmL2J0Zi5jIHwgNSArKy0tLQ0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEva2VybmVsL2JwZi9idGYuYyBiL2tlcm5lbC9icGYvYnRmLmMNCj4gaW5kZXgg
NTQ2ZWJlZTM5ZTJhLi42NzlhMTk5NjhmMjkgMTAwNjQ0DQo+IC0tLSBhL2tlcm5lbC9icGYvYnRm
LmMNCj4gKysrIGIva2VybmVsL2JwZi9idGYuYw0KPiBAQCAtMjQyNiw5ICsyNDI2LDggQEAgc3Rh
dGljIHZvaWQgYnRmX2VudW1fc2VxX3Nob3coY29uc3Qgc3RydWN0IGJ0ZiAqYnRmLCBjb25zdCBz
dHJ1Y3QgYnRmX3R5cGUgKnQsDQo+IA0KPiAgIAlmb3IgKGkgPSAwOyBpIDwgbnJfZW51bXM7IGkr
Kykgew0KPiAgIAkJaWYgKHYgPT0gZW51bXNbaV0udmFsKSB7DQo+IC0JCQlzZXFfcHJpbnRmKG0s
ICIlcyIsDQo+IC0JCQkJICAgX19idGZfbmFtZV9ieV9vZmZzZXQoYnRmLA0KPiAtCQkJCQkJCWVu
dW1zW2ldLm5hbWVfb2ZmKSk7DQo+ICsJCQlzZXFfcHV0cyhtLA0KPiArCQkJCSBfX2J0Zl9uYW1l
X2J5X29mZnNldChidGYsIGVudW1zW2ldLm5hbWVfb2ZmKSk7DQo+ICAgCQkJcmV0dXJuOw0KPiAg
IAkJfQ0KPiAgIAl9DQo+IC0tDQo+IDIuMjIuMA0KPiANCg=
