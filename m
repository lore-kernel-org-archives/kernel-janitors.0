Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071C5C433FE
	for <kernel-janitors@archiver.kernel.org>; Fri,  8 Oct 2021 06:37:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D930D60F11
	for <kernel-janitors@archiver.kernel.org>; Fri,  8 Oct 2021 06:37:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhJHGjU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 8 Oct 2021 02:39:20 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:60438 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229693AbhJHGjT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 8 Oct 2021 02:39:19 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1984rpFS007639;
        Fri, 8 Oct 2021 06:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=O5iqP7I5vXrjzrx3Hn2VEKsYdy6WbmyOzOnwOfYCJXw=;
 b=cUmgWeLyfKgZD0st8M8/NnqC6e8KG8XQOPviDPn5nOyer74N21O61/DXv56PhYK1e+/z
 VSIBZpoqlqq9xt42qQNN15SgRHCf8uK5IzpEQa19Q6FDj8kHLn9R8HIQjF8K3u+t3hnC
 eM1Iusc5FJi5nxY5B3vQtGMBIbof0MkCZ8k/iU3FTavCreImpqc+fjd+PvAxp1as1M+z
 Fwlzk0C2iycsarOFPhz/QJp2dba9U/L1kktGsYCcO24rZx2Ibnu6Q0SG8h/ZocBFdMvC
 oJM6WNS9dZg8Pd860fSNleH+uG/iyNXqdSL6y/hwMd2YopRVpQ6EbO5XFGf9Cn3krSjL rg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bj0pw601y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 08 Oct 2021 06:37:22 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1986U86j033078;
        Fri, 8 Oct 2021 06:37:21 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
        by aserp3030.oracle.com with ESMTP id 3bev7xk7qp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 08 Oct 2021 06:37:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPV/ejiMtQ5/OfU/mA+SjqFwzbd3/F3fFS1plpy3Sk1bQ5ECTMfWp0uOBPlJvhqBboaXn1cEnfBmkh0rzYm9SiGp2evO0dmQk0f00p9/ynw3nvsaFEXqan2/fRaZSzjV/uuC6LPhKKlqKDkpsSBgppfJqitW/zky6breOZmOexTZpkzkoeIDKEs3i0whU2FeNFSPCkdBQTVUJiYF+23/2caO+WwvuGSg0554c7zelmt+zbpdazRNUzBhaON8elBfXAE5ZE4P3WQlC9RvBc3f7OVrtz3jbcxlZk0J8s7iOnTESfWr6BKZ1FbHc+IgDZ32v0wmMr8USy/itUIVtuYTww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5iqP7I5vXrjzrx3Hn2VEKsYdy6WbmyOzOnwOfYCJXw=;
 b=Ktp1PCMtj7hTBkHqIcqPTGbvFU7YbMrLCSZcolHAKvdvG+E6XPazMYFWBqRA5mcrWvpJtN4tdnqyiZYkLsL+KfIPBo+1AiGIsFAG85ABx9Mh+gv5i3Wr3EP51nCvrpA9hCE1dtwkBoKKHA+dXN+YT3yJYSmLUKVCvwZQRUr/tVlExXu0CiCVjD+rKWeA0rwSlENNXO0PSwRuEd177jtGOhgh2hv+5GOQ8BVnuFlPU/ZlOhuS00v2Nc3+2EYfrquWGLBTdjNio5P/isgp9tMj2c3qL/KMX2ZrHPdtsuNV7LeGssQHuRWumSWicZAPjKoFAfxa91NxJ9XaxokDgjmkPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5iqP7I5vXrjzrx3Hn2VEKsYdy6WbmyOzOnwOfYCJXw=;
 b=ryBRqqAlmwpUGimY47SygfQx95P90jIsXMw5i8JxPOXiaMrVlRBI7LSIQQF113eDkhyVZBizGyrwRpVcf41OPMryMdpSur2X/Q0qCinqOZMZBnqjwgWTMZsO2ifAA2kUlYZc9rNZoHOJutMOnYsZxQRgtRSRYSR8rIhnDJqrOQM=
Authentication-Results: fb.com; dkim=none (message not signed)
 header.d=none;fb.com; dmarc=none action=none header.from=oracle.com;
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by CY4PR10MB1287.namprd10.prod.outlook.com
 (2603:10b6:903:2b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Fri, 8 Oct
 2021 06:37:19 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::3ca0:1eb2:50b7:8897]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::3ca0:1eb2:50b7:8897%6]) with mapi id 15.20.4566.023; Fri, 8 Oct 2021
 06:37:19 +0000
Date:   Fri, 8 Oct 2021 09:37:04 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     terrelln@fb.com, stanjo74 <stanjo@usa.net>
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] lib: zstd: Upgrade to latest upstream zstd version
 1.4.10
Message-ID: <20211008063704.GA5370@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0150.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::14) To CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0150.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 06:37:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6f4b7d5-11d5-4530-7091-08d98a261342
X-MS-TrafficTypeDiagnostic: CY4PR10MB1287:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR10MB128702D03EE786556EEBE9CB8EB29@CY4PR10MB1287.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RTVcJR+qDLubZJWGshJcYwkYoPkMHQKrN9mMP2OnHnitN63c2IFlaa/Bi2s/22DbM5I66Tb5t0JuapBZ71vC5kPG+RGWgmitOJ4lifG3P53NLQi3Xy4Rs9eG+Czd7rMpKrKhqAd/3uy7cx8/SjjpkHC5ayZDTvTqWmXY4K9k6AtfVSI3UhQb3L3+Zg87hipu3ByKZgCc7fGrs81IU0wy5muXnkqYB+LhH+n4AzuFZLjebaMXwZQ+r4oiuAruXicT52khRS6tUOAncWj6JIpvhAxjLmPNo6/dgh9HuM3C3B0vbCbVv1QsqQ2OqE9QnxUZCB8+GWXb4Qj881r9cg29HeNqgW0UXHh9kA530+WyBMk+kTyLnmhVUA9djVa0ulgO/+v/qbsaFmM4X/R7NgE+NT/pvI/jMeoYM95tUeW4yOrj4rJeF1pbZdYcG6hLl7ImjjWQyXMI4Wsp/17qxJDgtvE+5jR7bntuQVUOLTJuQfq/Kgp6Cy5EfVc7+w8wVCqrcmYj+YIUr81Ja8E9/NyVXckYTSzKF4UF13qXF9d4IuWW3Lku+s/xOeClggAEWgrGCkq2zeETKiOJHVEb2Rwg/V3ifVwporS/d3LpoqTjckBIdBlqwALdajDvmV6zt4M+WHfV0wyAz3OQ4O+i204AueTIUNfqZ/HgkgIfIDVRxbcds1Z5xPKVMKLTG6TT3uPur+kfXJVy2qbRHIg2SkXgTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2358.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(1076003)(9686003)(8936002)(2906002)(956004)(4326008)(508600001)(186003)(26005)(30864003)(86362001)(52116002)(8676002)(33656002)(9576002)(6496006)(38100700002)(66556008)(66946007)(6916009)(66476007)(6666004)(83380400001)(316002)(5660300002)(44832011)(55016002)(38350700002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rff4Xk2NoPG4uMH9d31jXW1fTm8pFo9Oo1+x4bX+Ln/4z4QnxmXc/S0JZDYr?=
 =?us-ascii?Q?1mMGP6jv5LOhKTAwdpfAyMQcWSuPVW63k+INYp9LqX3dtIkrHZW4zTgA7YK8?=
 =?us-ascii?Q?quMikPOYm5+hQE144YPz8QZZl4CmolHOeS3zh1o7QdPVarj3yA69W8FOFTrz?=
 =?us-ascii?Q?13TcA7NgvLwuVQIQAndt8qFktUQ/Q+MxNDJoew5w+G+JScj0UnQ24tIDVLX6?=
 =?us-ascii?Q?TnuOvZ81/2F0ESWQGkNXn9jIdPF7nvqwOQbX1YTrjHuxRSczUS91A/GQgauI?=
 =?us-ascii?Q?LMIiW3OeXLmcBXrDnGwKwdfeCCl2L02d02zzEXs8NPlvXGZ8qVJ360fs7j8U?=
 =?us-ascii?Q?z0QUWcadzi48CCOYuWYQVW1brme901tnpVwLWVKte/Z2E8j/Rr2T19m+2Mlw?=
 =?us-ascii?Q?g7uRO8oFgSP3Men0ybAp88ogI9kkndNba4ko5uo4W8uHWpt+C3qdAT9jZKBN?=
 =?us-ascii?Q?opvLkRbI1epdOYOJa9ExfEOwzLUmLu0dpl37nv1yPbG9BZYO5I01+1UeHviL?=
 =?us-ascii?Q?I0FhjFzjR+HoWnum9CpHqLWkfr6z6+fHhbDoQA5nP5tFGR7TVXim7qf2Frci?=
 =?us-ascii?Q?tpGFac9ZgcYl2OyH8icqqQCL+oriuMm2UJ3/4QnYoa4yrHIJZ3Zp7ueCn7pW?=
 =?us-ascii?Q?D+H4EGuK+EHSbyU8Sb+yiI5k7fgY8LBb1+1oenHySo1DXWow4ErLSZQkhBs1?=
 =?us-ascii?Q?Q8WMliQAQUgYjGMh6bLKGw3lSQSwiqjVqV8TJUHvwueInMIrYrpxJoxdzpSb?=
 =?us-ascii?Q?IqdMauQyJk16/nYWSTy3g0zQAuH5cG/7crn3y9H0ftTmm33UMUMKQf1tv6G+?=
 =?us-ascii?Q?Kr6Es/+lEkpUkCt+hlyisQ2VPQqnyRrOrtTMZGV7cc+cbubHL3oFj4VwL4iU?=
 =?us-ascii?Q?v8OhI8AoOq0exsPmNwwTPG6VfuxW+dxT+wQ1X366xCz2Fs3TBMCsv/CCaPfn?=
 =?us-ascii?Q?Slsfyn4nuBKY78yq8qk6KPrD+1rXilCSIYeaKVX7veWQU4whf7GXVZLYpQOx?=
 =?us-ascii?Q?0t3l/Spf9eF9N/ZlXI9JBH7AR+soUquJ2CdhzDgwWb2QTHCn+SkKkr+KDecC?=
 =?us-ascii?Q?AuQWpJzVGR39ZiMC1rYB7EzyE9gOk3eEsHdgsPjr0uMNPOmWWNehkQQp/Awb?=
 =?us-ascii?Q?Naz63DnWKe55vIO099yW3h3rfZelcgHyOZ6PX3VoDRyy/GVjFNYJzVCima1a?=
 =?us-ascii?Q?vthWZYH/ukQjX+N0fQS9SpctfQ+R0mya0gqQfN8LEZVBft+F/RIaiIM20VYH?=
 =?us-ascii?Q?56mM8noxlupO8kbwHYPhcgQl/VyoDKZ+BLYR9A+WQJCE/pVdrQ7bkKEEoAWq?=
 =?us-ascii?Q?nP/DE3/Z00p5hJHVLuh9w7v7?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f4b7d5-11d5-4530-7091-08d98a261342
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 06:37:19.1484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqn/O4veyRi18Q7+tRZgQSk9kFSHrvIEr8YJEmG4PRYKIMbVw/L5CoYkDM0HDV384Gba1adBmGLuAxez6xqIU6Uatqh2u7hblgHgYiFvtv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1287
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10130 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110080038
X-Proofpoint-ORIG-GUID: ylM9h6E3Ebq5JMCTmEhJUTP48DjY23IO
X-Proofpoint-GUID: ylM9h6E3Ebq5JMCTmEhJUTP48DjY23IO
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Nick Terrell,

I grepped the README for zstd and it doesn't appear there is a mailing
list to add to the CC.

The patch c684b4e9a301: "lib: zstd: Upgrade to latest upstream zstd
version 1.4.10" from Sep 11, 2020, leads to the following Smatch static
checker warnings:

lib/zstd/compress/zstd_opt.c:695 ZSTD_insertBtAndGetAllMatches() warn: should this be 'nbCompares == -1'
lib/zstd/compress/zstd_lazy.c:360 ZSTD_DUBT_findBestMatch() warn: should this be 'nbCompares == -1'
lib/zstd/compress/zstd_lazy.c:1267 ZSTD_compressBlock_lazy_extDict_generic() warn: inconsistent indenting
lib/zstd/compress/zstd_compress.c:726 ZSTD_CCtxParams_setParameter() warn: no lower bound on 'value'
lib/zstd/decompress/zstd_decompress.c:177 ZSTD_createDDictHashSet() warn: variable dereferenced before check 'ret' (see line 174)

lib/zstd/compress/zstd_opt.c
    508 FORCE_INLINE_TEMPLATE
    509 U32 ZSTD_insertBtAndGetAllMatches (
    510                     ZSTD_match_t* matches,   /* store result (found matches) in this table (presumed large enough) */
    511                     ZSTD_matchState_t* ms,
    512                     U32* nextToUpdate3,
    513                     const BYTE* const ip, const BYTE* const iLimit, const ZSTD_dictMode_e dictMode,
    514                     const U32 rep[ZSTD_REP_NUM],
    515                     U32 const ll0,   /* tells if associated literal length is 0 or not. This value must be 0 or 1 */
    516                     const U32 lengthToBeat,
    517                     U32 const mls /* template */)
    518 {
    519     const ZSTD_compressionParameters* const cParams = &ms->cParams;
    520     U32 const sufficient_len = MIN(cParams->targetLength, ZSTD_OPT_NUM -1);
    521     const BYTE* const base = ms->window.base;
    522     U32 const curr = (U32)(ip-base);
    523     U32 const hashLog = cParams->hashLog;
    524     U32 const minMatch = (mls==3) ? 3 : 4;
    525     U32* const hashTable = ms->hashTable;
    526     size_t const h  = ZSTD_hashPtr(ip, hashLog, mls);
    527     U32 matchIndex  = hashTable[h];
    528     U32* const bt   = ms->chainTable;
    529     U32 const btLog = cParams->chainLog - 1;
    530     U32 const btMask= (1U << btLog) - 1;
    531     size_t commonLengthSmaller=0, commonLengthLarger=0;
    532     const BYTE* const dictBase = ms->window.dictBase;
    533     U32 const dictLimit = ms->window.dictLimit;
    534     const BYTE* const dictEnd = dictBase + dictLimit;
    535     const BYTE* const prefixStart = base + dictLimit;
    536     U32 const btLow = (btMask >= curr) ? 0 : curr - btMask;
    537     U32 const windowLow = ZSTD_getLowestMatchIndex(ms, curr, cParams->windowLog);
    538     U32 const matchLow = windowLow ? windowLow : 1;
    539     U32* smallerPtr = bt + 2*(curr&btMask);
    540     U32* largerPtr  = bt + 2*(curr&btMask) + 1;
    541     U32 matchEndIdx = curr+8+1;   /* farthest referenced position of any match => detects repetitive patterns */
    542     U32 dummy32;   /* to be nullified at the end */
    543     U32 mnum = 0;
    544     U32 nbCompares = 1U << cParams->searchLog;
            ^^^^^^^^^^^^^^
This is unsigned.


    545 
    546     const ZSTD_matchState_t* dms    = dictMode == ZSTD_dictMatchState ? ms->dictMatchState : NULL;
    547     const ZSTD_compressionParameters* const dmsCParams =
    548                                       dictMode == ZSTD_dictMatchState ? &dms->cParams : NULL;
    549     const BYTE* const dmsBase       = dictMode == ZSTD_dictMatchState ? dms->window.base : NULL;
    550     const BYTE* const dmsEnd        = dictMode == ZSTD_dictMatchState ? dms->window.nextSrc : NULL;
    551     U32         const dmsHighLimit  = dictMode == ZSTD_dictMatchState ? (U32)(dmsEnd - dmsBase) : 0;
    552     U32         const dmsLowLimit   = dictMode == ZSTD_dictMatchState ? dms->window.lowLimit : 0;
    553     U32         const dmsIndexDelta = dictMode == ZSTD_dictMatchState ? windowLow - dmsHighLimit : 0;
    554     U32         const dmsHashLog    = dictMode == ZSTD_dictMatchState ? dmsCParams->hashLog : hashLog;
    555     U32         const dmsBtLog      = dictMode == ZSTD_dictMatchState ? dmsCParams->chainLog - 1 : btLog;
    556     U32         const dmsBtMask     = dictMode == ZSTD_dictMatchState ? (1U << dmsBtLog) - 1 : 0;
    557     U32         const dmsBtLow      = dictMode == ZSTD_dictMatchState && dmsBtMask < dmsHighLimit - dmsLowLimit ? dmsHighLimit - dmsBtMask : dmsLowLimit;
    558 
    559     size_t bestLength = lengthToBeat-1;
    560     DEBUGLOG(8, "ZSTD_insertBtAndGetAllMatches: current=%u", curr);
    561 
    562     /* check repCode */
    563     assert(ll0 <= 1);   /* necessarily 1 or 0 */
    564     {   U32 const lastR = ZSTD_REP_NUM + ll0;
    565         U32 repCode;
    566         for (repCode = ll0; repCode < lastR; repCode++) {
    567             U32 const repOffset = (repCode==ZSTD_REP_NUM) ? (rep[0] - 1) : rep[repCode];
    568             U32 const repIndex = curr - repOffset;
    569             U32 repLen = 0;
    570             assert(curr >= dictLimit);
    571             if (repOffset-1 /* intentional overflow, discards 0 and -1 */ < curr-dictLimit) {  /* equivalent to `curr > repIndex >= dictLimit` */
    572                 /* We must validate the repcode offset because when we're using a dictionary the
    573                  * valid offset range shrinks when the dictionary goes out of bounds.
    574                  */
    575                 if ((repIndex >= windowLow) & (ZSTD_readMINMATCH(ip, minMatch) == ZSTD_readMINMATCH(ip - repOffset, minMatch))) {
    576                     repLen = (U32)ZSTD_count(ip+minMatch, ip+minMatch-repOffset, iLimit) + minMatch;
    577                 }
    578             } else {  /* repIndex < dictLimit || repIndex >= curr */
    579                 const BYTE* const repMatch = dictMode == ZSTD_dictMatchState ?
    580                                              dmsBase + repIndex - dmsIndexDelta :
    581                                              dictBase + repIndex;
    582                 assert(curr >= windowLow);
    583                 if ( dictMode == ZSTD_extDict
    584                   && ( ((repOffset-1) /*intentional overflow*/ < curr - windowLow)  /* equivalent to `curr > repIndex >= windowLow` */
    585                      & (((U32)((dictLimit-1) - repIndex) >= 3) ) /* intentional overflow : do not test positions overlapping 2 memory segments */)
    586                   && (ZSTD_readMINMATCH(ip, minMatch) == ZSTD_readMINMATCH(repMatch, minMatch)) ) {
    587                     repLen = (U32)ZSTD_count_2segments(ip+minMatch, repMatch+minMatch, iLimit, dictEnd, prefixStart) + minMatch;
    588                 }
    589                 if (dictMode == ZSTD_dictMatchState
    590                   && ( ((repOffset-1) /*intentional overflow*/ < curr - (dmsLowLimit + dmsIndexDelta))  /* equivalent to `curr > repIndex >= dmsLowLimit` */
    591                      & ((U32)((dictLimit-1) - repIndex) >= 3) ) /* intentional overflow : do not test positions overlapping 2 memory segments */
    592                   && (ZSTD_readMINMATCH(ip, minMatch) == ZSTD_readMINMATCH(repMatch, minMatch)) ) {
    593                     repLen = (U32)ZSTD_count_2segments(ip+minMatch, repMatch+minMatch, iLimit, dmsEnd, prefixStart) + minMatch;
    594             }   }
    595             /* save longer solution */
    596             if (repLen > bestLength) {
    597                 DEBUGLOG(8, "found repCode %u (ll0:%u, offset:%u) of length %u",
    598                             repCode, ll0, repOffset, repLen);
    599                 bestLength = repLen;
    600                 matches[mnum].off = repCode - ll0;
    601                 matches[mnum].len = (U32)repLen;
    602                 mnum++;
    603                 if ( (repLen > sufficient_len)
    604                    | (ip+repLen == iLimit) ) {  /* best possible */
    605                     return mnum;
    606     }   }   }   }
    607 
    608     /* HC3 match finder */
    609     if ((mls == 3) /*static*/ && (bestLength < mls)) {
    610         U32 const matchIndex3 = ZSTD_insertAndFindFirstIndexHash3(ms, nextToUpdate3, ip);
    611         if ((matchIndex3 >= matchLow)
    612           & (curr - matchIndex3 < (1<<18)) /*heuristic : longer distance likely too expensive*/ ) {
    613             size_t mlen;
    614             if ((dictMode == ZSTD_noDict) /*static*/ || (dictMode == ZSTD_dictMatchState) /*static*/ || (matchIndex3 >= dictLimit)) {
    615                 const BYTE* const match = base + matchIndex3;
    616                 mlen = ZSTD_count(ip, match, iLimit);
    617             } else {
    618                 const BYTE* const match = dictBase + matchIndex3;
    619                 mlen = ZSTD_count_2segments(ip, match, iLimit, dictEnd, prefixStart);
    620             }
    621 
    622             /* save best solution */
    623             if (mlen >= mls /* == 3 > bestLength */) {
    624                 DEBUGLOG(8, "found small match with hlog3, of length %u",
    625                             (U32)mlen);
    626                 bestLength = mlen;
    627                 assert(curr > matchIndex3);
    628                 assert(mnum==0);  /* no prior solution */
    629                 matches[0].off = (curr - matchIndex3) + ZSTD_REP_MOVE;
    630                 matches[0].len = (U32)mlen;
    631                 mnum = 1;
    632                 if ( (mlen > sufficient_len) |
    633                      (ip+mlen == iLimit) ) {  /* best possible length */
    634                     ms->nextToUpdate = curr+1;  /* skip insertion */
    635                     return 1;
    636         }   }   }
    637         /* no dictMatchState lookup: dicts don't have a populated HC3 table */
    638     }
    639 
    640     hashTable[h] = curr;   /* Update Hash Table */
    641 
    642     while (nbCompares-- && (matchIndex >= matchLow)) {
                   ^^^^^^^^^^^^
This is a post op so it will exit the loop with nbCompares set to -1U.

    643         U32* const nextPtr = bt + 2*(matchIndex & btMask);
    644         const BYTE* match;
    645         size_t matchLength = MIN(commonLengthSmaller, commonLengthLarger);   /* guaranteed minimum nb of common bytes */
    646         assert(curr > matchIndex);
    647 
    648         if ((dictMode == ZSTD_noDict) || (dictMode == ZSTD_dictMatchState) || (matchIndex+matchLength >= dictLimit)) {
    649             assert(matchIndex+matchLength >= dictLimit);  /* ensure the condition is correct when !extDict */
    650             match = base + matchIndex;
    651             if (matchIndex >= dictLimit) assert(memcmp(match, ip, matchLength) == 0);  /* ensure early section of match is equal as expected */
    652             matchLength += ZSTD_count(ip+matchLength, match+matchLength, iLimit);
    653         } else {
    654             match = dictBase + matchIndex;
    655             assert(memcmp(match, ip, matchLength) == 0);  /* ensure early section of match is equal as expected */
    656             matchLength += ZSTD_count_2segments(ip+matchLength, match+matchLength, iLimit, dictEnd, prefixStart);
    657             if (matchIndex+matchLength >= dictLimit)
    658                 match = base + matchIndex;   /* prepare for match[matchLength] read */
    659         }
    660 
    661         if (matchLength > bestLength) {
    662             DEBUGLOG(8, "found match of length %u at distance %u (offCode=%u)",
    663                     (U32)matchLength, curr - matchIndex, curr - matchIndex + ZSTD_REP_MOVE);
    664             assert(matchEndIdx > matchIndex);
    665             if (matchLength > matchEndIdx - matchIndex)
    666                 matchEndIdx = matchIndex + (U32)matchLength;
    667             bestLength = matchLength;
    668             matches[mnum].off = (curr - matchIndex) + ZSTD_REP_MOVE;
    669             matches[mnum].len = (U32)matchLength;
    670             mnum++;
    671             if ( (matchLength > ZSTD_OPT_NUM)
    672                | (ip+matchLength == iLimit) /* equal : no way to know if inf or sup */) {
    673                 if (dictMode == ZSTD_dictMatchState) nbCompares = 0; /* break should also skip searching dms */
                                                             ^^^^^^^^^^^^^^
Or it could exit here.

    674                 break; /* drop, to preserve bt consistency (miss a little bit of compression) */
    675             }
    676         }
    677 
    678         if (match[matchLength] < ip[matchLength]) {
    679             /* match smaller than current */
    680             *smallerPtr = matchIndex;             /* update smaller idx */
    681             commonLengthSmaller = matchLength;    /* all smaller will now have at least this guaranteed common length */
    682             if (matchIndex <= btLow) { smallerPtr=&dummy32; break; }   /* beyond tree size, stop the search */
    683             smallerPtr = nextPtr+1;               /* new candidate => larger than match, which was smaller than current */
    684             matchIndex = nextPtr[1];              /* new matchIndex, larger than previous, closer to current */
    685         } else {
    686             *largerPtr = matchIndex;
    687             commonLengthLarger = matchLength;
    688             if (matchIndex <= btLow) { largerPtr=&dummy32; break; }   /* beyond tree size, stop the search */
    689             largerPtr = nextPtr;
    690             matchIndex = nextPtr[0];
    691     }   }
    692 
    693     *smallerPtr = *largerPtr = 0;
    694 
--> 695     if (dictMode == ZSTD_dictMatchState && nbCompares) {
                                                   ^^^^^^^^^^
The should this be check for if nbCompares == -1?  This could be
intentional.  Hard to tell.

    696         size_t const dmsH = ZSTD_hashPtr(ip, dmsHashLog, mls);
    697         U32 dictMatchIndex = dms->hashTable[dmsH];
    698         const U32* const dmsBt = dms->chainTable;
    699         commonLengthSmaller = commonLengthLarger = 0;
    700         while (nbCompares-- && (dictMatchIndex > dmsLowLimit)) {
    701             const U32* const nextPtr = dmsBt + 2*(dictMatchIndex & dmsBtMask);
    702             size_t matchLength = MIN(commonLengthSmaller, commonLengthLarger);   /* guaranteed minimum nb of common bytes */
    703             const BYTE* match = dmsBase + dictMatchIndex;
    704             matchLength += ZSTD_count_2segments(ip+matchLength, match+matchLength, iLimit, dmsEnd, prefixStart);
    705             if (dictMatchIndex+matchLength >= dmsHighLimit)
    706                 match = base + dictMatchIndex + dmsIndexDelta;   /* to prepare for next usage of match[matchLength] */
    707 
    708             if (matchLength > bestLength) {
    709                 matchIndex = dictMatchIndex + dmsIndexDelta;
    710                 DEBUGLOG(8, "found dms match of length %u at distance %u (offCode=%u)",
    711                         (U32)matchLength, curr - matchIndex, curr - matchIndex + ZSTD_REP_MOVE);
    712                 if (matchLength > matchEndIdx - matchIndex)
    713                     matchEndIdx = matchIndex + (U32)matchLength;
    714                 bestLength = matchLength;
    715                 matches[mnum].off = (curr - matchIndex) + ZSTD_REP_MOVE;
    716                 matches[mnum].len = (U32)matchLength;
    717                 mnum++;
    718                 if ( (matchLength > ZSTD_OPT_NUM)
    719                    | (ip+matchLength == iLimit) /* equal : no way to know if inf or sup */) {
    720                     break;   /* drop, to guarantee consistency (miss a little bit of compression) */
    721                 }
    722             }
    723 
    724             if (dictMatchIndex <= dmsBtLow) { break; }   /* beyond tree size, stop the search */
    725             if (match[matchLength] < ip[matchLength]) {
    726                 commonLengthSmaller = matchLength;    /* all smaller will now have at least this guaranteed common length */
    727                 dictMatchIndex = nextPtr[1];              /* new matchIndex larger than previous (closer to current) */
    728             } else {
    729                 /* match is larger than current */
    730                 commonLengthLarger = matchLength;
    731                 dictMatchIndex = nextPtr[0];
    732             }
    733         }
    734     }
    735 
    736     assert(matchEndIdx > curr+8);
    737     ms->nextToUpdate = matchEndIdx - 8;  /* skip repetitive patterns */
    738     return mnum;
    739 }

regards,
dan carpenter
