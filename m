Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D07C433EF
	for <kernel-janitors@archiver.kernel.org>; Mon,  4 Jul 2022 11:01:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233910AbiGDLBz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 4 Jul 2022 07:01:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233132AbiGDLBy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 4 Jul 2022 07:01:54 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA3025E2
        for <kernel-janitors@vger.kernel.org>; Mon,  4 Jul 2022 04:01:52 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 22F3822175;
        Mon,  4 Jul 2022 13:01:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1656932510;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YQ6ksug+BFKh++5Gf6JtccDKmV45FwkQCtJw+Ho6+7I=;
        b=eVA+r2uMcnvEZrknZFnpGoaqFS7xi/I6Av9OEWnpK2O887FU9x7Ylu6qfgvtZWUU1Izn/T
        n+VJwLAm1ebGB7vcIenlScVEcS+yqAX0YwoHEz4fExBqOi3Vv/LztU90HwpDIwTVemU5I7
        LrVur+PGovBjzewrn5IToAoJVC5JmK0=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 04 Jul 2022 13:01:46 +0200
From:   Michael Walle <michael@walle.cc>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: guts: fix IS_ERR() vs NULL bug
In-Reply-To: <YsLHCE/ttyl/OeHs@kili>
References: <YsLHCE/ttyl/OeHs@kili>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9d3033f1ddaa224a792849fdf952587f@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Am 2022-07-04 12:55, schrieb Dan Carpenter:
> The of_iomap() function returns NULL on failure, it never returns
> error pointers.
> 
> Fixes: ab4988d6a393 ("soc: fsl: guts: embed fsl_guts_get_svr() in 
> probe()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/soc/fsl/guts.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
> index 27035de062f8..8038c599ad83 100644
> --- a/drivers/soc/fsl/guts.c
> +++ b/drivers/soc/fsl/guts.c
> @@ -195,9 +195,9 @@ static int __init fsl_guts_init(void)
>  	soc_data = match->data;
> 
>  	regs = of_iomap(np, 0);
> -	if (IS_ERR(regs)) {
> +	if (!regs) {
>  		of_node_put(np);
> -		return PTR_ERR(regs);
> +		return -ENOMEM;
>  	}
> 
>  	little_endian = of_property_read_bool(np, "little-endian");

There was already a patch for this:
https://lore.kernel.org/lkml/20220628140249.1073809-1-yangyingliang@huawei.com/

-michael
