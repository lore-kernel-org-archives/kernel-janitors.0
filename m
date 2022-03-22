Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8A6C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Mar 2022 06:46:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237048AbiCVGsK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 22 Mar 2022 02:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237103AbiCVGsI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Mar 2022 02:48:08 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C01562A09
        for <kernel-janitors@vger.kernel.org>; Mon, 21 Mar 2022 23:46:39 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22M1EFlo009046;
        Tue, 22 Mar 2022 06:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=NUkh21/kxAFRRm7qdkZ9jxBdZTY86DlCVZbS18MINLc=;
 b=Jobju8FXCMxTjuGw2JlJf7OQLIgfCz0mu3+pMBeM0UIidCoiUzkhlu2uzZnkhhL3G+fN
 HtiEAx+QD6wFOV6sVaoDLKfdhthTII1L5QxwAJxfWo8+EhgmK2/ZQpmieKNMvT8A3fPB
 XSEtZuraTgZSel/w9ou1PBEA4M4Wc2afSLt5oM+inxYSLnsuBtclWMTEkVnR4QNg8UsX
 lXK+/S2WElSu5LvcNhrClR4accvJdj0yJ7Y8H/cz1JSRSUQrUmhTFYqHia1MtpBADw2G
 tXUbQCRCV44s0zvARPA+G4TpYiXB6bQBnmws4yJL0zX+W613HS0uAVC6WJwzgZf6LGet XA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ew72ad84x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Mar 2022 06:46:34 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22M6eXLQ166942;
        Tue, 22 Mar 2022 06:46:33 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
        by aserp3020.oracle.com with ESMTP id 3ew700vspk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Mar 2022 06:46:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVRT9EzKvdx5QCVeBARbhCxwBZ6X/E1z0SaIPsx/RPx25wDGJmmAqY+UxqVLmAJIt8guwjBSQZayxz02/j+clsAsCh0/YZ+/aT1MLvs8wogNizKhXGDSWkkl+VAyJaoosatEnpKjigPuvKhdcoeTu4sEt5nQeP+BRIGE2tzA2MZunbUKus24DbirMr8NSyJi4b+165f6ll22Q726s/4TEPxUTLpw7eu5BeY/09d2x0DhYNj3DNz44jkALH4dFxvAEMKKTT6bbZBGrC4RgE/ZdYkcnYIWAovq3Sl2j0jCd3sCCWldUHZ0HaPRQlfIcQxaASH6pHmETTID0NSrpEczXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUkh21/kxAFRRm7qdkZ9jxBdZTY86DlCVZbS18MINLc=;
 b=b5s3sz4pTfTZEXvxTJJN6+5OYdm8A8O38xxALjZr3WGBZl9X+Pop6bzArB4WCwxLl1dmMz+jFEi4jLhenHfkXF6hepTPDF6clZMRXxhdZkye1Fm+bbnlbmVJUe7qQ8O+jqem+GhPYNJhdX/UMIIXK5j8aZ+W5mSnasSdeNdUhRPcQEIy1P9WArnll6A1W/pFbApScn4bx53drf+6lKI4rvyKInaV50H5ov0+69MiNg30lWtpPIRtZhysWKY+sdsIYVkjfKp1ccGiu0lDu3k8rg2hLhqyiV/JxsIRDpUvhZC1XAOCg65RQf1vFDWj/Z+NNRtxCtmIUxgb4uQL2VO+9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUkh21/kxAFRRm7qdkZ9jxBdZTY86DlCVZbS18MINLc=;
 b=UGqGvyhDi9d/XR9ZgujLqQbVFerYWb8XrR/TOKGfvw4IBv2lOgVtYGaccfd/J1nZ3+y7WGc/8JuP4aIJT+I9eyGsO7J7Bmrf6go37Fi1lfYYddCpUn5eqk4eHPFiTc40+fCJ/MlJJ0QAh+WdHfrfCy80gLfLwC1SIAvR0jmb9LE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH0PR10MB4533.namprd10.prod.outlook.com
 (2603:10b6:510:39::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Tue, 22 Mar
 2022 06:46:31 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d4e7:ee60:f060:e20c]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d4e7:ee60:f060:e20c%7]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 06:46:31 +0000
Date:   Tue, 22 Mar 2022 09:46:20 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     mhiramat@kernel.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] fprobe: Add exit_handler support
Message-ID: <20220322064620.GA22331@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0017.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::27) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a87fc3b-3eff-41cb-3726-08da0bcfb2ba
X-MS-TrafficTypeDiagnostic: PH0PR10MB4533:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4533855A77E3D16AB15CAA3C8E179@PH0PR10MB4533.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xm05blUQDKI+055CFk5H8NDUCOGKDjz4/YQInJFQ8k+HY4hz31MoE9EHDVEaBzosMpnpJ0rhe/b3qwAPYKfbS4QqNBlRDaOvABlNhE7//0Zz5RlD3j6nwvmbfgKkvOndO1Y7a9eG2Fqna5YkQqiJUnmq1cBKMYaG2f5pXyo7WBg2CaBhDign8V49qXaU2RBBV/aQJ5vbFgIbTcEu++z2dsAhqkp3DqN5WftmAQT19HQcoqMiX7myPAlPOZGPCsGsnOH4SVrYwp+ltE7PjBU2MSpEZBpwCD8cFN0CtXMYgpRl4M6EqbbrN3w2OfNChym8CaD1lRr7fZfDlymWawjJdf4PyAgU5GcRTdoGJV85g88tXiJJiag5vOt1F1BjgUWiCBGHn+rDnR6tSnrjnHKCdgZ3959Ug6KJNJ+sC/RyYNx1jIREJIaSf1bXtPeATHeZco70y7IbDQOPq7Va+R9kLj+qgk0ufSEB+a/Qziwwxex1Z+Pnd/PwFlMIOzJ6J0bJ5WAqsO/iX3bXoUSkqmb4xYY060Fk7LYn5uWfS+9XMhg5vDD68d9uPEZT5bw/vhUEcoXgx5x/4YSzZkhIBSaChYlrZ7Tl0PUzVNOeDeSZtBQkse0Jzmcy38mBgm6dC1G9QRjqitTuiRtdDruXjxij8QtlaYeBQcTwdEz3y8a5WDvbhCr6DpzRThDv8mEU2rgTNek0GDAwb06+ntpQ309NtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(44832011)(508600001)(1076003)(83380400001)(26005)(4326008)(8676002)(86362001)(66556008)(66476007)(66946007)(6486002)(6506007)(186003)(6666004)(52116002)(8936002)(33716001)(33656002)(5660300002)(9686003)(6512007)(2906002)(6916009)(38350700002)(316002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mVp8CG0yE6N8WFdxQR/TlXE2znFx+AdtQ826FZlNwuRV99/pD0yv1weOP5iO?=
 =?us-ascii?Q?g1Wckdsge7w7NEV4dgr7+9lPw6ylfYhS7GajA49fDBh8sDn2zgpIOKL/TcId?=
 =?us-ascii?Q?SlyzJi/YNXW2Jew5RgR8F78BlCI3eAB0ouoM3foCSn6NTFEzBgCoRrlX2g9J?=
 =?us-ascii?Q?mPpok5TjXRAiDj3Lit6Nv1DuF9eLSExiK6LYdkQMt0zCXb5o/B75ypa8g8yS?=
 =?us-ascii?Q?Bu9pFD2HH+sVzFVzQLRIBCAglj2LFfrT29rTcr2s/8Ga9cNsK9PSBV76WRL4?=
 =?us-ascii?Q?uTU0ztw11Mvv9WoIcknmW+3TnawW9bcM/wU6M7wb0n3DJMHm2IErx9nSE4vN?=
 =?us-ascii?Q?FHv83oLTW8lvcjUZkZ3TP4/4mapfiJDkEip1t4L3fWGTwRrFrdnjxZ760x6s?=
 =?us-ascii?Q?w2sl1M8FvSwWxzydyMCWxf0N06jGJzOMlDHQmgxYrUr0T9/NTljMixfDySP4?=
 =?us-ascii?Q?VNhwJaS/BaFG+RFqBHyFuWLJFcNNHXYe60qN/PjZvbw5fFxmWpc/RPynURYm?=
 =?us-ascii?Q?pXeUT62V5FLRDcBeLMJMyiVLESenNEAjji6GbfXEIZWnlo8AeW15KHn8HUuK?=
 =?us-ascii?Q?HLaALbwo5WmDIQocQFfDc/Z6aQmAdUusdYCEikaRi2Pq2WJoUUvq1mhtkI2I?=
 =?us-ascii?Q?tTcD+QNt4h//U4YpCqUDOqNHV85LqWdQNtVu7s8zMkIGyVtfRc1PRsGt4aO/?=
 =?us-ascii?Q?3hb6dhAtBSLrHMhH5GYfqGdnSJ3ZkKbfNwhHchZAjk9Vi5EgvBpj3LUtQqtp?=
 =?us-ascii?Q?OL4SNRMgZ577bXohaPV93xKKCbrbnxYqTk1jGZgxYEmWj2rwswxOH9NAXH5n?=
 =?us-ascii?Q?2HxElWUzW03pzfSrbKAAjAyyhUdCObefUpbZ1GLHzMHVHO0N2obXJ/kIJEN6?=
 =?us-ascii?Q?5p/Ci623Kv8nJJUb+RqP5c+nV5wgqQ9PQG5e7W+f3LMDzXu0eb+EdiJLxYrg?=
 =?us-ascii?Q?mFuvoo3WrUcI9hUIl8R9RYIPkk02AnsRNk4QPX8K/72IQT4wp1yyDlksNz3S?=
 =?us-ascii?Q?xUTAr82GEBmVI7jMF9U1H+uGcDqpNpCSl9JK3rIuuCFwU5J5gCng8cMWvqrb?=
 =?us-ascii?Q?NrCiA5dPlbIuwAf4UWoh55gu1XK0c4YBV/BGssOmT4WV+N9QUGY6/n1GA2Vr?=
 =?us-ascii?Q?13fEZr/+Zu11m9G8eXuii9Wt94lSmNj8bmC8+ql6lRfld6tIJihxciKY/Gw3?=
 =?us-ascii?Q?B/S09p5ZH0bzaYPUS9OoZXCPtEfMpJ2TJlPWAlIJtMmNZLMJGutkyAoo01qX?=
 =?us-ascii?Q?kGiHaxGGOO26Do52EKJkWNyg6HysHx773XFIxkAwFPkEvZ8vOWd4UVe/6bBq?=
 =?us-ascii?Q?t8iy2Erju1s3TJU/2jJKSwTjstEbz/vhnf6AG4niY1rNnYAV0SEgq8qONsUZ?=
 =?us-ascii?Q?+elXXT1fSivmDDhBq+8h2QNRmLCIhW8ZQwdS9OnrpgPuT/ot8/ebLmTHwvIR?=
 =?us-ascii?Q?N+g5f66IMw0LNVQsh6mpagJ9f8fHgADTPAdtO4N07JAaPf2++OWkPA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a87fc3b-3eff-41cb-3726-08da0bcfb2ba
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 06:46:31.2436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXHeXtpuonHvmWEhTjcJiZgWoG0jJzB1XVQegg2HqoEjYFyCO97DqRUPviLB+sVrSWfidxWPgd3WXghjhDE2LL7NLWbdKBRMtLZ0e/BPUOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4533
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10293 signatures=694221
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=790 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203220040
X-Proofpoint-GUID: ILhPxNBvXTJUdI1i53Ll9HMfKwyd2XmD
X-Proofpoint-ORIG-GUID: ILhPxNBvXTJUdI1i53Ll9HMfKwyd2XmD
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Masami Hiramatsu,

The patch 5b0ab78998e3: "fprobe: Add exit_handler support" from Mar
15, 2022, leads to the following Smatch static checker warning:

	kernel/trace/fprobe.c:155 fprobe_init_rethook()
	warn: struct type mismatch 'rethook_node vs fprobe_rethook_node'

kernel/trace/fprobe.c
    134 static int fprobe_init_rethook(struct fprobe *fp, int num)
    135 {
    136         int i, size;
    137 
    138         if (num < 0)
    139                 return -EINVAL;
    140 
    141         if (!fp->exit_handler) {
    142                 fp->rethook = NULL;
    143                 return 0;
    144         }
    145 
    146         /* Initialize rethook if needed */
    147         size = num * num_possible_cpus() * 2;
    148         if (size < 0)
    149                 return -E2BIG;
    150 
    151         fp->rethook = rethook_alloc((void *)fp, fprobe_exit_handler);
    152         for (i = 0; i < size; i++) {
    153                 struct rethook_node *node;
    154 
--> 155                 node = kzalloc(sizeof(struct fprobe_rethook_node), GFP_KERNEL);

It's hard to tell if we're deliberately allocating a larger struct or
whether it's accidental.

    156                 if (!node) {
    157                         rethook_free(fp->rethook);
    158                         fp->rethook = NULL;
    159                         return -ENOMEM;
    160                 }
    161                 rethook_add_node(fp->rethook, node);
    162         }
    163         return 0;
    164 }

regards,
dan carpenter
