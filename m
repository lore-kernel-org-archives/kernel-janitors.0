Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A816EC432BE
	for <kernel-janitors@archiver.kernel.org>; Tue, 31 Aug 2021 09:03:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8839661027
	for <kernel-janitors@archiver.kernel.org>; Tue, 31 Aug 2021 09:03:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240464AbhHaJEe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 31 Aug 2021 05:04:34 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:55724 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240593AbhHaJEU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 31 Aug 2021 05:04:20 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17V8rCsG013862;
        Tue, 31 Aug 2021 09:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=NwpIdvf/6v72OpUMgfaCy1YxzLy+ulfoGEr7cMPHnaw=;
 b=NQ8MpPmHV5Zm0m9kvXpY41RMBhAZbHE6enGPzGoyxyq711yaLawQRLsn6FtWFqI4Zb85
 WfDDMSILw7ZwHc7hLZ6oJ7dIZYFKAo6ok1yhujn5l3bQdYiCE5PP6hCZeEnaBAvCs9ht
 sjo5RHRbEM2xG1tyZWPsBD6ZpLTSeg43C/6n1cKck4f63q0+cudzEWRnAHWXRt0FwH2S
 Qx+huSdeHPA1zu6zzYFFv+2rgKVAsq1hvOqx0JUHkBOUmKy1Qt6rB50b5PwKTxNaI9As
 XxgSlfQiqh93fC+2PNlTom//bG749CDdIOX641pPZ0D4ETR0LIxPtOCW/iOxYLpa34L0 iQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=NwpIdvf/6v72OpUMgfaCy1YxzLy+ulfoGEr7cMPHnaw=;
 b=loMnyfJ9mk/uegpdKTjNufrmNaPKlxQO2aHYyyWdmbhP4ezshCiE/nWnAyy6o44x5EPh
 cy6xiJnkDQVi2ud75QKg2zKQHKI1VVhlAxXHdiID1cZxm8ChE/1IPHY3KNZiwR6vKZ6O
 E7Wdy3orBZUNqzs1mj9rKm+WIJ/db+hItXSdA0lPzwc2D2H334a31ElfGgX3t7CkaFme
 ou8otFL8nxo2f429vQkHHSANmn7+JuUbD8QDZgpN+6KysruZiFTDhHy98zh2Xxmz1pER
 RuSYOrxSrY2k1hZ/X7W7XPed1SYc/c4ZxNrkQAiGcWzloMH3BR2E3YCw+LntGe2v62cB 4w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ase028h8h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 31 Aug 2021 09:03:23 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17V8xcV6082640;
        Tue, 31 Aug 2021 09:03:22 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
        by aserp3020.oracle.com with ESMTP id 3aqcy4c1tc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 31 Aug 2021 09:03:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlcfHjsIJlKiMmbX9Jk1oHGP4BLYoGKiC07hduqvQWDsDfw3ke4fML9ezTGMMnAlIaYgxojQfOV4L7NvkgHBydo4OVR+6h7bPHUqVssi7wxTlKSX2WI2tZ8muHLwL85wXEDQ+oTL4gWZMA9wcN3vfKIqo3v1e1YxUkz/R4L4Toi7e15wSCWITXBki7sHmW+SUrtKhwuh0k/zZdyVGWtw1s2oQlOceDBHKaTE/FAfEQ2FISiCIqLJFLgVNeSrbyfGrGU5xMnshoovYii000b3s+vhnSVewzdVW2seRXhK5H8v1sRHX8DHzzOe8WGMn1vbyTNBjoY4me7QsX5TBpXk1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NwpIdvf/6v72OpUMgfaCy1YxzLy+ulfoGEr7cMPHnaw=;
 b=PGLzZDsfi+1vQb5NDwnCwOujBqTMo2C0hLGIywB/QybIZFcmyXFzpjN7Z8ce/ZNBn6vPwJp1YnQbTGpNaoTh9FkoliSE+PbtXc1o+ejYE57GAwd47SZ18TleydfIGbQq9f2agtjYJ8LIHOp8AMdSu1dPDhHt+kVlIieRW5zvJcEZtGnUCgyoFR9BsuUQ5/PhhItVKCmcH9dmhmun1Srk3Oujr0i/FYKgkRlqCQF1Dyc8e6W9W6xBsQkyf/knDnZBpKDeTtQdE0xB1JQ/jsUPXIaRuoEFhz1LmYO6QuKkZ6vhjrD2o/kJFE+r0DJ0UNZWMbLdkth0OzFzYrk1gh6I9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwpIdvf/6v72OpUMgfaCy1YxzLy+ulfoGEr7cMPHnaw=;
 b=jVBkRTRAzZqS9ovQ+t+oka2dWRGiqJwNBMFbQ7RL1rw9MjIBJyDEfiVagtqH5+nGxodrHg6yzKYIJ4jXQQ+Q4sqP1i/C7e5gCo4AaE8U3XjUvW1pWw++BelJo6mlirOvChvZ7IYW4LGQ1OrJnhWUqp1g0wYkBXk6WlA1DUE9i7o=
Authentication-Results: fb.com; dkim=none (message not signed)
 header.d=none;fb.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1903.namprd10.prod.outlook.com
 (2603:10b6:300:10b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Tue, 31 Aug
 2021 09:03:20 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4478.019; Tue, 31 Aug 2021
 09:03:20 +0000
Date:   Tue, 31 Aug 2021 12:03:04 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andrey Ignatov <rdna@fb.com>
Cc:     kernel-janitors@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [bug report] rtnetlink: Return correct error on changing device
 netns
Message-ID: <20210831090304.GN12231@kadam>
References: <20210830090405.GA6314@kili>
 <YS3U7SwGhXVTdI1g@rdna-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YS3U7SwGhXVTdI1g@rdna-mbp.dhcp.thefacebook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0062.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::17)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JNAP275CA0062.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend Transport; Tue, 31 Aug 2021 09:03:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c77d7d32-55da-4b7a-fbc4-08d96c5e2df1
X-MS-TrafficTypeDiagnostic: MWHPR10MB1903:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB19034F1A86D6ED732C06D3AE8ECC9@MWHPR10MB1903.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6//8wukoyECJ6g3J1ZRStf5/KcPwMr1tC65J7e4yajjomyyF8BWLZg8KN6/OLbMdh3zfa9Ih49patH/+1OGRvJGrpVZplndfj5lRssk8nhQqcZsKZLjcbqLqkMLV+E3z9wMj/YiTGbqsrcnKv89JFDligvqaTmwo0AAh9u/+0t7u/xAwM31MblOkqlP9rnBTD1NdVAWjz837hUqxQuVe36msbhXjDPpxcNaUrBOme5a/GDrPy8sJyuMFl53zSTH6M04HpwogX9S53BN+yRgQL3skaYtWKzny8bQiLSjaQvkm0+9K6sByUq/vU3qofaFoAkFBIDhi6rRxv0+VXIj52lBvlw5cp1f8onA/osU12cAD7jPr8z8yDwFxkiMOk88q4mCI/PpIjeRP8bRR3SUxhaVBpBEt8dTSSh3FcjC4z8ddaIHFfJtLI6x6AsXw0yPODStDX+Cl25oHL4T03NuZH73z6UamWf6dApRgBW5NH33CfU6MqaJmAWnOKzAfQnhHW5yErQG/LXui4bFGXZos/ddoZaf1WmDnXvKjh7FTh+UwaOYpUlyMn03VobJhkZB1/GItMaAJ/ob+qMq2S/Qb3+YbqfIjOZQ5CLuUzkHNt16rHrTTdj6gx512mJvF78OnGRjkKgsUvwhqsJba1UrErVPJwy4kLm5HtJO6Sb+6uqqo5YRJWhWW+B///TRyM2THQb/13xzXq8qgswMYABB/Pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(39860400002)(396003)(376002)(366004)(6496006)(5660300002)(66556008)(186003)(38350700002)(1076003)(66946007)(52116002)(66476007)(38100700002)(6666004)(6916009)(26005)(4326008)(478600001)(4744005)(2906002)(8936002)(8676002)(956004)(33716001)(86362001)(316002)(55016002)(9686003)(33656002)(44832011)(9576002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z88V4G3c8XgVOZbqsPtycZyQ6Wu4+BpdyimPyCkI6EJdfD8onO+t8mikjzw/?=
 =?us-ascii?Q?46W3kXcG/cADDb6xHW66U/mendiEz4cKtUuWPTxxpZdo60BnJbVOEVk+Egq5?=
 =?us-ascii?Q?Vl4syMuhCXBojUNu95lGhDWqUs/O7ChsTnxh9YgHMgoFmHyu/ja+d/zaxywq?=
 =?us-ascii?Q?zwrZ6rzM+M2/IZ/9vLZgvcs1bhO5ZxEornpoBKxcCK6OlIg3PJJU88DI0eF9?=
 =?us-ascii?Q?VoGLq8GW8XaIN1DeyjucrCQkehnWc7a80rc5qA12E4rHiGXpRknVcuWOZFQE?=
 =?us-ascii?Q?ipHCWW/dymSMcMNrRDObiLrxKJcA2D+H5RpEgKtFTMpAvxpytoxz/OGg/+AS?=
 =?us-ascii?Q?0tkO9kZwAoblaCmu0hLVqMMnt4mSq/3acl2fl+8FWALW36kvn9XOrcJ7d/To?=
 =?us-ascii?Q?bJ1wJFPUUQeLfKmW4TjMUedM/gWET616gR9YiWZl+nsQ9w2sEqD3bGa7BGDn?=
 =?us-ascii?Q?IpUlvEN9HcB5NzO560DFCB5iHJUFJzFpDJPFBmYdtctILw04UgQauT465NlE?=
 =?us-ascii?Q?5GzmB8fU0tpXRXWoG8boAvA276lWuhlrnelubCW2MxO/xx/N35Xgzq51kaN/?=
 =?us-ascii?Q?JglmBk7pPqlVklZlncF6uJwI+ihUOHVo4DwbNdRl0IoYekZkgWv4BrT3J8YU?=
 =?us-ascii?Q?MviKwDwLqceeXBLEXSYqkMl1YdvJmwrbG3707lQPO0tDcx/ctl5iY6MKCldI?=
 =?us-ascii?Q?uOKR/TknbmQVFUX3uDMXNKB82qCRL9zI+8tV7MqoW7FfJOFbazPLWEM808tD?=
 =?us-ascii?Q?2clT7QGkOYW61vN1hFFBrX67ETi8nMUbQOwKNPdgPwvWmcxywyvx3tf618nC?=
 =?us-ascii?Q?KH0QNTzQKnqxzZs+0DL0L/fIn8Rf5qgpPAjvfDRlWlCzeXgp31ceSbyM5jVp?=
 =?us-ascii?Q?l0E39n4tEpQoxnzL52+uV84GQ4t1W9A6lC/a/AsGqzxyh2VLrgZJs+rsgMVf?=
 =?us-ascii?Q?0Qg5/jXDNnj2GJF+rrdeWjCZ80iWSBWb7PFQLuZEoNXZKQH0nfdSRGG19xjQ?=
 =?us-ascii?Q?69Q0zo3cErPhf2qrZrAFrfpdesO8qYQwtvCaIszCNd7lm/yGd+oHRdtsm2+T?=
 =?us-ascii?Q?f7rvhLTyxYBYfD+2sojfFHo/brWAePayAAwGSKHQpooAHdwby0yBkHAJogH5?=
 =?us-ascii?Q?YfTejebsEb+gjKSSAsO/Fp1NJILPxJTWpceYMUpIlFV9kZjrtoxTo0qKBowU?=
 =?us-ascii?Q?BAYQDsusNhwOiGwGaL1lLBDMmJeQmNXZNAt4MHZNAYlLpUgv/xM8A+o92/an?=
 =?us-ascii?Q?8crreyWI+62Jf9YJY3NN2+UmxhPj1EApzTRI27TeW7DWfTPpt64d7uiphyvt?=
 =?us-ascii?Q?uNysKrHUhqtxQ0/un6rB6V3g?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c77d7d32-55da-4b7a-fbc4-08d96c5e2df1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 09:03:20.5263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GygqGAP5XOFl70PUm8F5UpIHfPFUlljeGZkG1b6oJTTECK1iqFGnQsB1qnGIGd4zqfaHXxu6BXOyFibM6ndwp5kRgOwFk4cDVdyIpOKb3aU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1903
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10092 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 phishscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108310051
X-Proofpoint-GUID: ZDocOPPCVvF0mZi-wDJe14oPz9ygHq0D
X-Proofpoint-ORIG-GUID: ZDocOPPCVvF0mZi-wDJe14oPz9ygHq0D
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks.  In theory, Smatch is supposed to be able to parse this
correctly but do_setlink() is too complicated for Smatch.

net/core/rtnetlink.c:2824 do_setlink() warn: Function too hairy.  No more merges.

So then the callers think that ifm->ifi_index is not used and they don't
pass that information.  It's hard to know how to fix this...

regards,
dan carpenter

