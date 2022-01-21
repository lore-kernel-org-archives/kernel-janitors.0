Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D135C433F5
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 Jan 2022 11:55:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235627AbiAULzq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Jan 2022 06:55:46 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:14776 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233354AbiAULzp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Jan 2022 06:55:45 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20LBoCZO017777;
        Fri, 21 Jan 2022 11:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=aLn+/F41iouy6W3lufe8R249SyO+zI4gyDapMpyZRgo=;
 b=oukqG6pIZhwNYkVaHMp/phz7qspUYR+6xXTWYtRQOAqkS9k7QOAqMIQfW3S9SlHmf7Y9
 AqF8jct7nfXNJzKf/NOHuP6ZC7GN5VkkUODW1/lCuxMrgza/KGsO7KvE94iQbVbXmMt6
 oJV7gb3U38fPBtydMT6Mw8GEURTMgtrpTsLC+UsGUBPBeW8HyOIq+u2YvpVtTFbxtrbM
 vFtRNrNDObd8JAmu/IpsQ2esS44IdKdWyRij3GehpEKCCN096q63ZD1EFYd9Pq3o7R1a
 mDoBUFNezapcVSH8f1rQ3MybX+sIGKnEYkl2mAUNj1TeC++fhosNEDbCGdmf2obSPNzu QA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dqhyc14wp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 Jan 2022 11:55:28 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20LBp3QT095011;
        Fri, 21 Jan 2022 11:55:27 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2045.outbound.protection.outlook.com [104.47.51.45])
        by aserp3030.oracle.com with ESMTP id 3dqj05x64a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 Jan 2022 11:55:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xz/ywltKRf+HYasg0TQ/sfY4HMzO+wkV54JbgMbq7jnIkycq0/fvJsK4DTmQZQkAcLen60dJybIPgQZKLyHN9ypHlj4GKYAce6JoQ6uRBNlbExFKfrBJ0Hl8FFBgpPnqJAem7Xp2nrp3ke6h4dmreGsto5RvJdQhdfpKOzkmSH8oj3vL6D7QWFoSfsyqmshqc8Daa75HQ9eDX8QIK4oisNCRDgdFz/PUijYRzn/4lpYgm0Ph43oQXBRg0tl2EWUhFM1nIH4w9RYSmaF9RFonhc84c+jHRgJAAWSrJ2qP5B2Ic0Dj1AqWfX07YzVd5WjUELy8fuVAz/Z4SA/ceJCJRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLn+/F41iouy6W3lufe8R249SyO+zI4gyDapMpyZRgo=;
 b=YRER0bWz+yauKQILamoLTAHWHNRXfPYHy73IgJz+vN43kqC6Xrg+PrXtNYumqZ3cvfgXTET2FZYVNyIQZY8RQl4GJkZnmCYpJhn2r/qUchkbd8AoZ+5jQXofeuweuHxBsmfX3XXsja50j7Obi1jrRs52FwwVgCpLlhT8D3UHhLq4G/Os3BrkT2V/DFIpEzwO9AMMEYGddRXN3bq9Pv8D7Prrup2kzh2KLdahtpnkpX6EjFriu7YyiBKzMIeVAOIyFRR/+cK4Ur+M6qOfjndtiJfrs5ZIBO886pv+nR5zSf/e99AQa7w2lraKbvdorrFLjYw1F0FWmyXzLH6PXt8qOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLn+/F41iouy6W3lufe8R249SyO+zI4gyDapMpyZRgo=;
 b=ShZpCbOQxtHrWrfVQI3MYWWPuRkzjt12eIs3oo78E0M7KehJt7WhOAx64lLGI64ari73HQRW3lZOsQMXUrHublN9VtCkoM41T3uu+zIemqKauxLOa6RkC0oD82MblIkK319EifIq0qSxfXyCagk1MCbDO0Y3XBgAl4TU5VsE+Ek=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM8PR10MB5414.namprd10.prod.outlook.com
 (2603:10b6:8:32::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Fri, 21 Jan
 2022 11:55:26 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.012; Fri, 21 Jan 2022
 11:55:26 +0000
Date:   Fri, 21 Jan 2022 14:55:05 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Joern Engel <joern@lazybastard.org>,
        yangerkun <yangerkun@huawei.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] mtd: phram: Prevent divide by zero bug in phram_setup()
Message-ID: <20220121115505.GI1978@kadam>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0044.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::32)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c52e631-cbaf-45bc-2cf8-08d9dcd4e981
X-MS-TrafficTypeDiagnostic: DM8PR10MB5414:EE_
X-Microsoft-Antispam-PRVS: <DM8PR10MB541468CD1F58A3D767B697CE8E5B9@DM8PR10MB5414.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pX2jErtiH+z3aTZcsdTn0e38Y7ejUY82JQKbTpHcqKg3LjNRwRtuDsss/0W3DaDXbdGP+DTeV6j4zo8P1FAmzXWsS8bCf9wk0fRhiNxAK07vnQlOJOKU90yK9f+6pwO+nBRHdhPt/oekHdBiC6oo4tAEEWWHLasBxzxp0juZkYgCmaL6T1AWcW8E8e0QTrGdRvVz5HTdhBzIW1TlOAkL28bBYObXKLt4xN6Km4vS6rKORpdWiV/sCnWaS89+cAZrT92ItqBDI6fChpHWT/i+qEe7PwpSQOPwWpRnN0yjxBKUevRDhJyKeN9nPoFr3h8vBH7xZInnO/QDFMB1u/FBu7Ev2tgO65yQXYk1p7xo9BzLJ4FIO1GYdw4GfUiglRQI9k9vfpd21yaIpbPiqWhMdPwOcf+sGXgXH37zt3Zl7CBEwDr4m7sACkI+u+QYUnrMl74DuI5kN3Uo1Cvy1CJyo6DKezytfavosE3UVbKR9FGUnL8sdxtVT6EViCd+fqVJR9JAutHufdwejdBJAusb84C1EnZVV8B+g7Yjs39ZwFnmHmYdNNTdZOuhEP7OJJbm8+lf1cME9jPnOINLJwreOBmdMbClprw0YJQ+ZS1yop6WTPNVpCxPKeNxGfeOlDHezAZcASKc5YW33BJtmV9fNmnKieQqph9czZUjemrTRAOYMwmAttS1d3NDeIM3ckjyCmH/kV1+Scihr1hZBVVvuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(316002)(38350700002)(6506007)(38100700002)(9686003)(86362001)(66946007)(110136005)(66476007)(83380400001)(52116002)(8676002)(186003)(4326008)(26005)(2906002)(33716001)(6512007)(66556008)(508600001)(5660300002)(1076003)(6666004)(54906003)(33656002)(6486002)(44832011)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lElg+zUyAKJfmDPrYC5fetIp3Vi+/I9lpO7g0GHZnd55dl2XtMBo0NB/zX2w?=
 =?us-ascii?Q?5MV36M7kM7I2wxXtVAUtkPhk4kCFbAr2JIBPPSfW+KT+4Qz7mV3WL2TtXamg?=
 =?us-ascii?Q?ruImdfkJCS5sKcTSCTmZWoUYpMz4eJ6aIwS33AC8gb1C0typqJVxb8l9d3Pf?=
 =?us-ascii?Q?xpQAbWxWlpzrvsdCMoIcVdqop3sGlvmiVC3M28b2a8hn94wq3uqz8+kHNIdD?=
 =?us-ascii?Q?kZmGo6Tx0gfrhesHHmpRurrc95XuevCVuW19AQmxfzlfjXT4/BsIzy0SSOSv?=
 =?us-ascii?Q?LZG0of7SslnzMi+UGi9iuyfZZSNHa4vgkex/xk4OGmhogaJ2rSMO6xNuNFNb?=
 =?us-ascii?Q?DWRD1NoJyF0VUzVMc6mfMuM8vQu8bkzalmCBNL6m+e/C0u0UGqR8Jmbrx60W?=
 =?us-ascii?Q?thmr/ZJHf7YDV9A1k8MNi3iLZO6cJSoemvBmROyo/J0xu0Sqx1eak+Q6fiCT?=
 =?us-ascii?Q?uR+100s6lRLI1frtxkPuLrIegHRFMMh6mtJopCcDcO3+p+R7ILnRRR0TaMTh?=
 =?us-ascii?Q?vdNwEtyvJGbx50+yqkE10XGwcmSgNIi+yBeh5hXFlKWuij/4OwH2ZSo6WE22?=
 =?us-ascii?Q?rScz8ElVPZYwyRVIZ7xCpyqFm+6csAAtHxm3xti93fz5BaTZ1ihbkzr5YTnZ?=
 =?us-ascii?Q?7eH0A0HGsAF4YxUHIEgdRMd+Z0e+nuWtrZiKxhWI0KVZYI9UEvADkB7aaeLl?=
 =?us-ascii?Q?bZFPgfQy7MTViRQFjvM5IZCNxynZ73Ki/OlKaMwi3PzQ/sbuS4fRhZKiWVve?=
 =?us-ascii?Q?Mh3/ByS6Zm7hVZwpqT2dtfsfHYQdEIjvGG9F97gnSu6gVmvC+g5YpMeKjkuU?=
 =?us-ascii?Q?Wy56slN/OLYXrFnO+C7Sp7HKhBK+3fmzvBxRq1KFLQOydMH3Hh8k9L0tdqdq?=
 =?us-ascii?Q?7Z8JP2G49EKuLTqsthu6yAptwmtOkBRkolRWNNTUGlY0+mH6EN75PsjSzQd2?=
 =?us-ascii?Q?DHU3QGs/6FkJDGBcihghWzVgS6spSoMj+ah1UEiVt+dRh6bf3AFm1BTNGUtT?=
 =?us-ascii?Q?yRZ49eZtCS6t1k7UP0dOK9qB7wxeMXNPp0r7GTSlG3yPGh2M3XXxmTht0Kp9?=
 =?us-ascii?Q?idzIL4l6WDtZjlaLZj1wH0nrKpsRMTO1+LgK7nO956B3rrYqWpXPit/9qdeW?=
 =?us-ascii?Q?VFLpz8NN80dAR40xyn1pptpgFcjkxo95pHLlLYaTEYEGtgUUNJYlJCzKcCy+?=
 =?us-ascii?Q?R3Q5m4/Fmy8Q6xJ1fGHc9p78CmtZqC+RY5pFf5LQuK7MnC4qvgBEeYlByCuu?=
 =?us-ascii?Q?D+7qsRbnAzm00GfXXjDbec03PXp6Y68YhIJ2Pq90XQ0CkIl1cx1aurmUXSXI?=
 =?us-ascii?Q?Mfa3S/UgIYvXqVVLT1nev+ydVkq8/T7kZYkmC/NaBtBlUOzKv9VfhXNHayqa?=
 =?us-ascii?Q?SmA8mifsmVH+qS5WGwUXmGjH81i1BBgK0Juq5G/FYa0JjaIw7bgqtg0Hf6OY?=
 =?us-ascii?Q?WmaSi5KEATRQEfLX4jUYstE7Y3FH19qjfWKWu/KMwD5KdicCkyAWk/8k9I5J?=
 =?us-ascii?Q?AqIXX6RSCcA0gfRrHOtmAT0JDCaJO/VFCT1YvlzWAeTzbqVSkbgTKw9pUWhQ?=
 =?us-ascii?Q?18CK3riJllKzdpx7mdiG8RmyWXZX2WyQUlWp81S1xIIcF9Q7XATVRvvfw6Qe?=
 =?us-ascii?Q?kGHZF79wngQZEueSJR99l8t78dAq+lswfJJ22n0KrzUsuwMGTuel4qHSfrKX?=
 =?us-ascii?Q?nk68Sq07BfSfSnv/U2r0kHG9TKQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c52e631-cbaf-45bc-2cf8-08d9dcd4e981
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 11:55:25.9776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NW8fQHSxYh+yjoMyPY9Tzr/1RkSOfLOxvuYKt3gLB4/ynjkZh+ht/gmaT6cipk5tpcw24I9sQt2UYjhvQv0d/DyDU4QLDPZYN0k7U3I8qWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR10MB5414
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10233 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201210080
X-Proofpoint-ORIG-GUID: 7A7GwKDypOkFN2_2HBu5qdemsxMkn7IF
X-Proofpoint-GUID: 7A7GwKDypOkFN2_2HBu5qdemsxMkn7IF
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The problem is that "erasesize" is a uint64_t type so it might be
non-zero but the lower 32 bits are zero so when it's truncated,
"(uint32_t)erasesize", then that value is zero. This leads to a
divide by zero bug.

Avoid the bug by delaying the divide until after we have validated
that "erasesize" is non-zero and within the uint32_t range.

Fixes: dc2b3e5cbc80 ("mtd: phram: use div_u64_rem to stop overwrite len in phram_setup")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: edit the commit message

 drivers/mtd/devices/phram.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 6ed6c51fac69..d503821a3e60 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -264,16 +264,20 @@ static int phram_setup(const char *val)
 		}
 	}
 
-	if (erasesize)
-		div_u64_rem(len, (uint32_t)erasesize, &rem);
-
 	if (len == 0 || erasesize == 0 || erasesize > len
-	    || erasesize > UINT_MAX || rem) {
+	    || erasesize > UINT_MAX) {
 		parse_err("illegal erasesize or len\n");
 		ret = -EINVAL;
 		goto error;
 	}
 
+	div_u64_rem(len, (uint32_t)erasesize, &rem);
+	if (rem) {
+		parse_err("len is not multiple of erasesize\n");
+		ret = -EINVAL;
+		goto error;
+	}
+
 	ret = register_device(name, start, len, (uint32_t)erasesize);
 	if (ret)
 		goto error;
-- 
2.20.1
