Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5FBC433EF
	for <kernel-janitors@archiver.kernel.org>; Sat, 19 Feb 2022 05:07:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbiBSFHg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 19 Feb 2022 00:07:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiBSFHf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 19 Feb 2022 00:07:35 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B26C31912;
        Fri, 18 Feb 2022 21:07:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E45FDB8266E;
        Sat, 19 Feb 2022 05:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1A1C004E1;
        Sat, 19 Feb 2022 05:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645247233;
        bh=0jjzKpsuiEAtKkwYrKSUtLG1TQNSB7RdGg37iseRMlE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SJJHJURWgsVg/g4zIh2oUXhIgNVs0XA84Xm70UwGf5727YutFWpz4r2J1UG5f94dI
         GWJcf04RmgEM7xLwOTR/+S7qIfr0ty1MqCbWssCKeuh6KVAcphXiBKY2SVzgj7CJF1
         ZsLvPvtyVqbb7JB4LLwpTew3EDGZRw+aRnzJVB76DQ1o6A23e4pGYCS1QOesu/frUu
         cewV3GjmJPdlm+JG49efJ7YkGiut5+XKLs1g1WZlwJZ84cI2sJzQNYPOL6RhZnyslu
         lZ1Cs1H/eDjvGb6h1wwRXVQ3Ghh45rABcqcOyAct0lQv4s1EqX3BSNUReZU4g6ZSQd
         b0D1rID+YtMqQ==
Date:   Fri, 18 Feb 2022 21:07:12 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Joseph CHAMG <josright123@gmail.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net: dm9051: Fix use after free in
 dm9051_loop_tx()
Message-ID: <20220218210712.32161490@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20220218152730.GA4299@kili>
References: <20220218152730.GA4299@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 18 Feb 2022 18:27:30 +0300 Dan Carpenter wrote:
> This code dereferences "skb" after calling dev_kfree_skb().
> 
> Fixes: 2dc95a4d30ed ("net: Add dm9051 driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks!  Although..

> diff --git a/drivers/net/ethernet/davicom/dm9051.c b/drivers/net/ethernet/davicom/dm9051.c
> index a63d17e669a0..f6b5d2becf5e 100644
> --- a/drivers/net/ethernet/davicom/dm9051.c
> +++ b/drivers/net/ethernet/davicom/dm9051.c
> @@ -850,13 +850,13 @@ static int dm9051_loop_tx(struct board_info *db)
>  		if (skb) {
>  			ntx++;
>  			ret = dm9051_single_tx(db, skb->data, skb->len);
> +			ndev->stats.tx_bytes += skb->len;
> +			ndev->stats.tx_packets++;
>  			dev_kfree_skb(skb);
>  			if (ret < 0) {
>  				db->bc.tx_err_counter++;
>  				return 0;
>  			}
> -			ndev->stats.tx_bytes += skb->len;
> -			ndev->stats.tx_packets++;

I think the idea was (and it often is with this kind of bugs)
to count only successful transmissions. Could you re-jig it 
a little to keep those semantics?
