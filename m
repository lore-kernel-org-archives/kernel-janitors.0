Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A096C19F2A
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 Aug 2022 06:48:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234955AbiHCGs1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Aug 2022 02:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbiHCGsZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Aug 2022 02:48:25 -0400
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10063.outbound.protection.outlook.com [40.107.1.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DDCE3BA
        for <kernel-janitors@vger.kernel.org>; Tue,  2 Aug 2022 23:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXEmDhTkpzXCPaDQn7nLt/OPxNIDlCQPWs0r4pu6FIwhoa8YvHglAWrjTly6+nYWz4s4ZvjrsLA2/4BVksCHcaILmkwKsE/XMSgosduAjZKgLkvIy9FCf5AREEJyHl65OXSfQU016qsqHnT09UrUN1OUoYMWYlbKD9xB8YtY2m4TSu7rdWQUOQBG2z0qsPXXDIS6KtL2fhCNGwiQ/fFAYeXWoJibo6LDVgNrw/X40vBMFDD+73WsYBRsfu+WV4fltUyTOAMiK5jvKrEmaYQ19GxlQ82YJCH7J/Q8+zFyGsyfFyxJbP+3c8HvVvmJlQkqrVKCct3CznT4etWgp/kOlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgAdNzlwozdxbhhieCYOJZqtXibIUlHAnckauEW0DjY=;
 b=ZwjSqaZIkbl35tvtl2RpbTErXOegfmCSBKfd4mTpxJ0J0nsMgKZ11wxyAnYONRFG3WcHAS7y0jUIdKWJpTcidvhk5zwYsphbpdUzUWcU5SpY7mz6GvDGAZFr58GKFbrOlRyS77SVbd3kXgWn55Ps9oyqj0t107zt58UmVOCdvPUbJjJVE+1tAfl2JqpYPaOVINIxwDxfo2g4HoLXWkfbhFLboo1G9ct8anqBoRJ5JBgJNg3RYh+cARye8Nx9FomZeRhnUmmDz8jqAAz1g9XjGvfZxamVOBzac8qJSFBsCrOwZ0gMGti7WSOVj7eb3yVIcOdemuwU+uy7y1qbfSWnxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgAdNzlwozdxbhhieCYOJZqtXibIUlHAnckauEW0DjY=;
 b=aHZZCM75/mXLVCAKXwxgCQ4b7FAEv5jURryn1vUFM7rEvXv/IYvG3aK7A/wbyxfnriT2B5XVkCFffygFIpD1WLrrcw/be6Xpr7mbxXuQt9cUIDrVCSvAydBvNH3fAM2rYmV8ZFkwTOfG4X+NZX8oumln2o+IKFT8W0t/SKzxrsH0vY6jx+uBObnlucVm7arReahCJTaSaZI+RdEO2Hr8FfZc4zEpYxpYVURUEWHTpw69M9gKBGzp1YzZOpDSh0STbYat0VIMkNdVLmvErKXkTZcdWtVoi4GTbMojp3WIgB8PAyCmWjJm4RBEQDYEJSlJr0dpvYVtK1Pml11MmPqJvw==
Received: from AM0PR10MB2020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:44::29)
 by AS1PR10MB5602.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 06:48:22 +0000
Received: from AM0PR10MB2020.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::86c:c394:f46d:5b88]) by AM0PR10MB2020.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::86c:c394:f46d:5b88%3]) with mapi id 15.20.5458.029; Wed, 3 Aug 2022
 06:48:22 +0000
From:   "Foglietta, Roberto" <roberto.foglietta.ext@siemens.com>
To:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: [PATCH]  ww_mutex_lock/interruptible GPL-only exported w/wo
 CONFIG_DEBUG_LOCK_ALLOC
Thread-Topic: [PATCH]  ww_mutex_lock/interruptible GPL-only exported w/wo
 CONFIG_DEBUG_LOCK_ALLOC
Thread-Index: AdinBIMJCYjkgF1ATYiQ6DWNQHxmxQ==
Date:   Wed, 3 Aug 2022 06:48:22 +0000
Message-ID: <AM0PR10MB20207EAFEC027FA5E3605306AA9C9@AM0PR10MB2020.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2022-08-03T06:48:19Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7b7fd9d5-90b6-422d-9849-14ce1b5b80d5;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e71da7e-90ce-4622-2a1c-08da751c2844
x-ms-traffictypediagnostic: AS1PR10MB5602:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IAvRZDqsgeNU50NRl96oj8o2I+x2cBljJo9We0p4yD6XACEVktbPuA2fZM9EJlPcMGpfuE76owZIUmM8OCR05LMFFseXSf/xJ9QuPyP0HIShwg4Q4F7XlUpUJH92QaWTzvoabm+sBV9/JHXGyRML/n7j9PBNGNMVO7NrqTnkfPrHG5YFaH1C/Z284sAjC/V8oxUTlElAiqcwYnbF5om/Q2mfyA9YncB6Z414pLtdt2x1Ewf7iOdQVQiKY3Xf8cy3IcXpJeOBfaGD8KiTL0CquQllGtOxCVG5xE2BwRFHLIkfQt2NSMw8SfSyokjabL+bd15MBL89B8EBCAQMkQDFBIYrg1xQZWnY0lIK7Hg44L+8oo2Xu3qwgDDdhn+eK0c+divRE9eURZumcqfYSZk5mKvnBZwBiknZGeQxVIXhjruHImCjHC1G0l2Smh0b1kMX9pO81yxAFCkk3tcpY/NCIHqeP/Tbj6QrKIo/V/ITTsJ/SbSa8NUpf8KXsI4J/vfALr/F0wto16v1ldO6TG4kAUC21b9FH1AaDy6Cbh4xpYu3pV6987yUHa7Vv4GQZoeS5o4G434TfifHH2uLfIhIzZE7uWoPI2uQEHej6nUGmNdQJryQi9sBsuU0Lu0nFp3bnjlyMdI2e2Zz3a7TQDi8pjttu4gvOKYIB5Iq9Im5sQQzl8OJsUAdcEm+r7LEtvVGkd0Wm7wW0yz4OUuRt+Da5YncdDLXXvF19/hqdozOkwtIXPeG7UEF7DeqNA4Klh1dFkOg1uXPzRqK/Ap8deK8bjgLgcJA9NSOHw6YX6VfAEAXFDTUsfA8uEGRfXOeS/4KlYy+ismLx+XgbeNS/QDYkQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2020.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(5660300002)(41300700001)(9686003)(55016003)(122000001)(4744005)(26005)(33656002)(2906002)(83380400001)(6506007)(55236004)(186003)(7696005)(8676002)(71200400001)(66556008)(66946007)(76116006)(64756008)(66446008)(66476007)(86362001)(316002)(478600001)(6916009)(99936003)(966005)(38100700002)(8936002)(52536014)(38070700005)(82960400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZzovW8owhH8NTHsuzvlXg8HmbjCIEHgHGj9EtcZnhRccs5N82kud5unImJuP?=
 =?us-ascii?Q?pe13ZkRKxF99FtJsPMk+uDk1B/A+xUk6twbVlgZ65WZFymNwo8rVCuN+Hcqv?=
 =?us-ascii?Q?Dn6uaflGs9Tl+muUTCwbxt7IWfj6KCvjRUfZqNECEIXwbQNoSkusydNy1Vur?=
 =?us-ascii?Q?XSJGimX0R3DkhohswjTwBC47Yy1AaAAwGZYsY4hqJs1BrQwep3BBrOp6yNML?=
 =?us-ascii?Q?myC/MeOcH78igZyjJIQJCDitW+uF0ZBu7t5Dttkq58UMDn/uvnMgs/c3jNn0?=
 =?us-ascii?Q?sI7tuxLccNXxzI6PrimpamwfYwW0I//FOdHFJDp7Afobp1Q5HkEnGF/yuqTR?=
 =?us-ascii?Q?vxdLvYkZNPt/vB/GK6JHcme4m2rfjcTEPhKjewwXwoN49lw+6YhP1VA38a+3?=
 =?us-ascii?Q?JtpF/LEGjTx0qHI+Mteu96WDWENHo8e+HgufwtL36s4akh62CEJ7rgraGWcm?=
 =?us-ascii?Q?f684Re7grYWnNzogBjd+C1GFVWiIhkXe+3DkO3liIzwpd4oXXgTZHnDFuM83?=
 =?us-ascii?Q?Ltn+MVG4d294e8L1go+I/UBmvzzsZ6TJDqP9Zv7jbNDL8xO1EcqWY1S7sjVz?=
 =?us-ascii?Q?o9F2UrZisnkFl3PChvGKafZUYwR4OwX0Hr2z/EJoi/02rEe/lUjECc1uOuOr?=
 =?us-ascii?Q?YdlZ5Gi0AYMD+9cyszQ4M8KXWz7ibbDLlj9Mific8rgd8pMF5sj6y6NA3pB0?=
 =?us-ascii?Q?uvhfj77hoYdZ5BQHSBC9LGmkl6lSRG8fUBICs21B62jUdURZK1cvshGRVNaQ?=
 =?us-ascii?Q?K2xOjzvqrX1iHVa6AUG6Jad3foZMW9u/tXI2QDmnecgRDbCAaveZnL6pla3v?=
 =?us-ascii?Q?nQJ4mvqc9nGGCYLlrUprjJlM+uaVqGYCjSho65lXUjqXcTF8Cl5oBFzyxGzn?=
 =?us-ascii?Q?0tmt4ddwQ5XHtvk51iJset51qHZBqcOPWYuA2RLbWRyCYj3aNwn60CUZUJCK?=
 =?us-ascii?Q?YwPl4VsOa6UnKiwQdC6wltdqxgy5Lk+7RbLg84+u54BF9Pefyd4U2+mwvKLI?=
 =?us-ascii?Q?pFQDkIQPWvV4MPN79K07XL5SMZcK8qxExq77gMR8ITQ2E9OUu6cn0Y/miBWZ?=
 =?us-ascii?Q?Yna3+gsXckufii+El8/xsEOPQTbnfiz7+mXn2lk9WlRFpwxe4gt3oyxuNHGn?=
 =?us-ascii?Q?/lQIY63vcxQ+W6PKJ2ysOQtPtrgNwoP6IdCv1Nj4r9uuiUTWHoNUq4NdV78n?=
 =?us-ascii?Q?0ntskDO0tC/eKpeFay62VvvA8MEck14pvrTCamd4CrzZMqZGVjO4tdD5WTUG?=
 =?us-ascii?Q?AYBeOLsVxmSGtu37kj5ms+lIqQeqKZG2ZMHnCRpX6AOSqTHbIH9SjbtC7fcY?=
 =?us-ascii?Q?eJPZzX4/RRQV5o4jrGc1Aq7GCSm9izChOeCQoSD7cpdAkB9GG8GCQdF5tDKp?=
 =?us-ascii?Q?9UYKC41KvZIoZsYpHp4hQUWp8DtIqty83d+vIbbyj8qchSVG/f1V34q3zhsF?=
 =?us-ascii?Q?JPcL78DcBAY8wTf6ZLoSRO7H9dTMfFn8vnTu2OAaCruombhX9Yid9pRugNsV?=
 =?us-ascii?Q?WBuzg45r2IDEyvl0c0pyygvoN2HlvKgwVdxlX5IaIL6Qcn8b1lMu3Oxs6KC7?=
 =?us-ascii?Q?jkSKLfX3wSCQW21EWwj/edjWEfKOiFZYBWWNFBS3hAp5zV8Cp0VyBNMGmSle?=
 =?us-ascii?Q?XiEkDfwjvLPo0CJwRWhjr0M=3D?=
Content-Type: multipart/mixed;
        boundary="_002_AM0PR10MB20207EAFEC027FA5E3605306AA9C9AM0PR10MB2020EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2020.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e71da7e-90ce-4622-2a1c-08da751c2844
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2022 06:48:22.0967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CjqR4EngFSMpaTmqK2vWx3vWiIlU3f0XxzDok2Sc76H9oXXOADSblHxeEy3016CnftvXw/QLowrm5JB2sLcgKMMTEdTvPXf46/qMSHjKfeEzE49VDdcL9vtK69rBoB4v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5602
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

--_002_AM0PR10MB20207EAFEC027FA5E3605306AA9C9AM0PR10MB2020EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

 In attachment a patch to fix a symbol exportation mismatch

 ** Rationale **

 When CONFIG_DEBUG_LOCK_ALLOC is defined two symbols are exported as GPL-on=
ly otherwise public.

 https://elixir.bootlin.com/linux/v5.10.104/source/kernel/locking/mutex.c#L=
1191

 https://elixir.bootlin.com/linux/v5.10.104/source/kernel/locking/mutex.c#L=
1434

 Cheers,
--
Roberto A. Foglietta
GNU/Linux Senior Consultant
+49.176.274.75.661
+39.349.33.30.697


--_002_AM0PR10MB20207EAFEC027FA5E3605306AA9C9AM0PR10MB2020EURP_
Content-Type: application/octet-stream;
	name="0001-ww_mutex_lock-interruptible-GPL-only-exported-w-wo-C.patch"
Content-Description:
 0001-ww_mutex_lock-interruptible-GPL-only-exported-w-wo-C.patch
Content-Disposition: attachment;
	filename="0001-ww_mutex_lock-interruptible-GPL-only-exported-w-wo-C.patch";
	size=1218; creation-date="Wed, 03 Aug 2022 06:45:36 GMT";
	modification-date="Wed, 03 Aug 2022 06:48:21 GMT"
Content-Transfer-Encoding: base64

RnJvbSAyNjBjMjA3ZWFhMGRmZjNjMmNiMWYxOTY3NWQ0OGQwOGZhMTg2NDU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiUm9iZXJ0byBBLiBGb2dsaWV0dGEiIDxyb2JlcnRvLmZvZ2xp
ZXR0YUBnbWFpbC5jb20+CkRhdGU6IFdlZCwgMyBBdWcgMjAyMiAwODoxOTozOCArMDIwMApTdWJq
ZWN0OiBbUEFUQ0hdIHd3X211dGV4X2xvY2svaW50ZXJydXB0aWJsZSBHUEwtb25seSBleHBvcnRl
ZCB3L3dvCiBDT05GSUdfREVCVUdfTE9DS19BTExPQwoKU2lnbmVkLW9mZi1ieTogUm9iZXJ0byBB
LiBGb2dsaWV0dGEgPHJvYmVydG8uZm9nbGlldHRhQGdtYWlsLmNvbT4KLS0tCiBrZXJuZWwvbG9j
a2luZy9tdXRleC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2tlcm5lbC9sb2NraW5nL211dGV4LmMgYi9rZXJu
ZWwvbG9ja2luZy9tdXRleC5jCmluZGV4IGQ5NzNmZTYwNDFiZi4uYWU4NTQ2ZTQ3MGU1IDEwMDY0
NAotLS0gYS9rZXJuZWwvbG9ja2luZy9tdXRleC5jCisrKyBiL2tlcm5lbC9sb2NraW5nL211dGV4
LmMKQEAgLTExMDYsNyArMTEwNiw3IEBAIHd3X211dGV4X2xvY2soc3RydWN0IHd3X211dGV4ICps
b2NrLCBzdHJ1Y3Qgd3dfYWNxdWlyZV9jdHggKmN0eCkKIAogCXJldHVybiBfX3d3X211dGV4X2xv
Y2tfc2xvd3BhdGgobG9jaywgY3R4KTsKIH0KLUVYUE9SVF9TWU1CT0wod3dfbXV0ZXhfbG9jayk7
CitFWFBPUlRfU1lNQk9MX0dQTCh3d19tdXRleF9sb2NrKTsKIAogaW50IF9fc2NoZWQKIHd3X211
dGV4X2xvY2tfaW50ZXJydXB0aWJsZShzdHJ1Y3Qgd3dfbXV0ZXggKmxvY2ssIHN0cnVjdCB3d19h
Y3F1aXJlX2N0eCAqY3R4KQpAQCAtMTEyMSw3ICsxMTIxLDcgQEAgd3dfbXV0ZXhfbG9ja19pbnRl
cnJ1cHRpYmxlKHN0cnVjdCB3d19tdXRleCAqbG9jaywgc3RydWN0IHd3X2FjcXVpcmVfY3R4ICpj
dHgpCiAKIAlyZXR1cm4gX193d19tdXRleF9sb2NrX2ludGVycnVwdGlibGVfc2xvd3BhdGgobG9j
aywgY3R4KTsKIH0KLUVYUE9SVF9TWU1CT0wod3dfbXV0ZXhfbG9ja19pbnRlcnJ1cHRpYmxlKTsK
K0VYUE9SVF9TWU1CT0xfR1BMKHd3X211dGV4X2xvY2tfaW50ZXJydXB0aWJsZSk7CiAKICNlbmRp
ZiAvKiAhQ09ORklHX0RFQlVHX0xPQ0tfQUxMT0MgKi8KICNlbmRpZiAvKiAhQ09ORklHX1BSRUVN
UFRfUlQgKi8KLS0gCjIuMjUuMQoK

--_002_AM0PR10MB20207EAFEC027FA5E3605306AA9C9AM0PR10MB2020EURP_--
