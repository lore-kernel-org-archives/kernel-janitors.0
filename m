Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49049C77B7D
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 May 2023 14:56:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240110AbjEOO45 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 May 2023 10:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241380AbjEOO4v (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 May 2023 10:56:51 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72EA210D
        for <kernel-janitors@vger.kernel.org>; Mon, 15 May 2023 07:56:28 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3063afa2372so12050312f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 15 May 2023 07:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684162587; x=1686754587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UKdQljelele47fGhlCDtFyRrYOqvsvKHSxZYQmiGNRs=;
        b=Hn29fxuNMyby+YmQYnHiOhftbcHGmxehKzHtB7YzQD7v/sceIbhluaRt8wSdlJJJWW
         rYxh0eyDlDa3kfYLGhU0UbUOBzmTKnmuDJaUeb6gs8Cg3XSI32vksTKtxZ/DPf+Wv/jz
         6g7f33Af+mM8iEK5njYrtDiH+fb///gfth7NgjgLVYobaoY6p/ugrq3V+8CUQOLiJ4jm
         o0ej63/zA/PuxrUudmBd2t5GWqb5iX2lr2pfM36Mm3DYvZXLV+XD6oeihMT07MIw1tct
         7ztFaxRSccEK503l2NlgWVizWJ0tgN66uJnr011LOYo/QivoD2AH9G9y2QVT+33V7JP2
         /vzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684162587; x=1686754587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKdQljelele47fGhlCDtFyRrYOqvsvKHSxZYQmiGNRs=;
        b=iCL54tavpJnIiddwBTx4YeBKAZihxdvyiF084yhKv7tvv/u2oiF+TvL/NrkoQRZi8Y
         XrplxHBWg2QucVxq9SVbeF+ZSqfgF1g94SNqJVn51ISbs28OO3caTysJwJUIgHBHT5X+
         CbaA1rmi+AnvqK6kI59AXFV8K/LLlG8CdgEIEHVYY+8UMrYIkwLUDKOYKXAW8BdmNr4w
         +sudx76ndtVuqgt5V1jNAOzc4RvWlwcMROlnakyBCt0PExNaHNSt1yYXpWFNten85bvd
         uyNO4NqBnWkvyXCyU/J/7nD6Gb+Q2SaYmTsVUGM45CeRQVVWW82A4u8oni7ToV16nXyX
         k8vw==
X-Gm-Message-State: AC+VfDwjfSuK3heSZjQ8mK3bkyUcUs3W/aAFlzec2u4CiKy7pOyvf1fI
        uR7HeOmOsTkq/ByV1X/SJ+vN/g==
X-Google-Smtp-Source: ACHHUZ6GgrO8jcM5d3saW4J4IAVcPfC4QhJI1fiDa7hJz6KmjkRa3o1EhVVQMxnA/Z2etk4iReXBIQ==
X-Received: by 2002:a5d:6086:0:b0:306:2671:7cad with SMTP id w6-20020a5d6086000000b0030626717cadmr27241216wrt.55.1684162587152;
        Mon, 15 May 2023 07:56:27 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j17-20020a5d6051000000b002e5ff05765esm32745232wrt.73.2023.05.15.07.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 07:56:25 -0700 (PDT)
Date:   Mon, 15 May 2023 17:56:21 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     wuych <yunchuan@nfschina.com>
Cc:     dchickles@marvell.com, sburla@marvell.com, fmanlunas@marvell.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net: liquidio: lio_core: Remove unnecessary
 (void*) conversions
Message-ID: <2c8a5e3f-965e-422a-b347-741bcc7d33ce@kili.mountain>
References: <20230515084906.61491-1-yunchuan@nfschina.com>
 <61522ef5-7c7a-4bee-bcf6-6905a3290e76@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61522ef5-7c7a-4bee-bcf6-6905a3290e76@kili.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 15, 2023 at 12:28:19PM +0300, Dan Carpenter wrote:
> On Mon, May 15, 2023 at 04:49:06PM +0800, wuych wrote:
> > Pointer variables of void * type do not require type cast.
> > 
> > Signed-off-by: wuych <yunchuan@nfschina.com>
> > ---
> >  drivers/net/ethernet/cavium/liquidio/lio_core.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/cavium/liquidio/lio_core.c b/drivers/net/ethernet/cavium/liquidio/lio_core.c
> > index 882b2be06ea0..10d9dab26c92 100644
> > --- a/drivers/net/ethernet/cavium/liquidio/lio_core.c
> > +++ b/drivers/net/ethernet/cavium/liquidio/lio_core.c
> > @@ -904,8 +904,7 @@ static
> >  int liquidio_schedule_msix_droq_pkt_handler(struct octeon_droq *droq, u64 ret)
> >  {
> >  	struct octeon_device *oct = droq->oct_dev;
> > -	struct octeon_device_priv *oct_priv =
> > -	    (struct octeon_device_priv *)oct->priv;
> > +	struct octeon_device_priv *oct_priv = oct->priv;
> >  
> 
> Networking code needs to be in Reverse Christmas Tree order.  Longest
> lines first.  This code wasn't really in Reverse Christmas Tree order
> to begine with but now it's more obvious.

Oh, duh.  This obviously can't be reversed because it depends on the
first declaration.  Sorry for the noise.

regards,
dan carpenter

