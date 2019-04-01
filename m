From: Gary R Hook <ghook@amd.com>
Date: Mon, 01 Apr 2019 13:27:27 +0000
Subject: Re: [PATCH -next] crypto: ccp - Use kmemdup in ccp_copy_and_save_keypart()
Message-Id: <133b98b0-829e-ffa8-5fb9-ef952ef3c996@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330014316.174072-1-yuehaibing@huawei.com>
In-Reply-To: <20190330014316.174072-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, "Lendacky, Thomas" <Thomas.Lendacky@amd.com>, "Hook, Gary" <Gary.Hook@amd.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

T24gMy8yOS8xOSA4OjQzIFBNLCBZdWVIYWliaW5nIHdyb3RlOg0KPiBVc2Uga21lbWR1cCByYXRo
ZXIgdGhhbiBkdXBsaWNhdGluZyBpdHMgaW1wbGVtZW50YXRpb24NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4NCg0KQWNrZWQtYnk6IEdhcnkg
UiBIb29rIDxnYXJ5Lmhvb2tAYW1kLmNvbT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL2NyeXB0by9j
Y3AvY2NwLWNyeXB0by1yc2EuYyB8IDMgKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3J5cHRv
L2NjcC9jY3AtY3J5cHRvLXJzYS5jIGIvZHJpdmVycy9jcnlwdG8vY2NwL2NjcC1jcnlwdG8tcnNh
LmMNCj4gaW5kZXggMGI4YWFiMDA5ZTdiLi44NDFhY2RmZmJjM2MgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvY3J5cHRvL2NjcC9jY3AtY3J5cHRvLXJzYS5jDQo+ICsrKyBiL2RyaXZlcnMvY3J5cHRv
L2NjcC9jY3AtY3J5cHRvLXJzYS5jDQo+IEBAIC0zNywxMCArMzcsOSBAQCBzdGF0aWMgaW5saW5l
IGludCBjY3BfY29weV9hbmRfc2F2ZV9rZXlwYXJ0KHU4ICoqa3BidWYsIHVuc2lnbmVkIGludCAq
a3BsZW4sDQo+ICAgCQlpZiAoYnVmW25za2lwXSkNCj4gICAJCQlicmVhazsNCj4gICAJKmtwbGVu
ID0gc3ogLSBuc2tpcDsNCj4gLQkqa3BidWYgPSBremFsbG9jKCprcGxlbiwgR0ZQX0tFUk5FTCk7
DQo+ICsJKmtwYnVmID0ga21lbWR1cChidWYgKyBuc2tpcCwgKmtwbGVuLCBHRlBfS0VSTkVMKTsN
Cj4gICAJaWYgKCEqa3BidWYpDQo+ICAgCQlyZXR1cm4gLUVOT01FTTsNCj4gLQltZW1jcHkoKmtw
YnVmLCBidWYgKyBuc2tpcCwgKmtwbGVuKTsNCj4gICANCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0K
PiANCj4gDQo+IA0KDQo
