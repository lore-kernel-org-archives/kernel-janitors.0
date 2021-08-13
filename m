Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03505C4338F
	for <kernel-janitors@archiver.kernel.org>; Fri, 13 Aug 2021 12:38:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D887360EFE
	for <kernel-janitors@archiver.kernel.org>; Fri, 13 Aug 2021 12:38:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240403AbhHMMjL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 13 Aug 2021 08:39:11 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:57326 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240266AbhHMMjL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Aug 2021 08:39:11 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17DCVdVB000376;
        Fri, 13 Aug 2021 12:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=wwDXmdMbfzgSfs8n1GwPNKiqMmTuWlDWxAnkUKq/G5w=;
 b=Ngbuds5DSLpWCJdKlAEV2+Dro7zytKugtW+7DkN11x5HQI80zk1bNJFHyZputZVpfp9h
 GPGVqJoFrR6KHfjf2NdH/djdYQfWAEXEa1I17ynpDHcWxbbrKs5ABn3GtIrX61uLseVe
 iOGAh+EPGykMKsADDZ1g8+k4t/ldJVj/HZo3RChQeuVsKis1PGB/wbu5vXnVfv1LT89L
 o0/2L6C49KIHVG3vPQCsOsWUztFPdrPC1s3xXK650YcO2J6YDzlsgqfw+VJCAnvvfe2T
 YX46qe+ing1ILXVUoDOaHkjBYAzvWTrAmq9zryejWmMZ3/6IdwsVYWkmQJHmOWFQdjp4 2A== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=wwDXmdMbfzgSfs8n1GwPNKiqMmTuWlDWxAnkUKq/G5w=;
 b=Wu4F2cK7eHxa9QBOmSRdh0X7rRxhsrT8NBTFea6YdGUQQ/hMxENnuNz74QOe1OytT8N3
 ziZt9vKUMboi9R9QEqJuDYetmBpNE1WUr5kPf7nEEkIlxZ0meU0zkIlZpctLhhlAcI3/
 Q9xHg2GWS7qcTS4vgwNbv53Hr4Xs+SWMXu0zxBGXB6n3104wMh5WtvHLfQT33BpCmN4W
 fL7Rnnql1Fqvok8ArPdqnJ1k0mYqqidXsM43vR7/U6Ldzip50b6c9plZU+bOJbVflouJ
 Vu7qTwhldB/9Fmjqe3JlAz+fh4qfonN5jgw1+DujaFykPnEcLzt9FJ6d4jf7YiVTLiy6 JA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3aceudw8kq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 13 Aug 2021 12:38:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17DCahKM156944;
        Fri, 13 Aug 2021 12:38:39 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
        by aserp3030.oracle.com with ESMTP id 3abx40ncq3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 13 Aug 2021 12:38:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMTfCIqAZzbCcuGLF3RKArqraVoMOKpqhiF2x/evX8MHSIifQfGIsyiHdG1lEi9kpv1GqqGmN1pwdx61GAv0k6z/v8qLIq88X//gYSFOP3ZF60dZC9/bZWJ4xwiQeyKvsy1MrXl04CtPQre6btLjvSr06+QcVU7gTugaSbYQLX6nasAviqoM1O0GxEIfAoaJa0cipfT+CiPOU8rRfnbzvm488uYcBn2MpxNvI21c70FJDUzAfNkkGlBWgjZxUDcondoGYkitxSVdkNy9F4za7pgpBl6jRmoKIFGcw2uVRsH2eipscjg6lK9LlUNEQt7IixhyXIBvo4rf1uR4Eb/gyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwDXmdMbfzgSfs8n1GwPNKiqMmTuWlDWxAnkUKq/G5w=;
 b=Quzlncih1y5FhIRJ9l/Wll/TMlPvFl+2Fiwhf7dXKHOOPqt0SwpVIVBCfQdFiGneD+HjX8wDLF5iKAT/D7DGE00+fC/emzW1pIxtXzHemf8RWSz3zU7PQPhhpQDHE+2xBSDMmjXTE/XAAwj/Me0Y7479k027dq1thF1pOaYOrBexftfFXpHjOsChYgS6EURl6tJVHfr1nxGwrsEacAZFCWlzsjSyaa1HTfGZBynSMzNJtKTl1k9+rW3sS/IEgXJ0NsSiZofzhVr2dXCIfWjKpGkDthBxe4fo3OQS56JLBEKs+GYq8nveFwO/BmvfifCKOyqvpg275AMy/MUgNHImpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwDXmdMbfzgSfs8n1GwPNKiqMmTuWlDWxAnkUKq/G5w=;
 b=Jgl1M5fHBMp7ZL6enFz9+JgrSXWZbFTaiYNwwr0u5dIGQm77A3iyybVW+7fCJe3AU7v0ctWecjaHOxbuFMVc0lN0Nv0omFESisb81c80HLZHs5aKJAzSkGr5Ib7Jtv+C0npsHIIcUOoz/EdUdUAFs/uh0IkqaSuugxYNotpQ3wA=
Authentication-Results: habana.ai; dkim=none (message not signed)
 header.d=none;habana.ai; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1774.namprd10.prod.outlook.com
 (2603:10b6:301:9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 13 Aug
 2021 12:38:35 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 12:38:35 +0000
Date:   Fri, 13 Aug 2021 15:38:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     obitton@habana.ai
Cc:     Oded Gabbay <ogabbay@kernel.org>, kernel-janitors@vger.kernel.org
Subject: [bug report] habanalabs: replace GFP_ATOMIC with GFP_KERNEL
Message-ID: <20210813123824.GA6307@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0107.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0107.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend Transport; Fri, 13 Aug 2021 12:38:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cb9a001-2705-4548-c1d0-08d95e57446b
X-MS-TrafficTypeDiagnostic: MWHPR10MB1774:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1774A8E5A7C2819395003D1F8EFA9@MWHPR10MB1774.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zu+cghVtD3Mi6DhcPBl5eXBj/Gk3GdOL2vPPDb9ncTDEuiVNk8DlWwaF3v48IX/FYKU8KjxzTF9B/3t2zgdYiI4RMK02SXuSK27xUSwDsbIN1qojGG8FuH0oNQhmSNxjp3ofuPrmbUEKJsePepOXbG96YGeAVSE1sCAOwTifNbF6Db0GqBHS2cocMEsIebzyldCV5Onwk64TIgcK+Ie44n2JSPn0LlNNM5az5yvWJOQ3MWND09MuXKYDJfi4EoXDA3BVFBc5aiw6f1H3pnYEuKumzL9MCw1RmDEdu5gS4ynv9dalYE/wSOM00wYvED2k1uY5VcTcV3LDhnR8n9wFHl8hxDNhcJRUzjGw+oeKoqf2GJXIH80TdjDwQygCk3YTQZIbeYm83PY+Y3t7L5HqgynBrpxTusakGWrYS3MZtLJUsxSn4NpjZgHMPbbjgTvjF+Qdzk/PXx0m45w4GEkEIb+ltQVWJCn3jBeYylAuxLcx1dXuOvbevdidM2CNz5928rbj+B/IJTgn/68i44yXDjpshF9Ul93gnAZ1jfvB7p7QHG2FHAvwuA7XfE5DLMpXoOGs231uu+6JooCH0BClRdzcVYJ5fFongPfm9bqxPUzb0xwYI4eyGUrXM9OLLQUDLJSbC1EwGHmu/agWJnGIvglMyPWxJj4C4OWedPn7ol1Hs72byE3JeLLXNCPe26lwUqePF5ezu1k4k0b00ljL4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(39860400002)(396003)(366004)(346002)(8676002)(33716001)(8936002)(6916009)(2906002)(83380400001)(66946007)(6496006)(5660300002)(478600001)(186003)(6666004)(26005)(52116002)(9576002)(316002)(66476007)(66556008)(86362001)(956004)(9686003)(55016002)(1076003)(44832011)(4326008)(33656002)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DDT2RKaGb+5N85jz2T+IBRC5wWHSDyvwPY278nh+EcBuFOkjc/QfgUZdamSP?=
 =?us-ascii?Q?afhB37GAJDSuw/biNOe7P3s2/kpTzQ9NAe0bEL6vcmWvx7t/mnZN/6nCPjEQ?=
 =?us-ascii?Q?Yq8PkhR0YRh4t8wcpe2gJYH4vH891HnGU9AMR7lP5uoH8BvoR3Ndj6dgPMOO?=
 =?us-ascii?Q?4GMfsAabHrKI9Qh4m79BRysN/s0sjpFPg+XyEjRNq2YK84qUiqHtFtyO1B0h?=
 =?us-ascii?Q?sX32LBUhjkgqSnPh6XZ2X1TZXLIeBmzS/udjkpgEDj4METC/S2u5D4w8j4lA?=
 =?us-ascii?Q?DXIQf6iDTiHgGaaodCimL7EWl7k2PTHHg57Bq17wykaIIF2vyfq4k42JrZ8A?=
 =?us-ascii?Q?oIOKswFtE50PJ5IVbersxZ1oKW4qlUQkLk28EIUUmRXl3XpSxNR8Avq3C9uL?=
 =?us-ascii?Q?qcR/HA+1bLxmfpLkWi0c7OrwARvhTSDOazPeofT+Pc81sEXz3VjgiCnKULAh?=
 =?us-ascii?Q?hc+EgGPk+J7Do2pNAYf/Qhm4t958JnppFmP+ENoTrUlcRwUldrirGWTdlQ/+?=
 =?us-ascii?Q?BItQkUwG0A2sgJtUi0fag2jjekqnAEg+WNNfL2HtkbhVRCjAOhElRMTqvNVY?=
 =?us-ascii?Q?KBVIU4BViGOXwc6PoGqMDK8eKldpl3AI+yoAWMpzffk1DzMe/rLkta+iXBEH?=
 =?us-ascii?Q?Ek+pCRLoEw/uStyjflibt0euL2R/IKT5UJEXjH50PY6/bAwRICQ7FslL9RiO?=
 =?us-ascii?Q?mKhv8zJ/M84TKPCjH745Jvms8hlGHaRUdG1BbCdBzDMtIt0QjY20wtDmVn5m?=
 =?us-ascii?Q?kG1r7amJUG0KOjcxR41sEyYOmnBLjz1rdK80Y/9fj1F8KzCu1aaoAsBqB3n9?=
 =?us-ascii?Q?BIQWETojW9Yy4vzJ60V6eDbkhtwRidqNrC6Cz5HA7srieaozK0Zg5hbSTnLh?=
 =?us-ascii?Q?KsLSxAOcmu8w2NBNzzU8rQ+6cN93j/ryqRrgyp3UoN+nIOiX8fr0iTZ80h01?=
 =?us-ascii?Q?lunRkHvJxLrP0HqptlECvPoUDzAy6v5eEVDQi/uGgrEXHX/p893W1ncLz0QG?=
 =?us-ascii?Q?+nPtJW87QGal707YCaz6kvHmyWuNRMJNTSilfwew/6xQTpIjQBsHSAFAirAo?=
 =?us-ascii?Q?XWP0n8+mHIrWS4TCZPl24KZGevFQtaGdmvi/xPBTsPahu6orGOW+5Fmwqqwp?=
 =?us-ascii?Q?vGzKlfzEIxQsKGA5qx4pH4TuB/cfLf+KELBwri0gPGMUx+jJTmoijB/h7tJ2?=
 =?us-ascii?Q?i6E5hfirJ/G3nr1syORFTOQANVs3gEzovlNiqTb7u/IhZTdZtaWkkuAse5JB?=
 =?us-ascii?Q?Cfnx1PEfoA/N6dm5DgJYsXKehkGB+xD5gc3eDZVU/V1tuy/+glC6Y9z/yYu4?=
 =?us-ascii?Q?QjD0iUMurdMQUYRcElnVdRlG?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb9a001-2705-4548-c1d0-08d95e57446b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 12:38:35.6012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DblcYOQcHYOPAP4OLUIibWsfq7J71Uc2sfqWwQM7Msz6ZUc9SiR+gCwQmIn3yGKgEmU09jvVqt6xeN1D2qm7FsJLKaaOzVMnrtSH9j64rqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1774
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10074 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 mlxlogscore=972 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108130076
X-Proofpoint-ORIG-GUID: R8TD9I2GJjj8OzW8kL0KHRt386__TXSN
X-Proofpoint-GUID: R8TD9I2GJjj8OzW8kL0KHRt386__TXSN
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Ofir Bitton,

The patch d5eb8373b2ce: "habanalabs: replace GFP_ATOMIC with
GFP_KERNEL" from Feb 14, 2021, leads to the following
Smatch static checker warning:

	drivers/misc/habanalabs/common/command_buffer.c:318 hl_cb_create()
	warn: sleeping in atomic context

drivers/misc/habanalabs/common/command_buffer.c
    311 		if (rc)
    312 			goto release_cb;
    313 	}
    314 
    315 	spin_lock(&mgr->cb_lock);
                          ^^^^^^^^^^^^^
    316 	rc = idr_alloc(&mgr->cb_handles, cb, 1, 0, GFP_ATOMIC);
    317 	if (rc < 0)
--> 318 		rc = idr_alloc(&mgr->cb_handles, cb, 1, 0, GFP_KERNEL);
                                                                   ^^^^^^^^^^
This falls back to GFP_KERNEL if GFP_ATOMIC fails.  I don't understand
that.  If it's at all a performance improvement to call idr_alloc() with
ATOMIC first, then the correct thing to do is to fix idr_alloc() instead
of working around it in the caller.

    319 	spin_unlock(&mgr->cb_lock);
    320 

The other warning is also idr_alloc() but holding a different spin lock.

	drivers/misc/habanalabs/common/memory.c:126 alloc_device_memory()
	warn: sleeping in atomic context

   124  
   125          spin_lock(&vm->idr_lock);
                ^^^^^^^^^^^^^^^^^^^^^^^^
   126          handle = idr_alloc(&vm->phys_pg_pack_handles, phys_pg_pack, 1, 0,
   127                                  GFP_KERNEL);
                                        ^^^^^^^^^^
   128          spin_unlock(&vm->idr_lock);
   129  
   130          if (handle < 0) {
   131                  dev_err(hdev->dev, "Failed to get handle for page\n");
   132                  rc = -EFAULT;
   133                  goto idr_err;
   134          }

regards,
dan carpenter
