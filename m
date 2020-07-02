From: Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Thu, 02 Jul 2020 12:35:58 +0000
Subject: Re: [v4 02/14] irqchip/csky-apb-intc: Fix potential resource leaks
Message-Id: <856f5c62-d731-fc3c-0e41-0c2d8b4e24a3@loongson.cn>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593569786-11500-1-git-send-email-yangtiezhu@loongson.cn>
 <1593569786-11500-3-git-send-email-yangtiezhu@loongson.cn>
 <564ffff9-6043-7191-2458-f425dd8d0c11@web.de>
 <1a0e007a-db94-501b-4ab9-0bb479ec093b@loongson.cn>
 <971c649e-fe07-3771-6fea-f5aaeaf090ad@web.de>
 <c7cc848a-1ce0-e877-aa44-ebafe4b5985c@loongson.cn>
 <41b48aa5-e5b2-0257-8b3d-07e1b86634b4@web.de>
 <0726ddc2-6b01-2ac8-d5bf-74c3df36b6ef@loongson.cn>
 <c0093731-fa42-9d43-ebfc-208ba51a96c5@loongson.cn>
 <14cacb4e-d687-dfc4-8ad8-26f9f1050a0e@web.de>
In-Reply-To: <14cacb4e-d687-dfc4-8ad8-26f9f1050a0e@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1254"
Content-Transfer-Encoding: base64
To: Markus Elfring <Markus.Elfring@web.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

T24gMDcvMDIvMjAyMCAwODoyNCBQTSwgTWFya3VzIEVsZnJpbmcgd3JvdGU6Cj4+Pj4+Pj4gKysr
IGIvZHJpdmVycy9pcnFjaGlwL2lycS1jc2t5LWFwYi1pbnRjLmMKPiDigKYKPj4gTGV0IHVzIGtl
ZXAgaXQgYXMgaXQgaXMKPiBJIHByb3Bvc2UgdG8gcmVjb25zaWRlciBhbHNvIHRoaXMgdmlldy4K
Pgo+Cj4+IHRvIG1ha2UgdGhlIGNvZGUgY2xlYXIgYW5kIHRvIGF2b2lkIHRoZSBhbGlnbm1lbnQg
aXNzdWU6Cj4+Cj4+IHJldCA9IGZvbygpOwo+PiBpZiAocmV0KSB7Cj4+ICAgICAgICAgIHJldCA9
IC1FTk9NRU07Cj4gSG93IGRvIHlvdSB0aGluayBhYm91dCB0byBkZWxldGUgdGhpcyBhc3NpZ25t
ZW50IGlmIHlvdSB3b3VsZCBsaWtlIHRvCj4gcmV1c2UgdGhlIHJldHVybiB2YWx1ZSBmcm9tIGEg
Y2FsbCBvZiB0aGUgZnVuY3Rpb24g4oCcaXJxX2FsbG9jX2RvbWFpbl9nZW5lcmljX2NoaXBz4oCd
PwoKT0ssIGxvb2tzIGdvb2QgdG8gbWUsIHRoYW5rIHlvdS4KCj4KPgo+PiAgICAgICAgICBnb3Rv
IC4uLgo+PiB9Cj4KPiBQbGVhc2UgYXBwbHkgYSBrbm93biBzY3JpcHQgYWxzbyBmb3IgdGhlIHB1
cnBvc2UgdG8gYWNoaWV2ZSBjb25zaXN0ZW50IGluZGVudGF0aW9uLgo+IGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVl
L3NjcmlwdHMvY2hlY2twYXRjaC5wbD9pZM03NzAwNmUwMWIzMTk4Yzc1ZmI3ODE5YjNkMGZmODk3
MDk1MzliYiNuMzMwMQoKT0sKCj4KPiBSZWdhcmRzLAo+IE1hcmt1cwo=
