Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAD83BB13D;
	Tue, 21 Jul 2026 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624586; cv=fail; b=mdOsCC09tXZsBNJwRA0j8cgN9LPkD3hX93GjC8iOwQTv+ZLY12BOSqxToiP+x/feHXgpNxxD8jVjnOGgow9wShA4x89VzVBIR3ek9sozBiznbQm239kgNKWEHKIQtIFkRafmEmzQO7cRWhYYXbLDUm+yNVeNKKR04bfpC4kMly0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624586; c=relaxed/simple;
	bh=LtCJWUxHAwRq02LSfQoOen6LZqBylIi6ZN4tG7g8YZw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AW0mFl6mR8MF+5WsWikQo8EwkDrweggqxwlQcV7nBdNO6Qm8t7rUXWu0RGs7yJpQ0vq1N1I5AcqNasWsvNPaJC7BSmUVWI1YgBadwSimZLW+x/6zLzFd0vwoVkOjQ65JEd8SdWpPbJ1GQqgUPYnNUM7ygIHSXu18E++s5G8zOBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=fvaEn7Fw; arc=fail smtp.client-ip=52.101.69.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="fvaEn7Fw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UddvM23W3damzky253hs11o87Kw+QYj3/ZQxqcOrak6o/nfsIcM8IhKMnLASdvGGUCFc5k8yBvY/eTyj2hEx4K65t/fUEv1qRgN6QzZO597Z7d5R6L6OTm1HlvRupnynV8db/Bl+J1UQA3tdzDcmo/Xp4RAkncPiyBwgM1mMXrI+7DusSUW19udSwAkE9uu9Mn33M8Ri08RBlq1clyZUZvBJ6kNfw3Owy5PJ0DNoJjkM0lb2i8aZHQmUvhU1tTzRhusGMsNaNUtK+kzbg9E/Em7gkQPykAIgQJIi6EIVpTnphylNP7YCsTjkbrYugti6kpUaSZZt1AxeJAvhktvhIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzFEYaZ31ngV7DM8NQYdoY1mO7XPfcDH93x7MCGl7Mc=;
 b=DOmb147Cb7RxVCUbb5C3Rave54i+cqI/YLOyGotLof7PaKsDppUc4IG/zcMlXrbtVUlcexNBW1oBbYney75JkltoBMV7AyGTZQTY40cPElJoQ1fMirAu6va1ETNH2gGBT+RuDpJcQlZNanVY6Zx0R1lNhC2lRY01ORSjv0ghRcheo25t4OjSeqHtVPyqBiKxxWv9JCrVWGDbWC0iLYvINs3j3zzXAA0baU14cF3AyTYCcnkk+VP0pP0YQhX87NZ5sNiG2otpmLFCp2rdextC8zZm/oztcyYN7SRcUT7sNscLo4Gme6DOYCCiVpyhfG+SyjVnI+Of3BjDYG3uzvMkaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzFEYaZ31ngV7DM8NQYdoY1mO7XPfcDH93x7MCGl7Mc=;
 b=fvaEn7FwFSi0k2acx2VqeDpaEY+fN65h1lNcj0oDi2tCTazEX8sh0TIM80eAY6NLIcGamgo0x/9JH6bAl4a5giDNKfnClH5USQHdw+asVdq2rphvOIo4HIXtDM9z11kF7ezMED2mtkPKtLiwf0M5BcLWBP31huKTHAOSR/Kwg7GuZ32xVPiey6SDoCRCkOT9H+xMtrnDoOHithq6D0p/o2d80kLQKtybWPuW0R81RHrJLAMOPaz4kayhr15g+er5Fkxn3nsv9SMK0rsSZynH5uYOSLhMMcX3g16pLi6novHL6/swXqPflmHje2KqFzZJAhL/X9cM/cTpxF/nLfebQg==
Received: from DUZPR01CA0191.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::20) by GVXPR10MB8106.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:116::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 09:02:56 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::56) by DUZPR01CA0191.outlook.office365.com
 (2603:10a6:10:4b6::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 09:02:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 09:02:55 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 21 Jul
 2026 11:07:24 +0200
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 21 Jul
 2026 11:02:47 +0200
Date: Tue, 21 Jul 2026 11:02:39 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Dan Carpenter <error27@gmail.com>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] media: stm32: dcmi: fix some error handling bugs in
 probe()
Message-ID: <al81r7oJXTms6XG-@gnbcxd0016.gnb.st.com>
References: <alnx_dGHIBYpZuHo@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alnx_dGHIBYpZuHo@stanley.mountain>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885C:EE_|GVXPR10MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: e8270b24-a93e-424b-c691-08dee706dace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ETIquyLnod+xrdQLtO4uRzOieDu9dsZFzSpNdnqoUlhqk9lSab36Xp1E/2G3SDYByXN/cXJjkQX6NTaLoDTZ/07fj414o7HAIqaqIvoI6dYJPEsTz+DgZaoGjgACUJHX+qJl2lGTAvpxqsqAnFNZ5wyjy1jS3CuOt23vOxe7Rw/SINW6rc/yMe2HOzRjQ739SCgH2pUM8Vbk7qBX8W3SOqfgpDjtYVe8tBY/Mm3gd8y+AdjTgW3DBaX3p/cYXggcEr6ho0qmt5/i3AdvDZoPnXCDtw0ZCGPGccvDZWtcrTOd6LE4mQ6mdgiW18sOBt70L2Opmz846mB6QhLV+uEXIBl4Iu+bBgzX5Rdc0033H6/rhKLUXRUUXy3hLY4mc7UYauP8qVi2yzPOlywOQWzXiLV2cvTFPEa9Y7TjIwT8KPJgjC33TEGoatD4ZJl28R2zqqp64R/oTO5WzJWFIpabdvrdN08ovK2kbAnXl7am8rjrXWa8pZn8xSI8Tz3lZ59aGJ5vGQ76Gs+3DyURXWKD18BcXPk/2U0gBO/7gSfpPhW2GBko31a65Os7pqcwuQhIRG0P4q7HFHCGteJ8LVA+dstyAlpAzhWXFz/lpBH+AzM/hR4CG2CkBnOi21/teLk/OvGgD9KDzhz0YnzqUusKa4+w3VSKE2PgD+wnuJHlP3Vj/BscvENKkkecqgVeBqEHuH+NssCi+Sk7tr8f3faO8g==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pGmezc+6pCIA8nnBkJsjaRAgaXyx7U+uxK6z/TXQNrEpejVAoLftUW7mBwITxP+JRG8Dt82uyAA/g+R21iyNKNHTgPYgNgns/qovFNOpnEc3GbRImeY0HkT7WUfJ+9RdvO6779RV5atihqhnac5lhUyTw4hbggJQQRucLfEAhvcbp8yfRfOV1qgZ3X/c3fjmL9r9HeyRf75gc7krrbeLE8BNLGTUA/11+Pcpv+X1SQpldn5dxJLC7dmsbDZVCfj8EK+HX/hGgtuznGTPbBM/njmykaG0E3QfgmYMqLsvvQDpxi+vnMlyUG8IfEfnwjIlRbFnbDy0cOIOpZh4hhGlgXggut+Xn5V9K55YvTIMz6qXr1jHeVQgR+gNCPLK61wzKRhjbJEcyzDuvx8xJ3qTR4bWQajRTHYHNEBXOi5pp1Chskq10RciI1Fgsu8cG4Bv
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 09:02:55.8782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8270b24-a93e-424b-c691-08dee706dace
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8106

Hi Dan,

thanks for the patch.

On Fri, Jul 17, 2026 at 12:12:29PM +0300, Dan Carpenter wrote:
> There are a few issues here:
> 
> 1) After we assign:
>         chan = dma_request_chan(&pdev->dev, "tx");
>    Then the error paths need to clean up before returning.  The first
>    error path does a direct return.
> 2) The error paths check "dcmi->mdma_chan" but that is not assigned
>    until later so it results in memory leaks.  Test "mdma_chan"
>    instead.
> 3) The error handling calls dma_release_channel(dcmi->dma_chan) before
>    "dcmi->dma_chan" has been assigned which leads to a NULL pointer
>    dereference.  Use the "chan" variable instead.
> 
> I also moved the call to dma_release_channel() after the call to
> dma_release_channel() so it mirrors the allocation code better.
> 
> Fixes: bc901885fae0 ("media: stm32: dcmi: perform dmaengine_slave_config at probe")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

> ---
> From static analysis.  Untested.
> 
>  drivers/media/platform/st/stm32/stm32-dcmi.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
> index eeb0199864dd..c9f08b2465be 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
> @@ -2024,8 +2024,10 @@ static int dcmi_probe(struct platform_device *pdev)
>  	mdma_chan = dma_request_chan(&pdev->dev, "mdma_tx");
>  	if (IS_ERR(mdma_chan)) {
>  		ret = PTR_ERR(mdma_chan);
> -		if (ret != -ENODEV)
> -			return dev_err_probe(&pdev->dev, ret, "Failed to request MDMA channel\n");
> +		if (ret != -ENODEV) {
> +			dev_err_probe(&pdev->dev, ret, "Failed to request MDMA channel\n");
> +			goto err_release_chan;
> +		}
>  		mdma_chan = NULL;
>  	}
>  
> @@ -2206,12 +2208,13 @@ static int dcmi_probe(struct platform_device *pdev)
>  err_media_device_cleanup:
>  	media_device_cleanup(&dcmi->mdev);
>  err_mdma_slave_config:
> -	if (dcmi->mdma_chan)
> +	if (mdma_chan)
>  		gen_pool_free(dcmi->sram_pool, (unsigned long)dcmi->sram_buf, dcmi->sram_buf_size);
>  err_dma_slave_config:
> -	dma_release_channel(dcmi->dma_chan);
> -	if (dcmi->mdma_chan)
> +	if (mdma_chan)
>  		dma_release_channel(mdma_chan);
> +err_release_chan:
> +	dma_release_channel(chan);
>  
>  	return ret;
>  }
> -- 
> 2.53.0
> 

Regards,
Alain
