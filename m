Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1C8C433F5
	for <kernel-janitors@archiver.kernel.org>; Wed, 15 Dec 2021 11:36:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242062AbhLOLgE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 15 Dec 2021 06:36:04 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:31220 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242102AbhLOLgE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Dec 2021 06:36:04 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFBStTx005943;
        Wed, 15 Dec 2021 11:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=qm1zCWIAOFmAVI2EGIlODAud6R1OjQoMZ6VO4h1+nzw=;
 b=f4rSuG3lfQoPS1EVsHHofAYQ5oO+p3DcfEdIGgTFlpwUclV8SBlQZrh7nUxXw045LmJM
 Jmv9ZY5GMXmPPu7vjw5fD9DrONHY98wOpLpk+YhluH6KEpNzzA+LwASHfcEdj9yMEjKU
 Rfz4ILvltQH6s1AhNw4fkBpGEkP4sABIp/1KTxYryRFpxltuPHE6Gko0LbSehwkQSCiV
 7uC9YFj1EozYcpa2mIcO0Na9CScFJ6dNBD3Lmj+aeThz+OXD9XX5Ehny6k/0Uh8wb7JD
 mIYX1AdJ47K3ZbpMNWEiLvIvZoK+RjNj0hl6SlG+RQoAyA+hlRairqn+kVT3J/ctfwY/ 9g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cx56u67ay-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Dec 2021 11:35:53 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFBUXe0082101;
        Wed, 15 Dec 2021 11:35:52 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2045.outbound.protection.outlook.com [104.47.57.45])
        by aserp3020.oracle.com with ESMTP id 3cxmrbpswy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Dec 2021 11:35:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8kY5JwyxVlRaYfTplcdAeOXNHYgb7inDv4t77lLdJhIQH6L9fgbSRg3xg7oC0V8pb6Xqk7w90M5keu6KIN8FAMnD6e2boWzpT7L/0QN2+DRzOO1aP7KUqbkUqf0+nfsHVaU6Uu+9D2ZP06RIUhZMnD2Gpb06Nz1QjM3oYvcR4pW4dG2vPRsgOWHmNvPi8ShqfsrtNrT7qkQoZlQBNx2AAgq3wOAL9LE14MmDbTPiRucrEo69hzMA2w/M7ZQ/cOMl/L+XZq8dYYNBuvFNFKJqlZTXSjOff/KYS247tV4KngXf3NtIpvl7ySvthX2umwLzFHlik2AaOJEw9luKA79Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qm1zCWIAOFmAVI2EGIlODAud6R1OjQoMZ6VO4h1+nzw=;
 b=N/by3VJOPI8o6v1PgNfgoNUTF05abrswDB8PI9FtU5JDfTvwzCGyUXEkA2rOcA83ylfjS81wICrFZCMMnKl2w+mRDzhyrwwq5XtjRWmujZJAUGLJWVaeG/NAxm0tsqCWqzhT0eWFhbyCm8ZuQeuGTQNeiDB5PIaVJ3rnBYEtbwv/JP9+Md45msuxkBocWC7mHfbMHG5xlptH4c68B99Ls3nSbYe4VOlWS6sVEL5Lu5mOMw1FnuAUqQzQxijHk8wcYTulHqNHnu9Q93RWqYeoKgZYA4FK87MopdlKQb/PwJHAPP7LbxmhoYtCbW9h5oW14JLf21xBO56V0CRkhZmNrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qm1zCWIAOFmAVI2EGIlODAud6R1OjQoMZ6VO4h1+nzw=;
 b=J+TkbppUBa+G8a/lhMLQp/ckae4qNgqaen/qygHLKwewUCpaB10l1yKz5s6lfe09SCxu2Uh/tTVZ8jP/2iUumLX27hVSSuy3ovtN0KLdi6ehBX+rXnX2e/XOKpF4zJQ/AXSpmnX8qRY6ODcWT2hhjSSBNfsvA/igZV2SAHQm6mA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2366.namprd10.prod.outlook.com
 (2603:10b6:301:33::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 11:35:50 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 11:35:49 +0000
Date:   Wed, 15 Dec 2021 14:35:39 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     rmk+kernel@armlinux.org.uk
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: phylink: use legacy_pre_march2020
Message-ID: <20211215113539.GA14967@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0184.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6344ef89-37be-4806-8729-08d9bfbf0b0e
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2366:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB23666BC0145D0DF6C665D09B8E769@MWHPR1001MB2366.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ggOHBfxWbzktiGNM4nrJQ2esYL3EjyCwXBx+oXtbXHqURdwbR3y3Qwu4I0XLeXG035TGTo5RSoxqF1j6z8kygdJoFrjYTdOw/rpjdSsNHpDoeW6UFCd9ITQsO+qn9Uy5YOJb8h6Jq9eC9PFWhAlCVaMknOqh+CxgesK0a+ha3Db82MQLMEMcZ43Kzj+Mk6fDGCNZpWg+YI+egWlui1TrAkkmB4WKjm34GzolK4KCBL1dHOaE2KKSIJF2LsGXDubAEQrK7LS3K4pkDOtDuNRk1HSDapworIWLSoP8Ue/Ez1y3iW3i5fvgGnolec6I/Dzo8QCs3QiJp94YzZUf9GVL2jY3SaBpeevL35+YZCrUWDzjrHkyIh6Da8wl6BwmHLgCcD7i4bD5DNlEpYtgJ07swkNs5SAovkUM6xeW00FRD0sP1RSeFeApTRdbrymzRqsvrc/2HsZ8TmIs1SCj+1HEP3f1PEzLmiqivvwPkTrZ2SH4/aZeowhQZVSSfLZ+Ctd4sBHuwRobT1CGj7vPY3M2rpyOnQquXw2k8MtNtxjq+vbhomIO2mROstUQ5IrRSWSG8GiHh09au1nrxbdblt3n47jY7d3Nr+CffPfYPbuMa70Va47qswt+9xKWoRfzlbh2jVLSpKEJL6cUnMREFIRAE5g29pPms/lP5RKhPy5FEHNPMdMvBDTurVFFXLr/3ySYMVPNsnj6TMRDtZHgNhS/aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(66556008)(66476007)(66946007)(1076003)(8936002)(2906002)(508600001)(5660300002)(33656002)(83380400001)(316002)(38350700002)(38100700002)(86362001)(6506007)(9686003)(33716001)(44832011)(8676002)(6512007)(6486002)(186003)(52116002)(6666004)(26005)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MGgWp08cGDTLcdLRt1gjl932VRLQJh8SUlDdG2/BWf0BdSoIbete6XnqUGgG?=
 =?us-ascii?Q?ezfK2wuPeg3LzoL/RA3NZb8kKtNcbLWH6GP0czSzMVACjbDT6uVr68F6jxTB?=
 =?us-ascii?Q?UnmgW3pQP57kJFHM0eTSdxnydhlF2bnzHSxBBrWY6doT3Nw67QLdPP/mqa+7?=
 =?us-ascii?Q?o+wxs2jMsRbmE/UotaZCBy2L12sO6bJCM4uWKimV/tHHplJ+vQWHuuucWBJO?=
 =?us-ascii?Q?kqIsuQEY6N2v1qTkTx/Op8TG//BxBYGGOcErdksmVdUj3gr5aF5SUglS1tNv?=
 =?us-ascii?Q?FYz8XZZjVOZ98q9zPwH6iDepqZtaDIv3Nij5CIgp574PHKz+bZooW9o6jmKu?=
 =?us-ascii?Q?PCBZhcaYNM9ldSSR2EdM5su2yF3CWoFScPbW/t9MdVBVneAiqQRfTa5rNUW2?=
 =?us-ascii?Q?HGB4RMFMAuvPvo+m4vb8LdhN0bMhD7sFadRl15Pmnbggwoz9G9V82SJc/pAW?=
 =?us-ascii?Q?bf9SomIMOjvaCXzVBeIcS5ElgSrXpj69E0uajCpcblWb7uN4C3qU6cMg+xxF?=
 =?us-ascii?Q?KhkNgW7XLpQLsD9JDI0k2PMuPPD/dUJ7MOwWjAkcRkIEyBFZTpaeO7zNt5Ua?=
 =?us-ascii?Q?vK9VqSP79JjwQHL46FsIT7XywnxRkq3luPY6d/rfr6dfeBUCkSusWCTW/9Ww?=
 =?us-ascii?Q?VjeOwieBMUf7UdjrLyuPm4C13DDzPnTPdHN1rxspHOMN18S1b3ENQBgqBeuA?=
 =?us-ascii?Q?F8itsX8Q80kxDu6kvzie0dgsxVQ11Xs6X83U0fixhCBcP0cg2Lbs5+2rfEjW?=
 =?us-ascii?Q?cKk9ynxJPPoKlUdjD4oFYBqeDCZP7KATKt/P+VvmiFpq1Yvzn/+dGwut4tJw?=
 =?us-ascii?Q?CU4wbKxx3N/8pxnsyuxMv57yRQXNr/dOUgMJTA6AQyZMMYR+0wFAGYjb1mKe?=
 =?us-ascii?Q?A3qNB/BYCX8kqpV0iMVJyLpXQVy+qfRRb8jR4MeQ4oOFHMjpf2da6x65w5fC?=
 =?us-ascii?Q?XAAixAnxoLUt6n5YjneqRnhstmN+jzD9mSPdWusUe8G4mDQx/jaJyw7U0/21?=
 =?us-ascii?Q?Shysrmx26cZq+1ba74yg3S23oJxOwQF+SItNwD0qT+QYcVBKgK9RZc2rf+sc?=
 =?us-ascii?Q?daUHOJqFHpqCa1LuJTUnYADW8TaPqwFn998cVmjwx0wrfhlf5xokVDdEcNGX?=
 =?us-ascii?Q?qiwohzXEaXwNT10a3rv4t3E8ANsl4kpbUdzoQpwITYSts3vmNLpIF+XtpHxD?=
 =?us-ascii?Q?INlw5eTM6vc4cSePzFDIQSlW5yePvvM+56y+foTv33cZN9pXffijQbqN/jtO?=
 =?us-ascii?Q?kay7MfbtCeCklefbabPJKDJ/fBRvdFcp8e+Q1nWsm119+a4RnwH55NRY7G1Q?=
 =?us-ascii?Q?ba1YgurqyrYmcGn6DOwu6xN8CypQ0rw9eYdJzFPB4lChuylZjoR/s9SiO+Ry?=
 =?us-ascii?Q?2LIFZsd/BDOC9R8e5MQhJzG1FJfkwFs14qB0GQD3SaKBGMrkDXovxG2pDw1G?=
 =?us-ascii?Q?Ft7Npzyl560f9s7GsIF58HhX3LB3UW/IFeC7ZdKEpSWI3Q0pDZdISSzees5e?=
 =?us-ascii?Q?9gxK3FpEUyLnU6NlegJeCe42BoaeVcvEeVWowJ8xhru07OxkfbXAriDV7XN3?=
 =?us-ascii?Q?POQ6MgsGe/OmhFhucb9LMEXwHCNjMKoMoUaNIY4RaM6Gks0VncOf5CWORgSy?=
 =?us-ascii?Q?LooEWsVlIrf+CJZR2rI58yi1rOmO7Kg61wxbqkY1xchJPUbMrXOFqO571Y71?=
 =?us-ascii?Q?sqTNW8jM7QxtC66IQTTGk1oWU0g=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6344ef89-37be-4806-8729-08d9bfbf0b0e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 11:35:49.5755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PivyYc6JYN21kncVsiF/0W1NPOBp4kAr+47NvPIJR7KWHUUjw+0EcKQU96UJtUDLmkSv6GR2938z8DMDEVqO523VDMSB+2aDeAJdU1ONjzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2366
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=804 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150064
X-Proofpoint-ORIG-GUID: c4CxFxy90g2vwxVVfgSObyZjrIBAMAdt
X-Proofpoint-GUID: c4CxFxy90g2vwxVVfgSObyZjrIBAMAdt
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Russell King (Oracle),

This is a semi-automatic email about new static checker warnings.

The patch 001f4261fe4d: "net: phylink: use legacy_pre_march2020" from 
Dec 9, 2021, leads to the following Smatch complaint:

    drivers/net/phy/phylink.c:823 phylink_change_inband_advert()
    error: we previously assumed 'pl->pcs_ops' could be null (see line 806)

drivers/net/phy/phylink.c
   805	
   806		if (!pl->pcs_ops && pl->config->legacy_pre_march2020) {
                    ^^^^^^^^^^^^
Should this be an ||?

   807			/* Legacy method */
   808			phylink_mac_config(pl, &pl->link_config);
   809			phylink_mac_pcs_an_restart(pl);
   810			return 0;
   811		}
   812	
   813		phylink_dbg(pl, "%s: mode=%s/%s adv=%*pb pause=%02x\n", __func__,
   814			    phylink_an_mode_str(pl->cur_link_an_mode),
   815			    phy_modes(pl->link_config.interface),
   816			    __ETHTOOL_LINK_MODE_MASK_NBITS, pl->link_config.advertising,
   817			    pl->link_config.pause);
   818	
   819		/* Modern PCS-based method; update the advert at the PCS, and
   820		 * restart negotiation if the pcs_config() helper indicates that
   821		 * the programmed advertisement has changed.
   822		 */
   823		ret = pl->pcs_ops->pcs_config(pl->pcs, pl->cur_link_an_mode,
                      ^^^^^^^^^^^^^
Unchecked dereference.

   824					      pl->link_config.interface,
   825					      pl->link_config.advertising,

regards,
dan carpenter
