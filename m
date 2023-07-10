Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54339EB64D9
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 Jul 2023 07:32:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbjGJHcN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 Jul 2023 03:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbjGJHcI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Jul 2023 03:32:08 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA6A4102
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 00:31:52 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3159da54e95so312353f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 00:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688974311; x=1691566311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=byJr0xmC46iBq743abJgximnkiOFt20UZMaO06opogY=;
        b=X5fiH7o4AsekI7mkLf4fPTiLgEdyue6pPjKezkmqKfV3CDsrCmYH9m6ICfqZHgHjGg
         tJfneRt+0gzz5bBiAglMGwS8J25IcBbg7RodSTFa2BiPVK0qQbLKNGovfduSxekD3HTB
         yZ9AZKZd5cbF4GdZv/8cQ2mYpW9PPp19BgLcC1Vn6dvAbTRrFdQu4wGKeIK4u5fAj7sV
         il8NXX66xaP7FtVhd/CCOn3GMyH4gzdhfBHtJfuqt7gO+FgnGsaciGOnKm14m6Cb/B5Q
         KhAVeQMMoFvKwpAFoa3+gYDsEp6ZocF20Dh3fXWZoRaxg4NPh+z0NMfR9lV61gyDIDTk
         jl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688974311; x=1691566311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byJr0xmC46iBq743abJgximnkiOFt20UZMaO06opogY=;
        b=i66mlRMzzaQFSX9cZsljjLfrEbE4b5KWfUxK4Wvj/UpT5M/csvdxqAcqGop7XHhosh
         4shvBgC5AVNRYQVo7BaaiO+6nSUxaaYhqHa3jTQjD20GvLbhQzTRscvxaQvsoImHd1lK
         2ol9TEDUxsSqQ2IZTYaDbOoiVolTROKgHo1OsU9/Y3SHwXT9W5sXs7/Q+acdje6CKE1U
         +XpD0rAEB7Q2RUMO/iAZbXhYpFNyNJl+0D8CoIJKySRQ0z3CcwqM1Um3ZyMjcJ1KDWis
         ULuuFKqaMzh9rqHK9OLyIeZ2zp8M0kcZKwpoVoR1p8ovN4qRzjlu57QR5epEFv4lxqEv
         hzoA==
X-Gm-Message-State: ABy/qLaE7UjjweYENeJUFIAnqBP4PXCyf4x7SS0Ac+Ho2xfVIUixNzvp
        +Pn3p+uyCegU34qqV7n/SFQjcg==
X-Google-Smtp-Source: APBJJlGIJJG1aP9zcuRcTkdGAGVFewfD/2w036VUMfXBREZDOxc7KHHwsQ2h+DL5uPflOXk9HHB8lA==
X-Received: by 2002:a5d:6b0b:0:b0:313:e5f2:7cbf with SMTP id v11-20020a5d6b0b000000b00313e5f27cbfmr10307005wrw.58.1688974311144;
        Mon, 10 Jul 2023 00:31:51 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y5-20020a5d6205000000b003145521f4e5sm9813695wru.116.2023.07.10.00.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 00:31:49 -0700 (PDT)
Date:   Mon, 10 Jul 2023 10:31:47 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Su Hui <suhui@nfschina.com>
Cc:     irusskikh@marvell.com, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, yunchuan@nfschina.com,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next v2 02/10] net: atlantic: Remove unnecessary
 (void*) conversions
Message-ID: <494050a5-4bed-44d0-90d0-e76726168791@kadam.mountain>
References: <20230710063952.173055-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710063952.173055-1-suhui@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jul 10, 2023 at 02:39:52PM +0800, Su Hui wrote:
>  static void hw_atl2_hw_init_new_rx_filters(struct aq_hw_s *self)
>  {
> -	struct hw_atl2_priv *priv = (struct hw_atl2_priv *)self->priv;
>  	u8 *prio_tc_map = self->aq_nic_cfg->prio_tc_map;
> +	struct hw_atl2_priv *priv = self->priv;
>  	u16 action;
>  	u8 index;
>  	int i;

In this case moving the variable is fine because it's related to
removing the cast.  But in the other case it was moving other
decalarations so it wasn't related.

regards,
dan carpenter

