Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6AB8C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 14 Oct 2021 08:27:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99B4A60C4A
	for <kernel-janitors@archiver.kernel.org>; Thu, 14 Oct 2021 08:27:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhJNI30 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 14 Oct 2021 04:29:26 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151]:29547 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230049AbhJNI3Z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 Oct 2021 04:29:25 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-90-4Lb9nf9DM1y0E1-BhmhiIQ-1; Thu, 14 Oct 2021 09:27:18 +0100
X-MC-Unique: 4Lb9nf9DM1y0E1-BhmhiIQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Thu, 14 Oct 2021 09:27:17 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Thu, 14 Oct 2021 09:27:17 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Bernd Petrovitsch' <bernd@petrovitsch.priv.at>,
        'Joe Perches' <joe@perches.com>,
        LKML <linux-kernel@vger.kernel.org>
CC:     kernel-janitors <kernel-janitors@vger.kernel.org>
Subject: RE: Use of '%#02x' is almost always wrong
Thread-Topic: Use of '%#02x' is almost always wrong
Thread-Index: AQHXvfZAETUX8XTqNU6mI/eVjyEZpqvP3atggAGmOwCAAKhy0A==
Date:   Thu, 14 Oct 2021 08:27:17 +0000
Message-ID: <5cf03008e8784b7797feaf3d8ccfa303@AcuMS.aculab.com>
References: <b04a10ea9682c51764053c1be73d4b3be59d1e7f.camel@perches.com>
 <f41e216ed5074c55ad024e68a7dfaa3c@AcuMS.aculab.com>
 <9bae5c76-db1e-b9e3-cdfa-ab22f9d8b58c@petrovitsch.priv.at>
In-Reply-To: <9bae5c76-db1e-b9e3-cdfa-ab22f9d8b58c@petrovitsch.priv.at>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

RnJvbTogQmVybmQgUGV0cm92aXRzY2gNCj4gU2VudDogMTQgT2N0b2JlciAyMDIxIDAwOjE2DQo+
IA0KPiBPbiAxMi8xMC8yMDIxIDIzOjEwLCBEYXZpZCBMYWlnaHQgd3JvdGU6DQo+IFsuLi5dDQo+
ID4+IFNvIHByZXN1bWFibHkgYWxsIHRoZSB1c2VzIG9mICUjMDJ4IGluIHRoZSBrZXJuZWwgYXJl
IG5vdCBvdXRwdXR0aW5nDQo+ID4+IHdoYXQgaXMgYWN0dWFsbHkgZXhwZWN0ZWQuICBQZXJoYXBz
IGFsbCBvZiB0aGVzZSBzaG91bGQgdXNlICUjMDR4Lg0KPiA+DQo+ID4gRG9lc24ndCBoZWxwLiBU
aGUgZGVmaW5pdGlvbiBvZiAiJSN4IiBpcyBjb21wbGV0ZWx5IGJyb2tlbi4NCj4gDQo+IFNlY29u
ZGVkIC4uLg0KPiANCj4gPiBCYXNpY2FsbHkgMCBkb2Vzbid0IGdldCB0aGUgIjB4IiBwcmVmaXgs
IHNvICIlIzA0eCIgb3V0cHV0cw0KPiA+ICIwMDAwIi4NCj4gDQo+IC4uLiBqdXN0IGJlY2F1c2Ug
b2YgdGhhdC4NCj4gQW5kIGlmIG9uZSBnZXQncyBpbiB0b3VjaCB3aXRoIHRvb2xzIHdoZXJlIGZv
cm1hdCBzdHJpbmdzIGFyZQ0KPiB0aGUgJSAtc3R1ZmYgaXMgbm90IGNvbnNpc3RlbnRseSB1c2Vk
IC4uLg0KPiANCj4gPiAiMDAwMCIgaWYgdGhlIHZhbHVlIGlzIHplcm8uDQo+ID4gU28gdGhlIGNv
cnJlY3QgcmVwbGFjZW1lbnQgaXMgKHByb2JhYmx5KSAiMHglMDJ4Ii4NCj4gDQo+IEF0IGxlYXN0
IGl0J3MgY29uc2lzdGVudCB0aGF0IHdheS4NCj4gDQo+IEFuZCBpbiB0aGUgYmlnIHRlY2hpZSBw
aWN0dXJlLCBJIGRvbid0IHNlZSB3aGF0IHRoZSAnIycgbW9kaWZlcg0KPiBidXlzIGFuZCB3aHkg
aXQgbWFrZXMgc2Vuc2UgdG8gdXNlIGl0Lg0KDQpJdCB3b3JrcyBmb3IgIiUjOHgiIHdoZXJlIGl0
IGFkZCB0aGUgIjB4IiB0byB0aGUgcmlnaHQtYWxpZ25lZA0KaGV4IGRpZ2l0cy4NCg0KCURhdmlk
DQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBG
YXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2
IChXYWxlcykNCg==

