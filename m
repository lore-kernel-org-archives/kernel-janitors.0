Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C2BC28B2B
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Aug 2022 08:26:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241967AbiHRI00 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 Aug 2022 04:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241936AbiHRI0K (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Aug 2022 04:26:10 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3156B02AE
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Aug 2022 01:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAKrKbQEVwuPWNXibXiropv8nxZ/zZGDzFh7hJEvWWbGw39EvrEkCDEoZYGihyv4LW6LPHD5RLxgW9fFURMHDedgG8yJH4+7+IWKLDA3yg0F+2Ic83zMElsYj6XOlGK1//mpRgTYh/Q/BXgkAjiVy/xZSZT24FvOZdo5+To7Xlo7yydGVmAn5SLOO8rNcDnqZIUp4KUyFPW1zL4QkykiSJAxp5KXoSNsO9OHz5OUFMWOlVVlT3WggiZ23t0iQzVTSjd/BFZLRfFqly8WhLM0qaBwtMb+gi7gJb3SXJ+G4r11AXtt6z0eptKHD1CeFKTsXsdwaVcFhRcyNbh8xb9mjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/W99OpBGWDzL4/ISwSUiyuEPN3r07ADr8LWdzDBu0jI=;
 b=cdRWXSB6etAkFzvPefcz95UEi2upDVZK/FfzAkdVhm92aZjJ9gnt412VNUgNQXYvNsxvuUqKpX1MUO+TxyRKnwqwoGI3L69wXhS4gP/uRI1YhkzydGlor4Y9L+khav5g5XqFVfq8iBpmkYowY6sVCD1jWS9SrJZh783jkKiGVBZBTUOrqx4n3xB6rpIRil/Lutw1OOX6TPvw5JMp/v/SaOdMZGGORpcOE21/iGszMF5RK1vVXXFSiIvHkhyExImCo4vTqnUW6LtjI0v5ILEftDJmuHu6vzQh/aF/oc1VDcqvs3x25PysvTi1SkyXNd0MFM8X6w5QmJoSJZsa+wxNig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/W99OpBGWDzL4/ISwSUiyuEPN3r07ADr8LWdzDBu0jI=;
 b=u4VWD2WF3BA3KhL9xM3Ifwo0kye31xZE8zQ9WnwzgGhPYGqdWWxoieOtD9FjTBG0WOvzzr5rw1ZdKIIS+LicWjvmB7vmMXCPWIxqNCrf62+CFKIcFJmDJJmu8fD758sAMW2X6CvjVajGcQ7SM0cN9ZxyvZVruhA8yofpONX0TxF84xVpqMm36CSEoEZDEU/kju+HrL0RhRHudnvj9BKYYGn/3JBL5Y91E83z76f3987JNUEzYJt/iZQg1aWH7cMyZMePvOiaaTMovM5zI8pmf/QTtDiGVU7OEtjPCmUq6bfQ+bEp7xJ8dM7QD2KnwSxUFulO3fh5qnPKlX+uaMWA7g==
Received: from AM0PR10MB2020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:44::29)
 by AS4PR10MB5245.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 08:25:53 +0000
Received: from AM0PR10MB2020.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5970:bc8d:4379:cbf]) by AM0PR10MB2020.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5970:bc8d:4379:cbf%5]) with mapi id 15.20.5525.011; Thu, 18 Aug 2022
 08:25:53 +0000
From:   "Foglietta, Roberto" <roberto.foglietta.ext@siemens.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH]  ww_mutex_lock/interruptible GPL-only exported w/wo
 CONFIG_DEBUG_LOCK_ALLOC
Thread-Topic: [PATCH]  ww_mutex_lock/interruptible GPL-only exported w/wo
 CONFIG_DEBUG_LOCK_ALLOC
Thread-Index: AdinBIMJCYjkgF1ATYiQ6DWNQHxmxQAPGy+AAua7vwA=
Date:   Thu, 18 Aug 2022 08:25:52 +0000
Message-ID: <AM0PR10MB2020B3A8879A62E65ACE0C8DAA6D9@AM0PR10MB2020.EURPRD10.PROD.OUTLOOK.COM>
References: <AM0PR10MB20207EAFEC027FA5E3605306AA9C9@AM0PR10MB2020.EURPRD10.PROD.OUTLOOK.COM>
 <20220803135715.GE3438@kadam>
In-Reply-To: <20220803135715.GE3438@kadam>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2022-08-18T08:25:51Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=789a732a-e5a5-4040-ac83-ade37dae7170;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 239c51db-a7c4-4e26-67cc-08da80f343e0
x-ms-traffictypediagnostic: AS4PR10MB5245:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H+zdkjxG8mb/Ef9ZJTez1MloR5j3kTGut9ytg4d9ay7L8fEWLYVanoM+oGAdAOH8bNnXhM4Kgeop+OvGikiheP3Pu7FVEy1CAFlOb3DXGeXWDdEmPwamZoVohzj+rQha/bO1Tfkk8mkAMLUtA95IsrbHqZddkMKqI/+wgVMpgtwVvXNgDL12b/buf6T5/DltMGhLLDEgv9e0L76A0+GwLtostITrcdG6/tFvrcHbRfKklIaUkIXvGYa3LHp9ojreBQLP3AS03PI5NHXcBdcuDIyKcfSd77rFemqXX+YGjgWXwfvujWt6MIM+YS/Yjru5MzIIAOO5QmITU4pq4YsfNPRXodE1Ng+Q5+J964FbcgjZQNZl3I0L2M9EPNwl+7bbPd25RD4olg312/I4KhMQ01pYeJ2PbKEqhxDNGZ4xjrOWSarQpDaeTOTncPNfBgigVs3eL8+jMsCy7ZmL/bSPA3/OISczq40RabzWR1PbwZ+rvonvslPrOTupEshuBe4gfnkpDVEosyHcocyiUsIs1MbvCKo4+yVWjsX0oQ0p63c1A8vVcqhNofbg+DfZKfCJ6U5Z4DlK6cCMEAX+U/RDKds6Eayzu+uKdB3vki2rSncjP98qB+cTYwVoy4Ki99nd1+q0QxkskkKzGZnEQaXfx2DrgrSjza1gDusLzDE9FUBnguEgYXtKLIWxjno98WXa4bg+Y67LPph4gh7K+bn68i0tfZpfVlbDSCoEeT787OebG1NUoFeXIUKMPlJWyVUe0klFTwj6AHUCgHSM3QXhSqLQ0ZsnaN1nMIevxCofmTw4etWo/kPwh7HkDP7xoOJw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2020.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(64756008)(71200400001)(478600001)(66476007)(66446008)(86362001)(66946007)(76116006)(9686003)(66556008)(33656002)(26005)(83380400001)(82960400001)(8676002)(55016003)(4326008)(53546011)(55236004)(4744005)(7696005)(122000001)(38070700005)(6506007)(41300700001)(2906002)(8936002)(52536014)(316002)(186003)(6916009)(5660300002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OU9UZUcwazlMQUtrbGdiNTFoMzdjdHZ6aEl3NVFtYUp3eGlMekxLTmN0QTdj?=
 =?utf-8?B?UElCUlFWTDNjUmY1bHhHZHJoa3FrbEFUb3RiQ2ZsUjNMdmFjKzRSZ2FkekFC?=
 =?utf-8?B?M05HS0JualZwdTV4S0xGazQrZGU4RlA0dUtDN2FIbUFpM1FZa2tLWlpNbGZU?=
 =?utf-8?B?MGxjTklMeHkvSmt2S1M5b3NMMzc2T2ZYbUNnM2pZczJpRDhvT2tBeEJCVEkw?=
 =?utf-8?B?a0VFVitXYk43dWJVajVZYnNwVURhb1I4aEYvMHdEYVliay9EQWZMMEhXTmRT?=
 =?utf-8?B?V1lrSHJ1RnFDY1VTY3VxVGwwUUEzODZqMGlhdHE1WnBPa3FiMmttNjNkNFZ4?=
 =?utf-8?B?VGN4NU9saXNKNFNUUTNLK1dERFF5V3BXM2ZicGppQ3Z5aFNXT25aYWp6TEVI?=
 =?utf-8?B?YTJObjVBQldzQkt0WEsxOTRPU1lYdE1LTmpRQmlyaHcrTVJwcWhDR3hYWVda?=
 =?utf-8?B?aUxxaml5ditSdlUwVkxwVWtUNFY4Ym5wL0dQOUhiVi9qSEJsdG96UTVqUzIy?=
 =?utf-8?B?V1k1TzJXTFBUVkZQSHFKTjQ4WTR2aGFtVVZ4Q21BZFZZN2hJWlBpb3RESFRY?=
 =?utf-8?B?emIyVnp0WkVZWldxbzBLc0M5Ynl6QmtPRjFJeU1FSmc1ZzlyMjArd0R1bW92?=
 =?utf-8?B?Y0crRnRrMUlXYkE4Rmg1cXVVOHhQMGFjRElFNml5MS9lYlpHSmVmZ1o2VzdM?=
 =?utf-8?B?NkJxVC91TUN3bmZONFZPU0pnanBQQ2J2dUowZ211ZUFKZkxnK1JBeWVTVVRn?=
 =?utf-8?B?K01jdW1IeWw0NXJtbU1sMGN6MVhYVEM0TCtaWmZHOE9wMjlNWDUxTktpNytV?=
 =?utf-8?B?bHhzMnlsTDUrR1FlUlJ4dnF0TmlWNENrMFFHajZTK2I1dnE1NlRWN1VYT2or?=
 =?utf-8?B?czdseXloT1dVcHRYK21iZGJZcnhaYlB6NnZjUENFbnpUQlJSVGlDVFoyVjJ2?=
 =?utf-8?B?RDNzVHVPTXdnTVdrZ2FONnFycmxiMjBveFJUdkRKM1FPNEk5SzJaUTZ4Qm9W?=
 =?utf-8?B?MEJKcUZGZDIrTDloYTV1d3RkUWtsODFVZWFxZXB0ZUc0a1IvY2FvVEVadTUx?=
 =?utf-8?B?YnNhRlN0Y045ZzczMTNNc1U0c0E5a0IyajVoNm03TXFpUHVPeG15RmJEMjAr?=
 =?utf-8?B?RE4rUUhSYlF3WjZ4UysyRUQ0ODhnbmlvMEhGelVJaExnVmZBZmZuL2JoQWF3?=
 =?utf-8?B?eURTcVNDamExL2czM1VqNmhSdG1RUThBblF6VUNBMERXRkhUVEFlbGlhWUFD?=
 =?utf-8?B?RncvWjBqSUEyZTArOFNLTjEzSS9sME40b21tUHlyR0ZRaU1UOFgvSlA5aTho?=
 =?utf-8?B?d1hHa291NzNQeldQOVZnbDNkNTZ5RENvTHlIM2VWeTVYRnd6RUszU0t0NzVs?=
 =?utf-8?B?M21EZExpRGFOb3IxOUJBTzdJWWlraXUwOUlMcDdBa3dVdU91WHhwcVFyM05j?=
 =?utf-8?B?QjgvNk03VExRUXk5d29lN2NldCtvOUc1S3FHRGdNTlp4MExlTkdiZDhzclBY?=
 =?utf-8?B?STdkak5MTnJaUkZ6MlV1dy9KZVRJWlVHdzQ2eGZ5cWMyZ2dTbTZLZ3IzRW9H?=
 =?utf-8?B?OUhNbzZHcXlJS2RBMnlhWUFEZDFyNEZWczRCSHFVa1NMb2ZYZXYxaTlOTUVE?=
 =?utf-8?B?QlVFMGFZbVZrS3JZVEtoM1RuaUp0QTI1ZUExRUlKaUxwR0ROQXBpdUxndXRB?=
 =?utf-8?B?QW1xbzZoYjFRbUgwY0t0SDdiM2N2aUlkeEwzVnhycDExdlQrdTBRMjNCR3A1?=
 =?utf-8?B?QXZ6aUNlTmRjQ1lYemdNQWtENkRjbHNIMHNFOXVPSVRrQTdvdlAzTVBXUVZE?=
 =?utf-8?B?V04xcCtDYm5qNi84ZVl2TmhUMHVyNGh1OHhyUHFNQU9ZMHBmUmx2alNOK3RY?=
 =?utf-8?B?RWFPUjhpOEFUOWlIc0RlaDU3MithaElrWjNQL3BiS3l1c3ZVVzh6elY3WUxL?=
 =?utf-8?B?dWl1bU1GYUtSZGl2TWxycXBjK1hkR2oyekZMaTByTEFQUDJVQi9Qck1vdnlO?=
 =?utf-8?B?K2RqY0FYLzEyQTlIK0ZPcTltbEZ0djdrcUJzTWxiemNsUGk5TGUvZ2txVmtB?=
 =?utf-8?B?ZFphendKYjdFb2Y1SFhmUEFVZE5FMW9BZnViU20raFFUSkdpWWcwbktjTmNZ?=
 =?utf-8?B?RDhld0xXdEd5bTVrQ21uQ01DeXAvWW1GRlhRd1IrVFBpUTNDTUN6V2hneWNY?=
 =?utf-8?Q?wiz5XE+BBLtYMinShqjiWAc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2020.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 239c51db-a7c4-4e26-67cc-08da80f343e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 08:25:53.0222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +cp54BHjwUMBG+WXwrhhWPiBAeNOzj8hoRZIX2AVySNrYhKawLpIAs6lnjQNNsXq1yGiGNAYZJQv7cuUIVCcdIppmS2geDY46z3IfIT1D0Y5zWcnamheTGFfk3iZ/ZXB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5245
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYW4gQ2FycGVudGVyIDxkYW4u
Y2FycGVudGVyQG9yYWNsZS5jb20+DQo+IFNlbnQ6IE1pdHR3b2NoLCAzLiBBdWd1c3QgMjAyMiAx
NTo1Nw0KPiBUbzogRm9nbGlldHRhLCBSb2JlcnRvIChleHQpIChESSBGQSBDVFIgSVBDIFBSQzIp
DQo+IDxyb2JlcnRvLmZvZ2xpZXR0YS5leHRAc2llbWVucy5jb20+DQo+IENjOiBrZXJuZWwtamFu
aXRvcnNAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHd3X211dGV4X2xv
Y2svaW50ZXJydXB0aWJsZSBHUEwtb25seSBleHBvcnRlZCB3L3dvDQo+IENPTkZJR19ERUJVR19M
T0NLX0FMTE9DDQo+IA0KPiBIaSBSb2JlcnRvLA0KPiANCj4gVGhvc2Ugd2VyZSBhZGRlZCBpbiAw
NDBhMGEzNzEwMDUgKCJtdXRleDogQWRkIHN1cHBvcnQgZm9yIHdvdW5kL3dhaXQgc3R5bGUNCj4g
bG9ja3MiKS4gIFRoZXJlIGlzIG5vIGRvY3VtZW50YXRpb24sIGJ1dCBpdCdzIHBvc3NpYmxlIGl0
IHdhcyBkb25lIGRlbGliZXJhdGVseQ0KPiBiZWNhdXNlIHdoZW4geW91IGhhdmUgZGVidWdnaW5n
IGVuYWJsZWQgdGhhdCdzIGxpbnV4IHNwZWNpZmljIGhlbmNlIHRoZSBHUEw/DQo+IA0KDQpUaGFu
a3MgRGFuLCBJIHJlY2VpdmVkIHlvdXIgbWFpbC4g8J+YiiwNCg0KQ2hlZXJzLCBSLQ0K
