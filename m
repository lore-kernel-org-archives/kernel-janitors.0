Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB807C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 May 2022 13:56:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231994AbiEXN4W (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 May 2022 09:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238114AbiEXN4U (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 May 2022 09:56:20 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 462911054B
        for <kernel-janitors@vger.kernel.org>; Tue, 24 May 2022 06:56:19 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OCxLNc001543;
        Tue, 24 May 2022 13:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=pSWOOPQhYMuBRTAJB8doqEdxYAkrIOLVCk7rrEwnbjI=;
 b=hpXcOHm2yG3Oy0BCFWR81CGaB8TBg6doGCoAM27hik2znIi15AodlHTm6KoFycY2WD5M
 aJYh0lUmRiqlvadVDutCrnabgquh8qeDCJa9ZbKJiKEHHh9F8qaTPHHs38srNJ9asa61
 4YxaTz8BNCQhvgwNu73Q9zaksRm2NCDY0ZOWJA8wR3W5dvsISLw4ZCmCRwHjXlmGQ6zn
 SYsnAc7ilqXCcJA9a7Jww4Lp4iwotG46z7KH47LvnPaOIGbHH2nZkGuDR/VkFozoJfh4
 eCqWD/uCKcFL6I+CREZb+dx9HpA5zc9SRkI5/rwK9ZumOmeBSofry6DHqqDf+jig0FoB fg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6pgbpd5b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 May 2022 13:56:12 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24ODtt3C033070;
        Tue, 24 May 2022 13:56:12 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3g6ph8u6y7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 May 2022 13:56:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9RdEOdWUgx+HeMvV3Kft2ykal5no3GTyU9kD+ySyypKSXRdXgRgbP/dumcWqjBmcz/ZvafdDMHTGLNUcmvUlq8fGwnsjRAp4x/GfZ2oiG+qz7AeVZswOh9MC7s13oiDQiW0V+xUPLZdjJF71etnvldbD4DOU5MIUm1nS1VC8I2wZybzGpxDIf501qh0gUvOz+2apB7YUgL1ZT9QDEvrrpmdJU3sx/IF94SpDSAtciC6r4YXxOwMZ0Z+bmvrSFD5MRSolVQEfEXQyV7twdHnlD0p/M/FSsgaO+q1RAIl5QJfjVrnmGbsQEGoRkE+1En0/agunk9bhdJ2YJWT79tbVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSWOOPQhYMuBRTAJB8doqEdxYAkrIOLVCk7rrEwnbjI=;
 b=lTxcG7m802OUHkGFQ/f1ZZPT1QgvtPsoGttNc+Qe5PnMZ2cp2wPnZ7lg7oIrl34ov2PyGGoozi9jH4rXYfyG+BWNMsCsnpRrG1KQcPcp/p0OR4w4rxZfM+3QQ2eESk08f1Ycv+bjgYnaSwEYHQxYT9LpsZlqOD/7/XpFwb+s6APED9knPNtRSImTc8SVygHexzCpTr/pf7k4ahdPavPe3iQeRPgA+h1XXansFTQzcXwsKUp+AaQ+oB+j5ZSLDi+iwZx0AaEVw0WI5ulrdL38VqYq9EdQgUrzktmPLMwfguWpw8g3Y+Q8mwMkhDA3o9TksvVzmCKkW3I51xyAMl4VjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSWOOPQhYMuBRTAJB8doqEdxYAkrIOLVCk7rrEwnbjI=;
 b=lCvuoit/ffZWHnc+IpFcSmRxo6AYTrQxLz5HbeqAIGY7Le15Hu9L8XYuC6d+w7E2ZNPta9CM93zJHlwyLJjdwnYG82jGRF/g5c89MKODehNoQ6zxPTNfxKCpWr+IKAjUeJSeKrhTvqnS5qIBMv1KW7OabGkavQvXBDLSWpyuYxI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SN6PR10MB2672.namprd10.prod.outlook.com
 (2603:10b6:805:4c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 13:56:10 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 13:56:10 +0000
Date:   Tue, 24 May 2022 16:56:00 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ynudelman@habana.ai, Oded Gabbay <ogabbay@kernel.org>
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] habanalabs: convert ts to use unified memory manager
Message-ID: <Yozj8HcJ3uTqd0c7@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0185.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cc56277-0c12-4627-27e1-08da3d8d281c
X-MS-TrafficTypeDiagnostic: SN6PR10MB2672:EE_
X-Microsoft-Antispam-PRVS: <SN6PR10MB2672240C81421E44E5E359588ED79@SN6PR10MB2672.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BwWF0xYkgfVz0UmDJmH2L+sY+Y7nCFqKozVOxPTR6DVjLPNzoh+zCO6qoME/9/99mlB6Y7m8mF5B8o+QWI2QG3kJ2DG9St4gVqJFNtujKNIMPxdNIPEt4HUyhjVAiqH9FdESXATuWIeLOtRZ2tBAQn9t3u1e2JKoEqiymo+Awn2XwStVu7jx7LycYvC3ps1AJP/PPm+SUSKvxyRbgJsUb0LcHIQiWhhDP+EPr8L9dWGInIYhO29ekrMuiwmbrlPSkKLK7FUysHB+lV69A4scgAmgngyP8nRcBsghuqP68fX4WLF58aDkd3wg0jcfZhQPAyiqjG8FXr8Z2gDmAs7AmwbC07GYwfh1lFRweycnD97t6zcQzZ5VJ7lOFBoKLCRryO+MbEs8p2LaninzpaQL4nRdBKtTEniFKF2KLIev9RQCu3sDuMbHxvwZkP+zQp1U1f1WzXBB1jrkcxAwIijlo1S+gBB/QT49wL7BkclpRRAuJ/nVtJ5Bq6SnbIvHnL9vLy1ap2puP6GPjf21FQ7a2BfpxUPzXzScQ/IdmCden0eaewdZEMPUmdnml6yTLhNDOaUWE94MO+PkaI6LNwrSBh/axbNqXwn1q22nXs2icUqHPn5/SpJo5Md+h8qv3gkhc+P3HcOEgDhSejhvBYRQvsHPj77iKwljONl7EVE1YCLfVkMuHyM1CSiAAKHPkUykHR0HHiADWB/ULVz69xColFw9//mqyOdCFEaPPJ9yNVo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(4326008)(8676002)(38100700002)(5660300002)(8936002)(38350700002)(44832011)(66556008)(66476007)(66946007)(6512007)(9686003)(6916009)(316002)(508600001)(6486002)(83380400001)(2906002)(33716001)(186003)(52116002)(6506007)(26005)(86362001)(6666004)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?auPYjm7iub5fNPYTSBuwx19g07G/0wHxf4iu1xEluyAXJN18DMtTfliuV2Ey?=
 =?us-ascii?Q?cN1eNbFTZogMM9pcyilfuJDNNBZAillNCarQHpLSpDFYQP/4MduHTkkn9+Tt?=
 =?us-ascii?Q?rikudfzIZIijbvYdMN7lpcsiyhel7Fqvftquj1rtbKZrvnW83FThbCZsjDN9?=
 =?us-ascii?Q?RjXyH0bTUeTb/guFgJOGI/5q6wZoIyLmRhfgnd/iz2vVDl8AJ7ev9JjCDYlA?=
 =?us-ascii?Q?On7+zIb0jEYooqpRDx4qpX2Klg/b/+Otm2eThukFddNzWPvgxzErsiGP8ZsW?=
 =?us-ascii?Q?i7+kDjFqhPojFK/ngXVl/10886aOY4wBVn1x7gJbCJ5NW0ILUVVXp60GzjQV?=
 =?us-ascii?Q?wTCno+/I7KZS+rkFvLRYdwar+E+FzGO/eXKot+165UNn0YdCONkzcmkMfAnM?=
 =?us-ascii?Q?/Uxs25y8eL3avqTvUM5iS506BMTIjzD1FKgTyaQO3hMbDBHC416P+rXjxUvM?=
 =?us-ascii?Q?rrgdW8UZzaV4Y311sLaeH7uSwqAD7lvS7sy5MhQ2ajxDdWbJfuMqQBW95QLq?=
 =?us-ascii?Q?NZ2EthJ2L07pOczP5kjy+D95XjEBTJRVGC69wAci7LPS0t2WVdtdV3Saz8m1?=
 =?us-ascii?Q?hJ3/wk6aqmkrV9XE1QbzzC03r6U8eMObOmmH5eQzp/5ijEFIKcSnWfnzVAbh?=
 =?us-ascii?Q?irCYTLR4wgiIo1XUizetbOFLbcC1MQRm//uXwxpo3pwCr3cjaNdTmp0aeSYW?=
 =?us-ascii?Q?6scDUHxJ+6b1sk0ieK2Bi05IoL5IMDiDmgOWYF91p7zgzzgsauR+YWKn8zZI?=
 =?us-ascii?Q?n4GzalJ9+Oz4YAEb6oFgZjCJPlvC9c+LLNzwdqbGohq4wFeyPBO3VxE/Xaa9?=
 =?us-ascii?Q?Y6Lua19WYGlnTIJiwyhDXiiDjda/q33nfSn1dtaglwACyL2aiPnc9esi/FXW?=
 =?us-ascii?Q?zpaVbRNtA5LMb4UVxjHnHCeFiOChwfmdo5EadCR68LC5IV+HijX8Q1pz21nE?=
 =?us-ascii?Q?uIL5IwP5WZhn2TbrBPdkB8985IOFj/1FMkFAK2VujSVwq5HwneFPpGdSLgRF?=
 =?us-ascii?Q?9eYKFEj3KlTZtkUC5BhvQ0PSrax9kOpT3TL4aAoFQx6J1WKiCwCMIhE7Svtg?=
 =?us-ascii?Q?D43OsC8JJs2sj8ONKnF3CM0ubvWinb7XBgOUrzZPXFW96jMyCk0mfye3eY87?=
 =?us-ascii?Q?8N9WifmhLiA3JQYVqMy9+szVH6uIEi3uxYBzqGR/Gy+DZ8ZnM9r/KFCTC0LR?=
 =?us-ascii?Q?/Ln8NIyJGrX8qqW7lpqhjABHx4rRE6x+09e0us9JK5OlfW6/QlQauBvZ/KOC?=
 =?us-ascii?Q?cCasxzlTRBJlcba0zH9b+11u8qqqtE6y8QrtgX2F+0YP7y2YLrbLOum2/iv7?=
 =?us-ascii?Q?QKqJEm8xKIktF84vYaB4BztE625DQVpMkvpQ2Xg435rwaKQefTROocSxRIeo?=
 =?us-ascii?Q?jrP3fwF1PbV4kH/jh9IZvt0Id7Q/LKEexOsgFqeAz6H4ARiGGTSjQ5wZnTIA?=
 =?us-ascii?Q?CyOXiJzHHKUGmXlggN9N3koopcJhKm0VAawQ0z3TCT+tGgM61rb1O2vG1w/+?=
 =?us-ascii?Q?XXubP3wx+gtG6KcczDMEpQcFLRGmjQZtN9/QY8vAYTaQJ+GMJDeqKQyUih/W?=
 =?us-ascii?Q?b8GYqyAWK3DGI1vRGsY5aEYd1QZHRHIaEvd1ueV2CiGpxlYobVknw3u6YaRH?=
 =?us-ascii?Q?UJ47ExzEfi2CYeV0kM6Q6RRxCn/ItfDcUNOSnOEHCMgSuVwFK/Wlv1drK5Wh?=
 =?us-ascii?Q?vOnD8E2XHtrZB6w6NQ2sv0JqIMvszLNFGG4kzz8vxnjaspxn9Gvn+m9nu/ER?=
 =?us-ascii?Q?jbbVUxMJZWqAWtLNnSzS2Mxw4l4Y8tc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc56277-0c12-4627-27e1-08da3d8d281c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 13:56:10.0525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+0VnrRa415mvq3OYQaWR+0R48wFVedCITFhznLUuU+xlHTRLt7t50RjQgA6EIwrvQ2Tui/3LSO7gfwSI+qU6g1YRb1yLdaXYphuma7yXpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2672
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.874
 definitions=2022-05-24_05:2022-05-23,2022-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=652
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205240071
X-Proofpoint-ORIG-GUID: vp4Q18PzrAfbTouEQvBIwQ4sWLtVBvbm
X-Proofpoint-GUID: vp4Q18PzrAfbTouEQvBIwQ4sWLtVBvbm
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Yuri Nudelman,

The patch 4d530e7d121a: "habanalabs: convert ts to use unified memory
manager" from Mar 20, 2022, leads to the following Smatch static
checker warning:

	drivers/misc/habanalabs/common/memory.c:2117 hl_ts_alloc_buf()
	warn: use 'gfp' here instead of GFP_XXX?

drivers/misc/habanalabs/common/memory.c
    2107 static int hl_ts_alloc_buf(struct hl_mmap_mem_buf *buf, gfp_t gfp, void *args)
    2108 {
    2109         struct hl_ts_buff *ts_buff = NULL;
    2110         u32 size, num_elements;
    2111         void *p;
    2112 
    2113         num_elements = *(u32 *)args;
    2114 
    2115         ts_buff = kzalloc(sizeof(*ts_buff), GFP_KERNEL);
                                                     ^^^^^^^^^^
The "gfp" is sometimes GFP_ATOMIC so that suggests that this is a bug.
However, I can't immediately see why it nees to be atomic.  As far as
I can see the callers are holding mutexes not spinlocks.  But I have
not looked hard.

    2116         if (!ts_buff)
    2117                 return -ENOMEM;
    2118 
    2119         /* Allocate the user buffer */
    2120         size = num_elements * sizeof(u64);
    2121         p = vmalloc_user(size);

It's concerning that there are no integer overflow checks.  I feel like
someone should make a vmalloc_array_user() or vmalloc_user_array()
function with built in integer overflow checking.

Of course vmalloc() sleeps so GFP_ATOMIC doesn't really help.  There
should be a Smatch warning for GFP_ATOMIC followed by a sleeping
function with no preempt enable in between...  #Idea #EasyToImplement

The way to do it would be to look for GFP_ATOMIC.  Hook into the
preempt_enable() hook in check_preempt_info.c.  Add a hook into the
check_sleep_info.c.
1) If we see an ATOMIC, set the state to &atomic.
2) If we see a preempt_enable() then set then set the state to &undefined
3) If we see a sleep() then check for if the state can be &atomic and
   if so then print a warning.

    2122         if (!p)
    2123                 goto free_mem;
    2124 
    2125         ts_buff->user_buff_address = p;
    2126         buf->mappable_size = size;
    2127 
    2128         /* Allocate the internal kernel buffer */
    2129         size = num_elements * sizeof(struct hl_user_pending_interrupt);
    2130         p = vmalloc(size);

Use vmalloc_array() to prevent integer overflows.

    2131         if (!p)
    2132                 goto free_user_buff;
    2133 
    2134         ts_buff->kernel_buff_address = p;
    2135         ts_buff->kernel_buff_size = size;
    2136 
    2137         buf->private = ts_buff;
    2138 
    2139         return 0;
    2140 
    2141 free_user_buff:
    2142         vfree(ts_buff->user_buff_address);
    2143 free_mem:
    2144         kfree(ts_buff);
    2145         return -ENOMEM;
    2146 }

regards,
dan carpenter
