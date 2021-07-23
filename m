Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444E3C4338F
	for <kernel-janitors@archiver.kernel.org>; Fri, 23 Jul 2021 13:36:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19AB160EE6
	for <kernel-janitors@archiver.kernel.org>; Fri, 23 Jul 2021 13:36:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235227AbhGWM4Q (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 23 Jul 2021 08:56:16 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13810 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234972AbhGWM4P (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Jul 2021 08:56:15 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16NDVwnq007132;
        Fri, 23 Jul 2021 13:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=01O/AoDj5FmU9x5+Y3L6WDb9Sc9jbTjGvsXPpfM/1RU=;
 b=VpzvDp9+6FgWQ7fuM369v0mWnTKyo6mKpZNK5EVltU0zxkYOn30OCCAwknmwhsrIg9N4
 2g0aReLVNH/tPntc59RfsJ9SuEJl5a41EM6e6vElSVoMLVMn0PVTU01akVSGL5hXKhjG
 47qW4KSG9et6LHK6uFK+L3zLj0wXUOmXoVbCy9iXBO6P4mm5DE7XpnaSYcMXisKhDuGU
 +TVYYazkMNQhiKsirXPCJgtgz0vuckrn7JZF6PzjH/RHNMZcM+7wWtLedNjo4votrOoY
 WuzIRQ0CvgmRsjxQ5rvVr05nBwu2Qn45iEJPWAC2FjWihk+6g9DaJNvQFo0p4wSuJCOG 0w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=01O/AoDj5FmU9x5+Y3L6WDb9Sc9jbTjGvsXPpfM/1RU=;
 b=vtHzJeNT/p6Y5S/Nnm02/Onew8Ekts9HjcBY0CIYScSVz+lFWRQnF6uuIQ41csE7JpP4
 ILOgQ/wnYSL8x4VsGAUxSb7312GG4IXqb5LtonrESCnvdAn99mCezfxZG1LwhB5XyBxN
 y8xtQrF4OXUaI6h6d+taZdDrniQvg6yzsTHzLSEm7V+SwR2LY86FrG3rJofy2EK68Lv6
 anq6MIX2LiCmmdIdhsABa14VHhZ1Xt8hpHyGH76/uDfnJfPONYff5VFPQHrPag6NH/MI
 Ih42bU4NdndfXpRQh/+1nH9inYFpHogfSmKZHH3r/ug5zUvg4UnZAQcrBQZCI0jx2dDE CQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 39yesmspfb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 23 Jul 2021 13:36:47 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16NDUXfU167312;
        Fri, 23 Jul 2021 13:36:46 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2049.outbound.protection.outlook.com [104.47.73.49])
        by userp3020.oracle.com with ESMTP id 39v902r66d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 23 Jul 2021 13:36:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTIF2fsXelTDFEd14xBpIOKHcPQOzPqsL5TIYz0Vyx6HmIYkP500x/jrf5NayTtYxa6gRg+GM8o0sFvc/X5TF9kZNzXb+rUj27ZkRZiWVPwfMq66+ycR6GZQ7GV5cci5MhRLjoUgJgLLNpuOg3r2Nffw0ujQGCjbcFb1QSp7OQjfzfwtQ4nBMbbext33Z5BivhPtUmHLJLl41Zw+m9ZuM3l39Q0Ko5L+CDRTdUdJe7Er3/+SXXlFIZZMDFAkIWdmqbIL7gsXsMSucqqAIyH6UDTTIy8Tj/CUr3tkIbi4U4XHYRg/cKxLB3NyBxWX7Ye8/B4U5thE313Mt4kXqqjxyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01O/AoDj5FmU9x5+Y3L6WDb9Sc9jbTjGvsXPpfM/1RU=;
 b=fPHeXcQfX1iJKnz8bhDz+QMqXLuYOSwywuY4obLrkauSbdprgk8Tkr/thnZmUQtEUjKKFCCBtQGgzf/dM7ak2l6OTmF7+rN4Or5j4t0kRm7P3lbjw6F8ExydnDt9e+OxZOO/raj6PyY8p9BGSO9kIoWBRcjrWd/3o8Vhr2+W86mZf+VtH6kr85pWmFEb3a5Fnr6N9aNhYmnY7GSp60Zt1o8jSYe2cuxD9Ehs8k+ljTfwFPWHV0rzh39BcSnFhfCjwr/iAfdSi7Ld92k+xs41j7Ap/ubdkxnC3Jl5MV36TQtsb0JSermGNjrJcEk3EDuSZjJny+pt9DI9Bm5YWoOMZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01O/AoDj5FmU9x5+Y3L6WDb9Sc9jbTjGvsXPpfM/1RU=;
 b=jyRptybJvT7njNVVCiU7jfnQXGdrLjGh8Zk23iGbCU0+e4nt8zpiSjOzs1906fJJeaaXx6K2g1ChTNftGW2uyNv1T04v96D3iW0/e0nw8WsfJRvF2jqumiu21TTi+7SH31GdHhtSrX6Is+UQYGRwpoIL4uyVjeLMbcnEHlqE+Sg=
Authentication-Results: marvell.com; dkim=none (message not signed)
 header.d=none;marvell.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2207.namprd10.prod.outlook.com
 (2603:10b6:301:36::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Fri, 23 Jul
 2021 13:36:44 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4331.034; Fri, 23 Jul 2021
 13:36:44 +0000
Date:   Fri, 23 Jul 2021 16:36:33 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     sbhatta@marvell.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] octeontx2-af: Introduce internal packet switching
Message-ID: <20210723133633.GA18413@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0118.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::15) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (102.222.70.252) by ZR0P278CA0118.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:20::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend Transport; Fri, 23 Jul 2021 13:36:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38f80214-8373-4ead-0643-08d94ddee90a
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB22077EEC48E855AA453C21828EE59@MWHPR1001MB2207.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GuWE/Mwtc0bEzi/KFoafF8rVArwTr0+oafif3Y3ddy0pJ9eJUBMCeKzxV0diAvDpL+L7VsOuT1RLzphpxhZsAayETwZa6Wu93FpkqsItu3NtFVaa6PaV3+oM3w54dzz4qJtBz7j0EyIXtIpGt0pQ40qPnEat3d6FVe+E6kus/lEVRjBB0kF2z2ifT9P5aJEDyuuhR7791Jid9HRgRF2IuXd8OiVD1k5Vp8QlmVfA9ifYAwo+yYVkpRI7Fl9Kexqehac5IjMY1Oh97ab1sl/PTGfIrJh700/CMe8j6HMJ1EFAE2T95DNKgGZiPhis+lxbXY9Tvfq8gh6Pj7T46jzxJMIA7HvITk/OKhdGUaJ4a3tZR6mNsFcw7xXfO71y1GIfvDbj3dHIg6Vv1V9I4RwgDc4yOpm/Pj768piWxDCeIsRXcalpS8csmRWhOxuzNxps9ZB/cxKm8mrlRzYGw09HP4ORKmWlU2/9cTM7m5sE4/KMRkZkoC0JbrWRocUkiSWxzrJeT5o9Os4zuUnhnybVmj185M0Ew8+8RetkfxQodnetdbw38hGbaEvNHjt80CLJBbFMOgsSCbcx0Ujsnbp1Rhf14AnoMYze/OKvlMAVEid3ENk0FESNN2SSkqIfU5L/b1KAOiKV+bKMMPWiuoKDz6o07ac7eawNGHNtLsVM8HfeblxHakupmuMOYON9vQL6l0Dvd4JhhjkXDlkRK26jzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(346002)(396003)(376002)(136003)(52116002)(186003)(956004)(5660300002)(316002)(44832011)(55016002)(6916009)(1076003)(9686003)(66556008)(86362001)(6496006)(4326008)(8936002)(6666004)(26005)(2906002)(9576002)(38350700002)(33656002)(8676002)(83380400001)(66946007)(33716001)(66476007)(38100700002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TTKdXyB53zNyZxrbylNSJs9fOpbG6e4vD7KmJai4atjdOLL0ny20M/rNTUh/?=
 =?us-ascii?Q?1hrtfY8HFHae+xhisxEGywI5ZGIul16lPehrpl/R8AhpGNdoyptCCDgoxKd1?=
 =?us-ascii?Q?WXcgQWPnrhVa710YzM/p1vgpmoUUx4qn9rvPEnhuDbqhYu4D/J2+GiCw0dqC?=
 =?us-ascii?Q?a/hVqCL+Nv1sEHN/coi/hq3unMkQTgm7WRCOSh7lgVnfdC+607pcJ7WwD3Uy?=
 =?us-ascii?Q?gopHHMEnDMBlLsOvDj2DA8ytbEiDLqWZH+odBuHME8CPdUrtp0sj87wrIKK1?=
 =?us-ascii?Q?yeyMF+lSxNHIRFw8Qxt/ULU9tCjSmI6b/R7UlqL+NUHrz5a/3sfxjH0cNF/8?=
 =?us-ascii?Q?ZmZxO0uZMD5FiE+Am+zFaXjbkZ7H/hdVAIZ6DQLwaxe0Gxtj2n0b2id6Wf9D?=
 =?us-ascii?Q?AsiB0n+SgY10CpQCMF8GAr8/8WBzICLPWVsk4u+osDnykmKFq6N0uSNTKddM?=
 =?us-ascii?Q?4M7PIDSrjUCLPPQmznsAD4ULjHhxj6BV/J5R8at2417PjOAY5rgmUOQtTGlM?=
 =?us-ascii?Q?U+5Dg+3tsrxljW+//V1BAu1C9oGGOv/ODt3T7pPQ0kRwA6loIK5wb3rXhvOY?=
 =?us-ascii?Q?6PyfQyL8+vt021z3UahZsqicRCKdbS3TMKgfuylMSAElm6VF4EEvekH5ze+8?=
 =?us-ascii?Q?Y379nRSdKIa5FEruES62z25yZH5Xqetv1YiC4XajFfFAxnrSgXlrHBzPaJoq?=
 =?us-ascii?Q?ERWceHoTm1YrZKEKW6Sipv2oUamknoWrcyzz1ARnMw/Qs+tejdJ2Si5mH2tr?=
 =?us-ascii?Q?b1r7Z+w9dFtjK625Jd+0mRx7hh8OzuNI472Qt87bCOkjiG/XhS9yReNB1vxg?=
 =?us-ascii?Q?Im3ISD9OTx7qPSi4oMxPqXgqa7Lh3fLEzRP7iv9u5bpmu/IBd/H20yEyhlDn?=
 =?us-ascii?Q?9W4356HMQ29NNJsGgyBESXj8x6x9zLrOcCfpa6KYMEPnxQadH1SZTkpAEADE?=
 =?us-ascii?Q?WLp81F/KgUJnJuMAZR1oO9n+2b3zF4LlLBv/cxPnu8zsFZ/OWopr1Qe1DO7a?=
 =?us-ascii?Q?XnNaUMeYujVcsg7nqQ9JrvaIuJ54gNIMDYaOrFmgA2D4l+dABOBcTJp1SIwe?=
 =?us-ascii?Q?lr3x/GYqTuC2zfxoVrVeZ9xMmtNBw+KWSmDMQ1FA5Eo5Ld4UCaihB+c7D8sk?=
 =?us-ascii?Q?2xZc27CcPdGdq4IranefA/nzdOEP05oPOaVSy23mlTp7ZjxVsR+EGuI864KO?=
 =?us-ascii?Q?KgXyZbhdojhy1H/Xp+HgV1kCmJ9RTJyIOwFF5Ln4afBYf/IR1x4+cQFpkewi?=
 =?us-ascii?Q?/c5E8nBiE7yMx5oCtVr+MLp/A+EIoVGfSh6uR/P2M3lScgxbo4odiJGjcWPN?=
 =?us-ascii?Q?06B0rFIt56nUlciXI8U3mg/4?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f80214-8373-4ead-0643-08d94ddee90a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 13:36:44.0660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2sS1jzwuD+6bEkMZzCD5OPTIxv41bYSL45zE4tT/sq1Zaal+hdN27KRYwy9rwtaXSA+YvUN/y+RNLcvWQ9Qx1jdB1ucn5aXXP9NmXllfyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2207
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10053 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=944 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107230081
X-Proofpoint-ORIG-GUID: 9Jzwjft4w7kgg6tTelB2LgdQhrjFn0en
X-Proofpoint-GUID: 9Jzwjft4w7kgg6tTelB2LgdQhrjFn0en
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Subbaraya Sundeep,

The patch 23109f8dd06d: "octeontx2-af: Introduce internal packet
switching" from Jul 19, 2021, leads to the following static checker
warning:

	drivers/net/ethernet/marvell/octeontx2/af/rvu_switch.c:220 rvu_switch_disable()
	error: uninitialized symbol 'numvfs'.

drivers/net/ethernet/marvell/octeontx2/af/rvu_switch.c
    195 void rvu_switch_disable(struct rvu *rvu)
    196 {
    197 	struct npc_delete_flow_req uninstall_req = { 0 };
    198 	struct npc_mcam_free_entry_req free_req = { 0 };
    199 	struct rvu_switch *rswitch = &rvu->rswitch;
    200 	struct rvu_hwinfo *hw = rvu->hw;
    201 	int pf, vf, numvfs, hwvf;
                            ^^^^^^
    202 	struct msg_rsp rsp;
    203 	u16 pcifunc;
    204 	int err;
    205 
    206 	if (!rswitch->used_entries)
    207 		return;
    208 
    209 	for (pf = 1; pf < hw->total_pfs; pf++) {
    210 		if (!is_pf_cgxmapped(rvu, pf))
    211 			continue;
    212 
    213 		pcifunc = pf << 10;
    214 		err = rvu_switch_install_rx_rule(rvu, pcifunc, 0xFFF);
    215 		if (err)
    216 			dev_err(rvu->dev,
    217 				"Reverting RX rule for PF%d failed(%d)\n",
    218 				pf, err);
    219 
--> 220 		for (vf = 0; vf < numvfs; vf++, hwvf++) {
                                          ^^^^^^
Never initialized.

    221 			pcifunc = pf << 10 | ((vf + 1) & 0x3FF);
    222 			err = rvu_switch_install_rx_rule(rvu, pcifunc, 0xFFF);
    223 			if (err)
    224 				dev_err(rvu->dev,
    225 					"Reverting RX rule for PF%dVF%d failed(%d)\n",
    226 					pf, vf, err);
    227 		}
    228 	}
    229 
    230 	uninstall_req.start = rswitch->start_entry;
    231 	uninstall_req.end =  rswitch->start_entry + rswitch->used_entries - 1;
    232 	free_req.all = 1;
    233 	rvu_mbox_handler_npc_delete_flow(rvu, &uninstall_req, &rsp);
    234 	rvu_mbox_handler_npc_mcam_free_entry(rvu, &free_req, &rsp);
    235 	rswitch->used_entries = 0;
    236 	kfree(rswitch->entry2pcifunc);
    237 }

regards,
dan carpenter
