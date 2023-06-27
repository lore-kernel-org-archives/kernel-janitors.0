Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EE0EB64D9
	for <kernel-janitors@archiver.kernel.org>; Tue, 27 Jun 2023 12:09:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231851AbjF0MJL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 27 Jun 2023 08:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231842AbjF0MJI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Jun 2023 08:09:08 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F22B2733
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Jun 2023 05:09:01 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3112c11fdc9so3916016f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Jun 2023 05:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687867739; x=1690459739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XjTuTNgKEBvunVd9fAUm7Ppy6mfbSYWQcxqzB1Eo12w=;
        b=jMET+zhwnS5q6F2CeWL/ZvUUXDxRCD3KIZroZ3mxJHNSTe+pVHeJRDOfbPh/630Aot
         LOUAHMqjtu3E4Fh2Yoo/r8tatlVx6RP9Waczk9zetDUKGYgMybsikZfJXk8RtbHcaTVS
         OrpAQ/hULa697u9j25R98sPaSRghRYBcpag4DKF7O5A+4f5g7K4+2eeFvSyZjEWJMcHy
         cEwewaTPhh4epk8JRB70mg4CTANx+XtlF8iZ4lvBht/Fdo7ToGIeRIJCfgHwo8EKNvg4
         RAScDKlNtoCmNueMswgykjbNZUBOOYFfWhrqaheSCJAwebY2PpxoBaJX1eZoqBVJ0KeV
         8V5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687867739; x=1690459739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjTuTNgKEBvunVd9fAUm7Ppy6mfbSYWQcxqzB1Eo12w=;
        b=BSvyuPkCsuFZmJAUGChkjKYaSQDPxkGkrsR6a/PYDILAYVyoH6PCB2VWCprBc+Nwml
         JNf78b+S9oCZm484RG6he1Bfn+rf84OCzPefOjUKT3Be/8jqdaS373590ijFpdtV4wxW
         uQCErt/tNB1DfLE5kgjHTMXqU+J34GTtpNbuaO3gu1iNsNRN6g4Jm1yeEMSEnhGs5j6+
         FHDszZglSuQSqS15rI2c6qO81SLHnhRHHk7k4GfINOnNM89M89bxaZStcXXpr+HmCpqU
         nAsnTEf+DbeZoqZipL2pjEIXr5Dkr0yEzV+YvtAlPZgkwDjNFg7eg+iLZOTE1pK4OPRb
         dPTA==
X-Gm-Message-State: AC+VfDz3Y7e7Yjnoku0siu6VIeRu9COP/jrC9yT6WHcMD2bPkLPbKafb
        X+zFSEjWc2WYi/K3GSvwPgk9wA==
X-Google-Smtp-Source: ACHHUZ4pCkteu52b9BlAo/HYL/OWS4u9cyn26HsksoVqBbTka5mDErRReBs9tDBbMMGxmHreePz3xg==
X-Received: by 2002:a05:6000:118f:b0:309:4620:e155 with SMTP id g15-20020a056000118f00b003094620e155mr10664973wrx.49.1687867739301;
        Tue, 27 Jun 2023 05:08:59 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v10-20020a5d590a000000b0030631a599a0sm10218526wrd.24.2023.06.27.05.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 05:08:56 -0700 (PDT)
Date:   Tue, 27 Jun 2023 15:08:53 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: sun6i-p2wi: Fix an error message in probe()
Message-ID: <7c6db53c-427d-4ba5-80b7-a069ab9322a0@kadam.mountain>
References: <98afbc28-3366-459e-bd01-f77cf1a67fe9@moroto.mountain>
 <20230627115920.c4ms65vgrbiyekc6@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627115920.c4ms65vgrbiyekc6@intel.intel>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 27, 2023 at 01:59:20PM +0200, Andi Shyti wrote:
> Hi Dan,
> 
> On Tue, Jun 27, 2023 at 10:12:36AM +0300, Dan Carpenter wrote:
> > The "ret" variable is uninitialized.  It was the "p2wi->rstc" variable
> > that was intended.  We can also use the %pe string format to print the
> > error code name instead of just the number.
> > 
> > Fixes: 75ff8a340a81 ("i2c: sun6i-p2wi: Use devm_clk_get_enabled()")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/i2c/busses/i2c-sun6i-p2wi.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> > index ad8270cdbd3e..fa6020dced59 100644
> > --- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
> > +++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> > @@ -250,7 +250,8 @@ static int p2wi_probe(struct platform_device *pdev)
> >  
> >  	p2wi->rstc = devm_reset_control_get_exclusive(dev, NULL);
> >  	if (IS_ERR(p2wi->rstc)) {
> > -		dev_err(dev, "failed to retrieve reset controller: %d\n", ret);
> > +		dev_err(dev, "failed to retrieve reset controller: %pe\n",
> > +			p2wi->rstc);
> 
> Yes, good catch! Thanks! But I think we want to print the error
> value here, so I think it should be:
> 
> -		dev_err(dev, "failed to retrieve reset controller: %d\n", ret);
> +		dev_err(dev, "failed to retrieve reset controller: %d\n",
> +			PTR_ERR(p2wi->rstc));
> 

The %pe which I changed it to is a cool new thing that prints:

	failed to retrieve reset controller: -EINVAL\n

We should create a similar %e printk format that works for ints instead
of error pointers.  But instead of that you have people who cast error
codes to pointers just to get the %pe functionality.  And other people
who make suggestions (this is the catagory that I'm in) but are too lazy
to do the actual work.

regards,
dan carpenter

