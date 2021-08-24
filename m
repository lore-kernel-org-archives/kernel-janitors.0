Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C0AC4338F
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Aug 2021 09:07:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73C0261360
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Aug 2021 09:07:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234037AbhHXJI3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 Aug 2021 05:08:29 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:13634 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230159AbhHXJI3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Aug 2021 05:08:29 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17O8iCEM015024;
        Tue, 24 Aug 2021 09:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=xd5f7Y7XiBZNLVYhaFH1DeG1birweaOqHj415DzyusQ=;
 b=0gUI6MOVXEYSXTg7CKwySDXRIwou+Z+JKxeyr7bkQP/x+CN/nP1zgoWc9xrzJG5DRjSb
 Nby5VnNR7qv92Q+s9tS04hyuf2L+yfEd/SU7VPkb24hZAO/XoNjBZw6+fvOPc5ko/UYC
 hSsz77adO6L5Z9qcH2wKJeLImxoYnj02S3CYth+dnwu796IC/DD2+q1reK4sZ7k9RB2E
 ExLXPAwr13B6mZGM6z5bqVR8N+EpeBuWhB3SWHWPewHTxL7Ty0/sKzcHpS7yWBKAbHlz
 KwwwBOBC6w5vfYzDqvIJbbiw30IwyP5w/JvJfzQFn/FrGvRxGW1CvSTDvGmf5i0CnqAk ew== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=xd5f7Y7XiBZNLVYhaFH1DeG1birweaOqHj415DzyusQ=;
 b=V5fUgr6KZA2DRkdo5EQE7LMF+n1hLmLL0TUF04nkZWUwe5cUReURQifVQAzebpfOrrtz
 8Q/OwI3RQQITswNmcruoSoSrhKjwalr24dK+54Bt0wKjerYkm8FfBISNbqBsbav4Brma
 rmH6w5O+TShNGx9ftYVP/KZzXD9siHw/fDh5uwj2bsTyBr+JnAscOG8D9ZGSnb+RHjsW
 Jb0GbvMqVtbUkvnPoRp27CaD5FkhoqIvFfVZGa6ihnwkYm9OMFXcBb6nUUQp7/A7GBad
 r0tyU1VOVADuOiu5hwQ/Kl56P1r6uOJfEqpGcn+qT4wcsBDTRtJI+RX37+BZyKHOryGu 2w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3amwh6g2pd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Aug 2021 09:07:43 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17O95VBI019215;
        Tue, 24 Aug 2021 09:07:42 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
        by userp3030.oracle.com with ESMTP id 3ajpkwx92k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Aug 2021 09:07:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fl8Cb6Yd313oxuk/tkon1qjPIlOLr1fNK3VtRwaOG9sCUvLug8QoWQ4RpZFLHCBthDvXiriSqgmoK9Kr4ZAE9Ik9rfmu1B/AH8ZgpUZq+jfGl6+ig8J7AtZd6f/xtPiik4868Pe89cKNyI8kjLxLyjZr8PFwmlwZ3pJGj/+Xcj5bLIuo0EIHsIs4dqrFx9RMbeDU6dHOtYH4aHT1t1Yo1rnKblGfrHjZ6TBv1CTiNM0+JwYTzijXGEMkCkGstL/FZPXPAedqg1eACWdiDXsvf4FKFbAN04duhidnyHq2OT0MAubd8YFf12pb+2by7njwMePEqWZbIn4tjJaV8fW1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xd5f7Y7XiBZNLVYhaFH1DeG1birweaOqHj415DzyusQ=;
 b=CFQpxQ3MQvkU1PuUwzH5J3dLAN8zHmmn2DZGarWqyBFC6KzoxtG6pMGEyHPbtOaW1dL0Ws86qnRV51Nf1XvCNK/dE6G/BRm9DooajaWbFURhbylU9h5hIO1v814/pasP+ZtQZW9TZaTfgM5VfcQlxc0LM/KosYhdX/UNxBDVsMip966nKJ4UUl7eL94NZu2UGBvauF9F+FEAEt3NZMjla0j+r0KGDzWv/mmvp7ui3jomshQgGGbvQc+mFC6l/LZFO9bYAYZCTUUA6Cdn60UEIcdTsOJOu8Njlp8Hi67q8tjYQsGD2ZmVyuQjnNx+QuBytM7oURcmVMofvweYRuSZpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xd5f7Y7XiBZNLVYhaFH1DeG1birweaOqHj415DzyusQ=;
 b=dMPfEGdTfIikPQCzcEeRo2wTRRpsV//RBpEALBkDEVRYzmKhi0yvl9vytz2aEVByFlkf78oy0kjM3pZTzTY7BCcaMMCi5VG357cOqOvWg9LL7kad3f3yLXaxdOamDRZTjNys3o9v3iDCmnJFQArgfQGoG5CBAK7T76QLrrdhMdU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4707.namprd10.prod.outlook.com
 (2603:10b6:303:92::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Tue, 24 Aug
 2021 09:07:39 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 09:07:38 +0000
Date:   Tue, 24 Aug 2021 12:07:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     tz.stoyanov@gmail.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] tracing: Add a probe that attaches to trace events
Message-ID: <20210824090726.GA18835@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0035.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0035.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 09:07:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 082b5746-736d-4fc6-9cfc-08d966de9eaa
X-MS-TrafficTypeDiagnostic: CO1PR10MB4707:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4707FBA5A74BC2CBCDE292AB8EC59@CO1PR10MB4707.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2dJL0tXcLv+7rrrPWj5kNsTX6Yry9zzxMkrU6qbpYQ1A8xXaYpG3pV8NCwcsIlsveAE1/+5eG5c6qth5Y0DPmQ8FjgmVam2AAtAuzUlE00AzOIUDsXkiJYby1pWeEwocSB91amrOVYfNrFKySXAENlFEQlKDDkWIp0BRp/Uf7lgAk2JjnZCPPncry1wQPXpYaAoznANn1Irh+cZe+aBPUJRN8tlGmJ1TYPSIisJ2JqOLttud0q1RJHoZoUpffDk4EBTD8ugDFYiUG6IUp2+Sd5IFmCj30zazCzlOReG7ufM/6A0ShkMC/BvO0mdEt6a16cULVxyd/wyJ5gjecMFJBqk4aGKTY4DK7+P8DuKU1BORj+8DbwT0wD4/Pfb+6j5aQJ42eN8rf/yzxa2pQG4LhgMsBBsW2rs469crOa5u+0mBNQJ/LObH+orglcpHZDUjXZxQCXLu45jq1yDKQRPmCmD6blDcFWB3/fOBoH/jkzkDSTShlUGULLVlMApSwoS5p4bvQec429tY9hB6MzTRaR+jxGcn15ad2kBoV8wk6xRDDu2Zr1AA7+6UG3zpVFBEkY5NAUyLQKbWR2pUbScWokTK9JAF5XMpxInSuDoPKAKvhSHTRG8kvGmi2weIRHeLmN5uwpeCG2krWDE0ZYbXjhGv9LG8u78dZmaxKy0o0JSCy1hr/j1/66ZJEzBBtMv8gEGTU7qy/xagKk/b0WHhJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39860400002)(376002)(366004)(346002)(66946007)(478600001)(6666004)(186003)(9686003)(5660300002)(86362001)(66556008)(38100700002)(38350700002)(52116002)(956004)(6496006)(33656002)(8936002)(4326008)(9576002)(44832011)(1076003)(26005)(66476007)(316002)(8676002)(6916009)(55016002)(83380400001)(33716001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7loI4qEMPy2ICtQGS7eYMiI9Bp/nFRFQn8aL/48EsjlvSscz3wq3ClJOJY9h?=
 =?us-ascii?Q?yCauUmrStCOTqVGXZukoxW2Pu+KVDRkQHMtZOu8733jHiI8979cKM8/hYYAS?=
 =?us-ascii?Q?vnhHtNrikzneio1n8oZzKmX8DRfiwDNSoqzwPuaePDDPnxBcXmyyuYZSxwPt?=
 =?us-ascii?Q?Aer1rnIezFUhYKxt8QqeIjC3HcN/GaNLghk/2qwA90/1xNOYU8mkaIJdHJSZ?=
 =?us-ascii?Q?YeRvZqtzhv0vqmlacQAoBqRXqMwfIax8fEfGr3NG2NbqRnc3PAlmhovukaZl?=
 =?us-ascii?Q?wDOmySppfWnhDJSrkZCurDyKeO7uMNzN22gIuUOGFbhTIw/1ZjUiqqUL5D+C?=
 =?us-ascii?Q?8ROk74HKWT7Z8K44z4PndwJFjuTYu9K2bnC2zH2cB4PM+Cwams8mXeC8J6wn?=
 =?us-ascii?Q?UadoqbUX/UFcXhZWUIc5RVpopJLsWZwoSB5rYz9ZX3WjK7zQCefuEFFtswnq?=
 =?us-ascii?Q?4AmF610713AnZHlSBpP8R/He3UGqlB2U/d/a4x4F7nGd5/c3M2wGlWwqhb79?=
 =?us-ascii?Q?xXmWXJW7en3Pm2QeEcMTCmATcpEd7Swrye37dsa5eMuwtWUaz8LAjpPGHqeX?=
 =?us-ascii?Q?BW5/g/p2vZNUQDV85Y3q5NFsz1NTc2ZKQ6SimqikgHsDbxn+R6mhHrnqy6h5?=
 =?us-ascii?Q?059VDFn6Sli0zsZSoyYpWfJ/MOrHuElzYx4N88R23mo6ycFW3/8bE/JZEJFx?=
 =?us-ascii?Q?s9h6/zzl7roXQ4ZS34Glepd9huG/TiRXRaFQHajaNiwZGelDJerFZwm/JYsa?=
 =?us-ascii?Q?C3LaV5OYJs608Ur4/ULOVHuG/f9TY3jaHB160vrpeckTbgUrf+8UZjMiYa7S?=
 =?us-ascii?Q?F8pXpxKMR9QRQShicWDvFS5jtUE6LRAAn/4XpWK8sHmtVlMk9KCSsclRLoWt?=
 =?us-ascii?Q?o8j/yM8c6AggcVLdkT9EfEjbAv4li8Bt/dFRL1Hi1PP95Izp61gptuqFUWUi?=
 =?us-ascii?Q?Fv6HKzMVlqQWM8ZrZdvTk8djGc/4ExwIfc37XcNNNMbt4RNrSDK6r3woGg3P?=
 =?us-ascii?Q?J02bnvjsoqK1TXpne43lISepTho6uAXENOKAhnB49KNKuetYo6Ghob+6tj71?=
 =?us-ascii?Q?e20LmCZ794rZlwhb3ku5/IOBorob/M4628PbeqJ5KrozXhfdsJuMKhc1afBQ?=
 =?us-ascii?Q?kVNm+u8bbo06nzuOOAk+bgecD5SPjWsfDSqZ7WaDeKyR6OPw/wfAMsP+1Y6W?=
 =?us-ascii?Q?Q9DTJck+/U4VPrDqOXKzyTLtC9dJP74FICQm/h4jbMCuaBRJVJSbdrJkKGkl?=
 =?us-ascii?Q?t7hH/Vs8ZoD4IVzuP4H10qojE7pIjDSZfqmx7gZpR0tLO751AuahCcxz1Y4D?=
 =?us-ascii?Q?F7m186Bdml1Aur9A3gAP6Pby?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 082b5746-736d-4fc6-9cfc-08d966de9eaa
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 09:07:38.3628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJzEHGpDXBOxs/jFqgPxXMy1sq8FL63l4acDvvqf5xF0Qc1p+1x3vivIJ4k3oyawkfU9rpukZ4b//CPhe+GO4+YZNqyAEpcNy4dgNXTKpUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4707
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108240060
X-Proofpoint-ORIG-GUID: c3lC4_x4U5hDOuiJbT09Q17RzsfJJvyr
X-Proofpoint-GUID: c3lC4_x4U5hDOuiJbT09Q17RzsfJJvyr
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Tzvetomir Stoyanov (VMware),

This is a semi-automatic email about new static checker warnings.

The patch 7491e2c44278: "tracing: Add a probe that attaches to trace
events" from Aug 19, 2021, leads to the following Smatch complaint:

    kernel/trace/trace_eprobe.c:674 enable_trace_eprobe()
    warn: variable dereferenced before check 'file' (see line 664)

kernel/trace/trace_eprobe.c
   638  static int enable_trace_eprobe(struct trace_event_call *call,
   639                                 struct trace_event_file *file)
   640  {
   641          struct trace_probe *pos, *tp;
   642          struct trace_eprobe *ep;
   643          bool enabled;
   644          int ret = 0;
   645  
   646          tp = trace_probe_primary_from_call(call);
   647          if (WARN_ON_ONCE(!tp))
   648                  return -ENODEV;
   649          enabled = trace_probe_is_enabled(tp);
   650  
   651          /* This also changes "enabled" state */
   652          if (file) {
   653                  ret = trace_probe_add_file(tp, file);
   654                  if (ret)
   655                          return ret;
   656          } else
   657                  trace_probe_set_flag(tp, TP_FLAG_PROFILE);
   658  
   659          if (enabled)
   660                  return 0;
   661  
   662          list_for_each_entry(pos, trace_probe_probe_list(tp), list) {
   663			ep = container_of(pos, struct trace_eprobe, tp);
   664			ret = enable_eprobe(ep, file);
                                                ^^^^
"file" is dereferenced here.

   665			if (ret)
   666				break;
   667			enabled = true;
   668		}
   669	
   670		if (ret) {
   671			/* Failed to enable one of them. Roll back all */
   672			if (enabled)
   673				disable_eprobe(ep, file->tr);
   674			if (file)
                            ^^^^
This check is too late.

   675				trace_probe_remove_file(tp, file);
   676			else

regards,
dan carpenter
