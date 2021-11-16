Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A8C8C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Nov 2021 06:38:17 +0000 (UTC)
X-Greylist: delayed 72 seconds by postgrey-1.37 at mail.kernel.org; Tue, 16 Nov 2021 06:38:17 UTC
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F7E16321A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=vger.kernel.org
Received: from vger.kernel.org (unknown [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F7E16321A
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Nov 2021 06:38:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234237AbhKPGj4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 16 Nov 2021 01:39:56 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:37068 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233322AbhKPGiC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 Nov 2021 01:38:02 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AG4unuY029754;
        Tue, 16 Nov 2021 06:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=7047HDWpyL9V/rVLgMhE6Wq70wr4IozQ57eXq517veE=;
 b=lbTRBRzvTO4Ynn/Q1TkjsZ9lmf3S8dGeTLiAchT/uHDgbGHiCLm90x2MUt+VidaVauTg
 3TN+m22c8zJ1Lwcsloe5s6hiFpjMccJ3tiDrtSc7e76Yj+i9eTDvsiiTR2MxzYsC68rm
 7CEgeZLh4CNowVYM3f8RV6ciEP5oWav08S9OveVIZPZI9/Zth/sge47i18jG6coiIain
 4AAm5EOIjGzVREsJMvviCHvaX84s+wkshQZdUF5bABY/uN6yI92X4Mh8ngHAtfOwxe0H
 qdKQoOk6nXOXPYUI2fdJo3oOnVIlrersYJDTonG9FzxL8VCHj9clkBUGHerEIdyELdqN TA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cbhmnqjj3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 16 Nov 2021 06:34:56 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AG6P1ob105975;
        Tue, 16 Nov 2021 06:34:55 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
        by userp3020.oracle.com with ESMTP id 3caq4s69pk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 16 Nov 2021 06:34:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULVBWi/kgVTbDGLHc7H69wIHPGHtaOiW5yp1mztH/PGzyK1ep+iwwNVaglhrC6sCaHm/k+ioB9+pcvrFGf1OVCQJVTqEju6TT+78Ht66nNVjRbLwz0VN8YGWNTxg0qFeDw5k/jBk/4jZGnrydfpyb5q9jPivrKtKFQ1otqzNmhs06UlnHomJfQiNLcaOFhif3RjaKOXjADPnom3tGIAJUwkbUgrXsc9BKiEB/3t+QLFpKTevBxq9E/6ijEZRZsH7cMmEOfFgiCWnV11oDPEcAPksG7vbL1HCfKyIRe60vpk7RPLtipodoXNzq/Y08cpvmnq9iGl9Rd565cfXieqUng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7047HDWpyL9V/rVLgMhE6Wq70wr4IozQ57eXq517veE=;
 b=DxFtI8eHxkPr7tn5Hy79uc1ZtFuxnO7D04OKsMpC3O9/mbg9frQkeonVv6t4Dej76I7zxe6iR2B/K0bsSvD6EQ0jgQd9fpXRM8nW/KHU5TVhWCQ3L7jFLQCxndfU/bSvpvLjuATmeoJUkzmIE5NnxfAZPESHlK4sUPL5G/GpGxiPPtYzQrxQE0Ms2HacCvgK3OCy19v3NUrb76+FTtI4q9+ZU4BL/O0mWjDqQYMpnjM4iGDmCJeFFdvO+9q96OOb7KZMh2iPWkXpnpv/jv7SgJQc4pj6Q5ts1wgC28c9JjrHtzBLHVgNIuK4BjoEFbvot5bPjrgBIREYPlWhq4XPSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7047HDWpyL9V/rVLgMhE6Wq70wr4IozQ57eXq517veE=;
 b=Y1NckBiDLLIAb3n06b6VrwLhus318my9HehcLDJLoZCK4AGRmuNdO8ifT22KOUbEBSwfPU01LDnA5iBaGeaCnHIUQ3DYaKTR9aKxT4NxhUGhftfM8CZDr4uvUAJjnonpnYCGnzoq1H7pDoLeSRQ35VcrDX3RbuvSKbdWGyRiSdU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4546.namprd10.prod.outlook.com
 (2603:10b6:303:6e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Tue, 16 Nov
 2021 06:34:53 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Tue, 16 Nov 2021
 06:34:53 +0000
Date:   Tue, 16 Nov 2021 09:34:35 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] net: ax88796c: ASIX AX88796C SPI Ethernet Adapter
 Driver
Message-ID: <20211116063435.GG26989@kadam>
References: <20211112123648.GA21129@kili>
 <CGME20211116004339eucas1p14e377393256e09c0e04e3da92ad0accb@eucas1p1.samsung.com>
 <dleftj35nxhqvn.fsf%l.stelmach@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dleftj35nxhqvn.fsf%l.stelmach@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0029.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::17)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JN2P275CA0029.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25 via Frontend Transport; Tue, 16 Nov 2021 06:34:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa8062e8-a749-44e5-3592-08d9a8cb324f
X-MS-TrafficTypeDiagnostic: CO1PR10MB4546:
X-Microsoft-Antispam-PRVS: <CO1PR10MB45466CA863441E27FCBF6D268E999@CO1PR10MB4546.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1LiW9B/HRP3CaJgNgl077Gjvc80zVomShWkOoJxPWazkSiuVntbGaJxuErPJokCUUMu5024nQ7a4za0hRtmSRTUEl3p32jaU6M0wKN8aD5HX0ZU/0UZjhMgu4UFqfzMEtamei1G0o5204tLhAqHhlDKLq6W8UHYYJhSX2IZPX16y52Z3lI2RL65/WasyCPPXRs5R15/ybu7WDRJnhV3d5JJpghrYMm4lY7hOaY3gMVuMD0vb2i+mgrE6W849hZdvyNYpKz5kwLg7ytf0ceX72uy+FF7ixCO0LzSXa9235Wvp5pXR2RSo+RPLxKeUj6fMic5BqAzTdvGGlTmkHXVFbOCXxbn2ryUHBvXzUfp0QdNhMJ/AJ7XC677Q7UDkrCfqtgkzasOofuuspac13pDR96LIhfD+kn1MNg7Pij4S5Pzx5JeBrmxRp/uiHVaMCYKUj1Ic57MFsO0OQsdyiJH4YhOOFi3Wq3Bcfh/FK0aeEQz8vb2Rh7sXb54VNsaCZaoCXl2oFlv6DAr6uS2gFsLOo8zbFWpRZmrSridaj1EUnQqmT4nkYL0ZnhwLCb4lKiFp5vE2CI1dltAbgiBSEqNuf2al5rkz3vXKGQJhDKZLKOvMxCtonPMrJKIURAdKTJoQAyD2KdN/ICQ2Gpas/Hn4VxPNzCztBc0BEp0whMl29JJKVpiIcmZKjydZzlYHHv8CVz7YLwLCkkD5sSEj5p0fqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(52116002)(6496006)(4001150100001)(8936002)(9686003)(8676002)(6666004)(55016002)(66476007)(66946007)(9576002)(38100700002)(956004)(66556008)(33656002)(38350700002)(186003)(86362001)(508600001)(44832011)(2906002)(1076003)(316002)(26005)(33716001)(83380400001)(5660300002)(66574015)(4326008)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTdxT1ZzSGwwbXRXL0NaL09IZk1wQ3lkTEY2aWJ3VytxamwwbGEwcjhMKyt5?=
 =?utf-8?B?b1dCUWdjc3dDendEejZaaVVWODdXTERraTRua0JCSVB5RXozd05qcEhQMUF2?=
 =?utf-8?B?c2t5bytPd2xmdHdCOGZzaGs4amprdml4bzVocFFET0N5WW1XOTNuTFpoWkNC?=
 =?utf-8?B?c3BkTHNLcWlpU2VlaDM4VWgvL3ZtT0d5RUdzQXZDZW9Vc2hXaDhESm5nQkYy?=
 =?utf-8?B?czU0WjFNYUp0c3hLVTRjSlljcFVzbFhScld0clBGNC9VaWZ2NUphMjF3Z2wv?=
 =?utf-8?B?V3YvdHhpWmgrQk5VeHFPeVkxY0phMG9nNytXUi9DWmpHbHh5REd0TWIrcVlQ?=
 =?utf-8?B?QUFuSFJpY0cweXRmdkFKQXZWVEIzS0FiUmQ3RFQ4TGhORmxNS0lJeDdvZ0pS?=
 =?utf-8?B?Q0RrV2FBVHFiaEYxeWl4cUI1d016anJrLzhKT0t2RUlqVXBNM3FGU1JyTTdl?=
 =?utf-8?B?cHhDL3pyV1Ewd3ZSYWdKWE5RUGRXYnZiS3UrU3N3VWxOTnVUMUpkSUxOMEhZ?=
 =?utf-8?B?cG9vSzRXMW8rb2R5endRYmNnN2JhbUJFcTZEamU3NXo5NzdsZVNKeGVseGYy?=
 =?utf-8?B?cnZIVG1Scnh6K1hEbFRUV3Z5YVFpcmp3YWhBd25RaHlJUVFYenl4QjRJRDVF?=
 =?utf-8?B?eUZObFB4Qll6c0doL2VnSjM1TUU2MTBQSjFPUU5MNS9mODV0WGpVVFBQNElj?=
 =?utf-8?B?WWN4MWFDdnpsNUc3bGR2bEFvaTROb2VoR3F5aDU4YVFsNWw1ZUFHaWN3ci8v?=
 =?utf-8?B?S0gvSXY1aU5DSThEM1Q4eGJuVW9iRm5PYUF1bi9RL0lNWCtpTVlHKzRHaDRm?=
 =?utf-8?B?eWZwMmhaNElucEx0UjZxMy84K2ROcGZjNXI4MkwvL0JUTEJqWnI3azhqMXIz?=
 =?utf-8?B?V3hxUDZKK1dJVDN6V3FHb2ZkU2tKbnJ6T1UrK3ZkdFBCa09jbDZuL2RUOERZ?=
 =?utf-8?B?Q3VKRHBnOFVFZjd6VEhFOWxLZS9nT1JyenFLY2JiSGx5S2NNSTV1VXhERUFp?=
 =?utf-8?B?TXI3WFRHOHo4UzNZTTZhMFMyMHNrc3NFRlBJTm9mWFBocWI0b0NMMXVidkl5?=
 =?utf-8?B?cW8wME9FeGM4Q1kzM29LQnV2TGo3NkQwSEpYSUpmNWU4aGdZWCtsTnlaclhl?=
 =?utf-8?B?cWdDYU9Fc1BHNDYxL2hRSERMZ1hBUGdDNUI3QndSTDg3VGFUQUlQTkJpSnll?=
 =?utf-8?B?ZmlEWVJDYmdSQkl1MUlPbTNuU2hqWU4vcGdpWW4wT0wxL1doRnF6N0xoYmY5?=
 =?utf-8?B?Nkd1QkdyV3JMRHF6a09YNnozeVpTajNrRG1HTXhsV2pjbnpGOEhxRk5EWXJC?=
 =?utf-8?B?Y3pPOVptekVobjhRbTNUbkNHQnFBTnRYcXdlSnVKQ0F1UlpxNXlpS3NCOHZP?=
 =?utf-8?B?TWpwUFY5NGdMakVPL2Y3RVhBQ0tGTzNzSUR0YVdUWExadGNrbm1mblhYMGhS?=
 =?utf-8?B?dUkwSE4xbkRJRUFSQmZXVTc0NzJDU2RWdnhxMXVJbUtIdlYxOTdBdmc1V1Rs?=
 =?utf-8?B?RGs3ckQzNW1XZUxOaTZmRzlZTlYzQ3QwSFpSUzF0Mjc0WlhocE5iczBwN2ly?=
 =?utf-8?B?dGdqTlk4U2MyR2xUZkM0SEt1N29sL2QxNm9lYVU1THlyQTcxNHR0eHlndy8y?=
 =?utf-8?B?cy9WR3hDaFBWTTRzQVJTVE5KeWFJYWpzWXdneHlJMXVsS0F5ZkJRQmVrQTRJ?=
 =?utf-8?B?cGtGcGd0cGwxV1BQSzRmMkhQeDFhdnlqWnFBSk1VL0thbVZKdE0vOFpjdUtp?=
 =?utf-8?B?dHo3dDljbUhPMUpSK0g2R2I5Nmh0UnhxT2V2eDc0V2taRFhuaUVUK2lQYkxv?=
 =?utf-8?B?bWZWS2l0REFHUDB2RHF4Yk5lb2dmSlpBWmw4WXhSZGNWRDRSRzdMaGlHOVd5?=
 =?utf-8?B?d3hPbEltTUh3RDhTUFVreEZ4NytVT0huTXNKNFMyQ3I4VUFPeUYzZENrSk9V?=
 =?utf-8?B?SHdGWHJHYmQwVmcra2oyQmxqMHJlTi9PMG5zNzlBeU85d2U3ZDB1VitHZDBr?=
 =?utf-8?B?V1hGd1F4d1RUNVRmREVaajZZVmdvSHJPRmhleUdZSkoxMDlGNmhvdEhFZUJ6?=
 =?utf-8?B?ci9ONXU2cDU4ME1jYXh2K2F3S21BU2diOEVDRFVCYjg0K0xKS1Z4c0lLNVZ0?=
 =?utf-8?B?UTR2MEh2VVZWQjg5WXBJOHdJanJGdWZTZGhnUnZTOW5tSm9QOWc4YlpQNmlQ?=
 =?utf-8?B?dnhsZVhKdVY2NUdNMkEreis0L0VEY2dhV0NkbUhjaWErb2FPbWliM0JtVWMv?=
 =?utf-8?Q?Q8FwfXcl0Yk0gm2w+Q1PD4zHC6UxohAlncTTPQt3XQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8062e8-a749-44e5-3592-08d9a8cb324f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 06:34:53.0052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+Z2EZ4czggKocIK1CRWHJt8oJSgFQUenU6bd/DS4MMEOCIXnAMw1K+XgqW+cHTf/PUKZoXvGTwNee1pN1C8RrAEqj97DsQzC/3qHlMEf2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4546
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10169 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=977 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111160034
X-Proofpoint-ORIG-GUID: wAtA2bEh9hQQvzwMi1fcjy5GjU-j-q12
X-Proofpoint-GUID: wAtA2bEh9hQQvzwMi1fcjy5GjU-j-q12
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Nov 16, 2021 at 01:43:24AM +0100, Lukasz Stelmach wrote:
> It was <2021-11-12 pią 15:36>, when Dan Carpenter wrote:
> > Hello Łukasz Stelmach,
> >
> > The patch a97c69ba4f30: "net: ax88796c: ASIX AX88796C SPI Ethernet
> > Adapter Driver" from Oct 20, 2021, leads to the following Smatch
> > static checker warning:
> >
> > 	drivers/net/ethernet/asix/ax88796c_main.c:391 ax88796c_start_xmit()
> > 	warn: test_bit() takes a bit number
> >
> > drivers/net/ethernet/asix/ax88796c_main.c
> >     382 static int
> >     383 ax88796c_start_xmit(struct sk_buff *skb, struct net_device *ndev)
> >     384 {
> >     385         struct ax88796c_device *ax_local = to_ax88796c_device(ndev);
> >     386 
> >     387         skb_queue_tail(&ax_local->tx_wait_q, skb);
> >     388         if (skb_queue_len(&ax_local->tx_wait_q) > TX_QUEUE_HIGH_WATER)
> >     389                 netif_stop_queue(ndev);
> >     390 
> > --> 391         set_bit(EVENT_TX, &ax_local->flags);
> >
> > EVENT_TX is BIT(1) so this ends up being a double BIT(BIT(1));.  Which
> > is fine because it seems to be done consistently.  But probably it
> > should be:
> >
> > #define EVENT_INTR		0
> > #define EVENT_TX		1
> > #define EVENT_SET_MULTI		2
> >
> 
> Apparently this is a porting artifact. Originally these were defined as
> {1,2,4}[1] so I changed that to BIT(x) without much
> consideration. I am fixing it. Thanks for reporting.

Changing it back to 1,2,4 will hide bug from the Smatch but the correct
values are 0,1,2.

regards,
dan carpenter

