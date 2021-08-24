Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B62C4338F
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Aug 2021 11:43:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 586BE613AB
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Aug 2021 11:43:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235566AbhHXLnx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 Aug 2021 07:43:53 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:5240 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234787AbhHXLnx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Aug 2021 07:43:53 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17OARiUk030415;
        Tue, 24 Aug 2021 11:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=lOs/mHh3v72oZSI9HCbiSPKUut3Xy0g/RHeYtZbkq8A=;
 b=Wt3rkHku9yOERkRQ5Gsy4ogcxib/0CCTszQVQIZYh1Cht6Oh7C16uGr2yblPHsN2Jz/D
 NIAldBX0Nq7vF+S2MwBrOk9XjSHDPdnKmzsooIK9Kazxk6Kv9t9M+iW5ApswC7ZFkU87
 tVhTaUSoTq4Ec5GMn8dgewhklDXz9DZ+Z1En3PZNsznHiVBO79Mh0s3i8+wXMSUYu/IW
 hACj+GKnErgHWw1xsT2X1gePTDmiUzU68kvywpM0p4PwxS4RWLhUgZqE+6K8ItYnx4oO
 zrEtX/YnHMQpQIeAmQ3zlY2jU4pP/FRvzrxzPegAVDqTprCLzkP+q296Mfomif+cOA6c TQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=lOs/mHh3v72oZSI9HCbiSPKUut3Xy0g/RHeYtZbkq8A=;
 b=kDZEp8WMxqWXjgApLwZ1C/AOB7xGgw1Z9cdIjG/led1GK+mZK24DCxO+Z2eknDaRe3JQ
 eEq1DVUW/PCPjWIE/aqjVVbKTv/U4tFLX65GBleRCPUWHlmt4TJZZyXVRVwLvu0hNrr3
 dkg/Wy3OjH0aWLJX+7EccYb0Dmk/D831if9WMBJ0R2L+s6XLQAk42zaIuybm7Tha7IP3
 oqiOctdMOGIMhHw22zFvo9JZF2ue2TQazZ1K4GmNXKbQsQOVh23CNVZNCPDJMd4rL1Hz
 pK37fQyjmib2a6NeFDqQ9HrTw4al+VjySV7cxGVqqt3ZFtsPz5uDbWjOhtu2krJ3Ij2w KQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3amv678m2y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Aug 2021 11:42:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17OBfK19182433;
        Tue, 24 Aug 2021 11:42:50 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
        by aserp3030.oracle.com with ESMTP id 3ajqhefddp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Aug 2021 11:42:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuuNeqbJneOnKhq8eWNy1SqB1OPo53ZWWJmf0CZDsYDKgVNN8EBzmvYMJaWkfc3u8Hj7KC7wiQqyQZbXO6AVqP+2rBMUP+O1cwsA+Ycyu2cfZZQo8LXWeMBKm4Tt3qDX+ZB3xwyVWP9pDsZLv9d7RlxGZL91DoKdGFjbiGdm11uSBTf4Y0qpkAbIN/hjTGmhSvF3jEiLr5gmNHfSzdPthAEPmZ21EwiAxHUJdPblA8g4NJu2ItHVViT3vx2Q6SP+ryXa30kZogWxWqc6hBRj89ABQBa64D3gMd3zoVGAJ+F0xl3PidfpKPN4q8VaaDtg7L2HHQHfCyWXPOAGyo+aKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOs/mHh3v72oZSI9HCbiSPKUut3Xy0g/RHeYtZbkq8A=;
 b=LwHkcFgcSbv3biCDQyOJYPWQJ7T3zBWz3dxBpkfya1igG10LLKC+FWvf0L1u9qHw2cvIKK0OryQiRDNPAuiWxA/G4xLBj83hkkzhQcLAbvcSu6QCZJdBZ0UPMmJg9R72i19v7yYtt8AcTpBbZUZvFPQBChNaZeAsCiJ1dLRT4uWevegH0tzC3IOJFwhtsks6JnqtO5MiSUvY4qNBPjqdNsTn8eWNsV3QvhqWQI6ke8Tg0WPKZhtJAftDuACGc3Bfc2TmLOtTn5aUI2nBGo+bS5qE8l18M5do8q1vLqhkCVrgmtY0eVL0AYrQdJO2kN7It3eIMOLEusB/E7uOQuagvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOs/mHh3v72oZSI9HCbiSPKUut3Xy0g/RHeYtZbkq8A=;
 b=wTjAJbXWAfEgQK/Squ/rZjKSKeO50JU9UdXZPUXnpy5UrTqpLd+MZEZmCNfQejw4h8nvg4B92gNwa4J/LPYQG+VL5phWcbWXmr2KoaTNbpnMN2S21H9WTIe6UUfUaYuTBYGiixQ0j9l2ty4l7x/YmZjDuSF/MsMyiEiyUCWZlDc=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2398.namprd10.prod.outlook.com
 (2603:10b6:301:2f::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 11:42:49 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 11:42:49 +0000
Date:   Tue, 24 Aug 2021 14:42:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     tz.stoyanov@gmail.com
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        kernel-janitors@vger.kernel.org
Subject: [bug report] tracing: Add a probe that attaches to trace events
Message-ID: <20210824114238.GG31143@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZRAP278CA0015.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::25) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZRAP278CA0015.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Tue, 24 Aug 2021 11:42:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e4ffc87-2c49-424a-c358-08d966f44c4a
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2398:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB23985AFC8FFB7D69357E29E28EC59@MWHPR1001MB2398.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qaWaBH1sfCffq/lIOR435/il4UFJ9UfKcGsjuoJkTpQfyhaVeTs9I2f6v+8JVf5PX4kkiC8JUqN334fopi+U+CL+UzvqSPJispWTNikIOxOJhXDdTNJZke9Pk+rocIfuLfblCvLwG9xjDRYSRETJUrstHZ1t2Dzyn3MxfofL7FsJuB++dCu2cnLsp2YRFaGDZdF8jgIdTavPt4PRO+WO1Yt9KHhr264FG4FNkPvxJCay7qXcQ3+HFF2Ecbm2EENYpAcgT8hyNGF5NAkQe0Kf0pbWk8vVIKJ7MiPGpdrJ3RD00Jdj8Bp3HiY18ee1hZGYPPnC1uh56q4KxEaXLIaI7pA7Rpw8f/jcUiMwmVlZr7SfgrLau3eGziKgRaNbEUCPFY9NUQWXAxLbAYx33wgvH0fJJUTrMuX5ZLJmw6imrI+WchMpgh9h7SlRprCcwfPdCftpdvGnqJS2bCpAlKglo8mD19sawLggF7Dbc2LLd+rhzqPvy52d73YvbEKhYhJF/FLLUqbZ9zd6On+hX5UUvkRucfFQhRktOeYpeMqUc4/YXuKePakwTCi+ACBZOcZ+wZ/DYp7OAlSH7NrpWuMO+XVwJeVGOa7nV5wk5Hy/F6iIonGFGfLmoX6q5YR9zPoNRof64dpoCnlNPKPASE2LU4TjjLQ5ntCiigzDl6ffIAWkMw4xkA52PYN7rIvhnzNzBfC42gQGIGoiJB5wx9ujmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(396003)(39860400002)(366004)(346002)(4326008)(9686003)(1076003)(52116002)(66946007)(186003)(55016002)(26005)(6496006)(83380400001)(38350700002)(38100700002)(6916009)(86362001)(316002)(33716001)(33656002)(2906002)(9576002)(8936002)(66476007)(44832011)(66556008)(956004)(478600001)(5660300002)(6666004)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BpLPpqu7K8vGntLGdT50hTYKA/sDw1MnwCa9A2kQRk7/DalP3brdW5OLz/b1?=
 =?us-ascii?Q?FPvM8GxAmqMU5iGyNrBR/KY7HIj0rg+LUsvnYAag3T8mKoL0O5r0zaUjwU0X?=
 =?us-ascii?Q?PSh5aP3ZoPu5CN3S1e8X36Jl81uN0tDNeRpFYg0Z4IU2S9Akm51m9GU66/ii?=
 =?us-ascii?Q?RrgR2Gss1KDB4l0q/u69IbOjhrPsmRHJczLebNCOQOKMdnUwf/3C1wcOfjzH?=
 =?us-ascii?Q?QB4cmRACUbSsdUcaUYuiCgIXlzg5bEJ/pujO1GjUZ8WgwwrGTWg3TnE8zQR9?=
 =?us-ascii?Q?tVvHMXxyQqIRx28rIei1+EKNu9ZIUKwPgyaTsRuNswko3Ys0Syj3rIH6Mo0q?=
 =?us-ascii?Q?JC9krybyDKFfBII7shA4TVLEryeYu6m7H2xjTGMBqzC6zv6Fr9hLEjU4vCDW?=
 =?us-ascii?Q?Mz10SOk5+u04eoGtGgSqm2QcHMtuNwA41Vg8p1/XSFqCI26NEVOEWNp7po64?=
 =?us-ascii?Q?TVQd0n1QUJowgxMaHXqt6nlyfMCBbUQOQZ59a8dORuXI1NDsjyQQJiTYJ6QH?=
 =?us-ascii?Q?xaEi68UYV8/Hjqgbbo5DVuhfZ+qZdCqYxUaoKCpAmEJYSLsUntrPPDu2fGm4?=
 =?us-ascii?Q?h1n/KZXXYWYLWFeFos6ec7o5xkAwUGdk+ysB8zhwd838Of1T3Nquv6iV2PLG?=
 =?us-ascii?Q?IRrdwS2g7iSXEDMA6mKmrha2KB00gQ8TcH/Rg5CYH2YRGRth+w/UXxB0kErO?=
 =?us-ascii?Q?E9d+Vym0CpXVqtkC1vLxyvl3gxphOFtEY2vbWyRRhlObXzASxUa7U+ed0HGf?=
 =?us-ascii?Q?Ko9+mhTDg0x80G9YTDG8Mc5Pl9T6NO5tHDx4TX7rcCyrvFafcBvmQNM3rrMY?=
 =?us-ascii?Q?Z/tuO8ssIdYinxuUi7Q8iaJhkmtMOBJ8KMBqkQt+4e8m5KiwuBzQL1IeHI1Y?=
 =?us-ascii?Q?EySnOt25+zbiUvNjMYo4GdduXFMNhT2Lgpo6VBvXPc2xuo4AgS/Q1W40pRCw?=
 =?us-ascii?Q?eNUb15vLOwpJVhMPmUjswsT2pmzv+jZLPLzA4jEMfTpcm7OAhzWv2yq2kGYJ?=
 =?us-ascii?Q?uVRNQcmh6pDZ5Wz16o33f8eMRp1LAFz67lciI2qVm5CzlJqJs1j4F2tlKNSB?=
 =?us-ascii?Q?OyvF6qkrT7QS4is4WuFadDmb/122eB836Ir+OmYPa0Obxnz5J1l7RFoK98eg?=
 =?us-ascii?Q?arIfNJCS+Oa/BL5XnryUAgiTETMxOuyc8GZxmXbEYVuL0VolvXb4moGdXuBo?=
 =?us-ascii?Q?iO26NMlIE5yaKGo22tF1drz9ySqaspIt/pBzrofmq36Xr8brwbS+RMyzKUSa?=
 =?us-ascii?Q?PgBXLDhUpKzEVK7fZFashw231OKDfMHLvU62H5qGKd2f4BlMWOXhD1zaHFqf?=
 =?us-ascii?Q?4p3un6hemegeZ/NFu+SKIeqh?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4ffc87-2c49-424a-c358-08d966f44c4a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 11:42:49.0815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmNt5cHOCy7/1VrUbWlI1LTS3+c8oLypMYQXsnZiyj/5+PNaH5CVVggF2K9PsiBq39qLDsbhnnjwUCauiAoVkDbw6oChw4D8oGRiqo/VbkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2398
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=792 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108240078
X-Proofpoint-ORIG-GUID: fRRjuiZVul-WcK9UdJnklcy-yVQg1njh
X-Proofpoint-GUID: fRRjuiZVul-WcK9UdJnklcy-yVQg1njh
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Tzvetomir Stoyanov (VMware),

The patch 7491e2c44278: "tracing: Add a probe that attaches to trace
events" from Aug 19, 2021, leads to the following
Smatch static checker warning:

	kernel/trace/trace_eprobe.c:664 enable_trace_eprobe()
	error: we previously assumed 'file' could be null (see line 652)

kernel/trace/trace_eprobe.c
    638 static int enable_trace_eprobe(struct trace_event_call *call,
    639 			       struct trace_event_file *file)
    640 {
    641 	struct trace_probe *pos, *tp;
    642 	struct trace_eprobe *ep;
    643 	bool enabled;
    644 	int ret = 0;
    645 
    646 	tp = trace_probe_primary_from_call(call);
    647 	if (WARN_ON_ONCE(!tp))
    648 		return -ENODEV;
    649 	enabled = trace_probe_is_enabled(tp);
    650 
    651 	/* This also changes "enabled" state */

Since adding a file sets it to enabled, then shouldn't we set
enabled = true on this path?

    652 	if (file) {
                    ^^^^
Check for NULL

    653 		ret = trace_probe_add_file(tp, file);
    654 		if (ret)
    655 			return ret;
    656 	} else
    657 		trace_probe_set_flag(tp, TP_FLAG_PROFILE);
    658 
    659 	if (enabled)
    660 		return 0;
    661 
    662 	list_for_each_entry(pos, trace_probe_probe_list(tp), list) {
    663 		ep = container_of(pos, struct trace_eprobe, tp);
--> 664 		ret = enable_eprobe(ep, file);
                                                ^^^^
Unchecked dereference.  See also:

kernel/trace/trace_eprobe.c:705 disable_trace_eprobe() error: we previously assumed 'file' could be null (see line 693)

    665 		if (ret)
    666 			break;
    667 		enabled = true;
    668 	}
    669 
    670 	if (ret) {
    671 		/* Failed to enable one of them. Roll back all */
    672 		if (enabled)
    673 			disable_eprobe(ep, file->tr);
    674 		if (file)
    675 			trace_probe_remove_file(tp, file);
    676 		else
    677 			trace_probe_clear_flag(tp, TP_FLAG_PROFILE);
    678 	}
    679 
    680 	return ret;
    681 }

regards,
dan carpenter
