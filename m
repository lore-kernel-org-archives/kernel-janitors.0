Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19690C4338F
	for <kernel-janitors@archiver.kernel.org>; Sat, 24 Jul 2021 13:35:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E242B60F25
	for <kernel-janitors@archiver.kernel.org>; Sat, 24 Jul 2021 13:35:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231809AbhGXMzK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 24 Jul 2021 08:55:10 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:31088 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229539AbhGXMzJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 24 Jul 2021 08:55:09 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16ODVh65018746;
        Sat, 24 Jul 2021 13:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=lSSKgeF8DViPlEuJUTL6PJvogNvYXdwWv83X3SYwMWM=;
 b=TrWSfUMxeYS7zGsBtYKT1gFHiNNfdqKXoXgvX10ZiApywa3JB6ez1+Abt2lArkZo1dJE
 jdTh03eExqx8tJ+0jNUkzjbiwUXK83cr1eCrYHupQniJQJFVN1GfdJNSbpt6vXeITnRs
 ibeN0F609FxgQNFmaRHCMSsFMlG1033ExFfnxkZQKZNA2yhi9Cz5SPiyLwRArqYQ3Cgk
 /dx9hYOBfp7ZwElpRoQ7j2DvLpk0SXhhiNkn2/guxNkOhRSaHLEHJvcRsbf1Z5P7+siy
 ZZ+OOE4YJfICZnO6LOud6uRwq5ODW+Zjl/h48r6NtAmTjfvfcfmPFyAQTgapiBX8SFeR Ig== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=lSSKgeF8DViPlEuJUTL6PJvogNvYXdwWv83X3SYwMWM=;
 b=hO/TAfTfRCUaIaVOLYFA2R6yZl7MTIblzj/gDyBGKbqID25IjGlFhRWL7vDhe+rXVlhD
 JvbHMO5Ta/pACxJBCwR82LsF4RrHxaWy+gKZXmWLNkZMB4+YSF3xh6bQqIycjbI9Xxm6
 4xFViJ7kFtGRA4wWKoL1IxrJvi5IkY6Lx906D/vKfEyQCtAa2j6PWJ5rf/gbIw1vDRBG
 xnwP+hDg9oxVAZbQpbUL2zX3KjNfSygZypUuR7ex0+jTXvl/wQ7zkwqcH3faIm9o89bG
 RMfCu+IqhGRSbOA5H6x8R4R7PsGuGC2NgfW67KIPNilCdENSsauOrHnI2tJfTEWrFX1B KQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a099c0gsf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 24 Jul 2021 13:35:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16ODUnc9063710;
        Sat, 24 Jul 2021 13:35:38 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
        by userp3020.oracle.com with ESMTP id 3a0a6m4r0g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 24 Jul 2021 13:35:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEil1M2sOsN/hAhFKsFJmJiSZkSJG+K/bhqGWXQH4wW91uJZt2Xbh+PMpNLV7bndXPcJ+yZ6UCjgZFeSxua2Xktw7Nl+J9iGgsfxo63bfWowJWnwKwli5qMkLqaKCaJIHZTDklm09vuxSOX2g+gGgrJfZmJe03GW6RIgf4uoq5yoPvbL+p0ZdwX/0hyIHyqcPHCuaNex8E4qW/fhoCbYCc2vwcVL7g3eb14a+/O1bl0JBmjmDXIv3Np0AamKcJsvrW9vqhHlnOJ52vCqv6X/h5/xtzojn7s7Bk1ze5N2TqLTYssqzqqYTn0/2hjuKwq8U2Z6rY3Jg/FaLGAa5Mw/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSSKgeF8DViPlEuJUTL6PJvogNvYXdwWv83X3SYwMWM=;
 b=eedmhjy3OxFxXeU4ULyZz4iyavfrdmjbZnbHE/M/DZgqLjeqjMjXrUzX9U6UU39ffIrfxBFC8NyomHc7BGKNPhZS2m7HRReG/Qk7M0IQOhIZPNGGXOQhqGEKylMsEXUGaNXpi+u0mB7QxL7wXubFCz/Vj4s0GfN3iYtqg2nl7zTpuHlr3r8bOFZvz/zCIHblQdLCprMQgYEgObNFrCuIydVoXjCD2KlSBQaxgAXNZl+naHTo0inZVtkfptmvBEI1CTmhZE9GapA7qqRoTyVpb8azsMIf9YsfhgzMVauktJmujx7IHq640kvQdZn8wxtgv397bgCFSAhKXXYa4AHKcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSSKgeF8DViPlEuJUTL6PJvogNvYXdwWv83X3SYwMWM=;
 b=wo0lXrasmBLu/bBjfOKRYRMKDVyiV4/K8aNx4ci+mIVGYdumErmVK27cacJO3ZPjlwJDOFWR85nZbuVv3jcF/QIunnoYuC84sHO7etK1nWU9svpvHjITAe2hsZfFezXE72tReLHS9XWkGJlH55EiwaTcPVPp+DPcvzeNK2J1JA4=
Authentication-Results: broadcom.com; dkim=none (message not signed)
 header.d=none;broadcom.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2094.namprd10.prod.outlook.com
 (2603:10b6:301:2b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.31; Sat, 24 Jul
 2021 13:35:36 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4331.034; Sat, 24 Jul 2021
 13:35:36 +0000
Date:   Sat, 24 Jul 2021 16:35:15 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     somnath.kotur@broadcom.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] bnxt_en: fix error path of FW reset
Message-ID: <20210724133515.GA3293@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZRAP278CA0001.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (102.222.70.252) by ZRAP278CA0001.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend Transport; Sat, 24 Jul 2021 13:35:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da3686e7-65a6-45e2-36f7-08d94ea7eb36
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2094:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB20948F7E846BF183D66CBF738EE69@MWHPR1001MB2094.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bn3Z0aeDEZiD5tpkpfvUfJtJFtuhiGaZPCcDlU672xRAcK6CJbWDjDbI7+ItRdM+WOYYuDA9ZXsxFqWHeFFQyayt6aoQc78KIGQHZus7ixozTbzufN8bVhteyw64R3e+9ery8Kdo9YT9Hp6sogszDZgCNFKWt7ltCT7XsyQf7IFDEaJniqzoQj3SweNelIuS4s847mfK1xOrls7jqIp155SljdLqvc1JVRdOqinWAtePOJ85sJHzqiqGsSEF3zU1kV3qOtFo0jlabFWy0MKpqeoyUexjjFYRrflw66yHtCE/0awv6IMRnDviyI3dldVL84b9nflj03A/dMf2zRtTkXUNW6GoebUPPvfe6zzWzm0qBKTM6+E3Cn+z/x3RAlgShsBz7yQ5oaf2gBqMIkEIfYzSTsGQZUk/M/rbwcEp/Z+NFxe6Fd1A5FFDWova5hiJKMAYpBuFgGHxDOLZhwqss/5McmTasdEJ7twYn1e/37Ymg62XuFgTEvBPmJ7pKbuuiAXBvwXV7+KvwTxVVlPFpgu3t4z5mnJnKjA9imIcszQulhafA5eQWPq14oxaZhGS5fIeJyv69x+GrepYIhOfUZQXQyJNsMvIdQ8nVuXp3XaO9S6JUW0zjKzgRpyMoxYweMgRJc7TC+9jk+JJH3HvrpUjobELTznzFrD750ZCTikX5NaFlZe1C3pPR21aTTSowwnnz0p9SXn27LmiXM2rdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(346002)(136003)(366004)(396003)(33716001)(44832011)(52116002)(38350700002)(38100700002)(478600001)(8936002)(83380400001)(66946007)(6916009)(316002)(86362001)(9576002)(2906002)(956004)(66476007)(4326008)(66556008)(9686003)(55016002)(186003)(26005)(33656002)(5660300002)(8676002)(6496006)(6666004)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oaxFsgKQ/qnRwgWDmmtRrVdzYK8BvFYaKMFG/B4rSVaGPIUmbuyoaqkHGD9U?=
 =?us-ascii?Q?ZWz3cKatidZIhCmQWl698IAwXhVnZ9qjqp6JdmqJr1XxfsdHSngIvsYcEGpW?=
 =?us-ascii?Q?icHmP7mhq+mUUOpbux5kSuTqxJqSQQtp/vlyAOhndKg+1GIFjEy2RPYz+6jz?=
 =?us-ascii?Q?ZmFeIbE9urswO+atn+WuyNMzwnA9e2lgOmv8cT7fGBX+kAyBPJXQM+AGmE+t?=
 =?us-ascii?Q?v3EBdBMeKckmC8HPqXTpSXNknV0Jvbrq+xGJB+EwYGzFt3nWpzJHVSDp+ly1?=
 =?us-ascii?Q?SFCoWWJie78QrbX/ta8tNoh7FCcVukl6Qo1RC7YE7G59TKUDUbj9RhPPiXN+?=
 =?us-ascii?Q?qYcRCi3gwbjKPRpID1b82mi2MMDsi78fkoj8NPPYJ5/oc+U+QMoAj5JJXgDM?=
 =?us-ascii?Q?qHLvidr3V0L/ZpzXMx+EpCTHs3pCgB5uiSTPC+dYfXouNMd6iCkhtZsw+kR0?=
 =?us-ascii?Q?l9VzS+Z+RRslYH6mv0OlkHbMEpEk19zt3Io6ReR+uPAAyAOjML6DiM0vS5WT?=
 =?us-ascii?Q?4lKcu0NehzQ5p8czzeXtUguA46Mj3d6GX7v90ZRZVKqkf0qysZ+7aVOTz3Zv?=
 =?us-ascii?Q?5mh+b9r9C1oHwVjNcdIWEfiYIAhk2OEsb4cfopCV6ui0xti46a07Pek/dXV6?=
 =?us-ascii?Q?NCtKOt+vDvKLSq0ZrZfcIND8ZmQNZgZeM3J4r/tg6Jt49KSgpT/2XedoOPuS?=
 =?us-ascii?Q?d4FgljDQwMUZFt5Q9k9v5Rv4Gvj7sARZ9BODT4Z6BLRk4OWDNqtoFjW4YOY2?=
 =?us-ascii?Q?USURSDPORZUmBg7u7BluCywTa6BFZzYhIToLjLCsWkJpdb6phdQ8EYmtS6Uo?=
 =?us-ascii?Q?c1I1J8tmGb2O4NgnM9kgeBsp0T0ZkUlg/DYpjkQ7Ud/L8CvYKaLew8BleEoO?=
 =?us-ascii?Q?PjB5WvoKvK0De/m2b4HTA9AHS3lOt/y7PooG1pI4vVgj8hZ/w/2vUMaLoY73?=
 =?us-ascii?Q?NlvOoOaHfmMJ+GYemrZ/j9fe+MWyws1Ubk0mLRZ8UxQcqJC8BLBKhU2TtFne?=
 =?us-ascii?Q?yYcotBzpHQpQTXcKPPW0vqWHxIuxovkhRKqDuroDb3VQxvtFsOha9qoESZIL?=
 =?us-ascii?Q?OGaMMg65HaDPNvyE/ltsbnYRKqtupkc0qRiP8aSdfebN8hWSZh/hQ6cIZ30w?=
 =?us-ascii?Q?kVW1Q3qyYQGTdOlEDWLE+ermVpVG3LQmNhsGQB6fm9lndo4Fln7qL/8s4zzU?=
 =?us-ascii?Q?gUqLqRSx8C91Drtx/JFG3U2LGxcAmYfDqOqEyVZv0ldfzBt/xcK/FtTwgXW0?=
 =?us-ascii?Q?ccb5Uvz/n/9/tRYf3RZiCp9/g4uEvxEhpA1N19qtxBmF9eWTjTW5HiIXh+NF?=
 =?us-ascii?Q?uG+aCIYz9aN/P1SlrjIeGXfi?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da3686e7-65a6-45e2-36f7-08d94ea7eb36
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2021 13:35:36.5487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5klvdeBqUzK7rlEltGE3o4aAvgNWZFpTh/wQwAsl0rt+Y8H8gMywYMIRFErF8RbIcVcax5L0K7CMTiRrs7aKWKzeQWGnLCjARt9UH8CtRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2094
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10054 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=818
 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107240083
X-Proofpoint-GUID: 5GAC_tXMWXdz2FvQy_pfoWZEpG_xGVuH
X-Proofpoint-ORIG-GUID: 5GAC_tXMWXdz2FvQy_pfoWZEpG_xGVuH
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Somnath Kotur,

The patch 3958b1da725a: "bnxt_en: fix error path of FW reset" from
Jul 18, 2021, leads to the following static checker warning:

	drivers/net/ethernet/broadcom/bnxt/bnxt.c:12135 bnxt_fw_reset_task()
	warn: duplicate check 'rc' (previous on line 12123)

drivers/net/ethernet/broadcom/bnxt/bnxt.c
    12117 	case BNXT_FW_RESET_STATE_OPENING:
    12118 		while (!rtnl_trylock()) {
    12119 			bnxt_queue_fw_reset_work(bp, HZ / 10);
    12120 			return;
    12121 		}
    12122 		rc = bnxt_open(bp->dev);
    12123 		if (rc) {
    12124 			netdev_err(bp->dev, "bnxt_open() failed during FW reset\n");
    12125 			bnxt_fw_reset_abort(bp, rc);
    12126 			rtnl_unlock();
    12127 			return;
                                ^^^^^^
The patch adds a new return

    12128 		}
    12129 
    12130 		bp->fw_reset_state = 0;
    12131 		/* Make sure fw_reset_state is 0 before clearing the flag */
    12132 		smp_mb__before_atomic();
    12133 		clear_bit(BNXT_STATE_IN_FW_RESET, &bp->state);
    12134 		bnxt_ulp_start(bp, rc);
                                           ^^
rc is always zero

--> 12135 		if (!rc)
                            ^^^
no need to check any more

    12136 			bnxt_reenable_sriov(bp);
    12137 		bnxt_vf_reps_alloc(bp);
    12138 		bnxt_vf_reps_open(bp);
    12139 		bnxt_dl_health_recovery_done(bp);
    12140 		bnxt_dl_health_status_update(bp, true);
    12141 		rtnl_unlock();
    12142 		break;
    12143 	}
    12144 	return;
    12145 
    12146 fw_reset_abort_status:
    12147 	if (bp->fw_health->status_reliable ||
    12148 	    (bp->fw_cap & BNXT_FW_CAP_ERROR_RECOVERY)) {
    12149 		u32 sts = bnxt_fw_health_readl(bp, BNXT_FW_HEALTH_REG);
    12150 
    12151 		netdev_err(bp->dev, "fw_health_status 0x%x\n", sts);
    12152 	}
    12153 fw_reset_abort:
    12154 	rtnl_lock();
    12155 	bnxt_fw_reset_abort(bp, rc);
    12156 	rtnl_unlock();
    12157 }

regards,
dan carpenter
