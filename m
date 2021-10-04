Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5725DC433F5
	for <kernel-janitors@archiver.kernel.org>; Mon,  4 Oct 2021 10:36:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C988613A8
	for <kernel-janitors@archiver.kernel.org>; Mon,  4 Oct 2021 10:36:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbhJDKig (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 4 Oct 2021 06:38:36 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:16856 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229545AbhJDKie (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 4 Oct 2021 06:38:34 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1949ZUDl009369;
        Mon, 4 Oct 2021 10:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Kr1a+k8Ed417Y1NgG2rOtg90PXM4ajqsT6MP5LIJCAw=;
 b=GprgZ3BGX1irbHdA798/rMj4pdBdvbjog+7vVvQ1Sdjl46WmCKx4uKYlUA0WNU0m0uxS
 IguvmDO31gOUOlA9pZluWxGZ+gd5JVrycDLnCFaw6I/7SJZ4ocEnIZRsJoFc648btu1i
 DRYw/hcUQilqgMaNgj6oTb38uqSsIi8imG33uyRBI0RLhrciJms4GMtM3m7bnjo2oPD9
 w7ExoWwqZMYkm8rlKFxD0jJllcizfwY2B2hFply3MLZM35hY4nAzzcgJwtYLX0JMDbD5
 WxIkeW9QAoj5xBzbfHeJovMMTLwzUDjI3rMj8EzVaSEHyXZ6jdFbxr7npCqMPVJZQ+hN cQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bfbatu46e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 04 Oct 2021 10:36:44 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 194ATqwa183054;
        Mon, 4 Oct 2021 10:36:42 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
        by aserp3030.oracle.com with ESMTP id 3bev7rfwss-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 04 Oct 2021 10:36:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtKu4i9XsAxRXEPSwKHA81uRWmJkdAzdANr2I+5j6BDS7vs+o2hWAArr0FkRElJkiAKR8qc4tC+zY1lYCTiVToKS5P9Jp3vqCq9/o0bry4/I1fQcnZ91EcYsoqFzT7kaKk1SROMXfpsh8gChPPZP0kKQeq6nD52nKJIySSqWi8fE2NnrLwqEO5kKfMUq8wlAm0NGgI/T7RoN8pbVOAOz2Pk/hwLqrDMAbLWUSF6pI5cIyfmsn6piRmZzaNlyyVaSjn73rhPlmVyDa57pV16fQTfLL2cHnhbuC6QS0UhPtpfdxQc2U8GHfnAKFCqT5Im3ucSmPF+g49iPJ9y1c1qLwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kr1a+k8Ed417Y1NgG2rOtg90PXM4ajqsT6MP5LIJCAw=;
 b=e2Qd6gxNegUYWpBBAFvfQjL5LHed3grXYFDs3RCWfZqr6gNegkmra7jPcjD4bnYXzCm5d5c8YWv1STT3StsIqG+TfucRJ7ZIeGgrOEB3oSSxBDJQT+7JcgJLyjpWK0vVBnO2rjPNLfPnQ89fURX/Ki+vWE2zjZ/j6M0iBTb/k2LCCVMEeLYB96PpT/Yp5W/q/Uu7dStSTgjhJhGD23zghzMTZckXC3NcDJe0d6ivIrarlj+9pMFx7OPxYmtaHlirYufNH+sKfRH3rsnjBzvbEhmg3yVbUBD28qF46wEXHKidZRL1V9YHEk/wDCZSxwqKEuabWtMBe3cM0wjsRD0nUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kr1a+k8Ed417Y1NgG2rOtg90PXM4ajqsT6MP5LIJCAw=;
 b=OrQJjxMlR+uUQL7MwyUthKyGPtnUyz3/n8pnESWw3DxZRr+P4O57myRfTwxe2ZlSYKkcDfm+ZtqtkxB+UOEWLTRihkmSXlYoMsS4wChN569urVUoXtfGtgpMajG0q8f+ASronpke11SLZzSzvTfKIkNwYjElKIBEou1Un0PdFzQ=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4484.namprd10.prod.outlook.com
 (2603:10b6:303:90::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Mon, 4 Oct
 2021 10:36:41 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 10:36:40 +0000
Date:   Mon, 4 Oct 2021 13:36:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     shjy180909@gmail.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: ipv6: check return value of rhashtable_init
Message-ID: <20211004103630.GA25015@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: AS8PR04CA0181.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::6) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by AS8PR04CA0181.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend Transport; Mon, 4 Oct 2021 10:36:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2f8799d-a532-44fe-da28-08d98722d9fc
X-MS-TrafficTypeDiagnostic: CO1PR10MB4484:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB448440EB9FD80157FD05D9288EAE9@CO1PR10MB4484.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lA8IBVBlfbz4MeRMcx+RK8aB7zJdRsRDTy7VRUziezInN3CmCIRTqd0g23xXD3p9QMhDClHx5q8CU+3LMZtq8pQ5NyxUiuPfMfrwJ2VWOdzGAXLigiljQyzN9Af9sUa8+i9XZDhI8JnSuk0Ij/oUSC6/Pt925c+FTiBBJiVvOWq9d23V2V6XUKJwFkNTikHvG+bbP/Wgq3urXVgcWbNJsVJR3R0qwIwpmS1Ty1TMVHyElgX4NIg4axyWGYfPBdh0dEIAWJLNHlVvwuQYEEkJ3dpdCZN4RmwB2na6tRL/zC5pNzXwBFaWRdlLLCb9WYNBv1//UPekeaHI0JfOKaUHqWwLqL9aty8GTWAYFashj7AVFxFnmcZEZrcaST5z2LN3MqQLqgHz7CeaDoH/DmCu2xCKhaYCYaLt+RCzjAQqmibSQQFyWBgaXaiat//mUGoR1WqACP2gwJjEF5s/iaZztxVyPEq15KMd/0I4fu6gRapu6rhw1lhrQ5crme5yBCdjFCThg192ygqP7mhwcLbE3AnJkl6Fhk2399GYnbZ+zdSDmusJQMIwt5avgbTkuvmTEX/RNfuGRLJIX7WgRmc7ULQqgdd+I9+YXbtxWO/vOW0fsJb2ad9UfuCYmMcD6NVzPrz8oBbdFpinbNZUT0BUxmazn0wqqGECZjCHwsjnwqtOoedqK3hkbA48TP7m5HN3+h1G1XtiqEqnZF1Y38WgiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(956004)(6916009)(26005)(9576002)(1076003)(66476007)(44832011)(33656002)(66946007)(2906002)(33716001)(86362001)(316002)(4744005)(8936002)(6496006)(4326008)(508600001)(52116002)(38100700002)(83380400001)(5660300002)(186003)(8676002)(9686003)(55016002)(38350700002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pptBnmprqk/FKwxwdYlKuOIyoiibxh3SjzR0wQ3NvyXUEDOq3+zza4PKIkdI?=
 =?us-ascii?Q?qEjrkJII/Flk9xkakTg1KBDIXzA4MXvu6ipGgPG7j0zqfZqQfj8y+xf3HmG+?=
 =?us-ascii?Q?1xBBe0dwT0b5uLwMLTUkEZ0LPrK1uE6Zb/ZYKWVa8mjAykeikff8HXidY2X5?=
 =?us-ascii?Q?iuoXdm25kK3nqwN1GNarw0gJGPLJibWpQqCx5lQOZtY094qoBm/wdI8m2uud?=
 =?us-ascii?Q?tj2uZOh1xoIRdi3cYVwBYtQMujjwPn0XyeuyJ1v70Q8F0XeZ7c+KqlUXV/rw?=
 =?us-ascii?Q?T6z5k3f6TcWmM+dtjG/ih7Y2NfGJGB2JsnKpzmNY4ZH1D1bvB66jcKggzFow?=
 =?us-ascii?Q?jD7QCa2QEXbcbptYsDR2GV3eOEu0Xaz1JCFXrlCiLD+kYvyOrCRL7k6a9L6t?=
 =?us-ascii?Q?0KKRODjBECPAfKqpqj1r3smQxEjgdrSLcQo6IVuy7BqvMynP54ggftIyfHHp?=
 =?us-ascii?Q?D8qod8gLdZk9kKfIJniIUIZMYQTTZ8AMPqVXoD3UtuUjNB/4S+o9weNzEX23?=
 =?us-ascii?Q?vqrKBBW1N1qrAkpyZiZ+Y+xQq3BJ4wz2RRGhXvJxj9WqUwycHkYwDGe3pgLe?=
 =?us-ascii?Q?QW7tKE3SZS1q5Ffthd2vAVAxMleQ8bZGE76CSONA0DCFCKXWU7+R5kXHRYoX?=
 =?us-ascii?Q?kuuxXJzXbulhzUnSNfPL8l9gQqvIiJCX+wpbn2pzKPV8Syw6CucRBtoamCOS?=
 =?us-ascii?Q?JDFgWE9pMVALniyJClF7N/RhQ52gLe1qor+4EIARafZrnQbSOJ2R0dRCb9b6?=
 =?us-ascii?Q?5H5ase3sAdcj4PP5pKsTlM7jhWJqhIhhRp+/HJ+6VNo69gVmmz9W32h+T6r9?=
 =?us-ascii?Q?rqul6y7qpPWJPC5Cnd4XcF/HS/8kIGPGV0T/SOq7RblZCe9XGWJwLQWp64NG?=
 =?us-ascii?Q?8mcYhztonZpIoQg0WRd6i0UGjtKPlV3jPvt84aiSoO5FCMHSCNyPr+GMucxh?=
 =?us-ascii?Q?OXnOAVVFRmuOCQsnnZZrVqZnsJ/uhpc7NrJ7RDYKflpdhjF+Yp2pdKjt29CS?=
 =?us-ascii?Q?LsbIzNzhFIGZcp1r7uh+tJswBlQKibGYc87ZQbpDhxdrgIMWcFjKizuBZRcP?=
 =?us-ascii?Q?8Ufh4vsFVNI3jlo+6M8hXcBXFCXo6bG73P1CitSxUHoCjP0CDqTLDvKpg0h0?=
 =?us-ascii?Q?TSx17ewDPGQkExKEAr/ppwRFUiesc1HYQGXnNiH/x8TA6x151UT16VOPgUdX?=
 =?us-ascii?Q?4DtPxj6jc/wAUUH7sFmkqKl+lbXkT9GGW4uWJUC9QB+CDDYI8LrQcLqV74aX?=
 =?us-ascii?Q?bQGx3ZRoHFlZn0JutZaAELHeAO1y/I9qFGbldahEfthK0tudDuzHPbAvJDM5?=
 =?us-ascii?Q?1czVnNNO9IdCXSAHkjOQRP1V?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f8799d-a532-44fe-da28-08d98722d9fc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 10:36:40.6649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpDGTpIY9WeRgj9Tj6uqp3/jsFMAwv4a47BcJ0cguVidKxb5dbdofOyoya/HoDfj4XnSEG58vnWKmu74ebymgEpjtikuhDSwyI+N/BsJ2x0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4484
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10126 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=831 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110040072
X-Proofpoint-ORIG-GUID: Yuc_1r6pU27T9FqAn8h2mE5mtIQ782Ez
X-Proofpoint-GUID: Yuc_1r6pU27T9FqAn8h2mE5mtIQ782Ez
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello MichelleJin,

The patch f04ed7d277e8: "net: ipv6: check return value of
rhashtable_init" from Sep 27, 2021, leads to the following
Smatch static checker warning:

	net/ipv6/seg6.c:379 seg6_net_init()
	warn: 'sdata' was already freed.

net/ipv6/seg6.c
    358 static int __net_init seg6_net_init(struct net *net)
    359 {
    360         struct seg6_pernet_data *sdata;
    361 
    362         sdata = kzalloc(sizeof(*sdata), GFP_KERNEL);
    363         if (!sdata)
    364                 return -ENOMEM;
    365 
    366         mutex_init(&sdata->lock);
    367 
    368         sdata->tun_src = kzalloc(sizeof(*sdata->tun_src), GFP_KERNEL);
    369         if (!sdata->tun_src) {
    370                 kfree(sdata);
    371                 return -ENOMEM;
    372         }
    373 
    374         net->ipv6.seg6_data = sdata;
    375 
    376 #ifdef CONFIG_IPV6_SEG6_HMAC
    377         if (seg6_hmac_net_init(net)) {
    378                 kfree(sdata);
--> 379                 kfree(rcu_dereference_raw(sdata->tun_src));
    380                 return -ENOMEM;
    381         };
    382 #endif
    383 
    384         return 0;
    385 }

regards,
dan carpenter
