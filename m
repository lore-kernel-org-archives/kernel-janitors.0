Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F5EC433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 15 Oct 2021 05:22:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DE3D61164
	for <kernel-janitors@archiver.kernel.org>; Fri, 15 Oct 2021 05:22:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235396AbhJOFYR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 15 Oct 2021 01:24:17 -0400
Received: from mail-am6eur05on2073.outbound.protection.outlook.com ([40.107.22.73]:20256
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229706AbhJOFYQ (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 15 Oct 2021 01:24:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhzHcaMW0dDi6xuTwLL1GQ0sLNnGrehwKSven9xb3Twm/k3yae7RUxMryyZeH6l5y4pljoOJC6g8UZIrsx+z+ncVEFzabh508hEsw97FPRc+7Js/XUSsrC2GDN4/3cbLquDi8zdgvivnfN+WDkDBVqrI2sxCs6LemYNnoQfTI8EGZJ0SFuL8uYhtyLfapo1J05lzFWxS/VraY2tXFywcAiwW0w3LpgYaNMJAbrCmi77S8U8srm4vRoT63H2sWRf2egr24DD987ANKWNIRqV1DW0MBVQ/BW9jG3c1b3SIR3XDz5tvVyR7TUs0xxda9eCSHzXqP5f9z+RV0lK+W2LAJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a35rIc67FflklQs0l5wSvRNBMWa+VJx6EXb+vV0DsN4=;
 b=hPzLCSW/62QWLLZW4GgLm4uMa2SyufcblR8eScRUfJ2iRYX4pgOtsTyEr+rUp6wG++Ai1y8//I5lbXWSkYVOikP2dasIQDq/aSNXlZq9AEa4XP5B0YiIRGoYzpeDaBuGa+UoM/taZhbz9v5gy65cpkvfldEM7OqaydPHDlGm7LxB+3hJ/uf0uc4r8Y9AOY17wqjnDUSEYBnA6RM5xsZIu+7TmNFESdLmu21BokGOtxAi/I3t9sigAUXLXTNfNuQjEXRMB5EObrmlF+BKS8VJakFaWCgaBjPGS6MH5+oJSEEWTIrw0AxfCLewrp6qvmTKVdbWkkl6DFpr0RZDepJ/0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a35rIc67FflklQs0l5wSvRNBMWa+VJx6EXb+vV0DsN4=;
 b=APX1CBiNn4r8QAMo/3tmjzcO5pw7883ywJoM8I6VzbHW6hSGP/FsgSs7Zr86rvyu3X9xUoR4JAaUC38pDY7MsbPPQ0AvZv+DXnc6vHrI4IqmbI4Id9MpXRRJMEsSPoMfDdpT5oErYhcxFYkpX843gFGTGXC2mwTMtqp5w+5Ul7k=
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DB7PR04MB4953.eurprd04.prod.outlook.com (2603:10a6:10:13::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 05:22:09 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::5d5a:30b0:2bc2:312f]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::5d5a:30b0:2bc2:312f%9]) with mapi id 15.20.4608.016; Fri, 15 Oct 2021
 05:22:09 +0000
From:   Joakim Zhang <qiangqing.zhang@nxp.com>
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [RFC PATCH] net: stmmac: remove rtnl unlock/lock sequence from
 stmmac_resume
Thread-Topic: [RFC PATCH] net: stmmac: remove rtnl unlock/lock sequence from
 stmmac_resume
Thread-Index: AQHXwPlCux4h7krvHE2vKlanO+SGoavThL2w
Date:   Fri, 15 Oct 2021 05:22:08 +0000
Message-ID: <DB8PR04MB67952B9086A3865FB377F15FE6B99@DB8PR04MB6795.eurprd04.prod.outlook.com>
References: <20211014124417.199403-1-eantoranz@gmail.com>
In-Reply-To: <20211014124417.199403-1-eantoranz@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f221f668-5962-4b4c-9c99-08d98f9bbc41
x-ms-traffictypediagnostic: DB7PR04MB4953:
x-microsoft-antispam-prvs: <DB7PR04MB495379A7705CF1183F8C8495E6B99@DB7PR04MB4953.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8hLDHWDJKQNzXCWS5Adrd3E4YCvjnpj4UvjgEbglbnJfJ69wBFmS3ZXROX0HBXuGQOMENMoABORd3cmMN6+makiE9Ya9snA1ergSNrFvkSzd/BX9Ju1XL7+qkM41/sS/QDr1k0k52v97whvFohlUTcy7B1ZdQYdFR3EHYWJMECDwX16jlLXLJwHVcoYzlArkSdI0QlaRwAbHNZ3gOFoiH2zJfNmxNGLB+ZjencfH3gBiVZ0z4WdVD9wpXX8OfPs8gRn6kOrqLuIOjTK1SR/YgRBSOyh0wUtk4hTOGM5TczyUHNoTprbDFc82AhUiQrsrDZ5WWxCIj79WyVCH5lbcsnrgq9tt21V6TNdkoAn2c7FOUTqkbHJ50VlFvgUF1bBwPqzaho+NhAbHfvdpwdf1gTW6PHw0Jx9l0N72lcxsaAdaGm9EwnTJyMAT4ZncaKbQ3KF3W/rnkAPoCv/WJo/Zi36j81oNGSajBtjmGktP46DwWxieEMwCckXU2f7je2EWuhd6kiiu9lEgVbwy1HV3qD3U10Bx3HrBjqxndJpa3y3x/G+wK1wil1gWHdVlOG9Rqba/sBKuHEF4uPv/ugv7RuI50EZCBJUUx1kly95edO2xQRIePxWwWFWgD/yGdXhOfV3ijooQXMSHy+aUn1OF7PXlYrrNNe3P/XxolpZW7+ppMPYhHlZOB0iPzxAY8bBiLKbH6y4+V9Z4nXisYdDWHg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6795.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(76116006)(8936002)(6916009)(26005)(2906002)(52536014)(66946007)(9686003)(66556008)(508600001)(71200400001)(38100700002)(83380400001)(316002)(55016002)(5660300002)(64756008)(8676002)(4326008)(66476007)(66446008)(38070700005)(86362001)(122000001)(53546011)(7696005)(6506007)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?RXdRaXZ4V3FHaFRDMzBWaVFpTHByTk9XYzFXWm1FcitqNnpLejg2VzY1OUc0?=
 =?gb2312?B?SmR2WVN5SjdJQUgyNklaUDJXL2Z1L3hqY2RmWnV5eVRTb1Q2Z0hiTzF5cGRv?=
 =?gb2312?B?R0Z3aHkxTEdTSmNxK24yUHQzczA4SEtNRnZaVzdTMXI2Q3VmRlg5YkNIZFJO?=
 =?gb2312?B?RHR3OGY1Wk94RExhZjNwWDVMSVBwNFpmSkpEZFZTK1J0VmRZMDhDckgxaEE5?=
 =?gb2312?B?RHpxTXBWeWNXN3Yzb05IUUJMTTJlZjhZSlBsektxOG1ZVjJCWGdGMm1CVnE0?=
 =?gb2312?B?MVBYNWRJRFJZNHVhcmw4aVp0L002MkJpYmlQV3JYWFh0RlVsd0lKWnREQTZ5?=
 =?gb2312?B?Q2ZtQXNBbTZKQkRtR0tuM2xJQjhicFFSMkNjTHorQXFNSkFiN3ZsZGhwSStO?=
 =?gb2312?B?clF2c2ttakdzWFJXMm45dUtPSytvUUJpUy9WMFE3MWRtY2JuM0psZDdFQ0hK?=
 =?gb2312?B?UVkvSUJoZmUrd0JqVWZTQ25jK3Y1OXR4bHorSTI2NUJhT3ozQ1JUd1N3emhj?=
 =?gb2312?B?cVczNFlsSFAySkcrSlZJbktTZlZ6QkVhRk9UTlJZbTAzdldGRWdsa0N3RWw0?=
 =?gb2312?B?Y2FwV0ZNUHczd3JSZzB1RTJmbjJsNUgvYjBJODM3d0g0QjFJOXk1L1NaRWpY?=
 =?gb2312?B?SXR2TDZObEhwVkkwb2YrS1lXYklPWjhUNnZnZjBHZHU2OEZpMUNNQnNOT1Fs?=
 =?gb2312?B?NHU0VW1tWXpIMTBYTEQ4QnJKU0FrKzNxQXpaSFBOazkrSDVUK0VOSXBqVEJQ?=
 =?gb2312?B?MmhxaE5LbUE2aStjdmlxNExRbWFLVTdpc0VERGFWRDE4eGNML2VuVGQyby81?=
 =?gb2312?B?YWc3ekFyK2E5WUtCRVB4K29DWmZpbW9DNXJaUnpvcUdNd29oQ2tOTEdBTy9H?=
 =?gb2312?B?dzBFeW05R3RoZjdPbWNqMkZSa3pkeEc3WVo3SzBCY0dBVUowNUszZE9rN2Rz?=
 =?gb2312?B?VEdJakV0VnovVEQ0N012Ym92ZFR4Q0ljOWU3SEErSXRBd0RvWnZiOGtuUUZn?=
 =?gb2312?B?WjNhZW9UMkwyelQrZWppM0NVQXdqSUt0ZW9Tb0RLcUJuWFNPMUJzMStOTGVl?=
 =?gb2312?B?T0lPSms4OXlDaWVuOGEzaG01K2tIVkoyZTBBTnBNcTRVZ1hFc2ZnclVPbWRy?=
 =?gb2312?B?N3BjZER3Q2wxV3A2ZkRVRkpNeUVpZDJ1VkszUnppdlZDRHFWNzhsaWEvY20x?=
 =?gb2312?B?cDBhVTVYY0VXY1RrQW5rZmluQ3R3OW5zYkR3aEMrY1JNclFTb2VMNUFzRDNZ?=
 =?gb2312?B?RDF4YXRJTytQRDZOdis5N09pOXdJL29YMERRYVRsYTkzeFhtbVNQRXB6NFR2?=
 =?gb2312?B?UVJoaDdPbnUvNUhONjlCdUpaRTZlLytRQldZR3FoVm9MTkV5YVMyRWtnWW9V?=
 =?gb2312?B?OWhmSENKVEpOZGlMRWZHNlhtbnJZOHR6Wmx6Q1FJVGZvTno2SXhwS3IxM0VK?=
 =?gb2312?B?MExwRXFzVDVMdEpRTUduaUloZFRpbGhtMW5CRzAyclYzV0d1NTFMTldJWHEw?=
 =?gb2312?B?Z1NTNkw3SDRnK0lxbm9ZUUZhL0o0d0h6dld6T1BmZ0dEYi9tbUlLTSt6ZGcy?=
 =?gb2312?B?cU0xbVlOWDRMM3hWL1Q0TWNLUFAwMmV3ZlZTM091bnM2b1E1ZjZiT1BwbDBq?=
 =?gb2312?B?cGljeDRvbjBKc0pVbVlBQVdsZndYSjRIVGNWbGtpdC9DNjZhL0NMb2ZRTUlO?=
 =?gb2312?B?cnNVdlJHekxNdmc3YlVDLzNpRTJzVnh5blY3ZXAyazduSGFnOCsyK0k4UmpY?=
 =?gb2312?Q?uAiFCiPEHyDNUOoDE3Lmtl8PXf1FZ4b1tTOaE/Q?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f221f668-5962-4b4c-9c99-08d98f9bbc41
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2021 05:22:08.9381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jwUYov1CTNm3lSi4V3aL1/DtqQq7joWeaJ7Gim6V0b2GMVm+EFmQ52EPD3sDXTHy3OSvrVh8ZQq7QmDn0Q0a+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4953
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEVkbXVuZG8gQ2FybW9uYSBB
bnRvcmFueiA8ZWFudG9yYW56QGdtYWlsLmNvbT4NCj4gU2VudDogMjAyMcTqMTDUwjE0yNUgMjA6
NDQNCj4gVG86IEpvYWtpbSBaaGFuZyA8cWlhbmdxaW5nLnpoYW5nQG54cC5jb20+DQo+IENjOiBr
ZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnOyBFZG11bmRvIENhcm1vbmEgQW50b3JhbnoN
Cj4gPGVhbnRvcmFuekBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFtSRkMgUEFUQ0hdIG5ldDogc3Rt
bWFjOiByZW1vdmUgcnRubCB1bmxvY2svbG9jayBzZXF1ZW5jZSBmcm9tDQo+IHN0bW1hY19yZXN1
bWUNCj4gDQo+IDkwNzAyZGNkMTljICgibmV0OiBzdG1tYWM6IGZpeCBNQUMgbm90IHdvcmtpbmcg
d2hlbiBzeXN0ZW0gcmVzdW1lIGJhY2sNCj4gd2l0aCBXb0wgYWN0aXZlIikgaW50cm9kdWNlZCBh
IHNlY3Rpb24gb2YgY29kZSBpbiBzdG1tYWNfcmVzdW1lIHRoYXQgaXMNCj4gcHJvdGVjdGVkIHdp
dGggcnRubF9sb2NrL3J0bmxfdW5sb2NrLiBIb3dldmVyLCB0aGUgY2FsbCB0bw0KPiBydG5sX3Vu
bG9jaygpIGlzIGZvbGxvd2VkIGJ5IGFuIGFscmVhZHkgZXhpc3RpbmcgY2FsbCB0byBydG5sX2xv
Y2soKS4NCj4gDQo+IEluc3RlYWQgb2YgdW5sb2NrL2xvY2ssIGFsbG93IHRoZSBwcmV4aXN0aW5n
IGxvY2sgdG8gY29udGludWUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBFZG11bmRvIENhcm1vbmEg
QW50b3JhbnogPGVhbnRvcmFuekBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyB8IDIgLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMNCj4gYi9kcml2ZXJzL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jDQo+IGluZGV4IGViM2I3YmY3NzFkNy4uNWU2
OTM4MDAyN2FmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9zdG1tYWNfbWFpbi5jDQo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL3N0bW1hY19tYWluLmMNCj4gQEAgLTcyNjMsOSArNzI2Myw3IEBAIGludCBzdG1tYWNf
cmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gIAkJaWYgKGRldmljZV9tYXlfd2FrZXVwKHBy
aXYtPmRldmljZSkpDQo+ICAJCQlwaHlsaW5rX3NwZWVkX3VwKHByaXYtPnBoeWxpbmspOw0KPiAg
CX0NCj4gLQlydG5sX3VubG9jaygpOw0KPiANCj4gLQlydG5sX2xvY2soKTsNCj4gIAltdXRleF9s
b2NrKCZwcml2LT5sb2NrKTsNCj4gDQo+ICAJc3RtbWFjX3Jlc2V0X3F1ZXVlc19wYXJhbShwcml2
KTsNCj4gLS0NCj4gMi4zMy4wDQo+IA0KPiBJcyB0aGlzIGEgdmFsaWQgcGF0Y2g/IFBlcmhhcHMg
dGhlIGxvY2sgaXMgcmVsZWFzZWQgaW4gdGhlIG1pZGRsZSBvbiBwdXJwb3NlIGJ1dCBJDQo+IHdv
dWxkIGFzc3VtZSBpdCB3YXMganVzdCBhbiBsaXR0bGUgb3ZlcnNpZ2h0Lg0KDQpIaSBFZG11bmRv
LA0KDQpXaGVuIEkgcHJlcGFyZWQgdGhpcyBmaXgsIEkgYWxzbyBub3RpY2UgdGhpcyB1bmxvY2sv
bG9jay4gRmluYWxseSwgSSBkZWNpZGUgdG8gZG8gdGhpcyB3YXksIHNpbmNlIEkganVzdCB3YW50
IHRvDQp1c2UgcnRubCBsb2NrIHRvIHByb3RlY3Qgd2hhdCBJIGNoYW5nZWQsIHRoYXQgbWVhbnMg
dGhpcyBjb2RlIGNoYW5nZSBpcyBub3QgYmVsb25nIHRvIHdoYXQgcnRubCBsb2NrIHRvIHByb3Rl
Y3QgbmV4dC4NClN1Y2ggYXMsIHNvbWVvbmUgY2FuIGFkZCBjb2RlIGFmdGVyIHRoaXMgcnRubF91
bmxvY2sgYW5kIGJlZm9yZSBydG5sX2xvY2suLi4NCg0KRW1tLCBpZiB5b3Ugd2FudCB0byBzZW5k
IHRoaXMgcGF0Y2ggdG8gZml4IGl0LCBJIGFtIGFsc28gZmluZSwgcGxlYXNlIG1heSBkbyBzb21l
IHN0cmVzcyB0ZXN0LCB0aGFua3MuDQoNCkJlc3QgUmVnYXJkcywNCkpvYWtpbSBaaGFuZw0KDQo=
