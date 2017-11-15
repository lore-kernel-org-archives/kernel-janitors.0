From: "Elior, Ariel" <Ariel.Elior@cavium.com>
Date: Wed, 15 Nov 2017 15:07:10 +0000
Subject: RE: [PATCH] qed: use kzalloc instead of kmalloc and memset
Message-Id: <CY1PR0701MB133773E3C821D3FE9124D08B90290@CY1PR0701MB1337.namprd07.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171115140320.14174-1-colin.king@canonical.com>
In-Reply-To: <20171115140320.14174-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Dept-Eng Everest Linux L2 <Dept-EngEverestLinuxL2@cavium.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

PiBTdWJqZWN0OiBbUEFUQ0hdIHFlZDogdXNlIGt6YWxsb2MgaW5zdGVhZCBvZiBrbWFsbG9jIGFu
ZCBtZW1zZXQNCj4gDQo+IEZyb206IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNh
bC5jb20+DQo+IA0KPiBSZXBsYWNlIGttYWxsb2MgZm9sbG93ZWQgYnkgYSBtZW1zZXQgd2l0aCBr
emFsbG9jDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0Bj
YW5vbmljYWwuY29tPg0KQWNrZWQtYnk6IEFyaWVsIEVsaW9yIDxhZWxpb3JAY2F2aXVtLmNvbT4N
Cg0KVGhhbmtzIENvbGluLA0KQXJpZWwNCg=
