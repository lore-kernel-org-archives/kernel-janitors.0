Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E149C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 17 May 2022 13:19:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347383AbiEQNTZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 17 May 2022 09:19:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347532AbiEQNTJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 17 May 2022 09:19:09 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0917741FAA
        for <kernel-janitors@vger.kernel.org>; Tue, 17 May 2022 06:19:06 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24HAsBoP011965;
        Tue, 17 May 2022 13:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=+SLJ4gFCsl54r3Q11ZmW7NZU9/DQtAEOFLaKX8XY2VY=;
 b=a3VPrE+t8lR4qcTHqYasWQsojlwb7Jw4D8rczB3cbk9W97r8Yf9QWStl1sgCo1F5f7K+
 REjH/r9aHLfTEaR2xRA/AQMuXkB06GEoG6kTQ5KJRj902rnDv/fAdzO7dmZ8z7ANHNTJ
 mHpZamRIq0SaEbSqfvd9el5bCLqgIFo8noAq1nLj86EbuTC0jk2Ql277Op+TP5ECV4TB
 Q9N8yGbLlaK7EA/+OfTono39NrVGZHXvYkbArNeExYOTCVvmPG+uju+aTNTqBHV5RDSf
 KbahfU4+vJd44bQYHk3EBEwCeOZyuclaKQFfCGxPtxcyNRP3T0JGYdddNQYs/SoPeYjZ yg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g241s66e3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 17 May 2022 13:19:04 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24HDFxSw010471;
        Tue, 17 May 2022 13:19:03 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2045.outbound.protection.outlook.com [104.47.73.45])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3g22v329dm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 17 May 2022 13:19:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLa0s40KCWaGuLSHOtWbkcdXT3GH6h0twu5lLS4mm1YibyBIzcJ/roM2/iS0bjHuCyBT3pO64T7YIUirYYokRigOaHWParyPXJVX5k/QiW2+r0dlihW6umd2Htusztb4TiLaZ76RjfHBItkazYvDu318Ccx2AIq3ojL9RKnn0YoFx4IeZo5LLaNdZAOkWxWsM4zZ/ZUjSDP+pQWmeXyBcbb7NcGcTo2TWqoa4LITmPXCMDt+TbzMno7DBavRFxziNmQabwkRnknU30r2VEqXFK0tY1pxWV/7xUf+ifT1m0ku7AYkmDHQcBlgcNDhIKlST1aXl5vZ2GVca3HY5HXQxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SLJ4gFCsl54r3Q11ZmW7NZU9/DQtAEOFLaKX8XY2VY=;
 b=cgntIBDU0W4E1VILa61H9bUx9JX95ao9s7342eU+1vS9/HujyUDpn+/Tf1osXH11PZcunGagugNvV/LMcJFQhO9EzF0WwKebKnnMYlKi0/FTPqiwNmCNLQUCgb4Q12MAWcYfEVqbw2pjP5OrMJiZP/3mbuWvZIazKNdKEi7BHKb2EubUw7Ejg4I54gHmrlLa4w9s7FdAT2z5s/WHSGPBC629ttcmc9ayeHb6Gr4Qr0qk2fpnaiqeNWEJwCR7aybVrd+JM47cXRnuE32Y127R0Vp9R7+rLSaz5GyjDoNDO23SuTryD43kjsTycy9CU5KdJbbTvabG7QeAvaCk/yKipg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SLJ4gFCsl54r3Q11ZmW7NZU9/DQtAEOFLaKX8XY2VY=;
 b=0NsgFVo1Q5Ctw6Q56gYzabEhyL0Ns75R49pZPw5EORqget5CRuIDFRu+qUHMMTz5gwSwpyL4uURqTSAZvZFU7qxq7ikAX2Y3naHqWvbEWZpv/ZeJkd9ucso112brhoelbfWIFoAk+wmfYXtpvMIRifwxj94fzXQgP2YP6stXS88=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5555.namprd10.prod.outlook.com
 (2603:10b6:303:142::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Tue, 17 May
 2022 13:19:01 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 13:19:01 +0000
Date:   Tue, 17 May 2022 16:18:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     cmllamas@google.com
Cc:     kernel-janitors@vger.kernel.org, Todd Kjos <tkjos@google.com>
Subject: [bug report] binder: add failed transaction logging info
Message-ID: <YoOgvH+SeMc3bGOx@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0121.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d45e283-3cee-4ba4-13da-08da3807cebc
X-MS-TrafficTypeDiagnostic: CO6PR10MB5555:EE_
X-Microsoft-Antispam-PRVS: <CO6PR10MB5555DD59846A10167D96135D8ECE9@CO6PR10MB5555.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SiMK9v7fEMpeFyN9fr3gFO3LA/V5pBjme15l3GgLnkLIM/2DaAdvaUbnmHoL4JSyrkzEqmFm2lAfAkOtuBUnYAqOBM48/+J7g+EGLXfqJ8SD5jT3pBiyyJJO5NrRt2tZuIv01ZGsVoBuGpdbKtULQXXBRo/NYl/2/KQ7gwviJWP0K8oSciFqceW8fIUyBDDvMdY2G12NGpC7jv9ep+q01oynkNp2aMEWD4+Ti/V18HtF5f4PIx/KXubozn/u4LFv6/nmg4I1ZTBCoZ9vfAHNqUZozd+F36IsPAA9jfv5v/4ZR9RMIGCK7U/BGNGD4WYPFO24qIeAvKUt2N6OebREVO0+eDVgCVyURJs/zv1lS3wt1l1tgEp8dvY9+47pB2Lqyn3l/fg0XO16GB2GPDAdNojDBlxt096xVlTwmomesFB2uG49wf9RlLiJAQVOFvCJfJK0+QgDnTKVDbnsa0u2lsDtdU6X5Ayjk5BtGd3U7odcyns/T/u6L/WKEsUiZjgJgQao0LOngfnBREnGel97O0MBz3h8+kJrh7U6Fu88vV2d08VR4QtiOAJhBekUbl8k0oQCAJpNOS9DdZGV4aSWzebu5sfkajZpL+4pWRu20t/77AQjoEe0oe/cZLP8n1f7qkoJ3MIrSZhrsleThaDnIAP0Ou5iCg5hPwoSgs1Di87OZbj8Rjxym84q0o5F7JBeZ6VjbMom/Yq73c0sW6bGTa9yubnBsSDs/aDBUb5FdMg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(86362001)(38350700002)(9686003)(38100700002)(44832011)(6916009)(6512007)(508600001)(6506007)(26005)(4326008)(6486002)(2906002)(8936002)(33716001)(8676002)(66476007)(66556008)(66946007)(6666004)(83380400001)(186003)(5660300002)(316002)(52116002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n7JJM2czaHh7sKLJYOJzbOOnRFkgLcsvYlgeqQtA0hpuszcv9Fh+hBnbo24+?=
 =?us-ascii?Q?15SP2cn6XxpIarVoS4ocgER4eGoDh5nLj3PR+MxQjjgC8+T8bdom5dSqVHBJ?=
 =?us-ascii?Q?VV2326u5hMwdL60vBriKjhbAHwTajIxPLwYxMCheVYvaFNmiR4UyFXAlIudz?=
 =?us-ascii?Q?Abhg5bL1DmralUC2O/iuKADmr32t3hDDyxGsx82psvQu4A0yYka0IgQHPxkx?=
 =?us-ascii?Q?KHPLQBW9+CYo82VRu85ZoDZc/JprAFMoCwyIWmnCl+TneXmx6qiXa3Xt9FxI?=
 =?us-ascii?Q?fl6DnqyLwwcR3JOc3LRdSiKUmtZG7c7D1L4sVuPhWCa3ukq8i3vP8yLOBeg0?=
 =?us-ascii?Q?GkA/2dDLMY8I5jWugn15py447gSKNvyUdsfA3NVPGJi6U1LSIHBoWFVV1YyQ?=
 =?us-ascii?Q?eMfXlHODRKsVbBTLzZ3GgoXOrM66cvWvOLqEW4UU6FFDdIHnXX+lOBhRvHDO?=
 =?us-ascii?Q?/MP5UXm/GhSlsnKStb9+sNoXoZAhc+0z60hvKwYRxdH2IOZiPdoJ9IEcgeil?=
 =?us-ascii?Q?PEYEeCkHgjbUo9UBYRMvMbWURFNF7QmOFGl6pcoTRdyEKF6a0ZRkMGp3CLyx?=
 =?us-ascii?Q?8UaX4nsqqajI6r/+/sUslorMHI7yA43C7hdXy8tleyGRzKuFpje5FoVzW+pt?=
 =?us-ascii?Q?Vn+bFZPqxqG5MmPL8cb6cpUDdYHJAYCdi/wwI+CxLYdbzkDHW7ifanD+eUo1?=
 =?us-ascii?Q?tG/Ch/C5UgBRL+TGfdtF2HBnuzFLsiwk37EI0P2IH5Co8bBlB9fHgB2ldx92?=
 =?us-ascii?Q?Jd0oHOTmGbYkJj7dns89NOCc6xzXUbh8byIR0Fv7MeKM7OnMUYD8ytRn8P6D?=
 =?us-ascii?Q?ECex96W8eqSOKF10RQN5rApO8n/pFHAXzkvVmDMZ5MCnuPApX1nUMY6FYaUn?=
 =?us-ascii?Q?1wR2KSzlDKs67uftzqZWmN9Og2UJ03iSX1Bk6yVZbgeFCHB2J4ZD0GuUUc0y?=
 =?us-ascii?Q?POaDFGdR2EdPyct6tXFo1PHg6pU+v6sFhY5Es9QP3CAnEGE3VTenwgnDnf2I?=
 =?us-ascii?Q?rlCSftq1n6TtQ7lCkekAmJZqWAEdf9JKoq+AoY2buG0v2ThgWp7WeMsVYSko?=
 =?us-ascii?Q?BSXjW8q93xqQiJP3O8qIdHn9IAxDIT6DOX/8uYfTtbdxFI4I7eAPru/xoV4v?=
 =?us-ascii?Q?GoPjT6YFRFgkWXihO/7qnUF/EWRikLHo1GX89a1tKIJ9r8fApdc8im+CmaBA?=
 =?us-ascii?Q?mqD14LHfOVFYTK7fSYyVt2vAQ2H43Y2CJ084wF8RdztROm6EasJmpKy6qALM?=
 =?us-ascii?Q?rALrP1coGh8NBi0QvoQSlqEyrFM5sMn8qGXTR9Lp2dSMof6UiufFLVsaCvl6?=
 =?us-ascii?Q?go/9dM/cyoMLYyAXtd7ikHROdfHNHCuKSRcxdoDG0CIzsbx9ubJscbq58TpX?=
 =?us-ascii?Q?KuqeGy0mBbhu8sDssYWoGihpfuySkLzVEQcs7iJHOcbc9zShu3guAiPuxzCo?=
 =?us-ascii?Q?pGvxMrOIJa7ng8ojjeb9drTVkso16K79THfRgV8FRchvS5PpqODtZG3w+W3R?=
 =?us-ascii?Q?QeaH2qfVhCckUv81sFJf4m2jmLKBRRXgP2sKYloG8zCczizIpxHd6Fb0MeaI?=
 =?us-ascii?Q?slRjAZAFKLcDAhyV9CP0tyMwlwlK5TpdgxzGL17xdHJ7Qp9xyvZOBPX6ia/h?=
 =?us-ascii?Q?0x/LcDopVtaYggTLYbVMoHTNPzlTi6LNwluMBx+im/r+XSTSCmMQCccQpL7e?=
 =?us-ascii?Q?pNw19hGLvEplRP/AqlqGfPyT0HSBRd3GTCxc9STtlq9HCT88Tq0PMXkSDBOu?=
 =?us-ascii?Q?JsiCIqDqQeCTbnZWJng/XkydYwWeFfk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d45e283-3cee-4ba4-13da-08da3807cebc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 13:19:01.1955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agsIEGlVZMwacEnhfTkOfwAH7U4+bJ7I/+t64QKwnDf20Jl+Ofm/OjuIqyC2LJ5FD/IdUi+Yo08MhApjU7+RzNUIVjpJKbgY+b5dCwFkySY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5555
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.874
 definitions=2022-05-17_03:2022-05-17,2022-05-17 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205170081
X-Proofpoint-GUID: gtYdQWbA1OXjXH3UircoKcPB2a1RpoPz
X-Proofpoint-ORIG-GUID: gtYdQWbA1OXjXH3UircoKcPB2a1RpoPz
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

[ There needs to be a dedicated mailing list for this.  Picking up
  patches using lkml and lei is new age voodoo nonsense.   Or it might
  work fine.  Wouldn't it be funny if Lei sent this to all the correct
  people and they all mocked me for being out of touch with new
  technology.  (0_0)  -dan ]

Hello Carlos Llamas,

The patch 9474be34a727: "binder: add failed transaction logging info"
from Apr 29, 2022, leads to the following Smatch static checker
warning:

drivers/android/binder.c:3562 binder_transaction() error: dereferencing freed memory 'target_proc'
drivers/android/binder.c:3563 binder_transaction() error: dereferencing freed memory 'target_thread'

drivers/android/binder.c
    3538 err_alloc_tcomplete_failed:
    3539         if (trace_binder_txn_latency_free_enabled())
    3540                 binder_txn_latency_free(t);
    3541         kfree(t);
    3542         binder_stats_deleted(BINDER_STAT_TRANSACTION);
    3543 err_alloc_t_failed:
    3544 err_bad_todo_list:
    3545 err_bad_call_stack:
    3546 err_empty_call_stack:
    3547 err_dead_binder:
    3548 err_invalid_target_handle:
    3549         if (target_thread)
    3550                 binder_thread_dec_tmpref(target_thread);
                                                  ^^^^^^^^^^^^^
Maybe freed.

    3551         if (target_proc)
    3552                 binder_proc_dec_tmpref(target_proc);
                                                ^^^^^^^^^^^
Potentially freed here

    3553         if (target_node) {
    3554                 binder_dec_node(target_node, 1, 0);
    3555                 binder_dec_node_tmpref(target_node);
    3556         }
    3557 
    3558         binder_debug(BINDER_DEBUG_FAILED_TRANSACTION,
    3559                      "%d:%d transaction %s to %d:%d failed %d/%d/%d, size %lld-%lld line %d\n",
    3560                      proc->pid, thread->pid, reply ? "reply" :
    3561                      (tr->flags & TF_ONE_WAY ? "async" : "call"),
--> 3562                      target_proc ? target_proc->pid : 0,
                                            ^^^^^^^^^^^^^^^^
Dereferenced

    3563                      target_thread ? target_thread->pid : 0,
    3564                      t_debug_id, return_error, return_error_param,
    3565                      (u64)tr->data_size, (u64)tr->offsets_size,
    3566                      return_error_line);
    3567 
    3568         {
    3569                 struct binder_transaction_log_entry *fe;
    3570 
    3571                 e->return_error = return_error;
    3572                 e->return_error_param = return_error_param;

regards,
dan carpenter
