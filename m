Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F561CDB484
	for <kernel-janitors@archiver.kernel.org>; Thu, 19 Oct 2023 17:24:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346196AbjJSRYD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 Oct 2023 13:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345827AbjJSRYC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Oct 2023 13:24:02 -0400
X-Greylist: delayed 3183 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 19 Oct 2023 10:23:59 PDT
Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B298121
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Oct 2023 10:23:58 -0700 (PDT)
Received: from pps.filterd (m0209318.ppops.net [127.0.0.1])
        by mx08-001d1705.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JFUA3T020722;
        Thu, 19 Oct 2023 16:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=S1;
 bh=7iZWJy69nXtgCfXTB2R2abKMlvPOhhka35Ypt+tBE9E=;
 b=Ffb0piB1bM0ALjc4bPMQefz0vkGB+SSE6lyR/En2/6dHb1HWDf4MPyGznkHKgW28rG6F
 9kCqCKaRn90IYYsg2xDXD+VIiZvlv5h42Cdf2N5AMs/Gz0fzr9XSr+3Iqj8P3tUfP6m7
 2lOwFUQ1xXX+VTX1Kk3d0+bboSnwNXCVyG8bpIvsdBQCn4BdDdTsavznAOCoEvgcAHdI
 aOdRY1RwhhCwin2801TKzYpwEfdPCKxnnAEIOB/e9VYZT4kvBenZdRmP8NTHImjohh51
 2l4XWLT7yOK/pwnPcsCHhaKdb5ChM4jjVVDCpkr4WoH6+vi0fy5JehjrlTvJwECybvjN dg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
        by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 3tqjxxdrpb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 Oct 2023 16:30:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffRjTXkwoT4KVG7Lla12MiTD5gFsdt9BiN8MzKPefwWOIdWuluJp/e+SFK8QZOVBtg+u6rJoAPklqj8eUml6K1mL9WQztm8QNNE5MM0Yslb5NYbZXDqxIzNvonGG0h0npKrG6pXfDasGIPy1JMeDJKUZk4WZkxqHgGD6EGBqBENEaMMARs1TZEIbJ9534HPKkGstMLh81g+UgO6xLq+T80Il/Kig7ssImRZggiVlRsYju1jSRjbkShSzU5hHIlf6ooI5illNzuWb//uMf3WIslWFb+ZlzkhADnAWrFPPRzLKclVICbVeGNIHI63LZbftVYNM+tOY4X2iBpxjV5NmBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znWBUSMGr3BZskNjKGNXfQy2SIASumcF9gYAR92+RIE=;
 b=i1vh2FXYxA/DMEzAeaYxBWq2CY3NQsmRHKgcPdpuavOTctljjXgGAWy8zHtejDE749N+jhxBmoTUGGuD6qfqj755FSTxr46U0DWSaGIWMWevM3gY3Mdd2hk9KILGVcrpWAMe9ammQqqmldUyWRstHBIbABxd3GnqN7IRR4P0HdiVOMAlFYifgUyNpuCRv4TDH7tu41HimJtzlK5Gh03x/dcK2QUvSXEJYDuLqBDaUwntyP0VWEMsQYQx6L/lUa1DzfVBPJwVHgjI6Plm8BBlqLUIGAlGeB4XCZ2oJlXYtOK26vpZAOgzuLCSRaT3rg90I5zEd2dt+r1zuIitQEfi+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from BYAPR13MB2503.namprd13.prod.outlook.com (2603:10b6:a02:cd::33)
 by SJ0PR13MB5753.namprd13.prod.outlook.com (2603:10b6:a03:40c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 16:30:36 +0000
Received: from BYAPR13MB2503.namprd13.prod.outlook.com
 ([fe80::b220:688e:9ce2:5c95]) by BYAPR13MB2503.namprd13.prod.outlook.com
 ([fe80::b220:688e:9ce2:5c95%6]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 16:30:34 +0000
From:   "Bird, Tim" <Tim.Bird@sony.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Dan Carpenter <dan.carpenter@linaro.org>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
        "outreachy@lists.linux.dev" <outreachy@lists.linux.dev>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: KTODO automated TODO lists
Thread-Topic: KTODO automated TODO lists
Thread-Index: AQHaAkJlaeDZ0P5ZuEaPNA06z5rT4rBRERyAgAAIrQCAADPNAA==
Date:   Thu, 19 Oct 2023 16:30:34 +0000
Message-ID: <BYAPR13MB2503AD4559012411E72E0208FDD4A@BYAPR13MB2503.namprd13.prod.outlook.com>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <CACRpkdbNOmvBg+wHLHcdvp=YE=jYiKKCVWDqs2cMF85rXyv_aQ@mail.gmail.com>
 <CAMuHMdX2XDJkcTtysz0t+h1UuZCzioE5H2_tBerMz0LuSMAEZQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX2XDJkcTtysz0t+h1UuZCzioE5H2_tBerMz0LuSMAEZQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR13MB2503:EE_|SJ0PR13MB5753:EE_
x-ms-office365-filtering-correlation-id: cd560da3-2612-4059-de9b-08dbd0c0b842
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S2suDA3OSNWnHc62/ZaGEHiCxhbf4yuYxvQFdvcC+6iZtmdfIhZ1pufwKY3gZdccphgednQmXs7hqDV06l+m29v5Cq5QkYbsjb1ysiHjqX5ED2TVwY/8/b9XRMBWFX737k6Hqu+T6ltmLQEC7JkvBZNxiVHCKUOgQrU5x/HdeRkfDjHLo3DtO5nrwmC05dSSVaF2FookZHFAY58PP7JThR15cXaIBcdnAl4vCehWsGK+2yfObpxb2RKuApFWafayAmVZBQyb2a4YC+LzJMfadA4SVMFWDf2TnyOUo0WnzkDCOOYo1wUD3vTv76dXn1nJjYKZwgwo78TPHkGU+ndPz1NOLgnPM8pc8evgk+QNpsHfAk65RCPkbtpUcDwxuc3Vu6u5altoA3zpiJzVo5hL9JcVT9i32DC7xBi7r7xWF/DueVdj7BH6aY9nriVvhKhhFV7bT5TuuPeHYOicl3IC1VZimEHxpIDsW0dWawE90d31ueNJTllpbzisTZM3wMmEwA0g6kXL1eLd0TG6+2+qov+YhoQr1Cq7kYCl/p4pdPdQ92Srh+yxAk2BsiqbrUxZaGM/O+sFylyn9NZLV7QtcX/E28jyJnbXnIGMKbzcejhbWOLS6GWB5NTmF5exs5ORk0DeD1mU6XgDfF4ZqHuLjA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR13MB2503.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(136003)(396003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(55016003)(86362001)(66446008)(66946007)(110136005)(54906003)(64756008)(66556008)(76116006)(316002)(8936002)(66476007)(966005)(71200400001)(478600001)(8676002)(33656002)(4326008)(41300700001)(5660300002)(52536014)(2906002)(38100700002)(6506007)(3480700007)(53546011)(7696005)(26005)(82960400001)(122000001)(9686003)(83380400001)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0JKdzFKQWZLZmNWRDNzRjBKS2hoclZnN25oMklkQ2Jsa3hHWUdDUEJvK3RI?=
 =?utf-8?B?RFM0V0ErbXBVcnpoNXlIS2o2TXJGakR1Vlowb2ppN1k4anQvNGRqMHVyeWZO?=
 =?utf-8?B?aDhkRk9MV2I2blJ5ZVB4dS8zUnJocW5oQWNzYUQ3ZXYzQzUxNjUvLzFuMXh3?=
 =?utf-8?B?L3grMndKckJyNTU5Z2JyZ3lMVllJYmlSK2c2dzBWY0duckR4UUlBWldnRW05?=
 =?utf-8?B?TkpVajhsdjFmQ1VtRGgxVWJFNG1aaDJiMW1iU1lTV25TU1ZCUnM1bDgySjdU?=
 =?utf-8?B?bVp4VlJtRTB4ODFVZklRTlF4d1NWNHIvZ1MwMXl4N2dicm9iQWNHOXo0WVBt?=
 =?utf-8?B?dDFQQUE3WkJUUFQxRzNhS0I4Q2JnU2s0VnNYWFptU0o4K0Jxa0Q4UzdHU2Zy?=
 =?utf-8?B?Vi9yWm1Ndk9sRzB1SlZTdmk2Sk9QZysxS1cyN2hla0hsdlVwbVllK3lkL3R0?=
 =?utf-8?B?TVdUMlJleW9mc0FyaVBjRzJJcTJWdlk2TmhtR1lZVDJreUhkKzgvQ243d0xk?=
 =?utf-8?B?OHVISDFvaUFPbWVwSTFpbnZkTjRWY1ZCOUQ2dTRtSmRMVWxvV0RhRU0raWtz?=
 =?utf-8?B?WUgycVBocDV0eUVUeFdoSXJqQmFrajhURXJJRk1za3VoeGM0TW1uV250Rito?=
 =?utf-8?B?d3lWenBaTzVTajgzbG5GUlhkcWtFMXNKZWYyVDg1MmthSC93dHoxL0xjWVB0?=
 =?utf-8?B?OERERlFaUjVFSTEvRW9rZlhJcTRzbVkxMTljYms1Z1JhMXN0bzAzNHAzOGV1?=
 =?utf-8?B?THpKNU1vZ2ZBaXV3TXlPWklQaW8xc3NhUVVHZXN3MnhWTzBTQkJuSFgySFMy?=
 =?utf-8?B?NU1nRkl6VlJWZnZVVDYrWHlkZWFwVXoyWnJpdXpkeUhLMVBiU0JNTjdHM0Zm?=
 =?utf-8?B?aG5ZanNnbk4rSk5qWUpFRFAvTkJySDNTV1BBeDUwL050WmNybitDdzBlSGdD?=
 =?utf-8?B?MW9oQnY3NWlETnhzMFRDdHFnSVB5Z01kOEVnYmdiODhXTGs2MnU4N1Arek4y?=
 =?utf-8?B?c3loUzRVZU1lWm1LSXZGRFBLT1pmVmk1YjlCeWM0VWFPbURrUjI1aWRvSTBw?=
 =?utf-8?B?S1FFa0U0L291SGRCdkEzbUs3UEp6dGtEa3h0QUk0R3pWNmp1MWlwRmdQdGZM?=
 =?utf-8?B?d0d3S3lmaFd3a0NlZlQwa0hkb2FjYmw5K3JCempSQm44M0tNekZFNzFrMkNs?=
 =?utf-8?B?S0N0YzRYU1JFQ2w2UnB4SUVFMW1rRi9TQ2dJN3IvbzBPOTQ1aXNHR0ZYZExa?=
 =?utf-8?B?dngyMEQrZ2FFK2RleU0yOFhZMk1OcmtGanYwb1pZNGhVcUNpYVV2dlZsdmYv?=
 =?utf-8?B?dzZIK0NVUDBqT0ZlOXRwM2t6R25DcnBLblovTUp0di84K2k3YnlpU1M4Y2gw?=
 =?utf-8?B?czZOTDhRc3JWTUg3S3pKOXFFL3BaSE1aYnN5Wndqd2QvazFjUnNqRU9qQnV3?=
 =?utf-8?B?a21yREVXQ0ZGcVhmdE1YYzBhMitkek9pZWlJWnRKZmdhTm5qYlZjbUN0YUo3?=
 =?utf-8?B?dVROd1NJTmVBNWxCSXFWNTh5ZXoyTDB0Nm5rc2Vybm51YWJKUC92OFVSV09k?=
 =?utf-8?B?OEY4NW5YUFdyY3F1NHk2YlUydE9LQWx5bmRsL3g5enAvbVJwMWJ0VFZ2aW82?=
 =?utf-8?B?aGV0V2dqUDVGZi9tUmltV093ZU5WdXZ3bUEvU1BKcXZyU1ZMUlp1eFRkRDhy?=
 =?utf-8?B?MHlZTy9FeDFYZDdBOHRUcmdGWDhWZXpUSkluVWtqOWVSdDhaVnJyUzBSaC90?=
 =?utf-8?B?TnpWQU82RVMxL1RPOGM1YXZRWmN1ZmNId1psamtOVUZKYlkxMWQxSmROTEVu?=
 =?utf-8?B?SmVoMlc2cTJEcjRmS0JHRVlSclRvcmt6eU8yMTBNdnBSN2tlRzhXQmV0N3Ur?=
 =?utf-8?B?UmxHNGN6alFBMERYMkhhN1hBc3RwWHhOaFdtK1d4TVZtclp5TGZQNnhFMkV1?=
 =?utf-8?B?T25DWTdsK2hGMFF5NFdBdnBoT0NaUTNYajEyNzluM0t5eEJCNWorckFERnBR?=
 =?utf-8?B?YVFFMGxOaWg4OUsyOWc0Z04wV1hMbVVkZE5BcGpHZUJrL1lDZnBMNEFsSEFa?=
 =?utf-8?B?UG5RMm9MbWVneGpaY1grMXg4MXZFU1pra3hMejN6YU9yM05YN2lIMzFpZ1pP?=
 =?utf-8?Q?usVU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: /nh6I60Yhp5uWDG3NU3KpUf70zXk4oNmLxVhps+racCO5uR3nnL96T/tlWvpiNjw/6dBvDwYF5BUVHhetABLe9sP6TW4JwrkiWQTWwZDzQE0b75dQNP2SDrkxNP/l1Z4AGrR+y4nGvvHa/aJBj9zO/+4Tsn4pmxWRwbyxFUZdq86dHYIJrq9i3XvK3hIOjSad/PVpESLh9z2WdXYxhovx3Q9PJpXTiZ+X2IlnZ6G9BldbTdcd2uiYuibHRcxXpnmVeOWzEWFgIWigxPfmPcYGSnkX8kBiY1iXcIXbN1SVYgcGcBznLcPlHghCQT3Phh4clW74bsOah0knG+s9rJDcCSrRHon3aUJL7wMMTx2sbEnZLVFYik63iX0+8v/5RZvvx4vmif6BB83sx5YS/rWp01TtYKrJQVOw2Bp3Bu3WIQbNv7AWUj1HF95nkUFw9aFpN1LcVnKq6uG+WHDnJu/gc6+WYvVgyqfVT7LUHQcYXUWsWpuI9yCHQDO6ZRrB+gtCAjkd/3e4QFxuBCR3CbtUyhHnBzcZDf6RdWUta3yGMvCrS6lu7Q0Xb6qdLPg6sB/UeUil6iVTlW9eL7ly2FUklciIvJNY/f043H351cRtUPIICCq+kOYtZKOcr1wqTP/Vb4pQDfjyfsTTQ1XCVnJkCKfRRSa5Y0Nk5a+Zy3F6XOX12dGqlh2d0N/SJAce9N3JJTtelbZFnioXt7CllxhsvklaJGGa7gyUF/GcmOrXU91P7DyMkH2wR0SHkokSAI2SLzF6CRaI9X8hxqhHx+FwTmBFlJTmhh1tsZwDPjyrpGSloPum+Z7U976fFhKf+qXSOaeMGc/XalGJuWA91IYvoxxDMMVdbHUS3FiVk9Qa8CEJNrc04w3xRB2g+YiOZ9FN0W880TCyqMgjBkge6VrUw==
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR13MB2503.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd560da3-2612-4059-de9b-08dbd0c0b842
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 16:30:34.6726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: efyAj+Hb5q61VqkqMkSMAagmIKUYNz69E7kPsEe85chfXS3FeDug4Trs5UlbWuq1iKv2vf/x1ATyvWt5+/wuFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR13MB5753
X-Proofpoint-GUID: U7qyATKIlL6OW9b8E6lRBpbjMsK-JmAF
X-Proofpoint-ORIG-GUID: U7qyATKIlL6OW9b8E6lRBpbjMsK-JmAF
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 1 URL was un-rewritten
MIME-Version: 1.0
X-Sony-Outbound-GUID: U7qyATKIlL6OW9b8E6lRBpbjMsK-JmAF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_15,2023-10-19_01,2023-05-22_02
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gT24gVGh1LCBPY3QgMTksIDIwMjMgYXQgMjo1
MOKAr1BNIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvb3JnPiB3cm90ZToNCj4g
PiBPbiBUaHUsIE9jdCAxOSwgMjAyMyBhdCA2OjEx4oCvQU0gRGFuIENhcnBlbnRlciA8ZGFuLmNh
cnBlbnRlckBsaW5hcm9vcmc+IHdyb3RlOg0KPiA+ID4gV2UgY291bGQgYWRkIHRoYXQga2luZCBv
Zg0KPiA+ID4gdGhpbmcgdG8gYSB0b2RvIGxpc3QgYnkgdXNpbmcgYSBLVE9ETyBsaW5lLg0KPiA+
ID4NCj4gPiA+IEtUT0RPOiBhZGQgY2hlY2sgZm9yIGZhaWx1cmUgaW4gZnVuY3Rpb25fc29tZXRo
aW5nKCkNCj4gPiA+DQo+ID4gPiBUaGVuIHBlb3BsZSBjYW4gbG9vayBvbiBsb3JlIG9yIHVzZSBs
ZWkgdG8gZmluZCBzbWFsbCB0YXNrcyB0byB3b3JrIG9uDQo+ID4gPiBvciB0aGV5IGNvdWxkIHVz
ZSBsZWkuDQoNCllvdSBjYW4gYWxzbyBjcmVhdGUgZGFzaGJvYXJkcyBmb3IgcGVvcGxlIHRvIG1l
YXN1cmUgdGhlIGFtb3VudCBvZg0KZGVzaXJlZCB3b3JrIG91dHN0YW5kaW5nLCBhbmQgdG8gZWFz
aWx5IGZpbmQgaXQuICBJIGRvIHNvbWV0aGluZyBzaW1pbGFyDQp3aXRoIG15IG93biBwcm9qZWN0
cyAoYnV0IHdpdGggYSBGSVhUSElTOiBwcmVmaXgpDQoNCj4gPiA+DQo+ID4gPiBsZWkgcSAtSSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvDQo+IGRLZFRsN2UzeTF6bHhwaHV0WnNyRzBCb0ox
WVFSRkEtLU1SSGF6aldYckg0UXFWRzBIcnAkIC1vIH4vTWFpbC9LVE9ETyAtLWRlZHVwZT1taWQg
J0tUT0RPIEFORCBydDo2Lm1vbnRoLmFnby4uJw0KPiA+ID4NCj4gPiA+IFRoZW4gZ3JlcCBeS1RP
RE8gfi9NYWlsL0tUT0RPIC1SIGFuZCBjYXQgdGhlIGZpbGVuYW1lIHlvdSB3YW50Lg0KPiA+DQo+
ID4gSSBsaWtlIGl0ISBUaGVyZSBhcmUgdG9vIG1hbnkgb2YgdGhlc2UgdGhpbmdzIGZhbGxpbmcg
b24gdGhlIGZsb29yLg0KPiA+IEFuIGVhc3kgd2F5IHRvIHN0YXNoIGl0IG9uIHRoZSB0ZWNobm9s
b2dpY2FsIGRlYnQgaGl0bGlzdCB3b3VsZCBiZQ0KPiA+IHJlYWxseSBoZWxwZnVsLg0KPiANCj4g
QW5kIGlmIHBlb3BsZSB1c2UgYXBwcm9wcmlhdGUgQ2xvc2VzOiB0YWdzLCBzb21lb25lIGNhbiB3
cml0ZSBhIHRvb2wNCj4gdG8gb25seSBsaXN0IG5vbi1jbG9zZWQgaXRlbXMuDQoNCldvdWxkbid0
IHlvdSByZW1vdmUgdGhlICJLVE9ETzoiIGFuZCBhbHRlciB0aGUgY29tbWVudCAob3IgcmVtb3Zl
IGl0KSwgd2l0aA0KdGhlIGNvbW1pdCB0aGF0IGNsb3NlZCB0aGUgaXNzdWU/ICBJdCBzZWVtcyBs
aWtlIGxlYXZpbmcgdGhlIEtUT0RPIHdvdWxkDQpiZSBhIGJ1ZywgYXMgaXQgbm8gbG9uZ2VyIGFw
cGxpZXMgYW5kIHdvdWxkIGJlIGNvbmZ1c2luZy4NCg0KIC0tIFRpbQ0K
