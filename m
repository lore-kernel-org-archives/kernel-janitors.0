Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB1CC432BE
	for <kernel-janitors@archiver.kernel.org>; Tue, 31 Aug 2021 08:22:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D3B260FC0
	for <kernel-janitors@archiver.kernel.org>; Tue, 31 Aug 2021 08:22:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240253AbhHaIXV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 31 Aug 2021 04:23:21 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:51160 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240109AbhHaIXU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 31 Aug 2021 04:23:20 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17V56JXO013830;
        Tue, 31 Aug 2021 08:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=7nsLgLAk9cFd8zr4G2OEpexIKOsNlj5V8prmKJ7oDf8=;
 b=auczSb7rJLZw1CuNr0YLU/ykvURQASc7ulufiuVCIiwjzi7lfNmZiuTl+NyYg02AvUIX
 kL1EAp+UGrongn+AI9LyQYlSlLegYrfUd3V9vUeuaoNFOVoRQZPdvWLHvfPabmlBguFi
 ott9OJ44L722Z0F0RWEyyqstqwm4xmuuixVq7hhUZz5sV4mAKaEC8ZOL7rsvoYypQwgZ
 JvjstTjFTXXhTW5A39CJNEE8E5yHr3IH5t4qQFD+e4tZwKGI1RUlZKn+va8OxSh1Gb7b
 Lce5Vn5b9dFm7Raq84v0LF0fAk3q3ngUX6n0i5gWOJw8nEvx3sWmhMIA1NAa7UtyERqm 5g== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=7nsLgLAk9cFd8zr4G2OEpexIKOsNlj5V8prmKJ7oDf8=;
 b=e2d7SHQcWJyi1/m6lqvF1wYhVNF4d5aYQVeuim1VTGy9Y1WOaOf9eBIJ5me79Z2aTXUj
 T0O6sMrLFIAUaQK9yCHPAQDPM5CXraGLCpwk2t0kcpwFfrzIa0W7Z5LOKHBq7JTT8gCa
 9uqEDW8I/CFVhoLwIKL7MLt1XB/dEq2BfABi9/haYBzgRlCf4DRI1DBU95pcGArFyICD
 chJpixigF2qxzfeJo5vpDmQDAQL+4Z7sNgZj+MoCoSLHIB3/P3lCUfMtDJ5lzkPisC61
 o/jzHrr/WtoUCqySxQQs+8EjkMUisOlQb11bYqP5NMk15SL7G5/p18+EEdRfR5sw9PWq ow== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ase028bxc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 31 Aug 2021 08:22:20 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17V8Fbhi128852;
        Tue, 31 Aug 2021 08:22:19 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
        by aserp3020.oracle.com with ESMTP id 3aqcy4a73t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 31 Aug 2021 08:22:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0znO8SGtDYXiVE3Dh303iD1moxuUpOskx3xJ4KXGAN+Pv5IK2TqGg03QJyCGdViqGmj2b78fcMLmfhIxt8YqfmuEB+yOYzXMXQ/0NNOGUN94nFgMi/1hmIk/J12ELEMfHqVZT4h9IgdmYl6oshEu9x+PLJE/GWqIHqFNP+5dx3e5HLSN5ylS+8LsC5UXpWV0/T8BG3TA1YzfzF8KCrIbMq8Dlp9AttqbCpDKntUxqybmmMS6gaBnct5TwuzJ7ZFF4jv8rH/xyI6Cjj9AOjnvJVRKQnzWIDiFnYRtxQeUw3Q0sYmVfzT/QIAErp4cPQR46NHCSBVisI88hIZT7k+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nsLgLAk9cFd8zr4G2OEpexIKOsNlj5V8prmKJ7oDf8=;
 b=jKxLxD08mSPdwGyQzdIMIg/L9jb/e6U6kjHxvwrOGhXnIg/Muae80ovV9MJSWK8uZOy4/bhBqSWKS/DgoskrrmHzO/a3NzoJXNcWP6Pnh6hdDxRW+Qzk+pe4Ai6cgEBfJIIfdEA4WmET/sg2B90nK1UQSPqW3DrCPHRj9OFFbQPgJVQT8XzY0dt9F46sUck0x8B57/VbA+40ukwaesf1LbvMTD1F/0OolLc6s4kUZsWvKXojVVUaoAT7Z1FkP1o2SaNrKFWyRROQ8yfM0Wvkd8e4E1l7ck0OfyUyGqGwIsTyvS3Y1HUjNFpGc5woOi0z/TL2idzqgW1LQb8+PHqysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nsLgLAk9cFd8zr4G2OEpexIKOsNlj5V8prmKJ7oDf8=;
 b=lnbSEYGpnKgZmEhWqGAxNnBy4YpuVfEhALnvnIwJhStzE1oNfnMvLA61rc22xDW0ghNsnop9wC3svUfCQNvCvyeBMDiTi5e+SmQrCrmISlWwzP/XUE3uTssLJH/5sd8waThmo2Z7p4KwEVtJNo/TokrMJTIEu9MBL+zak2mgi4c=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5412.namprd10.prod.outlook.com
 (2603:10b6:303:13c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Tue, 31 Aug
 2021 08:22:17 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4478.019; Tue, 31 Aug 2021
 08:22:17 +0000
Date:   Tue, 31 Aug 2021 11:21:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     peterz@infradead.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] locking/rtmutex: Return success on deadlock for
 ww_mutex waiters
Message-ID: <20210831082152.GC9846@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: LO4P123CA0214.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (2a02:6900:8208:1848::11d1) by LO4P123CA0214.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a5::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 08:22:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fa98da6-eb0b-411f-2254-08d96c5871d5
X-MS-TrafficTypeDiagnostic: CO6PR10MB5412:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB541294F42BAAA7EF9F3D06D68ECC9@CO6PR10MB5412.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4qlq9OqWHviCAuRrNfaJUEMz07HWppmMWs+spcZUN9fPhTDQqPLVAoN4KIW3mkbcW9tskcayMqT+1ODO1reDNGQevIInaIcNlwkciGE5r76hCU/qswf5zM0cRXU72ZSQ54XgBCgcmv+hDcN1mb3XCY+GemDv9s61smzM+G+pRPNIfGPRbuxuK1+83Nxq3PkVY68lKOoHNyHgjp6/NWF67DJR6nqG8bEOm+8gGQlyNA7ZgUor3Jc5rkthgI6FilzA+AEsowIC+8J4TN5vw+ONF53iOGmOxyEl09Tn17pNkGg2rk4KJAz+MWEKjEyAOEQNNu4ZEWmC8rYoKn2i6+ccVQf4ZvChv3Pt8wfdq9mUbCypk0u4ftJ+Dm5Cc+pnBVjfR/ilkE//PiORL6g1Ege0Rghp34NNN9qGYoybWPPiXQqDoDhIve0yJ7wCtT9KQiVf7jXpXD5BWtG/a1ZfYbtxgWOI7QesvPsmLMZawuyiVqvHHzlccEQpXEPpwKtMEv9bX0KPaXrXUIVgq9+VNPQccQ6HTAut4SLaoy5Br5zPxkqXew28EabugnyQ/7ts4DTVr6h+oOnyHrQcFgsKh2A6iNXGJVExKXUWse1J/z5QXF6zsSfYa3hh8EUmPr6gFqgBAABmUBqFBW0tjFrAxox60w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(39860400002)(346002)(396003)(376002)(2906002)(6666004)(86362001)(6916009)(66476007)(33656002)(9686003)(5660300002)(66556008)(8936002)(4326008)(38100700002)(186003)(66946007)(8676002)(44832011)(33716001)(478600001)(83380400001)(55016002)(52116002)(9576002)(1076003)(6496006)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OL3mD1kz+ZzoYyHGlFddRxu47b8/kgmxDMF6Av75pwEnxDdsdBRNjheUkDU9?=
 =?us-ascii?Q?VFU2VPKk3u37i9TKN6dw9UZU0jbGwr9m4SVMpjqwKkQPIYJ0ponubGsTeBRl?=
 =?us-ascii?Q?4MOUq/joMcneXq43Om23yntIqIoBhG6UzASx9Jsy84QOtnjnKq9xqEulK1Vu?=
 =?us-ascii?Q?wbscjnr3BqBzN+NIwJjmmzDUCSOvyaq5vlZuDQbellB5gvL7TMlrGNb+/jyc?=
 =?us-ascii?Q?40gq+8pXuB9vBO61mwUH7lbvEn1QDpM3yMvgkwMjlsjaqHdVWBRtJsQRjnXQ?=
 =?us-ascii?Q?wyK8LhSr9ypa2KuOwRmJNwpvNRJDV0O+JVJuSvX2guaXfwMBU4xW21NuMNo4?=
 =?us-ascii?Q?4SbohEuVhyrVAZ/kuK1+FmFpp9+wXzoAMtGq2E9YR3HAtWAPUSlvR8d2vDKk?=
 =?us-ascii?Q?3V2FZTsqd8GgzK4xSBri5r4JAJf1Bj19sGYf9VUU8W+S2uIDONs4Q2OCNppg?=
 =?us-ascii?Q?V0ZCzolLlSJXwD/2goiVjoG/ibopZD375L1nVeSeiJC6uciepf0u5YtlCxB8?=
 =?us-ascii?Q?22HVirjVH2JPFsRu7cEf5e9THz+jIQtdZuKgCFPjSgno8FFPEl+VN/n/eEHu?=
 =?us-ascii?Q?cNlJz0JV0HkG8aLbymFRlmFiSBl9r7fj9/cQd9aq30ZIo1dsGF9u86JZon7f?=
 =?us-ascii?Q?uvy4/viGo9+XcvSO4QpGhSlvxXTLUY70qvbdz3NmOJ2hDm4+jkzldhutjBju?=
 =?us-ascii?Q?9l8/gAh2PYx45ofkyxv9sWf60LqOlVVfiQzTwjlrlChxWQOdvjcP/q8Xqa4C?=
 =?us-ascii?Q?2waKkPq0NkqhNMkTERzw0VatHHphRhkZRon/J06ak3vBePZX04lOtpVDReKg?=
 =?us-ascii?Q?dLCMOip3GtSQkXFyLaE3RxYg1iHinlvakbXrR+Sd5vZr8SmPzckl4o0265Fq?=
 =?us-ascii?Q?czuqb2PpAhoM37BRbWeLfUGoYVRGqkIOxmyBgggiLa4d2HzzENsr7FOt53/z?=
 =?us-ascii?Q?4MY3VboajzAXeAAHNDUZAn4svSqalxgaodr7AXvXHpUCdpYawixDqkmo5I5N?=
 =?us-ascii?Q?UIlZrn1js4n73bEOjQAPhPUyq4tZLuJmbRLbEmyc455fk7pkoJjQLS0U4Srs?=
 =?us-ascii?Q?OM2B8+0FaGYI1N3Z31gjZv1pLvY9o1lL+Uml394X2eq7fCxMSFg9m7Wu9nT2?=
 =?us-ascii?Q?BDGSB+r6E+yNj0OF8NJ6Ck+8O7Gz+paOEm2sNHcTQPtXp2hD03lp3S/1r9KS?=
 =?us-ascii?Q?z7+9jy2KsVrjBAhiryn9yZ5/mCW1TeCS/R9Qh6F1YHC4gSH2it94syPQqiiH?=
 =?us-ascii?Q?RPmVjR4udZuU9jJxmd3vAPlpU87QiGkgm5DIGpVBkXmdw6wxgm8MDPrRrEVo?=
 =?us-ascii?Q?4AGMgSlCnUF8gNE6gjQCrGlVCp0cz5mER8bHJHtZBjMcjRdza6uJ+W872DG+?=
 =?us-ascii?Q?DyUjFPk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa98da6-eb0b-411f-2254-08d96c5871d5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 08:22:17.3490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlscJDQZCQkVG6y+aP0GCbbPRGA92ec6EMx8e+b+2dmwn26xaLVX0Bk4dkrd8bzF23MMTmZpnVIvUOw5ZRdEjvGjg1PbxKyIAU44PLtk6QY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5412
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10092 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 phishscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108310047
X-Proofpoint-GUID: 4cPp3NUay-xSgK9p45QAMMnzYptR9J7v
X-Proofpoint-ORIG-GUID: 4cPp3NUay-xSgK9p45QAMMnzYptR9J7v
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Peter Zijlstra,

This is a semi-automatic email about new static checker warnings.

The patch a055fcc132d4: "locking/rtmutex: Return success on deadlock
for ww_mutex waiters" from Aug 26, 2021, leads to the following
Smatch complaint:

    kernel/locking/rtmutex.c:756 rt_mutex_adjust_prio_chain()
    error: we previously assumed 'orig_waiter' could be null (see line 644)

kernel/locking/rtmutex.c
   643		 */
   644		if (orig_waiter && !rt_mutex_owner(orig_lock))
                    ^^^^^^^^^^^
A lot of this code assumes "orig_waiter" can be NULL.

   645			goto out_unlock_pi;
   646	
   647		/*
   648		 * We dropped all locks after taking a refcount on @task, so
   649		 * the task might have moved on in the lock chain or even left
   650		 * the chain completely and blocks now on an unrelated lock or
   651		 * on @orig_lock.
   652		 *
   653		 * We stored the lock on which @task was blocked in @next_lock,
   654		 * so we can detect the chain change.
   655		 */
   656		if (next_lock != waiter->lock)
   657			goto out_unlock_pi;
   658	
   659		/*
   660		 * There could be 'spurious' loops in the lock graph due to ww_mutex,
   661		 * consider:
   662		 *
   663		 *   P1: A, ww_A, ww_B
   664		 *   P2: ww_B, ww_A
   665		 *   P3: A
   666		 *
   667		 * P3 should not return -EDEADLK because it gets trapped in the cycle
   668		 * created by P1 and P2 (which will resolve -- and runs into
   669		 * max_lock_depth above). Therefore disable detect_deadlock such that
   670		 * the below termination condition can trigger once all relevant tasks
   671		 * are boosted.
   672		 *
   673		 * Even when we start with ww_mutex we can disable deadlock detection,
   674		 * since we would supress a ww_mutex induced deadlock at [6] anyway.
   675		 * Supressing it here however is not sufficient since we might still
   676		 * hit [6] due to adjustment driven iteration.
   677		 *
   678		 * NOTE: if someone were to create a deadlock between 2 ww_classes we'd
   679		 * utterly fail to report it; lockdep should.
   680		 */
   681		if (IS_ENABLED(CONFIG_PREEMPT_RT) && waiter->ww_ctx && detect_deadlock)
   682			detect_deadlock = false;
   683	
   684		/*
   685		 * Drop out, when the task has no waiters. Note,
   686		 * top_waiter can be NULL, when we are in the deboosting
   687		 * mode!
   688		 */
   689		if (top_waiter) {
   690			if (!task_has_pi_waiters(task))
   691				goto out_unlock_pi;
   692			/*
   693			 * If deadlock detection is off, we stop here if we
   694			 * are not the top pi waiter of the task. If deadlock
   695			 * detection is enabled we continue, but stop the
   696			 * requeueing in the chain walk.
   697			 */
   698			if (top_waiter != task_top_pi_waiter(task)) {
   699				if (!detect_deadlock)
   700					goto out_unlock_pi;
   701				else
   702					requeue = false;
   703			}
   704		}
   705	
   706		/*
   707		 * If the waiter priority is the same as the task priority
   708		 * then there is no further priority adjustment necessary.  If
   709		 * deadlock detection is off, we stop the chain walk. If its
   710		 * enabled we continue, but stop the requeueing in the chain
   711		 * walk.
   712		 */
   713		if (rt_mutex_waiter_equal(waiter, task_to_waiter(task))) {
   714			if (!detect_deadlock)
   715				goto out_unlock_pi;
   716			else
   717				requeue = false;
   718		}
   719	
   720		/*
   721		 * [4] Get the next lock
   722		 */
   723		lock = waiter->lock;
   724		/*
   725		 * [5] We need to trylock here as we are holding task->pi_lock,
   726		 * which is the reverse lock order versus the other rtmutex
   727		 * operations.
   728		 */
   729		if (!raw_spin_trylock(&lock->wait_lock)) {
   730			raw_spin_unlock_irq(&task->pi_lock);
   731			cpu_relax();
   732			goto retry;
   733		}
   734	
   735		/*
   736		 * [6] check_exit_conditions_2() protected by task->pi_lock and
   737		 * lock->wait_lock.
   738		 *
   739		 * Deadlock detection. If the lock is the same as the original
   740		 * lock which caused us to walk the lock chain or if the
   741		 * current lock is owned by the task which initiated the chain
   742		 * walk, we detected a deadlock.
   743		 */
   744		if (lock == orig_lock || rt_mutex_owner(lock) == top_task) {
                    ^^^^^^^^^^^^^^^^^
This might mean it's a false positive, but Smatch isn't clever enough to
figure it out.  And I'm stupid too!  Plus lazy...  and ugly.

   745			ret = -EDEADLK;
   746	
   747			/*
   748			 * When the deadlock is due to ww_mutex; also see above. Don't
   749			 * report the deadlock and instead let the ww_mutex wound/die
   750			 * logic pick which of the contending threads gets -EDEADLK.
   751			 *
   752			 * NOTE: assumes the cycle only contains a single ww_class; any
   753			 * other configuration and we fail to report; also, see
   754			 * lockdep.
   755			 */
   756			if (IS_ENABLED(CONFIG_PREEMPT_RT) && orig_waiter->ww_ctx)
                                                             ^^^^^^^^^^^^^^^^^^^
Unchecked dereference.

   757				ret = 0;
   758	

regards,
dan carpenter
