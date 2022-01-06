Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F169CC433EF
	for <kernel-janitors@archiver.kernel.org>; Thu,  6 Jan 2022 10:05:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237603AbiAFKFz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 6 Jan 2022 05:05:55 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43442 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231360AbiAFKFy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Jan 2022 05:05:54 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2067Xs3F020260;
        Thu, 6 Jan 2022 10:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Drb5Gcsw/STL6Z9toYFneqL80St8nV/Aatp/tCa7jBo=;
 b=aB468VyR8Q5rAk+dEWABvEUBoX8nuV93n7MVQ5ZdOeNTT2rLCmOnohdGQoTQwwv5fKQC
 XCi8G9n+qDGCdqjCsTCMkV8i0fFw0hWZW5HB4eiHAisCli0YF+UDGeu43jV4lOEc9+IB
 yC8V3+K8PYrv5NU3tfowwFH5SBNkXSnk5ESFZ+0SxNCa3aTYObeS02HGm6Z9r0ct2dx1
 HmYhuyaxCMtSGwMGbu4mrZBEHWF98NkHNYqbyxFeHUFKvoYUfcd/n7M7Z2sASo3EJ3gU
 I3pSjtX5K65m9GelzDXr6nPZvYeA3+dDRpO+Gp+Aa6KMP4oELzw5yttLLv5jCi2PjBK/ LQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ddmpdha86-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 06 Jan 2022 10:05:53 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 206A5iJB107314;
        Thu, 6 Jan 2022 10:05:52 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
        by aserp3020.oracle.com with ESMTP id 3ddmqameje-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 06 Jan 2022 10:05:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0bkkGBo3QcUSwg9DLPdKWX0xQfTIbzUhN/3I5hidpGU5qbOogWTZtnsiD2HmTT9ilwhgvqNuuO0hzQC7CTX2RYGwXod1oidHtHoGeLIGLSz7J1/g8+g2plHmjljxW0Cu28himE+gwbeza7rKSQ+kFTwf/Z1snURIGCLjfyZaqaDuZNvDw5D/TDdNUhLeCfpU6sql+FjU/DKNfIPgsYzUJC8xjSFcJfh6B76zUDtCRgQHdR/AuxO708zwAoktoE13bX9yR1lC/l7DZ5XFLVIQIxiQ0Ah3OEXj8bvjbeKmZJ2Zog/KqrwpLDjfH5cGdXZBx6YF0T5WPQua6aRGVL3OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Drb5Gcsw/STL6Z9toYFneqL80St8nV/Aatp/tCa7jBo=;
 b=jS7s15Yfh5olDnibhTtjpNxTHk6CzKJJ3KPTqSa94F6Gk9wYMjF1qg2treAzr1Ctot3BNupV7bU75mKK69z6HkKm1vt2/8+3jwn80x+UqazAsoXxZyYH2lp70caEhGPHXv7VnJgfs+MJ0BZEZjvVDQVjMGvByoMYw7KV89hOCwcOOd8wW5ecfi8/sp/5YGG3zUblMCmY0LMD3YGC3TcoZYq9QVMH/CyT0tol+rXCltA2xGRc2XU44MXD9L4X7nPUGds+8GscraxDn4PaHqLEsxzvEtvRYjHFflbnBjxm/gtuB/eM6WHbQBH5mLyfVtW9hORGbhtQaHKQS/vNusMB7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Drb5Gcsw/STL6Z9toYFneqL80St8nV/Aatp/tCa7jBo=;
 b=HIOn/5FMhupnMmoeEe5NtTudwkTjfb7kLrNqIKAI6g6GPeZ2RqjlOXfoA895L4BK+RpvI0eAwbFWr+MoeGk1ItjT8b7gfbeVVZ5WVZQ7g5/UU7+ni9LTvgtWZy3Rnk5ewVc5VPLcVEQu8IScXStYSElfcGRwrqgA6AQIyhsuKIo=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2367.namprd10.prod.outlook.com
 (2603:10b6:301:30::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 6 Jan
 2022 10:05:48 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8%4]) with mapi id 15.20.4844.016; Thu, 6 Jan 2022
 10:05:48 +0000
Date:   Thu, 6 Jan 2022 13:05:31 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     paskripkin@gmail.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] asix: fix uninit-value in asix_mdio_read()
Message-ID: <20220106100531.GA25074@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0112.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::9) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db76c775-5f2f-45a7-ffba-08d9d0fc1cca
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2367:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2367BE3182F45426946F0C4E8E4C9@MWHPR1001MB2367.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vR0MzIWRWgXtVJS2EivlJ1jvx/LfMxfsH2wJF1uMPN6yDFivx4Q0L1spWa8RBoVQM28jOuux+s9u2U/mhYBzLMd6Pt4CaI95EALE6rknnx2MgOCU4LmblSe0DMNQ1wWXkMRhSe8ojOexjRyOnB0pBUSP41r0eaIKtPQwgG1lf+Jol9Is7yZWa22A9mjtR2A4PeE5HYfhLCMIxldTwZ1gvUJjXwU7o3aRGkkF6XdaLmjferORArpXgabnWOvfpMg2amlM9xytXwtwv+UcYSSZ7OFDp911fa6MojHfRIIN57umujdA2SpnXTlJShi3e/LCEgqlkL8BqpiGgPOxw5hoer7Tu9fD4UBtRj92YDBso8DfsoJ8ne0HeUKfsmk1Z2laq00j7p//uUTKAg/63tNxZXUql1SJFkXZ0NklDO3eNqwidiI40eH/nwyzfbVwUi6EB+jvAODuO7+c7jg8x9qaDBPB49z5HrXZfxkZDLT1g2gE3mM21+Fwsk7YUcnRxrDyv0oHjX4CdJ85Js9OEv6Uyy0fEALCYoeaLZya5k3N+lnuvcAb9/IVfzpQZ2rk0f6O9ghVkkLX6XSUKI2LjoGXK3BMSvtyJkPdr0tdA2L5k4+ubag3QyExJnLWVeIPMKtEUhg1yAL9d92Qx7JjlA0TNzrTx1anXywRptAyabQVBkYF/UOdd4OHH1nzt7SxLY7TbrjqKzgS4aM2LLZZ9EeNlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(6916009)(1076003)(6666004)(33656002)(44832011)(6506007)(33716001)(316002)(52116002)(9686003)(6512007)(2906002)(83380400001)(6486002)(508600001)(38100700002)(8676002)(186003)(38350700002)(4326008)(5660300002)(26005)(8936002)(66946007)(86362001)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lqczcyoCB1OLLoeYDbeepqNb+/zTelkTHrbGG/ds9Bpe42DWpzFaUt1hgTcU?=
 =?us-ascii?Q?EdN0OyUtS1P9RUly37YDys9W3vMFsnjioaOULH/VPaTBUH231X+W8tYQca9w?=
 =?us-ascii?Q?jp5IRH5EUFoSY3ieq1wmydz/bojjixrMfRx9VXXpio7cxBsWWmE8W1M9yU1R?=
 =?us-ascii?Q?2nXqqjOA0ASFMh1RR3FDwo5iFgRGV2qfkYHbuiS0Q87bX3g55QHW2ZKlQBsR?=
 =?us-ascii?Q?tdE1Jt7I/ZZ4R68CffsgYS9KVCDh8v8wWroHFGqn/ffzPEKo3qScQH+PTUwt?=
 =?us-ascii?Q?ttoxEtqCOVMJNCFTf/QdUpGkZSfJ+7/A8i7l5VJsoo9w9W16sIWZabLkzvYR?=
 =?us-ascii?Q?Y4VC3o+aJJBEQKrs7NIyFaGKNUe0KiWnR6ouauXiGoMPiZB7UUMDqcrA5W11?=
 =?us-ascii?Q?W7RF3/lRLo28wR6WxSA9DMP1G4OM0CmglTvq6HWc4zHFM7mpeDot4hfcB0Qn?=
 =?us-ascii?Q?RdQ8ewSo+SfJw35v5UvvTbSw2S1ldBM9W5cetzpw8BLGnCzG/E4bML/VB4QD?=
 =?us-ascii?Q?BXFMode5sVVqQaBOJ8X5qxJxxwC3meuYmAAjFOhV4i8G9CyC2lnaCKnTWHFx?=
 =?us-ascii?Q?Ug1RkVNeU08dBUgL2PH71FWoPlhQWQCCEC9WNsTRno/izbfzcmqRZp4Qdtcd?=
 =?us-ascii?Q?omg+CiHW3gmOST1v63I1xUZqvoDnnwvLzylqHazx3c/92DUKxrgLNVY9X1nS?=
 =?us-ascii?Q?X9SwntqM2CGLxT9uPSBM/idZmOaSjFU2/+LkN/4ZjqRavXRMfUhjCJ3+aM7Q?=
 =?us-ascii?Q?kQzQFrZNxXOTIEnRwuhC1So/pNi6ITHvSVAyPnXYwzW523In/kdDSgXYRd2n?=
 =?us-ascii?Q?BmPRIGIdG0Q/7mb7rg/iG8iV4LEutSSI3Vpqgqm5o/N7l7oSqkAHWDlCignt?=
 =?us-ascii?Q?D57WNXoMMEw/CKKHk5N1sPGkFcbIiInCS7lR8Was8fyFPOy/3WneOOB1c5c/?=
 =?us-ascii?Q?xTeJh/KaUDJPl/kwSEGaC21h/W8tfQxCoXV/ZSZkkh67UlHGIYO8GC7Rfwmb?=
 =?us-ascii?Q?jCoRwY5TR5jToSg/7ScLsxNkavIKDbt4KtpzF2PYPyRIW8GSj9EdD4TX300R?=
 =?us-ascii?Q?sSfy4M2j2ccdaoayVpk6DXSKaSTzXxbs5nQWnRB63fHwK0SwZH/CUD6W8tCj?=
 =?us-ascii?Q?wXJrTh9gftzjOj0TiERHpGWJcvVyWywM+SCoplgZ8/lpsfWImQkXvr5bMEQW?=
 =?us-ascii?Q?qh8lV2y7/HqkHnRpuExt0Or+dfNwldu0xogzdcG0AsKivF1oUYcU3ngeZVUI?=
 =?us-ascii?Q?sCoEfi0+pu5DRjwKbOwDOgaAnqeBIPvTW+QRZC1G3OHOEjXpFJ5RwBhqbGcm?=
 =?us-ascii?Q?ah14nm3pd9wphdxR8O3Wo2md4xju/ok3AWhKeDqG9b3MjjY3dS2OmSfqVsmQ?=
 =?us-ascii?Q?qLmzeT7J6Q1rFM6waXzWl28VgUHsXIC1NCheN5EBgVtv6WRbl7JFO33uWlyc?=
 =?us-ascii?Q?Rc/k9KAoWorlnFnhaGgo2gnNgQs14yeyHDwHE/d1TGyDpRc2UOpgJCOXp9Kc?=
 =?us-ascii?Q?e5kcyup3fjS6AMoC2PPbp6rTqtYBtHG76scs6BRM3vkk1ly9BXLRQMWeyO6V?=
 =?us-ascii?Q?/9upIYeUlVN7RConjxXMJ0+Xgfk+A0bv1yvAaZuLQ2u78MkOJcXtBnCUXA7s?=
 =?us-ascii?Q?1r08ZPTvvQ3gYitkUCPZ2rhn+VfMf41Oq4/inFJ3Q/tYttdY2btRZhz5+rQm?=
 =?us-ascii?Q?xBYZeBSIdqitMOSdoF0YikyTgfs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db76c775-5f2f-45a7-ffba-08d9d0fc1cca
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 10:05:48.5381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEOPYF5t2ARlgjwjzvCOPTkEtCbLKWUXMuPU9ZlHILVmFUFOWFevKVKBwALHX8yvWd8SKvAGvIoxd0inGBcE6U4n3QDmyAouM/jCsai0/Vo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2367
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10218 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=832 phishscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2112160000
 definitions=main-2201060072
X-Proofpoint-ORIG-GUID: k9dxRoe-5NiwpBa9oT8N1OYw1lAwTndz
X-Proofpoint-GUID: k9dxRoe-5NiwpBa9oT8N1OYw1lAwTndz
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Pavel Skripkin,

The patch 8035b1a2a37a: "asix: fix uninit-value in asix_mdio_read()"
from Dec 21, 2021, leads to the following Smatch static checker
warning:

	drivers/net/usb/asix_common.c:82 asix_check_host_enable()
	warn: 'ret' possible negative type promoted to high

drivers/net/usb/asix_common.c
    68 static int asix_check_host_enable(struct usbnet *dev, int in_pm)
    69 {
    70         int i, ret;
    71         u8 smsr;
    72 
    73         for (i = 0; i < AX_HOST_EN_RETRIES; ++i) {
    74                 ret = asix_set_sw_mii(dev, in_pm);
    75                 if (ret == -ENODEV || ret == -ETIMEDOUT)
    76                         break;
    77                 usleep_range(1000, 1100);
    78                 ret = asix_read_cmd(dev, AX_CMD_STATMNGSTS_REG,
    79                                     0, 0, 1, &smsr, in_pm);
    80                 if (ret == -ENODEV)
    81                         break;
--> 82                 else if (ret < sizeof(smsr))

This has to be: if (ret < 0 || ret < sizeof(smsr)) { but even better
would be to fix asix_read_cmd() to not allow partial reads.  It should
print the netdev_warn() for partial reads but right now it doesn't.

    83                         continue;
    84                 else if (smsr & AX_HOST_EN)
    85                         break;
    86         }
    87 
    88         return i >= AX_HOST_EN_RETRIES ? -ETIMEDOUT : ret;
    89 }

regards,
dan carpenter
