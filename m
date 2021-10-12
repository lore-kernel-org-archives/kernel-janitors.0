Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73941C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 12 Oct 2021 08:29:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BD9E60EE5
	for <kernel-janitors@archiver.kernel.org>; Tue, 12 Oct 2021 08:29:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235029AbhJLIbm (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 12 Oct 2021 04:31:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235005AbhJLIbk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 Oct 2021 04:31:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 528FDC06161C
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Oct 2021 01:29:39 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1maDAA-0004lW-0v; Tue, 12 Oct 2021 10:29:30 +0200
Message-ID: <c71c6680e0930fd84f10e4fa13bd59e1f30c2db6.camel@pengutronix.de>
Subject: Re: [PATCH] soc: imx: imx8m-blk-ctrl: off by one in
 imx8m_blk_ctrl_xlate()
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Date:   Tue, 12 Oct 2021 10:29:27 +0200
In-Reply-To: <20211011123638.GB15188@kili>
References: <20211011123638.GB15188@kili>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

Am Montag, dem 11.10.2021 um 15:36 +0300 schrieb Dan Carpenter:
> The > comparison should be >= to prevent reading one element beyond the
> end of the array.  The onecell_data->domains[] array is allocated in
> imx8m_blk_ctrl_probe() and it has "onecell_data->num_domains" elements.

Thanks for the patch! I guess this was found via smatch? I should
really make it a habit to use smatch on my submissions...

> Fixes: 5b340e7813d4 ("soc: imx: add i.MX8M blk-ctrl driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  drivers/soc/imx/imx8m-blk-ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/imx/imx8m-blk-ctrl.c b/drivers/soc/imx/imx8m-blk-ctrl.c
> index e172d295c441..519b3651d1d9 100644
> --- a/drivers/soc/imx/imx8m-blk-ctrl.c
> +++ b/drivers/soc/imx/imx8m-blk-ctrl.c
> @@ -139,7 +139,7 @@ imx8m_blk_ctrl_xlate(struct of_phandle_args *args, void *data)
>  	unsigned int index = args->args[0];
>  
>  	if (args->args_count != 1 ||
> -	    index > onecell_data->num_domains)
> +	    index >= onecell_data->num_domains)
>  		return ERR_PTR(-EINVAL);
>  
>  	return onecell_data->domains[index];


