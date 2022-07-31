Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09459C00140
	for <kernel-janitors@archiver.kernel.org>; Sun, 31 Jul 2022 08:54:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236487AbiGaIyy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 31 Jul 2022 04:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGaIyx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 31 Jul 2022 04:54:53 -0400
X-Greylist: delayed 593 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 31 Jul 2022 01:54:52 PDT
Received: from mail.enpas.org (zhong.enpas.org [IPv6:2a03:4000:2:537::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B7A72E0F3
        for <kernel-janitors@vger.kernel.org>; Sun, 31 Jul 2022 01:54:52 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        by mail.enpas.org (Postfix) with ESMTPSA id 256D6FFB0C;
        Sun, 31 Jul 2022 08:44:57 +0000 (UTC)
Date:   Sun, 31 Jul 2022 10:44:52 +0200
From:   Max Staudt <max@enpas.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-can@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH] can: can327: Fix a broken link to Documentation
Message-ID: <20220731104452.3bc2e76c.max@enpas.org>
In-Reply-To: <6a54aff884ea4f84b661527d75aabd6632140715.1659249135.git.christophe.jaillet@wanadoo.fr>
References: <6a54aff884ea4f84b661527d75aabd6632140715.1659249135.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks, Christophe!

Max




On Sun, 31 Jul 2022 08:32:52 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> Since commit 482a4360c56a ("docs: networking: convert netdevices.txt to
> ReST"), Documentation/networking/netdevices.txt has been replaced by
> Documentation/networking/netdevices.rst.
> 
> Update the comment accordingly to avoid a 'make htmldocs' warning
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/net/can/can327.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/can/can327.c b/drivers/net/can/can327.c
> index 5da7778d92dc..925e880bf570 100644
> --- a/drivers/net/can/can327.c
> +++ b/drivers/net/can/can327.c
> @@ -827,7 +827,7 @@ static netdev_tx_t can327_netdev_start_xmit(struct sk_buff *skb,
>  	netif_stop_queue(dev);
>  
>  	/* BHs are already disabled, so no spin_lock_bh().
> -	 * See Documentation/networking/netdevices.txt
> +	 * See Documentation/networking/netdevices.rst
>  	 */
>  	spin_lock(&elm->lock);
>  	can327_send_frame(elm, frame);

