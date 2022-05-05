Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A140C433FE
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 May 2022 07:05:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245554AbiEEHJX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 May 2022 03:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240027AbiEEHJV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 May 2022 03:09:21 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B2D25C76
        for <kernel-janitors@vger.kernel.org>; Thu,  5 May 2022 00:05:41 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2456uFDb029440;
        Thu, 5 May 2022 07:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=r81cmN7K1vyQ1EL0iElX/szdPVotozdEELaz/l88CNI=;
 b=SIP2qucS1k62upRfTnIDhNps/qR+x0m29leGskqjw61UzRawXBhj6k8P2ErVFj/+unpA
 qbLRWOILG5VwHT8itQ9Lq30f747D7TAt56yT6bbWaVtrUCrSmTjeTfYo3vvrsY4ZSTXb
 3MD15DcewnxFFtmbR03qXl9mP+Dw1ftmZi2kqHazsCmx3cc3Nkn9rfS+Z004nnw3hC81
 ufpD/SqREA73XosaOQq5NBWBcZKPoeWYa+Sh/Zc03+6JpFwJKPm/7CuD05B5JXzRqyMc
 w8xfWbU4qj3ARZDadoOFxs32XA9wZ5ORIBRAXlGEau48iAiQwEKd6qAgTSBa6fe9y65v Kw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruq0jh8n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 May 2022 07:05:38 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24575PHN031457;
        Thu, 5 May 2022 07:05:37 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3fs1a6jajk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 May 2022 07:05:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpFZ5b9qUpQKFbdMB1MePtEzB0Ri2IxWvtoZ4Yv1MUaGKqW7KBJyx4kQhoiyeFi8qv2dlZnDnyt0jko/eVgUewUYMVLvHi6Inmep5od4n4uCd5Fb2IjZZ0rxRnChTLDclg3WalagpId/crxJhQ+GZAfTcst9WeDSdJHBoHa9xYr6YygIU4IUXWs8lQyOnF0GbcrW/4bfbgCkC4EkrrU+s60jszWOceEn6FCdzfIsx0AHuzIjyNgxtl9PhAiGicArl07urUNHgeZkHTWOpUTu5OSXBMeSyxcbTZ0Kok9zfwKekcW2nQNzcwWE3eZUvpkVNzK5S+om8kc0/c7RQflF6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r81cmN7K1vyQ1EL0iElX/szdPVotozdEELaz/l88CNI=;
 b=UKJUwBRnHMxox0CbErZhbAcuykcj0p4itfvW7ij1A9hCHOg/zGyD+gSnjZnsKEQztbmU1dEr3VCDcKgX4UEHaDwCITd0UX1FGHQ1Cr3C1q4KslVcmJGfOAlMjGfhTHMzpN0LCZNJibFWFqgD8ETlUMMW0WYurZzoYY3GoVtPxbmnnQA6Ok+FyDyjozV8xIffebiWPQ2J6dLmUOXWiIthjzV9xM6OuEbp+BFddlcEWx0V3g0F1Ek7Xp5u51AUg5kVt4BtWF5DdOBjkAizsV/9mgxpRVeVkKfqAdIlUxaXXfiAOfaMnAEssECmgWeyGPJRsLw1akc2UOjmQxqaHdn/7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r81cmN7K1vyQ1EL0iElX/szdPVotozdEELaz/l88CNI=;
 b=DhqcV7MXtIvaOYGhGgO8vg8NdV1HK9tSRSTpHbXPZ0fuG2Bo7LGE5eeylNHUMmXjrNTV+7WCX79rtz9l75es8U/X1FpOjtAiObNfheBLZbM6cRgxHtf0Tow+5+EVT94cReXBh8HmJtsUv3BBR1/l0wiaxlehMXOUIHhhbsd26tk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM4PR10MB6109.namprd10.prod.outlook.com
 (2603:10b6:8:bf::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 07:05:34 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Thu, 5 May 2022
 07:05:33 +0000
Date:   Thu, 5 May 2022 10:05:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ggherdovich@suse.cz
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] x86, sched: Bail out of frequency invariance if turbo
 frequency is unknown
Message-ID: <YnN3MwU5lPoNXhWU@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0077.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::10) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0d2596b-37cb-4df5-fd78-08da2e65a598
X-MS-TrafficTypeDiagnostic: DM4PR10MB6109:EE_
X-Microsoft-Antispam-PRVS: <DM4PR10MB61094A972588FEF721FB19D18EC29@DM4PR10MB6109.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pvJwKs/5Xvq22jbnPgTwiK1ven+ssrmmRnioDoJgRqe5veWIf/3blZrK7pRZyFnga2c7nxkjFsFzS/6HYGd+qXIcOSb297BvHI3EozRDH966OvRW/9srA0xM8HyBYxzWwCDtJ4pIU3mArjRR7N/kDi4qRpAIL/SnXugosxzQxze/uhJyeVbcqvwuRO/ZYAZVJ23lKk9v4p85WPYvBb4r5amtdvXVwu3l7/UkgaoQz1j6N88gxxNzQe6O4egiC9WzqzZsSeSO5XeM1FLI7R5mOz7YClEpb3nxTigNUms+hAv7wC49z/yM2FHhj72PKuVblDPevK7T+om9zBskcc9FqFs4IQfLilwUv0t6FEGAGcVE7NMrwLQrbYM2zFTVLGjEvN8CG5dniaUsVvFUEzafzHyGU9wSgCThgF7mIg1sLXPhZ+EgzWA2XK7Afvqmhw1u0Fd2O0WI31d14vCCKGJUdPP+KLaFpsO/STS5j+p7NfyMlvuBgWGz8RPoa7oQ21uRdi5CYchgb6D41MFXRPwDfciPk4JFAgF39wyhmfp9N32iggrFST86jraZ9eK2/lLCGHD7YXyDdiooqDfGiTTp9b2I6J/NCJKV7+VSwfsNIDXl8DXnkYqcJttdCuP8EkvULJxeGD8wGe+RHbvJK46VvT0infgsuCh/jqEILSrEUM78V1UZZ8vGtSK68WDXfF+ZDdNCfa2BEcMwhGwZs/k0JQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(6486002)(508600001)(2906002)(66946007)(86362001)(8936002)(8676002)(4326008)(5660300002)(66556008)(66476007)(38350700002)(38100700002)(316002)(6916009)(6666004)(52116002)(44832011)(83380400001)(6506007)(9686003)(6512007)(26005)(33716001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ivoWQKC/o9wlltMV6x+gnBtoh+do0irOv1qiDTNgmmXirf2TRoXWab3pGBWH?=
 =?us-ascii?Q?wkUNcwEZqSufPqxP24sWFQ0fepf1xCRH8ZN2skaKKjGD/bfMMEHPAdkn38lc?=
 =?us-ascii?Q?+93Ffc6VDikwox5G/17gON6LDY+bJkKOCfNNlhdXzgt3Dqdel00oLHJMor7L?=
 =?us-ascii?Q?LMjEHSI0NPwrJGBQtoF4/D8m7t34YHrCWWgKUjWuZYEW8W9FkPAV8nr2rCZ5?=
 =?us-ascii?Q?bmiEGN/vde39te/jvattWFrfE/Sv+Jc/46/91406AVqvK6rwd4/OuMjdLo0O?=
 =?us-ascii?Q?4agasMqVtIT396jho5iKsuJ/ob4AIWC26WnLvqBI1mO+nkOKHjTmTjkVuSfu?=
 =?us-ascii?Q?O0VF+ElaWhEuFqcycISlwoSilykSXzEYj5I/VbXtkdSMwAKcQcNJTOT6UGRU?=
 =?us-ascii?Q?FA+i0M2gs+GTDzapf4uomCOQ6sZYr3Zdovy6GliYIEUHDMDJQOCWi5NjOkNc?=
 =?us-ascii?Q?CwjPrVuDA3Oz6x12nKRINWhU6j/l4dzYN5rqcvtmvXvnzb65UNEkmq2ckPMo?=
 =?us-ascii?Q?ddp1octGlPFMV0luIhdSWCnM5wEI29OgTFvO+7M1PP9CS4dkcZZ8nXFVgfKD?=
 =?us-ascii?Q?pSpVMaaNNT71NJEvH29ADpGCx6BW+L+wPfkW/My+uge592/tTYc5r+hGOy1+?=
 =?us-ascii?Q?pj/J29tupb/EYm5EPHBhdXeZ4zAKCIxRZRvCSAVLmmiNnNYdPuu+Szu5BBM9?=
 =?us-ascii?Q?tTrcAAUPPBtlreEMftqmeuNYCZYgy+Hfy5luXkqLIn1LhIVx/uAiowIZs6OM?=
 =?us-ascii?Q?rdf2Ygwa4VKGuIF1t8kLyQjeUIdARD31c4gGeT9eKZWpw2UsZnv6yQc1qoOy?=
 =?us-ascii?Q?1Ncg0NiCGVUw4vRWLyCv2+pa3VSfc3Vgg9dCNRBAlgxu0kTFUyo4ysSyYN1n?=
 =?us-ascii?Q?bJBHZ53TE+djzr7UX9m0TZ75CIdlNDcCcoecj8pPZFLI78bdHOylhDy1elv8?=
 =?us-ascii?Q?YoEePrdI1oN8THVWN38beccMeTIcFVEXE8N/bsLrewaSnLCDuWNFxCHp7Qnc?=
 =?us-ascii?Q?ZUz0ElZYdYLod41fDiH1/4DuqjAtzR3Iw4bDSOs//lmErf/KUth50RjHq17A?=
 =?us-ascii?Q?9E/FnQWf1nWt8a+mZrETv+RPJoKulYZcOJxgk86r/iB9jauvG+Wp+HunKv95?=
 =?us-ascii?Q?LHAazQQ9H9eksSiDwIGYNsYRfiMCkKPjPTt1awaFOVFeiOPmy6uidmxmAUMR?=
 =?us-ascii?Q?oD4VJHdFRkmVR4QYGVJtodC6eKV/5I0Vcx4Ul2jQA3nbsiG/75AVQhiCBOIo?=
 =?us-ascii?Q?ZXbbmVsgmD2eBE0uGCnNhKg2JGwA5iwz0ZX0LsiQOcGIqYWKLjoSOykBlcsT?=
 =?us-ascii?Q?aGJJ6AW9lUdIqaE69n9caM1ko3NRQee6vQEff3q8xzaMyingZvAt/WzsTafh?=
 =?us-ascii?Q?Lg2QkcIzkgzpbH+eMGF4zPTC6mZQuXgUHdIW5pljRZFnQvolpbfLG4ZgMOWS?=
 =?us-ascii?Q?OViaD0X4eutjeWspJWzsSgdteQUkkvrAi9UTOD5VVCu5pssBjYnIG8pDyNNL?=
 =?us-ascii?Q?CLnOdOom9H39p7ZlukeMYiXuOtj8aZ/sdZlKY9LX5uDM/6ME4p78hFPV2K0Q?=
 =?us-ascii?Q?Eiqs/ZeDVKugFZ3F1BqgfElHxacecyABV7veSpwlN0T48BPzRD3oFMhiMw9H?=
 =?us-ascii?Q?6fa0H7RAibYyuMtap1Xs/wz6S5lhkK3ndsuc1/dE8daN0ZYKKEVDZq5LX+Yp?=
 =?us-ascii?Q?CFPkinVAfVe2qm7q1RAtCUvoRrjcN/aQNZ1POotSFWEzdJ9NbntuFFbv1ojt?=
 =?us-ascii?Q?5oJ345ROSTCP31HZ3hW0e0mxrtwAZH8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d2596b-37cb-4df5-fd78-08da2e65a598
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 07:05:33.2437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DESc+Y27PqE9Bv2vyAQGQ176arCnqZeft8MYZ01Gv1Mn6Y3BMvRjxn7ChAORZ8w4Xm/JC5sFum40cNrkXCKKgmkwsYJVG8jW0gIeU66a8hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6109
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-05-05_02:2022-05-04,2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050048
X-Proofpoint-ORIG-GUID: El-CsqEGa9simcrf9Kto6NVuzbW6Y5wR
X-Proofpoint-GUID: El-CsqEGa9simcrf9Kto6NVuzbW6Y5wR
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Giovanni Gherdovich,

The patch 51beea8862a3: "x86, sched: Bail out of frequency invariance
if turbo frequency is unknown" from May 31, 2020, leads to the
following Smatch static checker warning:

	arch/x86/kernel/cpu/aperfmperf.c:274 intel_set_max_freq_ratio()
	error: uninitialized symbol 'turbo_freq'.

arch/x86/kernel/cpu/aperfmperf.c
    242 static bool __init intel_set_max_freq_ratio(void)
    243 {
    244         u64 base_freq, turbo_freq;
    245         u64 turbo_ratio;
    246 
    247         if (slv_set_max_freq_ratio(&base_freq, &turbo_freq))
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Imagine this fails.

    248                 goto out;
    249 
    250         if (x86_match_cpu(has_glm_turbo_ratio_limits) &&
    251             skx_set_max_freq_ratio(&base_freq, &turbo_freq, 1))
    252                 goto out;
    253 
    254         if (x86_match_cpu(has_knl_turbo_ratio_limits) &&
    255             knl_set_max_freq_ratio(&base_freq, &turbo_freq, 1))
    256                 goto out;
    257 
    258         if (x86_match_cpu(has_skx_turbo_ratio_limits) &&
    259             skx_set_max_freq_ratio(&base_freq, &turbo_freq, 4))
    260                 goto out;
    261 
    262         if (core_set_max_freq_ratio(&base_freq, &turbo_freq))
    263                 goto out;
    264 
    265         return false;
    266 
    267 out:
    268         /*
    269          * Some hypervisors advertise X86_FEATURE_APERFMPERF
    270          * but then fill all MSR's with zeroes.
    271          * Some CPUs have turbo boost but don't declare any turbo ratio
    272          * in MSR_TURBO_RATIO_LIMIT.
    273          */
--> 274         if (!base_freq || !turbo_freq) {
                    ^^^^^^^^^^^^^^^^^^^^^^^^^
Uninitialized.  Although I notice that base_freq is also unintialized
and that predates your patch...  So I should probably send this bug
report to someone else...  Sorry?

    275                 pr_debug("Couldn't determine cpu base or turbo frequency, necessary for scale-invariant accounting.\n");
    276                 return false;
    277         }
    278 
    279         turbo_ratio = div_u64(turbo_freq * SCHED_CAPACITY_SCALE, base_freq);
    280         if (!turbo_ratio) {
    281                 pr_debug("Non-zero turbo and base frequencies led to a 0 ratio.\n");
    282                 return false;
    283         }
    284 
    285         arch_turbo_freq_ratio = turbo_ratio;
    286         arch_set_max_freq_ratio(turbo_disabled());
    287 
    288         return true;
    289 }

regards,
dan carpenter
