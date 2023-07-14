Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C6DEB64DC
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 Jul 2023 09:08:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235691AbjGNJIa (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 14 Jul 2023 05:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235653AbjGNJIZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 Jul 2023 05:08:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64EC52D51
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Jul 2023 02:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689325648;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=r2mY0JyNnTxZdvnP8IpnyvgEIsSEBhM9AyoS3cpTtDM=;
        b=QxtUE1FW/Uf6iufok1muR/xrDF61hx9LhLBo6A2GokBAKnxZXF4GtXI8N8sqc3atV6oy9w
        IA5xpgj6yL5TtIy1BGEN/6pbH5XzXuW4TTrwNP4Kcu7OdMmr5s4a20RZ0e9kLZ/yDEvNIe
        nKp0k9IhTZ91tl1tZG+/oWtf4sIoQeE=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-xuxgaWD3OAeLX2KLrozUdA-1; Fri, 14 Jul 2023 05:07:27 -0400
X-MC-Unique: xuxgaWD3OAeLX2KLrozUdA-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-4fab61bb53bso1536838e87.0
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Jul 2023 02:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689325645; x=1691917645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2mY0JyNnTxZdvnP8IpnyvgEIsSEBhM9AyoS3cpTtDM=;
        b=P0rlzK62IEydpWPE40bgBTqBOmMBGP8ra3INguQ4UvKXcAOWIE0cn15hni8zO+R2J+
         CW7n2SdFO/5SNrP6WXyZs/rodSaP1Qi8x7gHOTvWA8KRliNJNmSxW9ZSF+tF6zY5S0Il
         8Wjq7ZlNaPCPvSzUeqqUqrOOMMG2IxVDFzZhPXhHnKFAnWqT8mpyBsDtgst+DzjvPosD
         nSR2aEfOCm2qjk7VmNSE6s8y4ZaTNx5V/veU40KnmrwPIXUAoBVU3p5isi4F3ZYWsnYh
         Hq80rlQ5XVH4+4crC5uWarKTSmYE6TwKWv1Efcup6RKjZnZdfUIDwiJvH2ItGWbqmKoS
         Qdfw==
X-Gm-Message-State: ABy/qLaI4iBlm07W4KsqfV9vBeGBHTRmZj59957H/vZhcOQMY09u9ciJ
        7nnYXU54La1KPNxyE2p0rsWB//D7uVh80FJ/6vTQ+3N0G7w9sCN2ZbKACHTrS3Miik4O+ptEhHc
        MOI5S6OD8/D6/JA4IeOScpra5zxRO
X-Received: by 2002:a05:6512:39d4:b0:4fb:cab9:ddf with SMTP id k20-20020a05651239d400b004fbcab90ddfmr4243843lfu.57.1689325645724;
        Fri, 14 Jul 2023 02:07:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHrHRiCN5I9pXBjlPpDa1v4y/hbI5KQALwNl1SeMwVsF6yueBPg/QexbDXA94mOfWXdeFCURw==
X-Received: by 2002:a05:6512:39d4:b0:4fb:cab9:ddf with SMTP id k20-20020a05651239d400b004fbcab90ddfmr4243830lfu.57.1689325645424;
        Fri, 14 Jul 2023 02:07:25 -0700 (PDT)
Received: from debian ([2001:4649:fcb8:0:d1e3:8951:b0b4:8608])
        by smtp.gmail.com with ESMTPSA id u20-20020ac248b4000000b004fb757bd429sm1419011lfg.96.2023.07.14.02.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 02:07:24 -0700 (PDT)
Date:   Fri, 14 Jul 2023 11:07:22 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     Su Hui <suhui@nfschina.com>
Cc:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, xeb@mail.ru, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        wuych <yunchuan@nfschina.com>
Subject: Re: [PATCH net-next v2 03/10] net: ppp: Remove unnecessary (void*)
 conversions
Message-ID: <ZLEQSivEvfpWXrdr@debian>
References: <20230710064027.173298-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710064027.173298-1-suhui@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jul 10, 2023 at 02:40:27PM +0800, Su Hui wrote:
> From: wuych <yunchuan@nfschina.com>
> 
> Pointer variables of void * type do not require type cast.
> 
> Signed-off-by: wuych <yunchuan@nfschina.com>
> ---
>  drivers/net/ppp/pppoe.c | 4 ++--
>  drivers/net/ppp/pptp.c  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Guillaume Nault <gnault@redhat.com>

While there, you might want to also remove the useless casts in
net/l2tp/l2tp_ppp.c and net/atm/pppoatm.c.

> diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
> index 3b79c603b936..ba8b6bd8233c 100644
> --- a/drivers/net/ppp/pppoe.c
> +++ b/drivers/net/ppp/pppoe.c
> @@ -968,7 +968,7 @@ static int __pppoe_xmit(struct sock *sk, struct sk_buff *skb)
>   ***********************************************************************/
>  static int pppoe_xmit(struct ppp_channel *chan, struct sk_buff *skb)
>  {
> -	struct sock *sk = (struct sock *)chan->private;
> +	struct sock *sk = chan->private;
>  	return __pppoe_xmit(sk, skb);
>  }
>  
> @@ -976,7 +976,7 @@ static int pppoe_fill_forward_path(struct net_device_path_ctx *ctx,
>  				   struct net_device_path *path,
>  				   const struct ppp_channel *chan)
>  {
> -	struct sock *sk = (struct sock *)chan->private;
> +	struct sock *sk = chan->private;
>  	struct pppox_sock *po = pppox_sk(sk);
>  	struct net_device *dev = po->pppoe_dev;
>  
> diff --git a/drivers/net/ppp/pptp.c b/drivers/net/ppp/pptp.c
> index 32183f24e63f..6b3d3df99549 100644
> --- a/drivers/net/ppp/pptp.c
> +++ b/drivers/net/ppp/pptp.c
> @@ -148,7 +148,7 @@ static struct rtable *pptp_route_output(struct pppox_sock *po,
>  
>  static int pptp_xmit(struct ppp_channel *chan, struct sk_buff *skb)
>  {
> -	struct sock *sk = (struct sock *) chan->private;
> +	struct sock *sk = chan->private;
>  	struct pppox_sock *po = pppox_sk(sk);
>  	struct net *net = sock_net(sk);
>  	struct pptp_opt *opt = &po->proto.pptp;
> @@ -575,7 +575,7 @@ static int pptp_create(struct net *net, struct socket *sock, int kern)
>  static int pptp_ppp_ioctl(struct ppp_channel *chan, unsigned int cmd,
>  	unsigned long arg)
>  {
> -	struct sock *sk = (struct sock *) chan->private;
> +	struct sock *sk = chan->private;
>  	struct pppox_sock *po = pppox_sk(sk);
>  	struct pptp_opt *opt = &po->proto.pptp;
>  	void __user *argp = (void __user *)arg;
> -- 
> 2.30.2
> 
> 

