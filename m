Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00AECDB465
	for <kernel-janitors@archiver.kernel.org>; Thu, 19 Oct 2023 17:38:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346352AbjJSRiM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 Oct 2023 13:38:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346257AbjJSRiK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Oct 2023 13:38:10 -0400
Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C3E116
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Oct 2023 10:38:08 -0700 (PDT)
Received: from pps.filterd (m0209322.ppops.net [127.0.0.1])
        by mx08-001d1705.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JHVnod029194;
        Thu, 19 Oct 2023 17:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : mime-version :
 content-type : content-transfer-encoding; s=S1;
 bh=dsRV92jRZKKZTqHGkacENC5WkmPPF3DAb/Rq3C+Go4o=;
 b=VSwMGWiYfFjgMTsqWyAyuzd6ZIh8BG3SeABaquX04ryZgSHGRFFA/na+E14euetsvGNc
 y/D0BXVNMgbYBVoLypgKzN0aR4ESGMOsstWcK4IfUM+cgJjlVXnDb144NCH1RNL7rRvW
 U9dAm0A8EdehKVLM0nICezEknUyyzhI2TLaQXS9kHBw8NKwbmFL/BjMEwaQn+lEN4C3+
 YK92z6Gvs02wLQyM8906EzinOBtP0OIT65QqpbP5zSBqmO60NwVdOcdUfhSZ8hUUSHcf
 gCahchZJdlmn+V5k6PFVinKn4vqHJRgvJjEbOsOmUne3ToJMS0hi0lkSonWgLaAaj08S yw== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
        by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 3tqk2cdtdg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 Oct 2023 17:37:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiTMnafVaJ4kDAwd0yb7EsZGGaIXgdyBVmWe+mr9UZwxQtFCmy9D0WcHnKBy4s5eOHk3EycA3NUOi8oLYnTraEQST3wfnoJHWSbzSnljCYgKdmMLKWjQweTtltrTc2+531KHYnTQh2CccWRFo6dp3ReZCLH2gCuvD1LthqEPs0oaLT2AXhbPVOfcedaQDzV7z0De/GJ62Zb+oHkJhqTEhuo7U3AYKTJKyBbWeh9GjjFYjbT8Yyzn6vUOTsy/UBtPCFC1beAmXpwUILDMiI9UGklS9Z3xh01OgjR+JnDRMMCZhwzKM9P6pJ/hebhps+tJDBThmilS+LSzALSMA2IhHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsRV92jRZKKZTqHGkacENC5WkmPPF3DAb/Rq3C+Go4o=;
 b=QBznrZTTlYIq3ZF8REPjTGTCkeOfR8xA/CjiPK7MyH6STSFyn/OfgIUNIjDhqqU4+4cwEE3CJMUNRe1vTfeArsrCwrjbxIF2khNlRmXcaa73wwA08cKbN1U0ss+iQ597AyO+fxJrVfwwUzmpgIromivHdG5S3mvgZPwseRtvnLcHtt0UtE1kmcAlc62eYOwBxX5NJf6OA7MQ/W3zCVovKT+hrGpuyO6vjNSj/pBYot1iXivr/iX90SfEVtMeDh+noNyWQzDMnlkcB4h4hFxCOH37M0A8yYKoTZ20favbzUPWHS4Gx5LDPtNh6vIfkNvq3uOoOMsr4y4ieNR2UhPNrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from BYAPR13MB2503.namprd13.prod.outlook.com (2603:10b6:a02:cd::33)
 by SA3PR13MB6515.namprd13.prod.outlook.com (2603:10b6:806:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Thu, 19 Oct
 2023 17:37:51 +0000
Received: from BYAPR13MB2503.namprd13.prod.outlook.com
 ([fe80::b220:688e:9ce2:5c95]) by BYAPR13MB2503.namprd13.prod.outlook.com
 ([fe80::b220:688e:9ce2:5c95%6]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 17:37:51 +0000
From:   "Bird, Tim" <Tim.Bird@sony.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
        "outreachy@lists.linux.dev" <outreachy@lists.linux.dev>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: KTODO automated TODO lists
Thread-Topic: KTODO automated TODO lists
Thread-Index: AQHaAkJlaeDZ0P5ZuEaPNA06z5rT4rBRERyAgAAIrQCAADPNAIAAEwGAgAAAoOA=
Date:   Thu, 19 Oct 2023 17:37:50 +0000
Message-ID: <BYAPR13MB2503B6AF1C7CD5E8B311911AFDD4A@BYAPR13MB2503.namprd13.prod.outlook.com>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <CACRpkdbNOmvBg+wHLHcdvp=YE=jYiKKCVWDqs2cMF85rXyv_aQ@mail.gmail.com>
 <CAMuHMdX2XDJkcTtysz0t+h1UuZCzioE5H2_tBerMz0LuSMAEZQ@mail.gmail.com>
 <BYAPR13MB2503AD4559012411E72E0208FDD4A@BYAPR13MB2503.namprd13.prod.outlook.com>
 <087316aa-f8af-4612-b035-bada418f4e56@kadam.mountain>
In-Reply-To: <087316aa-f8af-4612-b035-bada418f4e56@kadam.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR13MB2503:EE_|SA3PR13MB6515:EE_
x-ms-office365-filtering-correlation-id: 51019520-8b02-4482-ea9f-08dbd0ca1de5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r38w8eie1a4Fz/Ue7RhXS27NX/8dVHKzXEgCR9VXyKNOduWB56T2stCK2+eI9Ucm+sU4VIxCLo8kTlLtIOitbj47iCwgICTiy59ANGy23UKnmcG73Svax+9BS0t9Zw+vJgGb//Mi/lfoeNf1b6FcfeaPQ2gSeMd7t63Ro/5fdhSctobw87wp2bHkabSK5R121K4alhtynTNP3rub+S8lZuoZ3ERDC0EcmIcPYTOAujdt23kIC6m3C4ywmHqmu9Nm6z8APQLtRa0aJfGbVNC8lhl5Ul+rhSXoPd8OZzWprhduJFg4q+UTuK6cSIT9bWJmG1FjUXvDJ65gJQMI2tIxSuiuEgiS//lgpTVFg30V3yuzdBnx10MVTzMQXlf676/j0oWhF8AUhtvGjVn7BZv6yNhmQXJXKdsvgIQNP9kGDkm7wvzJPZ6yKW38LPrzXG6B5CkCua4MdTntfG8jzclfwjrPEYr3cBc4D8oEZmjvs9QrGL9XxOalg/s32eEL+oERXm8OggHUVYGw58R3BOreWY6hw2i0mdySgti8J/QFol7HEPRQKONhYRb2ZSdqDg5B/rXnAXplD909FG7QwtPDlmKP5fD6DvTKKRdnZcIBjEdFBnsjrbCZgC4AUWBnBACS/Cl80nNKFQmXNFKgG04Ss7r5/ey/xYRdQnRKgLkck9g=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR13MB2503.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(396003)(366004)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(71200400001)(2906002)(7696005)(478600001)(6506007)(4744005)(55016003)(41300700001)(5660300002)(8676002)(4326008)(8936002)(52536014)(66476007)(66556008)(66946007)(54906003)(64756008)(316002)(76116006)(66446008)(6916009)(83380400001)(33656002)(38070700009)(82960400001)(26005)(3480700007)(122000001)(9686003)(38100700002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlVXaTBsMGNnOXVYYlZ2RDM5ek0rWnpGcnE1YTVGb0hUQkc2dWVwTXpac2R0?=
 =?utf-8?B?TDF0blU3T0RmREZrUkMycUFqNTRFM3J6Q2dnNXI5cWVpTm9weGVLcHYrR1p6?=
 =?utf-8?B?L2dTaEZKQUg3MkNUVTdERk8vTmpGRytUTE5sN0EwSEI2WHlpd1NPQWNFVzNu?=
 =?utf-8?B?RW9HLzhzMGJCa2VlZDd4dCtLOE53RUVvNWE5SExjN0FHMXRVQzRoWkZBWGZh?=
 =?utf-8?B?eE8wMlQrcmE3ZXpFY3duSE9pZ3NUenJNdkNyc1NWYUFvZkIvaHp6c04zN1dt?=
 =?utf-8?B?QUhGd2tkTVVKNUMrR0oxYURudzNNNHY4U3J0TG9QbG9MK0lVOTJyS0J6UWVO?=
 =?utf-8?B?WFBtS05wcmJRWDR4QUVUT09yNk1jekcwQnRmRllmMmplTmtSbkJKbjJ5TVo3?=
 =?utf-8?B?Q29jenBLczJFdThScjhrZTBFS3pXd3pGdjc1WmFQd3VnSlVtWDNJRC9TdmpQ?=
 =?utf-8?B?Zkw0Nm1aYmhkMWd3aC9GSnFRT3krdC96SXJpUHVNV0YxVTJSWHlQdWhJbUtN?=
 =?utf-8?B?K08rQkNUbk80MFFoRmtKSEF3WXk5Vy9DalRMenFOS2ttcWI4bGRVZEFLSUxJ?=
 =?utf-8?B?RDNEOXAvQlhNSWpKNWJkT2wwV1R2ay92eFFWaWpuaXhjcjFlR3hUUEo2ckpR?=
 =?utf-8?B?WU5jRm9UQnRHQWJjeFdpOXZMd0o1R25lNzJXaDl4NHd6elI0V05EYkdUcjY5?=
 =?utf-8?B?VUc3SHlaamtMMUdGenFPc1JMTXlyTTNjeThxNlBTVy9lUTA2M1V0R1MrODFL?=
 =?utf-8?B?MGV1ZGxvMnhwMUQzSjYxSFZIQ3FveW11b3FBRXFwZjJ2Z1VXZEI0a1VDN2Zt?=
 =?utf-8?B?YnQzc2tnNkwyQnQzNXhJclBISzNnejRTWjhIYWQyRG9Wa0lDLy9QcU8xRUZB?=
 =?utf-8?B?OC9xT09JVmdXMFo1cW5OOEV6UG82ZnlTdTJSQUwvclc0N2ZZdzg0bjdXRWlm?=
 =?utf-8?B?TlFKVHM1ZUR2bWhDTDZFRXc2dW9nQ2FZbXByc0FaU1JHN0k4QkNXOFc2MWZy?=
 =?utf-8?B?VVQ4OVhBenNvOWY1MElKT3JYbVRNOEdkc2ZSTmozYjBhaEZ0T0RpWDQ3em9q?=
 =?utf-8?B?VlJaV0l1ZWV6bG1XUFY1bXpLSUc5UVJKTnBSV2lhRFVpWXlkWEhPTGVaWmZT?=
 =?utf-8?B?REpoZURtcWpTUmsxTS8yd3FKalBVVG9iTlJUQWZiUmhkTDJvWC9jeGtvODVv?=
 =?utf-8?B?UExOc2tULzhWTzk2L1RxOEJ0dUt4ajc1WU5JdTJ6MXlyejUrL2U3bmtsK1hC?=
 =?utf-8?B?czVQRXpoTnMzSm9TSlU2ekJIWjJzYjhWOStyNHk0ckFYLzVyT01jbFl5ZFQw?=
 =?utf-8?B?VmdvUExjOW9OQWFnRnpCUjdNTlVaNVZBWmREV1E2bkdFZ1V4dmpQWHc0cFox?=
 =?utf-8?B?bEt3NmZVbW5oR1hUcjdJNkRVYVRMckNLVndyTDhiQzZBejlKbWFkdkJxYk1h?=
 =?utf-8?B?SUpkb3NuZXNKRFJnM1VjbDFqUk5SWXZ0SVFBL0gxaXppazBlQ25waXFxdUZP?=
 =?utf-8?B?UFRTcjJlNU5aMmhxS2krS3F6OGJoazVBbjQwa1htREdXZlZqWjl6WkdkaWdq?=
 =?utf-8?B?czdLTElxb1QyeitGMUhRZUxqZTcrVVhMMDZJVFJRMTlRUUh1LzdwbkNWeVFn?=
 =?utf-8?B?M3RFaWtaN0JraFlXd2tvV2Y3ZU1zandUS3JpZUlmTWhWMVQvU1cyVjJIUXRC?=
 =?utf-8?B?M3B2VEE0aVBGK1k1YlFPa1JCSkR5S25iY1lpWlZhS3pUcytRWG53c0xwblpy?=
 =?utf-8?B?dE5wYnh0UDIvSFBKRnhxZE5RZFhGUDVkWmNwdVg1VzM0a0Z6MjAyd2V3bEZ4?=
 =?utf-8?B?QkNEaTlLZjlCNWlsWnlTWDZKM0JldHJRa0FIT2JkODNmZEhjL3lQQXdGY2Va?=
 =?utf-8?B?c21EVmRhSWdzOHhOU2JyWllWWXUvSjlQc3F5cVZvc2xSS1FDYnZMSExNblU2?=
 =?utf-8?B?VFE1SU15aEx2Zm9KOUp4aVQwSkNydWl3V0RTajhNN2pmaW4rci9FQkNHeUhy?=
 =?utf-8?B?UDVraVB6cVp6Tmp3bnkyVUxSN01scU1qbFNDNFYyY2lzVEYyVGVpM0lMWGtP?=
 =?utf-8?B?aW80M09SMWhLMDVuYldwYnQ3ZXBmbTdyMWtuc0FIYXFGSFFFZGtjaWtwSmd0?=
 =?utf-8?Q?aUME=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: e45+zvp62wYdMPG1btJnU6xYT7mqpr3ctjf+mCIbnMBB1zhNBBqJTGcwJDsbxXQuCK1LlKugCImgHC+ep5TBPfiFNY8rVmTwidbTzNXDR5Db5lGKXqS1friZymM33k+rVlqvPRjiL4oyYx3Uxdq2u2/dmNwJecwEqgAjprv2oDMkn4sm4zvUQ2X7xu5GuTC/Gg4uAuJXUCq1sBdmGPZ5wgvTlpqgomkRf9IDnbMLRstw7aayH0exg3+46YvavhhvujBKqWE/tIraymz2oYQUIZDoaIZIk97GA7Qhb58+gVRMbocdyqy68Dm7XVK2GkGt3+mMrdeZqX3RRSjSZT1uPkkaoMmlE0TDrQxNsbAdwTs09zKLAVJW+GkFUtESL9Nny0pp1tIV3GaXwdQqYqPfm+UVSS5oNROxgrBuFCWdp2GnC8FflW1ngUwKq/Uy2g3OI5+y6+aZBWjWt3+qrt9jCvDTVX/lmCj59JataIJRXjcP60wOckkx0+hTSOPNwsuJvDJu2ISP4gICxWNdNMIQkgNFduJlfOTsNCP6lMEu8QZEsm0VGLC21Jk97XST0W0uMUYjxTk77hrd6eU6pY+4Ebztj6B6CZgjr5uAKcesiHWzf1SWVsFJxrxaTa8SfdmmMxXdYkXmleRkRAQ1DQJWitdHblXyt+5f07zpqYsKErDwHs9lBEiUy10RJxhFZb1WB1Da2kxn3UbNETXGz3GA1lkJcvfvU6Pk89b80uDncSCdrLEqIEze/7tJMZTUbIY6THZMke7kAp/NSKwqrIsrqc0yShp5TxGaiXqi6YACWbwVmdtak61Yzkf/IWYPDaLmHdp2RPB1/MEgGT8EK90B63IYzH+Qo0WXQzwT1R7SVE+N+yunBTx49w4YTU+SEi8sxRJGzBysfNil2W3JyFhdPw==
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR13MB2503.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51019520-8b02-4482-ea9f-08dbd0ca1de5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 17:37:50.6602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xO5iK583offtI2XqoBiEkOt5EhwCErBMMX5S2VpM8++eqJOs+FNreD0auN4D9vEnk+7DfZVsO/ruAq40mw5EaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR13MB6515
X-Proofpoint-ORIG-GUID: tZY9qBbJsLmcSIHOpZlgnfUpiDOJ4gS5
X-Proofpoint-GUID: tZY9qBbJsLmcSIHOpZlgnfUpiDOJ4gS5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Sony-Outbound-GUID: tZY9qBbJsLmcSIHOpZlgnfUpiDOJ4gS5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_17,2023-10-19_01,2023-05-22_02
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuIENhcnBlbnRlciA8
ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPg0KPiBPbiBUaHUsIE9jdCAxOSwgMjAyMyBhdCAwNDoz
MDozNFBNICswMDAwLCBCaXJkLCBUaW0gd3JvdGU6DQo+ID4gPiBBbmQgaWYgcGVvcGxlIHVzZSBh
cHByb3ByaWF0ZSBDbG9zZXM6IHRhZ3MsIHNvbWVvbmUgY2FuIHdyaXRlIGEgdG9vbA0KPiA+ID4g
dG8gb25seSBsaXN0IG5vbi1jbG9zZWQgaXRlbXMuDQo+ID4NCj4gPiBXb3VsZG4ndCB5b3UgcmVt
b3ZlIHRoZSAiS1RPRE86IiBhbmQgYWx0ZXIgdGhlIGNvbW1lbnQgKG9yIHJlbW92ZSBpdCksIHdp
dGgNCj4gPiB0aGUgY29tbWl0IHRoYXQgY2xvc2VkIHRoZSBpc3N1ZT8gIEl0IHNlZW1zIGxpa2Ug
bGVhdmluZyB0aGUgS1RPRE8gd291bGQNCj4gPiBiZSBhIGJ1ZywgYXMgaXQgbm8gbG9uZ2VyIGFw
cGxpZXMgYW5kIHdvdWxkIGJlIGNvbmZ1c2luZy4NCj4gDQo+IE5vLCBpdCdzIG5vdCBhIGNvbW1l
bnQuICBJdCdzIGp1c3QgYW4gZW1haWwgdG8gdGhlIGxpc3Qgd2hlbiB5b3UgdGhpbmsNCj4gb2Yg
c29tZXRoaW5nIHNvIHlvdSBhZGQgYSBLVE9ETyBpbiB0aGUgZW1haWwuICBJdCdzIGxpa2UgYSBz
ZWFyY2hhYmxlDQo+IGhhc2h0YWcsIGV4Y2VwdCBpdCdzIGEgb25lIGxpbmUgc3VtbWFyeS4NCg0K
T0sgLSAgSSBtaXNyZWFkIHRoZSBvcmlnaW5hbCBwcm9wb3NhbC4gIFNvcnJ5IGFib3V0IHRoYXQu
DQogLS0gVGltDQo=
