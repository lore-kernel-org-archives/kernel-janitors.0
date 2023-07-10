Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50165EB64DC
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 Jul 2023 07:29:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbjGJH3y (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 Jul 2023 03:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbjGJH3s (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Jul 2023 03:29:48 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B03138
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 00:29:46 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-31297125334so3018975f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 00:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688974185; x=1691566185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2jy5zTnsEjclW0IAo6TI4KH09ecPC4N8l96twGj5N0E=;
        b=OBAbthM1v1c78/ZzCyTdIpwTdHirp2JVWB3eDHKM3yppE8P3aW7bDozXCSbCfWCGvo
         aUJhkV9MOOBlgcArpIE7XMWjWnsRdnWwGgRD7j1RpPrD6eiToYHeHf0/kHKrsAl7vs9Q
         0LVNAuVBm9Ag0wKK7btutonbmGXnR2ZHigLTSRfxBYaD6A3CvlGEsVGLMurOCq3bsgXN
         kT2XnduE6CYa7eSe9Cm105uUZIE1A28AyWSzVEhqkOhUbrp6kdT/+8dDEGqEYo0mlC0N
         +p/NmuArdn1E3yfJPZxONsLJNo47TFfmB+uq37uCzOY1HYBrZaypYGD2le0rnusaQ9Wu
         fGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688974185; x=1691566185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jy5zTnsEjclW0IAo6TI4KH09ecPC4N8l96twGj5N0E=;
        b=BZRPyPoBOZfmGEqborGmDZxfGuBI6WAw6S0QDwkJkzvpRZj64mFgslj396adRI/koP
         VpibvCTSuROKFxf8HxeFfSo2FjJl75uybHcsKVe3ycWp/CY0yUUZX/aC8dxP/FmFQ67g
         lyPuD1+fDqsfVSMTiYjpOSm4feX142in6MiIrIdVAoYLZF+icuy0Utvzl+7tlNtGzU7U
         SM9EHIkqrEwZvGTZAgUgxVHnETdcu2VHY2AU6MLYhoCIrTjMIcDVH0BiNP0/m3yQfkvQ
         NcHEoe5wvqjvc7fJg+PEe0sr/zdB/X5ItE4c1PEMgr1UlWrb++6jT0ExPdqvgA1RJJbv
         vsDg==
X-Gm-Message-State: ABy/qLYm1PWwqN0fToxyIy+uZldOju/XoJABse9d/vElTIOnMNQcyL+q
        RLmQ/GDxjS0+HHsSZZcYBTQfUnOD6aKB/aL2yKY=
X-Google-Smtp-Source: APBJJlHVp1/4Jh3pSjHcnXhiWDH/u3GR3xaCfeHhiOKMO2azzBEjQPQEy5nxXANY+hMDz9a27mSt/A==
X-Received: by 2002:adf:f592:0:b0:314:1d6:8aa7 with SMTP id f18-20020adff592000000b0031401d68aa7mr10971747wro.29.1688974184893;
        Mon, 10 Jul 2023 00:29:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v12-20020adfe4cc000000b003143cb109d5sm10790399wrm.14.2023.07.10.00.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 00:29:43 -0700 (PDT)
Date:   Mon, 10 Jul 2023 10:29:39 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Su Hui <suhui@nfschina.com>
Cc:     qiang.zhao@nxp.com, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, wuych <yunchuan@nfschina.com>
Subject: Re: [PATCH net-next v2 01/10] net: wan: Remove unnecessary (void*)
 conversions
Message-ID: <45519aec-6ec8-49e5-b5b2-1b52d336288c@kadam.mountain>
References: <20230710063933.172926-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710063933.172926-1-suhui@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jul 10, 2023 at 02:39:33PM +0800, Su Hui wrote:
> From: wuych <yunchuan@nfschina.com>
        ^^^^^
This doesn't look like a real name.

> 
> Pointer variables of void * type do not require type cast.
> 
> Signed-off-by: wuych <yunchuan@nfschina.com>
> ---
>  drivers/net/wan/fsl_ucc_hdlc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
> index 47c2ad7a3e42..73c73d8f4bb2 100644
> --- a/drivers/net/wan/fsl_ucc_hdlc.c
> +++ b/drivers/net/wan/fsl_ucc_hdlc.c
> @@ -350,11 +350,11 @@ static int uhdlc_init(struct ucc_hdlc_private *priv)
>  static netdev_tx_t ucc_hdlc_tx(struct sk_buff *skb, struct net_device *dev)
>  {
>  	hdlc_device *hdlc = dev_to_hdlc(dev);
> -	struct ucc_hdlc_private *priv = (struct ucc_hdlc_private *)hdlc->priv;
> -	struct qe_bd *bd;
> -	u16 bd_status;
> +	struct ucc_hdlc_private *priv = hdlc->priv;
>  	unsigned long flags;
>  	__be16 *proto_head;
> +	struct qe_bd *bd;
> +	u16 bd_status;

Don't move the other variables around.  That's unrelated to the cast.
(Same applies to all the other patches).

regards,
dan carpenter

