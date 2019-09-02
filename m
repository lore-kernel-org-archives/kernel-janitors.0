From: Hugues FRUCHET <hugues.fruchet@st.com>
Date: Mon, 02 Sep 2019 09:41:14 +0000
Subject: Re: [PATCH] media: stm32-dcmi: Delete an unnecessary of_node_put() call in dcmi_probe()
Message-Id: <58d7d520-ba18-a822-4920-2bedb0d01203@st.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <129a4933-2171-7ed9-c84c-8e56b6d05270@web.de>
In-Reply-To: <129a4933-2171-7ed9-c84c-8e56b6d05270@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

QWNrZWQtYnk6IEh1Z3VlcyBGcnVjaGV0IDxodWd1ZXMuZnJ1Y2hldEBzdC5jb20+DQoNCk9uIDgv
MjcvMTkgNDowOSBQTSwgTWFya3VzIEVsZnJpbmcgd3JvdGU6DQo+IEZyb206IE1hcmt1cyBFbGZy
aW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4NCj4gRGF0ZTogVHVlLCAyNyBBdWcg
MjAxOSAxNjowMDoxMyArMDIwMA0KPiANCj4gQSBudWxsIHBvaW50ZXIgd291bGQgYmUgcGFzc2Vk
IHRvIGEgY2FsbCBvZiB0aGUgZnVuY3Rpb24g4oCcb2Zfbm9kZV9wdXTigJ0NCj4gaW1tZWRpYXRl
bHkgYWZ0ZXIgYSBjYWxsIG9mIHRoZSBmdW5jdGlvbiDigJxvZl9ncmFwaF9nZXRfbmV4dF9lbmRw
b2ludOKAnQ0KPiBmYWlsZWQgYXQgb25lIHBsYWNlLg0KPiBSZW1vdmUgdGhpcyBzdXBlcmZsdW91
cyBmdW5jdGlvbiBjYWxsLg0KPiANCj4gVGhpcyBpc3N1ZSB3YXMgZGV0ZWN0ZWQgYnkgdXNpbmcg
dGhlIENvY2NpbmVsbGUgc29mdHdhcmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJrdXMgRWxm
cmluZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+DQo+IC0tLQ0KPiAgIGRyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vc3RtMzIvc3RtMzItZGNtaS5jIHwgMSAtDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL3N0bTMyL3N0bTMyLWRjbWkuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RtMzIvc3Rt
MzItZGNtaS5jDQo+IGluZGV4IGNiMWRhZjgyMTdmZi4uOTM5MmUzNDA5ZmJhIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWkuYw0KPiArKysgYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWkuYw0KPiBAQCAtMTg2MSw3ICsx
ODYxLDYgQEAgc3RhdGljIGludCBkY21pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+ICAgCW5wID0gb2ZfZ3JhcGhfZ2V0X25leHRfZW5kcG9pbnQobnAsIE5VTEwpOw0KPiAg
IAlpZiAoIW5wKSB7DQo+ICAgCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJDb3VsZCBub3QgZmluZCB0
aGUgZW5kcG9pbnRcbiIpOw0KPiAtCQlvZl9ub2RlX3B1dChucCk7DQo+ICAgCQlyZXR1cm4gLUVO
T0RFVjsNCj4gICAJfQ0KPiANCj4gLS0NCj4gMi4yMy4wDQo+IA=
