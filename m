Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB292C63709
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Dec 2022 09:02:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbiLHJCB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Dec 2022 04:02:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbiLHJBm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Dec 2022 04:01:42 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D400666C80
        for <kernel-janitors@vger.kernel.org>; Thu,  8 Dec 2022 01:01:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8ccvT6E+0DYXi1bJP0sjcT4V2T6kCFLKUnU29eDt2NY5ur7hl7wGyK3UXzSGR/Er/atjlSkDUZab+lt7oLbZ8C7GfqfcEIHk2EYlQUqqAYTg+PoRWHBw9QhdiQuixcgh74CN/eXL+yrZwNd1VVydDctK6Ifn1OUlJ98eEtIFK6rJR2nHNzi6sjA9s31RFQCaZ1nL34XjlE2YxE1NewSgrHP3Tev26CCtoWDlbgkOfIB/rm607frjsE/A21SBOFd06vWm91MnliyyU7aLM1IcqKtr09LYe9wpDLJMXww8LGeWDbgMgaEXdnXtyKUK52IXcYCGdT5HOLZzrjdt0ndbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFefnTYWjS5w/g0Z86g3SKEd6Suy7UhL0u6/Sb7Jies=;
 b=BQokhjArAccL1yvtU4gjXrRWBsl2Q/CUxIbSgPB/37DkSxTNovLP65OVFAqxYWzXrvUrhQ3nBrQou4EKh8W7i6SuoVbyuO+3ef71gm5WL4PFKS4nLTk6T4bk4UBIF3bLjf//HDIFvkigVIQAGN/QHzLXJDXw4jnZmeThXGS5cWYWyAXumIFHMAXIPavNXZn/m4kd9eL+AiRd5Oj6SSn9JRqDFh8L8LtUcRQRud8Av3kJJo4RDnf+7gob4VPn0fatTh/eCubzh62Uj0xtCMAK0NQEFqXX4SzsdOFVlV+15lIUBuBCo0BhP025KURCVtlprDktO3blY3ZzswnvZHEOCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFefnTYWjS5w/g0Z86g3SKEd6Suy7UhL0u6/Sb7Jies=;
 b=IuvZKqT8RpE4xT8XytHjvfTu0fJ9FLPluI/IWvvpxqh/Vw0UUfxYxvUHAiW6fHIMwRGDNZNVCZAiGsEpIEC/ho+OURFygzn2jWGEvNNDYy0TWifoAtRjlN39BNV16gZ1lTqA5/aPkGntYTaVtncdUu7H9YNwmFFOTxkxs2NcQge2h/GBbu3J0AkEu2uX/dOmo7gOs/Su60kJr0RaRjkywtMU+kCdqCXA9Y1DxwH2XR7fe+KDvw6K3Igwj0VF9sLZZhGUp2YsE3yi1n8qbOplxi2NDPQtx6y3f4vwYhipWgvbrhkATZLV2MWg2t2Yqgliz0kRfG6W7PPH9KKDzFkHNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6179.namprd12.prod.outlook.com (2603:10b6:930:24::22)
 by SN7PR12MB6690.namprd12.prod.outlook.com (2603:10b6:806:272::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 09:01:26 +0000
Received: from CY5PR12MB6179.namprd12.prod.outlook.com
 ([fe80::a600:9252:615:d31a]) by CY5PR12MB6179.namprd12.prod.outlook.com
 ([fe80::a600:9252:615:d31a%3]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 09:01:25 +0000
Date:   Thu, 8 Dec 2022 11:01:17 +0200
From:   Ido Schimmel <idosch@nvidia.com>
To:     Dan Carpenter <error27@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] mlxsw: spectrum: Apply RIF configuration when
 joining a LAG
Message-ID: <Y5Gn3Yb3nLgsbcFN@shredder>
References: <Y5Cci6U4sb4hYNUL@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5Cci6U4sb4hYNUL@kili>
X-ClientProxiedBy: VI1PR04CA0051.eurprd04.prod.outlook.com
 (2603:10a6:802:2::22) To CY5PR12MB6179.namprd12.prod.outlook.com
 (2603:10b6:930:24::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6179:EE_|SN7PR12MB6690:EE_
X-MS-Office365-Filtering-Correlation-Id: a66016cc-9521-4b0a-5dcd-08dad8fac88a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: csxLvLCrkPsJEeOLzZaylQAJw6mdtgq8jxQjQHvVKUQHODwcbGo4kj97QqNobmnLEAY9Wp9ZbodHzypW+HjFIHgow+2ttUQWlHLrV5Pwb4313m5S0j1Col+dAefaDanR6lCk/m6XQXxZCCh0Lw9ukKUWbIcbBYw/p87ep1Pv/6jbeSA47JRurJyNP4O15J8oSQgABTjjbdcFC/ZNhwhLYSap0zP0yGxBKTdVZVy5/h+Pttr7d6ul+tytjwXmHHFoSfREf+nrtbWNSDlVTKsnTAvtG5v3y2AeLrLD+AmiJMk+GWlDaLWbvHOrwNneZ5Kbsg7/QOHfNQB7sdtVpKZF7ukNN6d27rttgTEhaPTrw6iFxbkgkhVOcuM0nJly/tt+a9eincdfr1MLmYTmiaV0OU1m8E3PTStLRbvqyzJWSeUqT9X1zI1qDt0rgYL0ZlhuHFTDttRUwo/4fRjPTXKfy0U5aGga1316ViyZBh/uCGqJsbQdqbS/a59dWWFUIlLS68IOmmB22UzidU5Puav5pEoqbJXS7OxBm81pXIoEDms+902Zu6nsd7sdOsvjw3HB7h1gEDjpEUVHUh56w9fGbyB5sh7cEYcGMGuBu5d6Yl7QePRyzfDB0aRv1ULYsqoPW031Y84R2olA1IKkXNaR0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6179.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199015)(6486002)(86362001)(478600001)(6506007)(8676002)(186003)(9686003)(66556008)(66476007)(8936002)(6666004)(26005)(6916009)(316002)(5660300002)(2906002)(66946007)(41300700001)(33716001)(4326008)(6512007)(38100700002)(83380400001)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QouTCeKtXu+MjmSHeXeP3Da/snSm+ijtwFsX2HDR2KqTya0t/322pYur4tZG?=
 =?us-ascii?Q?/1R8updTZ2JMCWC4i8ut0a5TwrxhGB/ZZtLvKD5U36lEuLzzacOcVtl9ZaW1?=
 =?us-ascii?Q?H1PkhYVh+eTTspDp4AVrHmSJx2wopvuOQs8ewlYCfMs9uC0FpD9CqNpjZ+8v?=
 =?us-ascii?Q?vx9yHLewSJcHIJd086B2Pd1edh3Qm2N5Mf2awKbm/NLguQGYIQ3JUXfQSbJN?=
 =?us-ascii?Q?r/kt0h/Egu4Tgq9POD9K/p5Vi1KXfcDmmzTlxU66ttZjJywp3F3t/pIMbE8w?=
 =?us-ascii?Q?Sh7zOyqMaI3s1dOcExXbH303X+1Z8NKUt32WI0gSyutC1H/U4EWZtY5AXdDN?=
 =?us-ascii?Q?SUCfd28VScXdkNb34m1GyCaVkWfvkulpznDVYBT5oQFLHRx4aoZhEQ3UJb6D?=
 =?us-ascii?Q?qoeoh6Dk6h7Sk5kGSXwT/XyB1Q8A0ZEn6j64WKFM3x1j3vt2FAVaOk0O3t5L?=
 =?us-ascii?Q?100Pdx8OEz5vCxRvD5mAjloY+O0GKJeZrTRuhskEmMM04E4KPVEwsZvMPoBr?=
 =?us-ascii?Q?tyekaDYq9hOkutJk0c9DyQi90GAKCK/iEC4bdy7JikGY9k2dT+/7sLm4dCa4?=
 =?us-ascii?Q?XZAQqVIER7VC68T3iWDsddWmIXS7bekHaK8LpSTrEJ1lx1ib/8mLPVy4n4b4?=
 =?us-ascii?Q?B0+IjzomFiJdeHcMA60GmvnRRLZR9CnsNjIppKTDrgmb/Eo20YocVwlFnjsU?=
 =?us-ascii?Q?G1TpCNhSUcAYHxRWHmk2Xu7fNmQq2TcuZtM3xRWhZWiZ15fGnItXm4tn4ON4?=
 =?us-ascii?Q?K/1T5OVtZSzWVtpF7talFggXh8OOBrkryB+dvOhzPo+A958uHmANgTkSGqG8?=
 =?us-ascii?Q?G1jIF3ZgQHOsRUCDtTGLwsPzcuvr04Ky/AzB6t/WR5AWWKqj5cVuTI1Xi0VF?=
 =?us-ascii?Q?QNkJA7ZVlW1Dx61C4M+tEf2B2SicBhbHF0iv2dEhgZ4V2mF/pCCDI6Am1NTy?=
 =?us-ascii?Q?ma+uLsZtYbi0arijiHl8gFuGt/XNlugiBfYlN9VeT9zg8gKgXvsTHvgaLuIC?=
 =?us-ascii?Q?xtAStvhjbaIx9bPW98CvlP/ZU9LTSG4rktGs2J7VAsgNtzAS0VQ+ZXXghQ15?=
 =?us-ascii?Q?fk8YWEdtJdCqJI3f4GC2W9FK9UL9spJpOk9s0gqzt1b8ho2s66pfOuuM9nZZ?=
 =?us-ascii?Q?d7MnUDb9XTWjXqeXN2rsQDAaE+JxmrISY/dhmZXMMnDFbnUiOhfnkg3kTTrj?=
 =?us-ascii?Q?5v6rC5gow5squCEsmdlK3LZPEDa9RJow67ux14aa+YT7iuo3RF+2bY8sZOq1?=
 =?us-ascii?Q?KXVoFkDSXlZzkKVPpQ/u9KnwhtKiQyq7iQCXXaxKXP5UIG+VexK3O5eC9HKY?=
 =?us-ascii?Q?LoINXU0FpXgkaAwNcvVteAZ3LFdcpI/oOEcpG7j78M+qPxhsy6hJ/OcrvwzN?=
 =?us-ascii?Q?Y6me/+z4MGQg1wFpTU5oMnfiRBtTPYNba5+VX8sI+npla5NFc02VM1qJObev?=
 =?us-ascii?Q?PL39LtcJNGhK7rj/W/1890fJQSWdRfxySDcqh75/QdcLuxiEqCWkEkjUHOCX?=
 =?us-ascii?Q?rRZO0PSqT6PalFzhzFxBXPT9JMK0jiofyVQJmgJ9jHvKGKgVQNN+41I71zzj?=
 =?us-ascii?Q?bk+E0cBkBdzINkT5pjShLoORepL1fBDRcjId1xiy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a66016cc-9521-4b0a-5dcd-08dad8fac88a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 09:01:25.8022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMvzDZqMJdsoa6hjJQxGnv72unPk5es2Nutj9+MonXHRbdHyE4GcbWt4xL/0oiDab7Us5gULmyhlC4JTPlrsYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6690
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

Thanks for the report.

On Wed, Dec 07, 2022 at 05:00:43PM +0300, Dan Carpenter wrote:
> Hello Ido Schimmel,
> 
> The patch 31e1de4f1242: "mlxsw: spectrum: Apply RIF configuration
> when joining a LAG" from Dec 6, 2020, leads to the following Smatch
> static checker warning:
> 
> 	drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:8546 mlxsw_sp_port_vlan_router_join()
> 	warn: missing error code here? 'mlxsw_sp_rif_find_by_dev()' failed. 'err' = '0'
> 
> drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
>     8534 int
>     8535 mlxsw_sp_port_vlan_router_join(struct mlxsw_sp_port_vlan *mlxsw_sp_port_vlan,
>     8536                                struct net_device *l3_dev,
>     8537                                struct netlink_ext_ack *extack)
>     8538 {
>     8539         struct mlxsw_sp *mlxsw_sp = mlxsw_sp_port_vlan->mlxsw_sp_port->mlxsw_sp;
>     8540         struct mlxsw_sp_rif *rif;
>     8541         int err = 0;
>     8542 
>     8543         mutex_lock(&mlxsw_sp->router->lock);
>     8544         rif = mlxsw_sp_rif_find_by_dev(mlxsw_sp, l3_dev);
>     8545         if (!rif)
> --> 8546                 goto out;
>                          ^^^^^^^^
> Is this an error path?

No, it's valid to not have a RIF. See the comment in the caller of this
function:

/* Join a router interface configured on the LAG, if exists */
err = mlxsw_sp_port_vlan_router_join(mlxsw_sp_port->default_vlan,
				     lag_dev, extack);

> 
>     8547 
>     8548         err = __mlxsw_sp_port_vlan_router_join(mlxsw_sp_port_vlan, l3_dev,
>     8549                                                extack);
>     8550 out:
>     8551         mutex_unlock(&mlxsw_sp->router->lock);
>     8552         return err;
>     8553 }
> 
> regards,
> dan carpenter
