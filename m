Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACD0C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 May 2022 15:07:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237532AbiEXPH0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 May 2022 11:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238439AbiEXPHX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 May 2022 11:07:23 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2104.outbound.protection.outlook.com [40.107.21.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1FE5EE0D
        for <kernel-janitors@vger.kernel.org>; Tue, 24 May 2022 08:07:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jo4xZIiFhm3U0T6o1NpyoeSqvv+NfLbwN2g+VWiWnpZI3TzFC4qIjf0XPgAr0c+FowCJtQppdckhxJow73zFyoXUQ8sINt+853WzsLfbkxRvI5o2DNIb8lxWTN3qJm204IyXdr8NbrilfZkXG4/U6FueVetiMSt/VzmH0bNu+p1xHjC3l8cYhjwRXd6tgejvUsCl0fkhwRrdgsdqZu5CNstesjnjeUAgmE1dGdKQ2TDNJqQ8AAZ/NCWZL2+9LC2osoHuafQDgqyNkYTOG9fN/0VwJxzMUrJsuWhlDVf4OXES7xlxqTqh4zKRLNTYiz2gjeIu4VONPMaGSbwU2r5P4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loJEjpArjbI4dLlx98ipxz5K/pid2U1Bri1GA+YMnhs=;
 b=UfiDO1GQjPiQT14qXEHa9U6PaT5vLH+XsgfIo9Z4nz9FqH60pm17xWJg49ON5bGB89v9JhcG5SGPxk1lR1snipKCTQUTyVIwForLCD7vi156yuQIvWFHqZnWwaBNtd/CtseTaNBQfN3hKGoWQedbMGhCsQfTOfcmfmyNuZwrUkRYG1hwkPZ/Rc9irozbmkqePvBGIi7m7a3UNpx0bkp5KRr2asKdHbSzEeGbO7IOme/hjY1tGVPA1WWAp3oKLUfO9OfjLeOUYFmjurLKwwFhz8fQb3/hX+OsNFY+56u4PwYS+T6xPk56/R0DQ1GDIayY4uQ13AJIXQc4w2WyMFGT6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loJEjpArjbI4dLlx98ipxz5K/pid2U1Bri1GA+YMnhs=;
 b=fERZAb6sif2b4oEWX22LVJCARnt1s8EWhKMdXoPqt8RlgeIRWah3xlctUlU/LCmFRdIUCItazWd8aq2UaPqbTbZ5Px9ZrU3I+Hx1+mQKsjUCo672DzHoZATi9wLszSkogjz9JwPETX89rsTX5MGhcUxey3+W/Lompi1fn80yh3vjHAQzVlOctPULQIXg/NYPgOn8hUXjUBR85NNSk+K8jhmwQTa5s5fAiyQCcx/UaH7oYkQ6OVbeKLUt/A5UjIpHAjanyHVr3zYDbMqw+IPoYIj9iuMqeuRaHITX5WrMUNSaOEhsETBWwjp/lYRmd3i2rnQNVibqJyFpkQ11Z3FbOw==
Received: from AM9PR02MB7737.eurprd02.prod.outlook.com (2603:10a6:20b:408::15)
 by AM6PR02MB5271.eurprd02.prod.outlook.com (2603:10a6:20b:8b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Tue, 24 May
 2022 15:07:18 +0000
Received: from AM9PR02MB7737.eurprd02.prod.outlook.com
 ([fe80::e9d9:5334:6fa3:b28a]) by AM9PR02MB7737.eurprd02.prod.outlook.com
 ([fe80::e9d9:5334:6fa3:b28a%3]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 15:07:18 +0000
From:   Yuri Nudelman <ynudelman@habana.ai>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Oded Gabbay <ogabbay@kernel.org>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [bug report] habanalabs: convert ts to use unified memory manager
Thread-Topic: [bug report] habanalabs: convert ts to use unified memory
 manager
Thread-Index: AQHYb3YJeOO2Rm35CEursJVn6PCf/q0uIP8A
Date:   Tue, 24 May 2022 15:07:18 +0000
Message-ID: <d238619e-243b-1333-5a69-9caccfa96969@habana.ai>
References: <Yozj8HcJ3uTqd0c7@kili>
In-Reply-To: <Yozj8HcJ3uTqd0c7@kili>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 603b9164-6856-494d-2d60-08da3d971886
x-ms-traffictypediagnostic: AM6PR02MB5271:EE_
x-microsoft-antispam-prvs: <AM6PR02MB52710C1402D39EED22B8E613B4D79@AM6PR02MB5271.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uvuWU3/lAFRUwDI5T4wcTLN5sJB2UzUn08YDWkVLBefA8278l6TbbP2WBCmkrwHALcALcz9QgYhNpIaVK/Og+2hVLk8Cz9lbNadkyx3uJzhV4aVeDParpPlfyX7WzyMEWZa2QVTEhr9Z25Vi484QXZ/YBCndUMIXC2/fdceGYYObWGTwr1/jI/9C0hhHeb1p5Ds3zFR2neAA7+U4mE+ftg7YtIJFD50FgWVTUb5wGPOqeR8H5TyxalTr4CWzd83ZzWwlGCXgvOcB7AbEEi81kz3Khm2yyxU1SotYxoKeq+dpvYnzCpqXQUUvsqiKtIEnshVY0eRxOozeMsuJR5Mkd2/6K1mgfx6OiCtP6GaS+hhxvZtf3Iyy475ryigC9f9L46f4QVzvpaJ1h2D0IgEuaz/274x1+Y2fAGe2pEIcBEerowMZIxohJORKLu3m1RZnCv34jJtudyN63zQhHQ3W7ksEeK0WxuWMGFKnclbA+NMdELidhNBuO1yxfgimu6kLzH5ZwkWcGEr+pS1cL2EUCTpC7arZoY+GmNriA1J0HXqvoILaIZCm6N8WODVoEwMVnwrT0DP2GLIx3/K+9Sw4poQF+AY7LhmRnucvAhwADUFWIegFDbQnkmR75SLnsHJaorT/CjTi3ZBDu0fMp/scNYl506+AKRwJhBX1YT4qUY8XO4YnfB3quM23gRhHDdYdEx4dOOl+pXAmGe963kp1CmpWGpUItMVH5NE1pjKYnvmhzhVbQq2EgWkUcX4og5jYXt5O4oS0lnikGc+fIZQbWA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR02MB7737.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(38100700002)(8936002)(64756008)(31696002)(316002)(91956017)(4326008)(66446008)(66556008)(66476007)(66946007)(5660300002)(76116006)(8676002)(86362001)(6512007)(110136005)(31686004)(122000001)(71200400001)(6486002)(53546011)(2906002)(2616005)(6506007)(966005)(508600001)(36756003)(83380400001)(26005)(38070700005)(186003)(21314003)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVdBRzNpc2VKMnV2eGtOenpudnQrbEVuVkthd284Yy9hMTEyeDZxYWhwRE42?=
 =?utf-8?B?QklQNmVLQUF0OVVWTG9KQmZ0SGJCbkcvMHRXL0JUYUl1UUxGbnpYeXB5U1pH?=
 =?utf-8?B?bW9CYkYwWTVCSmNzanJhUFBwOGdjZGF5SS9NbHh4aXRWelNLZFZ5RUtHRWlq?=
 =?utf-8?B?TG9VaFY4OXRpa05EWXQ4a05oRUtEcUVQVURoMHUxN0twVklLTmhNRk5sZWhi?=
 =?utf-8?B?UkJEWUNaU2F2WFR5VEVyb1MvSWpveTZubnY2N3FnR0ZGVzhmOC9nZk5GcUVX?=
 =?utf-8?B?Z1FKVUg2MHUxbFVwRnJPZTBrM05ad0F0bVZDVDA3Mk9ZWkFSYm0zUVd2dkVZ?=
 =?utf-8?B?UDZzUklrVlJjeHpyUjVpRUVEak9vZ0JOek9MamphKzVqRXp3MVk5a0hhcFhG?=
 =?utf-8?B?MjJIVHVVSHJaMWRkb0VWYTFlR0QzSzVxTmRJeWdDS0RqczlLd01ZamIvK3Qz?=
 =?utf-8?B?NUhCSFl4bEhjWjVqVFBqWFJRa1BjajYvemFCV2p0UXRzQjNGdUdzQzVpY29t?=
 =?utf-8?B?Q3RScXlienNSUTAwZHhScHcwcFhEclpvWUhWc01aSHExUlQ4akVYV2cxcVJO?=
 =?utf-8?B?S1hGSndVaW5uVjlNK0tOWGxuK1hHNkwyRmQyTWo0RVhCbmRONytJVFBlYUVS?=
 =?utf-8?B?ZHhIWUV3Y1dIZ2hRMG9uN2dxczFaVTFSbFRFQ2lYbHR5aWFvRENBdWRzZUsr?=
 =?utf-8?B?azJUeWFTdm4xeUVXU0tMZFhzR0dsbGVvV1k2Q051d1lKbHZvdGJCTTFKSVg1?=
 =?utf-8?B?YUN3L1ZKOTlsWGh6T0pHV1UvN21DQ3hWR1hiekRHUnZ6ZVByOVNzRkhYWEJB?=
 =?utf-8?B?ek5kWUNOVDhMNUlkd1owemM1RUdkVmlsZEtaVUp2NGtJK09yMzVvVDZ0N3hS?=
 =?utf-8?B?ckVQUThQZm1FOWFvZkg2eDljeHhpenR4dEs1NWZLZmphRUV5MHZ4YjVaeXhN?=
 =?utf-8?B?YkFpQytHbzZMOEg5c0NBdGxpcjlsa3RGQk1IdnI5bVhteHN0MmtkNFZsa3hD?=
 =?utf-8?B?STVaYktIR2FLck5qSnZ2Y2dHTW9HNXhvcGYvblVPd1hMVk4yQU1NU24vMlI4?=
 =?utf-8?B?SzJXTXg1K3lMb2Zia0t5NWF6VWJMM2xURHZOVUFHQllicytmUHB6OUNVUkhL?=
 =?utf-8?B?Qmh0SEthaCtGcm93bnVNQkwyTjdPdE9OZ2RKcjg3OGp2Q29PVHVJbnl0WkFq?=
 =?utf-8?B?M2U4RytPZjVQaU9PTDIyWTdyb3JITDFjS1dSZXVnTzZLT2pEUFZ5amRNeTQx?=
 =?utf-8?B?ZFM4ZldyYytKSEJudS9ERXFHRlUyQVRaa21mNmlMdHh6R0N5ZEVEWGJSYlN3?=
 =?utf-8?B?dGkzS0ErRDRzeFRSU3k0QWNIeTRsZU5iZTFLUGRlKzlaOTFPYWpNM0pYODZn?=
 =?utf-8?B?RXo4aHlDRHpWWExRRUZCb0VJWHRsQW9hTE91R1RFSlNlQUFnM3p2a2QyNTlM?=
 =?utf-8?B?VGNkRnVsSHMrT0hZVksvS3AvbzlGWU5ZaXJmRElNTEV0Ylo5STdvbDRMT2ds?=
 =?utf-8?B?QzZvT0sxWGhjcnVPVEdjR1cyUVU0c0l0WXVuSjN4bTljZHA4TkVnRHQ2Q0RB?=
 =?utf-8?B?dGNERzJkYjN3TE52VlZscERZa3FNOUV4a25ZZ2xsc0ZnM0cxNi9KNUFkengx?=
 =?utf-8?B?ekxUcjZiMmZxOVBnb3NucHlUb3pjUnpEaEc3eHdkVU5raHplY0c2eUhTSGNv?=
 =?utf-8?B?dm1vbTZQcTYzTU53U0szQllvSm96U2pKYm55YVBBOFo2bHJIQkJGNGozRnFt?=
 =?utf-8?B?SExOUm1GSjN0SDBiRHZKNWZVSzRYeFRMNjNFY2wzUE1wMlJJMGtqOUlCUkZV?=
 =?utf-8?B?bnR3d3pMMW9adi9CZWJXSGJkSG5kRDhmZFMzamtoMWdNSVBWYWhNbW50aThB?=
 =?utf-8?B?NlVXSExvd21wWlo2aDFqQWcraGxzalROZGZhdzF2TzZ1amtnSFd6aEFlWml2?=
 =?utf-8?B?b3dmMnFtS0YxNTJ4dWRsZlVCK2FqeFhrVVZHUk9ZTitLeFpzY3ZJMWcwSk5o?=
 =?utf-8?B?ZFdmc2Z6QTdCZlBja09RY2JsZHorTDZuUHA2aTczd2tnVUJZS3h6RkFiK2t5?=
 =?utf-8?B?Ync5RWhoYThJeW9jSDhSUDhFckJGcUJrT1RJd0Y0NmtseFBib3dVZTNYMVRG?=
 =?utf-8?B?MmxmeFRWaVZaTmEzZTJGUEloMWFFcktSZlF5cHlBZmpCb05hVHNYWlY3cnZj?=
 =?utf-8?B?ZW92UGxwR0lpaDlUakdqMGhMWHVaQXVJQWJrUWxaR3Q1NERKR3dqcjlZMXNp?=
 =?utf-8?B?VEZPRHdSdzdJS3NNKy9YNDh3NHEzaU05VkVaRk4vQlczVi9RQmlCd2R5RUZD?=
 =?utf-8?B?c2NRdUtsdnhaeDVGQ0V3UHRNS3F5RnB5QWRJSllKNDFxNjlCTm1PUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29DA6E6581FC1640A3AC761E409382EB@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR02MB7737.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 603b9164-6856-494d-2d60-08da3d971886
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 15:07:18.6680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: emrEaQDFAV6nqRJaYcrbTKQEwhPpdOYGcsTxGuGvsjNBmO7Dj6lWXzhICDtI3i0mXPB1on4UILovIplYUnbTQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB5271
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

T24gNS8yNC8yMDIyIDQ6NTYgUE0sIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+IFtZb3UgZG9uJ3Qg
b2Z0ZW4gZ2V0IGVtYWlsIGZyb20gZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tLiBMZWFybiB3aHkg
dGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50
aWZpY2F0aW9uLl0NCj4gDQo+IEhlbGxvIFl1cmkgTnVkZWxtYW4sDQo+IA0KPiBUaGUgcGF0Y2gg
NGQ1MzBlN2QxMjFhOiAiaGFiYW5hbGFiczogY29udmVydCB0cyB0byB1c2UgdW5pZmllZCBtZW1v
cnkNCj4gbWFuYWdlciIgZnJvbSBNYXIgMjAsIDIwMjIsIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcg
U21hdGNoIHN0YXRpYw0KPiBjaGVja2VyIHdhcm5pbmc6DQo+IA0KPiAgICAgICAgIGRyaXZlcnMv
bWlzYy9oYWJhbmFsYWJzL2NvbW1vbi9tZW1vcnkuYzoyMTE3IGhsX3RzX2FsbG9jX2J1ZigpDQo+
ICAgICAgICAgd2FybjogdXNlICdnZnAnIGhlcmUgaW5zdGVhZCBvZiBHRlBfWFhYPw0KPiANCj4g
ZHJpdmVycy9taXNjL2hhYmFuYWxhYnMvY29tbW9uL21lbW9yeS5jDQo+ICAgICAyMTA3IHN0YXRp
YyBpbnQgaGxfdHNfYWxsb2NfYnVmKHN0cnVjdCBobF9tbWFwX21lbV9idWYgKmJ1ZiwgZ2ZwX3Qg
Z2ZwLCB2b2lkICphcmdzKQ0KPiAgICAgMjEwOCB7DQo+ICAgICAyMTA5ICAgICAgICAgc3RydWN0
IGhsX3RzX2J1ZmYgKnRzX2J1ZmYgPSBOVUxMOw0KPiAgICAgMjExMCAgICAgICAgIHUzMiBzaXpl
LCBudW1fZWxlbWVudHM7DQo+ICAgICAyMTExICAgICAgICAgdm9pZCAqcDsNCj4gICAgIDIxMTIN
Cj4gICAgIDIxMTMgICAgICAgICBudW1fZWxlbWVudHMgPSAqKHUzMiAqKWFyZ3M7DQo+ICAgICAy
MTE0DQo+ICAgICAyMTE1ICAgICAgICAgdHNfYnVmZiA9IGt6YWxsb2Moc2l6ZW9mKCp0c19idWZm
KSwgR0ZQX0tFUk5FTCk7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXl5eXl5eXl5eXg0KPiBUaGUgImdmcCIgaXMgc29tZXRpbWVzIEdGUF9B
VE9NSUMgc28gdGhhdCBzdWdnZXN0cyB0aGF0IHRoaXMgaXMgYSBidWcuDQo+IEhvd2V2ZXIsIEkg
Y2FuJ3QgaW1tZWRpYXRlbHkgc2VlIHdoeSBpdCBuZWVzIHRvIGJlIGF0b21pYy4gIEFzIGZhciBh
cw0KPiBJIGNhbiBzZWUgdGhlIGNhbGxlcnMgYXJlIGhvbGRpbmcgbXV0ZXhlcyBub3Qgc3Bpbmxv
Y2tzLiAgQnV0IEkgaGF2ZQ0KPiBub3QgbG9va2VkIGhhcmQuDQo+IA0KPiAgICAgMjExNiAgICAg
ICAgIGlmICghdHNfYnVmZikNCj4gICAgIDIxMTcgICAgICAgICAgICAgICAgIHJldHVybiAtRU5P
TUVNOw0KPiAgICAgMjExOA0KPiAgICAgMjExOSAgICAgICAgIC8qIEFsbG9jYXRlIHRoZSB1c2Vy
IGJ1ZmZlciAqLw0KPiAgICAgMjEyMCAgICAgICAgIHNpemUgPSBudW1fZWxlbWVudHMgKiBzaXpl
b2YodTY0KTsNCj4gICAgIDIxMjEgICAgICAgICBwID0gdm1hbGxvY191c2VyKHNpemUpOw0KPiAN
Cj4gSXQncyBjb25jZXJuaW5nIHRoYXQgdGhlcmUgYXJlIG5vIGludGVnZXIgb3ZlcmZsb3cgY2hl
Y2tzLiAgSSBmZWVsIGxpa2UNCj4gc29tZW9uZSBzaG91bGQgbWFrZSBhIHZtYWxsb2NfYXJyYXlf
dXNlcigpIG9yIHZtYWxsb2NfdXNlcl9hcnJheSgpDQo+IGZ1bmN0aW9uIHdpdGggYnVpbHQgaW4g
aW50ZWdlciBvdmVyZmxvdyBjaGVja2luZy4NCj4gDQo+IE9mIGNvdXJzZSB2bWFsbG9jKCkgc2xl
ZXBzIHNvIEdGUF9BVE9NSUMgZG9lc24ndCByZWFsbHkgaGVscC4gIFRoZXJlDQo+IHNob3VsZCBi
ZSBhIFNtYXRjaCB3YXJuaW5nIGZvciBHRlBfQVRPTUlDIGZvbGxvd2VkIGJ5IGEgc2xlZXBpbmcN
Cj4gZnVuY3Rpb24gd2l0aCBubyBwcmVlbXB0IGVuYWJsZSBpbiBiZXR3ZWVuLi4uICAjSWRlYSAj
RWFzeVRvSW1wbGVtZW50DQo+IA0KPiBUaGUgd2F5IHRvIGRvIGl0IHdvdWxkIGJlIHRvIGxvb2sg
Zm9yIEdGUF9BVE9NSUMuICBIb29rIGludG8gdGhlDQo+IHByZWVtcHRfZW5hYmxlKCkgaG9vayBp
biBjaGVja19wcmVlbXB0X2luZm8uYy4gIEFkZCBhIGhvb2sgaW50byB0aGUNCj4gY2hlY2tfc2xl
ZXBfaW5mby5jLg0KPiAxKSBJZiB3ZSBzZWUgYW4gQVRPTUlDLCBzZXQgdGhlIHN0YXRlIHRvICZh
dG9taWMuDQo+IDIpIElmIHdlIHNlZSBhIHByZWVtcHRfZW5hYmxlKCkgdGhlbiBzZXQgdGhlbiBz
ZXQgdGhlIHN0YXRlIHRvICZ1bmRlZmluZWQNCj4gMykgSWYgd2Ugc2VlIGEgc2xlZXAoKSB0aGVu
IGNoZWNrIGZvciBpZiB0aGUgc3RhdGUgY2FuIGJlICZhdG9taWMgYW5kDQo+ICAgIGlmIHNvIHRo
ZW4gcHJpbnQgYSB3YXJuaW5nLg0KPiANCj4gICAgIDIxMjIgICAgICAgICBpZiAoIXApDQo+ICAg
ICAyMTIzICAgICAgICAgICAgICAgICBnb3RvIGZyZWVfbWVtOw0KPiAgICAgMjEyNA0KPiAgICAg
MjEyNSAgICAgICAgIHRzX2J1ZmYtPnVzZXJfYnVmZl9hZGRyZXNzID0gcDsNCj4gICAgIDIxMjYg
ICAgICAgICBidWYtPm1hcHBhYmxlX3NpemUgPSBzaXplOw0KPiAgICAgMjEyNw0KPiAgICAgMjEy
OCAgICAgICAgIC8qIEFsbG9jYXRlIHRoZSBpbnRlcm5hbCBrZXJuZWwgYnVmZmVyICovDQo+ICAg
ICAyMTI5ICAgICAgICAgc2l6ZSA9IG51bV9lbGVtZW50cyAqIHNpemVvZihzdHJ1Y3QgaGxfdXNl
cl9wZW5kaW5nX2ludGVycnVwdCk7DQo+ICAgICAyMTMwICAgICAgICAgcCA9IHZtYWxsb2Moc2l6
ZSk7DQo+IA0KPiBVc2Ugdm1hbGxvY19hcnJheSgpIHRvIHByZXZlbnQgaW50ZWdlciBvdmVyZmxv
d3MuDQo+IA0KPiAgICAgMjEzMSAgICAgICAgIGlmICghcCkNCj4gICAgIDIxMzIgICAgICAgICAg
ICAgICAgIGdvdG8gZnJlZV91c2VyX2J1ZmY7DQo+ICAgICAyMTMzDQo+ICAgICAyMTM0ICAgICAg
ICAgdHNfYnVmZi0+a2VybmVsX2J1ZmZfYWRkcmVzcyA9IHA7DQo+ICAgICAyMTM1ICAgICAgICAg
dHNfYnVmZi0+a2VybmVsX2J1ZmZfc2l6ZSA9IHNpemU7DQo+ICAgICAyMTM2DQo+ICAgICAyMTM3
ICAgICAgICAgYnVmLT5wcml2YXRlID0gdHNfYnVmZjsNCj4gICAgIDIxMzgNCj4gICAgIDIxMzkg
ICAgICAgICByZXR1cm4gMDsNCj4gICAgIDIxNDANCj4gICAgIDIxNDEgZnJlZV91c2VyX2J1ZmY6
DQo+ICAgICAyMTQyICAgICAgICAgdmZyZWUodHNfYnVmZi0+dXNlcl9idWZmX2FkZHJlc3MpOw0K
PiAgICAgMjE0MyBmcmVlX21lbToNCj4gICAgIDIxNDQgICAgICAgICBrZnJlZSh0c19idWZmKTsN
Cj4gICAgIDIxNDUgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gICAgIDIxNDYgfQ0KPiANCj4g
cmVnYXJkcywNCj4gZGFuIGNhcnBlbnRlcg0KDQpIaSwNCg0KSW4gdGhpcyBmbG93IGdmcCBjYW5u
b3QgYmUgYXRvbWljLCBzbyB0aGVyZSBpcyBubyBzZXZlcmUgcHJvYmxlbSB3aXRoDQp0aGF0LiBU
aGUgZmFjdCBJIGxlZnQgZXhwbGljaXQgR0ZQX0tFUk5FTCBmbGFnIGluIHRoaXMgY29kZSBpcyBh
IHR5cG8uDQoNClRoaXMgZnVuY3Rpb24gc2VydmVzIGFzIGEgY2FsbGJhY2ssIGFuZCBpcyBpbnZv
a2VkIHZpYSBhIGZ1bmN0aW9uIHBvaW50ZXINCnRocm91Z2ggdGhlIGhsX21tYXBfbWVtX2J1Zl9h
bGxvYywgd2hpY2ggY2FuIHJlY2VpdmUgYSBHRlBfQVRPTUlDDQphcmd1bWVudCwgYnV0IG5vdCBp
biB0aGUgZmxvdyB3aGVuIHRoZSBjYWxsYmFjayBpcyBobF90c19hbGxvY19idWYuDQoNCkkgd2ls
bCBjaGFuZ2UgaXQgZnJvbSBHRlBfS0VSTkVMIHRvIGdmcCB0byBhdm9pZCB0aGUgd2FybmluZywg
cGx1cyB1c2UNCnZtYWxsb2NfYXJyYXkgYXMgeW91IHN1Z2dlc3RlZC4NCg0KVGhhbmtzLA0KWXVy
aSBOdWRlbG1hbg0K
