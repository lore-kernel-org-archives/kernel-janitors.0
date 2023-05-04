Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D53C77B78
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 May 2023 15:34:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbjEDPeq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 4 May 2023 11:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjEDPem (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 May 2023 11:34:42 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2100.outbound.protection.outlook.com [40.107.236.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5887E40;
        Thu,  4 May 2023 08:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f141yebGRvPV4Z9lQfiJ69ktqb47Jg46Ep65P1dXhYbe+maCWtf+MS8AX0lflNI92IWKpRORYRduQPFgxreygvRpat1vl+RkyUwnWxUUvltrKLa5jtcJdrrn1sIh3CsnlHbww0R+Z8v5JfYDVqEdtkDjO/nLpblfTVK3WlWdopLq1Q86ep0bs+F+QgE1QnB/19cOvBWfteXH56QbyfgURPGbET292fl8wIvufUD+yZ7dH1kxEV2QEhDuopJh/mKucL3eeLYjZt1thoaxQT5fejalwjVg4jhHmV2E7MuLZUQnrPdn+6VDKRKDm6KqYetFvXXr4ZsHIVs7Z8dKOlm/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IcWQerD9Iizk0OsI20ERYpGKThq/CE+JA5sWwE+TmU=;
 b=IbpuXue5D0JC3xnQOI+J2IHRt1MiT90oI65//zi5dyMez1TIfqDM4WnEpuqazDGFKv67olf72P7EBA0QLwSAZVg/uMIyvyP2CAoM6hno2t4m1tjWSGfR4TzlK2GnPAAfE8dWk6fgTP8esTRHFX2sLUyVNY4GTYh//GmZlREneZ8pzdcKz2Rf9Hq0GiXYsVr+V8B/ZZgEfAv5bw1RyJjE56gBeJ773UFEXCj9JzsJzk+pwjY7vQDJ+L523ClcDN/tmAGscKYGGZp6CrRtbA93F7FnAglNvv3DwfXNjy+uBROkv3EJEdklC1n5ihkjMXqe6P5hBVd3XLGqdtJKhJPxng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IcWQerD9Iizk0OsI20ERYpGKThq/CE+JA5sWwE+TmU=;
 b=Doh0s0AVUA2MQtzIgpYdqX8/y7sRJxnd7cico2jclQqhd8VDgaWuuqTwqTmPgVjqn5CsF8Sbyq60/BGDQog3+6j+SycbQAk+NUZ2wVyj9mguFeARIU2cL3+WJdg8NfgHB/16OJ83FJRGiSrk7xnCQ3t/13BGaWVy88Ti7PLltM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by SN4PR13MB6035.namprd13.prod.outlook.com (2603:10b6:806:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 15:34:39 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::f416:544d:18b7:bb34]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::f416:544d:18b7:bb34%5]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 15:34:38 +0000
Date:   Thu, 4 May 2023 17:34:31 +0200
From:   Simon Horman <simon.horman@corigine.com>
To:     wuych <yunchuan@nfschina.com>
Cc:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, irusskikh@marvell.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] atlantic: Remove unnecessary (void*) conversions
Message-ID: <ZFPQh28YFfA9t3qu@corigine.com>
References: <20230504100253.74932-1-yunchuan@nfschina.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504100253.74932-1-yunchuan@nfschina.com>
X-ClientProxiedBy: AM4PR0202CA0004.eurprd02.prod.outlook.com
 (2603:10a6:200:89::14) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|SN4PR13MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d44bbaa-4e0f-470c-5559-08db4cb5124e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S1xyWNCt7YFzgYxte7KVSnfgaSnHks2TLa/AbZLdMUNFBYBctiA0fgPtTHu7sgCDp1hzjjvY57zvp3bTPelJM35XVzKMOPrkzC7lPau8FAWBHjfNWeCCZRsxBf/Kcz/reis4bzjfsOmSacVpG/ZbdFFFLOQ3rjqU+o0q35bRE76BYs+istkpTQGrKad2FxU630P3kuH4o6KwFmCx5Nd2GG38eNyWjmuc24962nuZHYKe/GeXpMVbPkAzW3Pzv3Ct5YdLJNve4AI9/5dE5bhVO3QzyG2h4GGe3WI3EDWgk0kusd84RGYWuTSx6tcjUOjJ0t1pmAKoQv1mmdEDL0OjpFTu0g6eanl3RZfQ4/cnBhzLTUzCYamXPO7/kJ8iWww2WUTSLkM32yvMt4GwuGBZMM6fVUzoEcEebeJNPaOLfMO0BAS4SSjHaLi0dmMkSlUTu2AGk1SGydfZIOckX4P2ssp87oKckvcYDI6hZMtTYV3wtwkJ2/b3gQ4TSzhj+knTyqWNmx87w9VV1mr14U1N2iMGhGcRx6NkwUIIoDZeLX4ZQ+ffBO2yOKAzNbshzZgQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(366004)(346002)(396003)(39840400004)(451199021)(2616005)(38100700002)(2906002)(83380400001)(36756003)(44832011)(478600001)(5660300002)(41300700001)(8936002)(6506007)(6512007)(186003)(86362001)(8676002)(6666004)(6486002)(66556008)(66476007)(66946007)(316002)(4326008)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kxP+SsHsttfxJSIoUwv5W/QYHYG9acylDKhOn7Fwmw7TMpFdTL6wG20Ppljv?=
 =?us-ascii?Q?cCVac+GV1+gkfFHpnT1L5X4hl8Ey18f7HEnDz461unBz1UjvGJ1LtUpC16y/?=
 =?us-ascii?Q?bBweB0sl3b6Y4Q/VEL+PXIcefuJPG5Qk6GUrCSacYDlHvam++pcgEwM/hzaH?=
 =?us-ascii?Q?/yrSwwqCeKuT9ORkuIqYH5W+ke1sRu53Y0RTSDB0YhHoyb6fjIFBll51cJUv?=
 =?us-ascii?Q?IdU7vMvE/tHZZa/c47DRh2otNp+eTTvMV8fwQ62sRkL7a1N5GGnh/z/3DKmm?=
 =?us-ascii?Q?acsmSdK+xacZArhDreXLYhnpt9pOzeYMHxTZ+vbSKIxmh45thyADl+zldWXA?=
 =?us-ascii?Q?hDBdBRoYpKA0A5mU0/5RS2z9TKhZJyo75mdgyk2lcysMmdtZg09BGfmU6H+H?=
 =?us-ascii?Q?wwRQMboa6Vw+xE5bm7nMiA9yiVlNEhrQFq8Y2ofUpJBOU7hNodYeEDh5ojWT?=
 =?us-ascii?Q?e7vcni+QCOyacFwH+OU9dI/0cRIxQmGvaZkAwMz6Tlj9aSAcPpdEkimcy2Yx?=
 =?us-ascii?Q?zTRixkLXsN/1MtV07iN0Z/NCmF4zQfCBN4i0wEabLDuZzNnwnxdQJ9M0P1Og?=
 =?us-ascii?Q?/9UJ6r89BrO7fGV3wJe0YEJOKdt5bmYu7lDKQ30D20LSf8fXNTcubf1qe53t?=
 =?us-ascii?Q?gE2jPAYakOkd1UaVudsuMXBi3TQhpYO6kdctWVCVdENNoSsp8/8wtJ5+Ifwh?=
 =?us-ascii?Q?bFOUxeqVJDpSM3CBlH/XouG1hShkYhgLuenXLuU87rAqRgRc0SJ3j0lzJJqi?=
 =?us-ascii?Q?CPf/mA1mHFHZL18g4iactLGwzzUQDdFlffKz2oQPwayJFKKnv7kZiUcUP9Xi?=
 =?us-ascii?Q?+8tFj40mP1OFk/dF/ze+oKo5TtBzxHgmPDi0jJq79OwhMGciClqm545iBQrA?=
 =?us-ascii?Q?kgE+v2ek9oMSR64WjkdgdQhSKHhHpQU41X32YiO+8v1i4emEAu+SsZ8WCRXz?=
 =?us-ascii?Q?AZrVgCoYx/pHyA0kInBNtI60aKdsbEXu9Kx5mkcHkLtLRll6aag+ilyhdPU+?=
 =?us-ascii?Q?3+X58XGuAGrtoI2BSnYROka1TsNSk2TKxTtxxtHGMWoR2TS1qqToQGZN6Akw?=
 =?us-ascii?Q?z2XX7yVsAXWgqNqz14EHKxOQPdOLG7hYHHyndtxk90zxLiNk1QgZDHvtENZf?=
 =?us-ascii?Q?jcBaaMtavDJqOmNAul0U7pZ+DHdrSpYmXL6zvPHIrZVNphaA87zkBP1R8V/T?=
 =?us-ascii?Q?dzB27EiYx6NvaSdcSWTUOGy2LNVIW1GdDWGvHwMyYgCfHCWPg9SmnyesJ3b7?=
 =?us-ascii?Q?BnsnSuEUEEFNeVPnDPWvGi+aS0e5v5H9EfIcPYep5y8cro3oWQIvVZhltpGv?=
 =?us-ascii?Q?D+PFUxfNiUaLa0nYrr5I+cU0A6BXqk0gp1c/KsoL03MMqhb4S3vrQzaQBLCd?=
 =?us-ascii?Q?Kk3K6NeuZwR4B0f/WUGb3kuDMrgrHFO+Wvz7qMmPP43DC28ofc+Dmh+3cybZ?=
 =?us-ascii?Q?hllLGNxalnDVRZEMy8iNfO6gRXmuiONXOUMk98AbjnGqwdVSUgkq+Aj6yRDo?=
 =?us-ascii?Q?Vqcnc9X5OfvAY/UZ28ob5ZZ5h/Vc2GruPhOqaVyV5ch4xkMggIS8uS1Knxz5?=
 =?us-ascii?Q?YOtZe88WWCeAZsLlvuQfiuaqdeErWxWSDXO5YvoH7nnFbMmmSpEqdCRV8f0a?=
 =?us-ascii?Q?aUQktacW0lLhxmKS8RqXbnu/GHLhKbgqGl/a22f4VYYviPTv486YDgZEw1yS?=
 =?us-ascii?Q?Qh1D4Q=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d44bbaa-4e0f-470c-5559-08db4cb5124e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 15:34:38.7250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bM2kUzjP41SXwPFEnG5kEW6HAiYDp0dAbrq8QqmFt8lK8GJOLp8XEe09N1nzmdUTheX62KOvfjgtjGgV6W3sFzKcVvd3DzxxXaAVp9xsfoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR13MB6035
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, May 04, 2023 at 06:02:53PM +0800, wuych wrote:
> Pointer variables of void * type do not require type cast.
> 
> Signed-off-by: wuych <yunchuan@nfschina.com>

...

> @@ -378,7 +378,7 @@ static int hw_atl2_hw_init_tx_path(struct aq_hw_s *self)
>  
>  static void hw_atl2_hw_init_new_rx_filters(struct aq_hw_s *self)
>  {
> -	struct hw_atl2_priv *priv = (struct hw_atl2_priv *)self->priv;
> +	struct hw_atl2_priv *priv = self->priv;
>  	u8 *prio_tc_map = self->aq_nic_cfg->prio_tc_map;
>  	u16 action;
>  	u8 index;

While you are here, and seeing as you need to repost this for net-next
anyway: could you adjust the order of the lines above to observe reverse
xmas tree - longest line to shortest - for local variable declarations
in networking code?

...

> @@ -539,7 +539,7 @@ static int hw_atl2_hw_init(struct aq_hw_s *self, const u8 *mac_addr)
>  		[AQ_HW_IRQ_MSIX]    = { 0x20000022U, 0x20000026U },
>  	};
>  
> -	struct hw_atl2_priv *priv = (struct hw_atl2_priv *)self->priv;
> +	struct hw_atl2_priv *priv = self->priv;
>  	struct aq_nic_cfg_s *aq_nic_cfg = self->aq_nic_cfg;
>  	u8 base_index, count;
>  	int err;

Ditto.

...
