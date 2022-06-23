Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D65C43334
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Jun 2022 16:18:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232128AbiFWQSA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 23 Jun 2022 12:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232075AbiFWQR5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Jun 2022 12:17:57 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80118.outbound.protection.outlook.com [40.107.8.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E7F8FC6
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Jun 2022 09:17:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXqJGKRnKFpBrUmszLcz4u3MGjhnP5mJCXJp/CO8KfClcXubCVIdUkMK1Kgm7+CMXVeuoLjjjQd+xbckyOlY9vkoF/zVZXAYJXj86Efq+4zIpIwFPgrFKQ9WaLlBkndQDVK5DAQA+Geec/eBS12h2Tzt7gpW4ky9gK5imhYo0xklYwNqi6jRU+q+ITVwtJBpNMMRwfHWfCEZ0h+9Xy9/48mr7cRx0dRScJ+9pssAkvwEUnkrJ8bsOSRliKLZoZ78sB9QCgflqvaezxzAMZZ72/5Oq5tFs9hj+HZPxH/g/B5bBOxxCpiwJXjfFQxHIm4w+mftCzVTk8iUPecD0IrKNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+e9+60fmPpm9fSWqQGR24K0YEUa9AHVQhWVqDyKuI4=;
 b=ENssDfBlXamuhL7ZDkrWQdN9Tdkq8Zqfum4F5kaLu6IWr70VsvrEAgtAB2r+eke7wCeIhFA6s0LBBVE5YDFh0gT3oX87nJaxozjap0k/cpZcyJPNhtWzZKyAFnGa6tB7w1M/KeQuNTzW3BwebVMuSWoZaomJnQyCMr/HopPrEsL108WjFbmyBnibjj3Q0fr+DfZzUW3TjSa4gpSlFtWtJ5CNbX7FFwLydqWEwz9ABY/WBOdXkMhatCmC5IDg5tRfOh40hzfEr7uOd8RbwUjpoopGYPPpJuFMhm8CUtg6yM7ugkIPXqHOaPxWuLE0AGCHAlN2pGlLykGTzyvYYvxS3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netatmo.com; dmarc=pass action=none header.from=netatmo.com;
 dkim=pass header.d=netatmo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netatmo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+e9+60fmPpm9fSWqQGR24K0YEUa9AHVQhWVqDyKuI4=;
 b=fbnuWyi8t0bTT+fZ77NqqQ8SxhSy9L2UAlwoEDMmxAjCjuDC6k5MdfEZiaFfRvv/stfsGWG6qgy8UQYBSKXXqgU6pMEGzxvkJAEbfNvk+9bIpB3o1YYG5wc4t7JNK/kamTxmkicawr4aIv7w6CusuoS8HB/nP+iVBF+NNeZx7pM=
Received: from AS8PR03MB7603.eurprd03.prod.outlook.com (2603:10a6:20b:34e::15)
 by DB6PR0301MB2439.eurprd03.prod.outlook.com (2603:10a6:4:5b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 16:17:51 +0000
Received: from AS8PR03MB7603.eurprd03.prod.outlook.com
 ([fe80::8175:20e5:60ec:b87d]) by AS8PR03MB7603.eurprd03.prod.outlook.com
 ([fe80::8175:20e5:60ec:b87d%9]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 16:17:51 +0000
From:   =?utf-8?B?SsOpcsOpbXkgTEVGQVVSRQ==?= <jeremy.lefaure@netatmo.com>
To:     Markus Elfring <Markus.Elfring@web.de>,
        "cocci@inria.fr" <cocci@inria.fr>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
CC:     Julia Lawall <julia.lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>
Subject: Re: [cocci] coccinelle: Extend address test from ifaddr to every test
 expression
Thread-Topic: [cocci] coccinelle: Extend address test from ifaddr to every
 test expression
Thread-Index: AQHYhZKVoiShKWKcfECMq7fkDiuzD61dLk7r
Date:   Thu, 23 Jun 2022 16:17:51 +0000
Message-ID: <AS8PR03MB76034D043F7A3FA878E13FA093B59@AS8PR03MB7603.eurprd03.prod.outlook.com>
References: <AS8PR03MB76033CF2848D03651D6E189093A69@AS8PR03MB7603.eurprd03.prod.outlook.com>
 <6aef3ee4-d934-daff-7145-73ac563d2fb4@web.de>
 <AS8PR03MB7603675681B64E5F14C1995593B39@AS8PR03MB7603.eurprd03.prod.outlook.com>
 <e887b364-7e69-267c-3a25-356bb2075699@web.de>
In-Reply-To: <e887b364-7e69-267c-3a25-356bb2075699@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=netatmo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8307587a-2c5c-46ee-90e6-08da5533ebff
x-ms-traffictypediagnostic: DB6PR0301MB2439:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mubd+Cg10XU7jg8xLz86MUaDbCKbO9JIs50yQhaNqhIZsY+2GPgzlqOZ/WMmukuKB0AWocl2C6z/WXm/BXmT2+LE7ksEf0vcWzgQtLbu2GM/hOnW2Jhva1mkgIJaKQ/YhLGJwwJJVI0L3RDzXkE6BN2DisPNppH+fdgB0FekivV0aK73m/xfjzfEzTW9zUJgzORUvAVgNfB45oFSeeXOYUAHQbUni6+iB+EIWOCKTiwixQF1DrkHLyyz1uFjskonzqjXqg5OFu5ZwXuAQFYXW6Gp+n6wNYW6viUEFV70vtjudTQmqh0E47fENi1lsVnRKjBshypT7R7XvCdWW6PQLmnyirqWy9tBargOdPlcDxJ0H7+81kwPEafReYtMiF/qM6gdDnfZwlYWISDt3CKmt0Zwgehw/Tf3fFsRbohDEPNyUUgXqNMNbwcuR0Ls+F8+34YiMSHnyu1PvzZittXDAhMKdwzAs+jleBu20zDlq85O7B/VYtR+W2cyr6XrYagB5YdIa5udAIpW6Aek1D2TCUrLuyuhfv9W0ONS+pLTCf6M5IQKYGbYQR6j7c8SC2jeT0AfrKsViEGOXDAYDlSsr683FNnHsSubKj1inTvvFyDQcYhDSXGuxq5VX/3Dn8DW9sojRLu73uxOl1QXfNFi2I1/qR6ts6YsGvI2qSm0p56faHvG20ICzEQUonn410DEaefz/rmFy38sko0YHQO77NgdTC4Sw+Jtbc5ucZadrcMralnV7B06jJxMt/XoYzVq2nXgz+oeijr7DnWHH9J83YYwHAyVbqkxPZBVGuCqAXc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB7603.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(396003)(136003)(376002)(366004)(346002)(33656002)(55016003)(85182001)(85202003)(5660300002)(122000001)(52536014)(8676002)(66556008)(66476007)(64756008)(91956017)(66446008)(316002)(110136005)(8936002)(76116006)(71200400001)(66946007)(2906002)(4326008)(54906003)(478600001)(41300700001)(55236004)(6506007)(7696005)(9686003)(26005)(86362001)(186003)(83380400001)(38070700005)(38100700002)(66574015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVhFNDVVWUJvRmUxaHp4S0tLTnZoREVNT3hBOTNweVUrWWZXVjNmM2hUd3Nk?=
 =?utf-8?B?RHdHT001dEpNcXlCUTRNdU1UWU4wZGpqOWJ6ejFSdnc0QlNUUVpDVEVLVUVP?=
 =?utf-8?B?eWNIVEFNQ2RjUldmc1JFY2J0d1RFSkpMYUUyZGpVZURaOFIwUFZHbFVaeVNr?=
 =?utf-8?B?MWFQQXZxTURydnhPTGZCaG13R1hSVlFJMEhUd0FQL2JrUXZGRC8zSkFoZ1Bx?=
 =?utf-8?B?WC9hQkJ3aGhyWm80a2lPSnROLzJNRDRSekFUaEd1YTNQRmFKTHpWOEUzZFRr?=
 =?utf-8?B?SkUrSzU1VjdyVHU2SXp6WnNmL2tFNFhYZ2FXb2hVQmk4Mkw1aXQ1NjJQMEpn?=
 =?utf-8?B?RTAvN09nc2RHNXFlTmdKNy9FNnh3cjJHTkR2OFVtS2hlNTVtZ0tLYmNHUVhX?=
 =?utf-8?B?Ti9LQzVWUEhZUkFQM1J0RnVKMEVUVWxmdy94b0k1d0JvbVczdWFSaEpvQWg5?=
 =?utf-8?B?MU1iRlVxajVlS0diSkFrVzlqYUduRWROb2NWNy95bDFBVDBVdXFJamowd3J2?=
 =?utf-8?B?UU9kOXVKcVRVU2I2bXltMDN2d3Z5alR4N1FMSlBMQXJUKzRIMHRxWTZ4dHFH?=
 =?utf-8?B?VmQ0bFpYelBGU0lIR2oxRFFFTjlOKzRQOWZIUTJXQktpMWFUTzhqS0Z2SmJU?=
 =?utf-8?B?UldFRzRPZnJyVS93OW45SlJxNUZTQk92UjdMOXVSbXFaaCs5c0VXNlNQY0dQ?=
 =?utf-8?B?djFkKzdBZ1NxUEpITHM5TGcveXBzSUJyVFFZYnFGU2NxSEhSdENtdkZhUjdu?=
 =?utf-8?B?Zkc1Tk5NNmMwOE96SVRHYm9UYjdrMDFnMi9hQldHNVBrMHM2SUpFVVJXcHVa?=
 =?utf-8?B?OEh3RmlSdjJCT2lVeGt4L3prUUZsc1h2ZGQ1cm9HSlJiZUd1NGtXU3ZEMU5i?=
 =?utf-8?B?dkZtaEZzWlhYdU5ZaFJ3WG5SbUxJM3dWUnVSV2Q0QTdzdFI0RlhHRTBmZGpj?=
 =?utf-8?B?dklmU1lNL1BjYVdCbFhVeng2VUNhalF4RmppSUU5VDhMT3BRNnhNdStReFBn?=
 =?utf-8?B?aDRRMDk3aUh6ZmlRdnZocjZkL3RNZng5bytpZDFEYnErektON21MaEI5MDlv?=
 =?utf-8?B?eGFwVFlKMGF3QlJIeFpKRTlLamRlWjlrSWFCQkNvWjBrUjFMa2FVL05pc3JU?=
 =?utf-8?B?Ry9vT0dVTzVKRWZVY0UwS1dJZzd2bmV5ZzZkTk5FN2dVTmQ3ZTFNby9QL2Fp?=
 =?utf-8?B?VkpLTEliS3pISENhYUFxWTRQWHlyMDZzRkg0ZjNrTWdTbWp5YjBHbnZ2dHdv?=
 =?utf-8?B?ckdlbzNPT1JVOUlLUmZqRUp1Q2VydGtuOW5uclgxYnRJeWV5blNHaUpRbkhl?=
 =?utf-8?B?VVdFNHJSeGNVVWNobWkxRVZ4SWRxMW1Tc2dOOGNqM05ldUpDMUdkTTNaeW1K?=
 =?utf-8?B?amo2SEUzY1gyVDV6c3VpTjh4bjZVKzB6OXFBU3RqdmsvZytWQ2tqSTIxT0Nu?=
 =?utf-8?B?T09rQnhIdi9oVlVLaVJueEVYK0pQVFV1Z2xBOU85eDNSOWpJS2ZTOC9FUExI?=
 =?utf-8?B?eWxkQnhVend1NEl6eEp1OU1NVkoyNlJPaU1jTXNoWWtWRzROQkFybWFHK1F1?=
 =?utf-8?B?Rm04RDRMOUdqOHJjZFZJNWkrZnl2MytVWU96Z3VUMXFnUzNPK0k0UVF6N2VE?=
 =?utf-8?B?UUxUemhnVzRlbWhZQlEyYmVZWmpkdXp6M1VDYXZJWGF5SnRtVXk4TklCc3Jz?=
 =?utf-8?B?S1VLQm44Z3B0dzQ3T1BQSDlLajlFZFNTdkdUUXdaTnE0OFFVVGw1dUJxWDZF?=
 =?utf-8?B?bEhZeW5ZakFsajRHYWpZZFppQ1AwWlZBYWc4cmgwRjVBYkhFYnZBSEUwQTZX?=
 =?utf-8?B?Wkw1VEZTNHI2NXBCam1jRnQyWWNGOFpxcllFUzBXOU5UeGNZd2tEdWRKUllx?=
 =?utf-8?B?SjRRdlZmTW51dW9LUEVYYjJna2tybUF5Sno2c214YVZKWXRLWEFGV2JpSDBG?=
 =?utf-8?B?VFFNdW9Lby9wQU41MlE2MGdyeXJXaTMvN3BwZTZYRy9GZWJEWGxBK1RuaFd3?=
 =?utf-8?B?N3ZaVlNua1dlbFRRRnNFejR1b1NFMDJnQTlSdE9mS1ZwWU1DdjFoVUpyYTlo?=
 =?utf-8?B?R2VrbE51Q0toVEpYcm15L0FtQTZHSUdqQzVVMS9YeWh3WCt1QU85NlRHQksz?=
 =?utf-8?B?MlRCRUdTemVCUmszQ3NTeFphZFJpWTFOODRVTXhuSjlPZGRObGFFRmRYbWJG?=
 =?utf-8?B?OWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: netatmo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB7603.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8307587a-2c5c-46ee-90e6-08da5533ebff
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2022 16:17:51.6809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4528446a-2666-441f-95cd-cc2cbd9f2c49
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WV2ZqQLATClMgPBPgxtjAfA6oCfbO9IwyeAwD9o9iXNqDvOGXPXzDV5HCTeVgvlZzyrcwtxXiX0px3RIYv0ZoYAw9gq1/enMD4AeSBWzcZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0301MB2439
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Pj4+IFRodXMgSSBzdWdnZXN0IHRvIHJlY29uc2lkZXIgdGhlIHVzYWdlIG9mIHRoZSB3b3JkIOKA
nGV2ZXJ54oCdIGZvciB0aGUgcGF0Y2ggbWVzc2FnZQo+Pj4gb25jZSBtb3JlLgo+PiBJJ20gbm90
IGFnYWluc3QgY2hhbmdpbmcgdGhlIHBhdGNoJ3Mgc3ViamVjdC4KPgo+Cj4gSSBwcm9wb3NlIHRv
IHJlY29uc2lkZXIgYWxzbyB0aGUgcGF0Y2ggZGVzY3JpcHRpb24gYWNjb3JkaW5nbHkuCgpGb3Ig
bWUgdGhlIHBhdGNoIGRlc2NyaXB0aW9uIGlzIGZpbmUuIERvIHlvdSBoYXZlIGEgcGFydCBvZiB0
aGUKZGVzY3JpcHRpb24gaW4gbWluZCB0aGF0IGlzIG5vdCBvaz8KCj4+IFdvdWxkIHlvdSBmaW5k
IGl0IGJldHRlciBpZiBpdCB3YXMgImNvY2NpbmVsbGU6IEV4dGVuZCBhZGRyZXNzIHRlc3QgZnJv
bSBpZmFkZHIKPj4gdG8gdGVzdCBleHByZXNzaW9ucyI/Cj4KPgo+IEFub3RoZXIgd29yZGluZyB2
YXJpYW50Pwo+Cj4gKiBhZGRyZXNzIHRlc3Qg4oeSIGFkZHJlc3MgY2hlY2sKPgo+ICogaWZhZGRy
IOKHkiBzY3JpcHQg4oCcaWZhZGRy4oCdCgpJJ2xsIGtlZXAgImFkZHJlc3MgY2hlY2siIGJ1dCBJ
IGNhbiBpbXByb3ZlIHRoZSAiaWZhZGRyIiBwYXJ0OiBpbnN0ZWFkCm9mICJzY3JpcHQiIGFzIHlv
dSBzdWdnZXN0ZWQgSSdsbCB1c2UgInNlbWFudGljIHBhdGNoIi4KCgo+Pj4gV2lsbCBmdXJ0aGVy
IGFkanVzdG1lbnRzIGJlY29tZSBoZWxwZnVsIGZvciBkZXNpcmVkIHNvdXJjZSBjb2RlIGFuYWx5
c2VzCj4+PiBhbmQgY29ycmVzcG9uZGluZyB0cmFuc2Zvcm1hdGlvbnM/Cj4+IERvIHlvdSBtZWFu
IGFkanVzdG1lbnRzIGluIHRoaXMgc2VtYW50aWMgcGF0Y2ggb3IgaW4gdGhlIGNvY2NpbmVsbGUg
c29mdHdhcmU/Cj4KPgo+IEJvdGguCj4KPiBBcmUgd2UgbG9va2luZyBmb3IgZnVydGhlciBjb2xs
YXRlcmFsIGV2b2x1dGlvbj8KCkkgY2FuJ3Qgc3BlYWsgZm9yIHRoZSBjb2NjaW5lbGxlIHBhcnQg
YnV0IGZvciB0aGlzIHNlbWFudGljIHBhdGNoIEknbQpub3QgcGxhbm5pbmcgb3RoZXIgY2hhbmdl
cyBmb3IgdGhlIG1vbWVudCAoZXhjZXB0IHRoZSBpbXByb3ZlbWVudHMKc3VnZ2VzdGVkIGR1cmlu
ZyB0aGUgcmV2aWV3IG9mIHRoZSBwYXRjaCkuCgpBY3R1YWxseSBJIGRvbid0IGtub3cgaWYgdGhl
IGV4YW1wbGUgeW91IHByZXNlbnRlZCAoYm9vbCB0ID0gKCZzKTspIGlzCnJlYWxseSBhIHRleHQg
ZXhwcmVzc2lvbiBvZiBpZiBpdCBpcyBhIGNhc3QgdG8gYm9vbC4gQnV0IGV2ZW4gaWYgaXQgaXMg
YQpzZXBhcmF0ZSBjYXNlLCBpdCBtYXkgYmUgcG9zc2libGUgdG8gZGV0ZWN0IHRoYXQgd2l0aCBh
IHNlbWFudGljIHBhdGNoLgpCdXQgSSdtIG5vdCBzdXJlIHRoYXQgaXQgaXMgaW4gdGhlIHNjb3Bl
IG9mIHRoaXMgcGF0Y2ggbm9yIHRoZSBydWxlCm1vZGlmaWVkIGJ5IHRoaXMgcGF0Y2guCgoKVGhh
bmsgeW91LApKw6lyw6lteQ==
