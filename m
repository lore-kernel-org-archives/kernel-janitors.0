Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F99EC11F67
	for <kernel-janitors@archiver.kernel.org>; Tue, 29 Jun 2021 21:53:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78B2261D72
	for <kernel-janitors@archiver.kernel.org>; Tue, 29 Jun 2021 21:53:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235955AbhF2Vz4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 29 Jun 2021 17:55:56 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:26572 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235407AbhF2Vzw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 29 Jun 2021 17:55:52 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-49-UjAekXPIORGvJ_dp4wCcjg-1; Tue, 29 Jun 2021 22:53:20 +0100
X-MC-Unique: UjAekXPIORGvJ_dp4wCcjg-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 29 Jun
 2021 22:53:20 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Tue, 29 Jun 2021 22:53:20 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Colin King' <colin.king@canonical.com>,
        Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] staging: r8188eu: Fix while-loop that iterates only once
Thread-Topic: [PATCH] staging: r8188eu: Fix while-loop that iterates only once
Thread-Index: AQHXbQTrH/7kn7BXCUeSE4wXJHw0z6srh4rQ
Date:   Tue, 29 Jun 2021 21:53:20 +0000
Message-ID: <ff4444d1d2204539945ded9bf06c94e6@AcuMS.aculab.com>
References: <20210629163624.41543-1-colin.king@canonical.com>
In-Reply-To: <20210629163624.41543-1-colin.king@canonical.com>
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

RnJvbTogQ29saW4gS2luZw0KPiBTZW50OiAyOSBKdW5lIDIwMjEgMTc6MzYNCj4gDQo+IFRoZSB3
aGlsZS1sb29wIG9ubHkgaXRlcmF0ZXMgb25jZSBiZWNhc2UgdGhlIHBvc3QgaW5jcmVtZW50IHRl
c3Qgb2YgY291bnQNCj4gYmVpbmcgbm9uLXplcm8gaXMgZmFsc2Ugb24gdGhlIGZpcnN0IGl0ZXJh
dGlvbiBiZWNhdXNlIGNvdW50IGlzIHplcm8uIEZpeA0KPiB0aGlzIGJ5IGluY3JlbWVudGluZyBj
b3VudCB1c2luZyBwcmUtaW5jcmVtZW50LiBTdGF0aWMgYW5hbHlzaXMgZm91bmQgdGhlDQo+IGlz
c3VlIG9uIHRoZSBjb3VudCA+IFBPTExJTkdfTExUX1RIUkVTSE9MRCBjaGVjayBhbHdheXMgYmVp
bmcgZmFsc2Ugc2luY2UNCj4gdGhlIGxvb3AgY3VycmVudGx5IGp1c3QgaXRlcmF0ZXMgb25jZS4N
Cg0KQnV0IHRoYXQgaXMgYSB2ZXJ5IHN0cmFuZ2UgJ2xvb3AgYm90dG9tJy4NCg0KLi4uDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvcnRsODE4OGV1L2hhbC9ydGw4MTg4ZV9oYWxfaW5p
dC5jDQo+IGIvZHJpdmVycy9zdGFnaW5nL3J0bDgxODhldS9oYWwvcnRsODE4OGVfaGFsX2luaXQu
Yw0KPiBpbmRleCBkMTA4NjY5OWY5NTIuLmRiNTdmMDRlN2U1NiAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9zdGFnaW5nL3J0bDgxODhldS9oYWwvcnRsODE4OGVfaGFsX2luaXQuYw0KPiArKysgYi9k
cml2ZXJzL3N0YWdpbmcvcnRsODE4OGV1L2hhbC9ydGw4MTg4ZV9oYWxfaW5pdC5jDQo+IEBAIC0x
ODUsNyArMTg1LDcgQEAgc3RhdGljIHMzMiBfTExUV3JpdGUoc3RydWN0IGFkYXB0ZXIgKnBhZGFw
dGVyLCB1MzIgYWRkcmVzcywgdTMyIGRhdGEpDQo+ICAJCQlicmVhazsNCj4gIAkJfQ0KPiAgCQl1
ZGVsYXkoNSk7DQo+IC0JfSB3aGlsZSAoY291bnQrKyk7DQo+ICsJfSB3aGlsZSAoKytjb3VudCk7
DQoNClVubGVzcyAnY291bnQnIGlzIG5lZ2F0aXZlIHRoYXQgbWlnaHQgYXMgd2VsbCBiZSAnd2hp
bGUgKDEpJw0Kd2l0aCBjb3VudCBpbmNyZW1lbnRlZCBlbHNld2hlcmUuDQpQZXJoYXBzIHRoZSBs
b29wIHRvcCBzaG91bGQgYmU6DQoJZm9yIChjb3VudCA9IDA7OyBjb3VudCsrKSB7DQoNCiAgIERh
dmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3Vu
dCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3
Mzg2IChXYWxlcykNCg==

