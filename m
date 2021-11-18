Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587F1C433FE
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Nov 2021 09:01:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 376B460EE5
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Nov 2021 09:01:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244937AbhKRJEM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 Nov 2021 04:04:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245009AbhKRJED (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Nov 2021 04:04:03 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C931C061570
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Nov 2021 01:01:03 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 133so4632886wme.0
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Nov 2021 01:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yRKffgsue4Yf9neMNHpLgBHKo/grTl2z4ZxCAqszd/w=;
        b=l34AmabnuOYJO6MPDOZ0Ge9x5B8qh6lgL+Gb7vozb4wFZVgOjnUz360lSEt9avika8
         GitfxDkVwUcOWNXw/jdXfoo1EkcxTDqJs6IH2fT/Rm67mEyuiOWhfBQtv7UPaizUC1Jf
         yDxsmZVDyqCFuY9BFX7Otovl1d9HEO2LTmww5oHPXCa3zfiHXRLCzKlpHa5yfvZVRGRq
         QWb4q4YB4jrDu3zY/zOdHCqAuHP34X/NDdMRJauYt7DIE0fl1xHzvTFtYDmddA9KO4/t
         OZQDv8U+ubQ8emzd9Opg3OfJUYiK50jXwJxkpgu9kqMKSDI1YBg/AAvJPeESGM9ejZ5g
         gjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yRKffgsue4Yf9neMNHpLgBHKo/grTl2z4ZxCAqszd/w=;
        b=QQS1oB5ucEUn68anNbvRYkSgY3irzHTbCedi/QNAQpHLpPPE768mAQNubhTSG/wZ62
         K1CnWWWj88Z9OMPw8XQSIDKeurFSeCnLMWoulcLr/v4BL+RSFPcxDlTrSTSd9gomwZSu
         YDKmSYDl2dgViPxZOttMI16cgpjK+lUSjDq3XpzGCp/ADKDtAde7u3fsZsO3r84bodsi
         OeuzEN7cidHuJe/rtfxScVU/BtsvR4QWzt+5gfNOK7s2al4oQz/DrfMFrWN4irEMNqNL
         TUnffrSaIIeGBg41FUOraRy8/mrwxgBKPoz8n75lpQLkicgBFk7eIcnuFqtto9BHvq/7
         VLxg==
X-Gm-Message-State: AOAM532AE9CZj9kUHUAb6cz742iImxvXFg/edScHglH+59Kn/2Kh9Dow
        FVn6c10YXMwV0wGqybzcFjEY2WtMIiOcyA==
X-Google-Smtp-Source: ABdhPJyYBTj2UX2yKGl2GeeYHjg+ht9nwt7s+FWuP46I4sm27gnSmVmD1ZMqL1cfGqHqqsKzQoaNxw==
X-Received: by 2002:a1c:9dc6:: with SMTP id g189mr7908476wme.87.1637226061774;
        Thu, 18 Nov 2021 01:01:01 -0800 (PST)
Received: from google.com ([95.148.6.231])
        by smtp.gmail.com with ESMTPSA id e8sm2384955wrr.26.2021.11.18.01.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 01:01:01 -0800 (PST)
Date:   Thu, 18 Nov 2021 09:00:59 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     luca@lucaceresoli.net, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] mfd: lp87565: Handle optional reset pin
Message-ID: <YZYWS0N7nluXjfKA@google.com>
References: <20211117111701.GA23355@kili>
 <YZYQ9KtYvsP7RfzX@google.com>
 <20211118084731.GL27562@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211118084731.GL27562@kadam>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 18 Nov 2021, Dan Carpenter wrote:

> On Thu, Nov 18, 2021 at 08:38:12AM +0000, Lee Jones wrote:
> > On Wed, 17 Nov 2021, Dan Carpenter wrote:
> > 
> > > Hello Luca Ceresoli,
> > > 
> > > The patch 50e4d7a2a667: "mfd: lp87565: Handle optional reset pin"
> > > from Feb 26, 2021, leads to the following Smatch static checker
> > > warning:
> > > 
> > > 	drivers/mfd/lp87565.c:76 lp87565_probe()
> > > 	warn: 'lp87565->reset_gpio' could be an error pointer
> > > 
> > > drivers/mfd/lp87565.c
> > >     46 static int lp87565_probe(struct i2c_client *client,
> > >     47                          const struct i2c_device_id *ids)
> > >     48 {
> > >     49         struct lp87565 *lp87565;
> > >     50         const struct of_device_id *of_id;
> > >     51         int ret;
> > >     52         unsigned int otpid;
> > >     53 
> > >     54         lp87565 = devm_kzalloc(&client->dev, sizeof(*lp87565), GFP_KERNEL);
> > >     55         if (!lp87565)
> > >     56                 return -ENOMEM;
> > >     57 
> > >     58         lp87565->dev = &client->dev;
> > >     59 
> > >     60         lp87565->regmap = devm_regmap_init_i2c(client, &lp87565_regmap_config);
> > >     61         if (IS_ERR(lp87565->regmap)) {
> > >     62                 ret = PTR_ERR(lp87565->regmap);
> > >     63                 dev_err(lp87565->dev,
> > >     64                         "Failed to initialize register map: %d\n", ret);
> > >     65                 return ret;
> > >     66         }
> > >     67 
> > >     68         lp87565->reset_gpio = devm_gpiod_get_optional(lp87565->dev, "reset",
> > >     69                                                       GPIOD_OUT_LOW);
> > >     70         if (IS_ERR(lp87565->reset_gpio)) {
> > >     71                 ret = PTR_ERR(lp87565->reset_gpio);
> > >     72                 if (ret == -EPROBE_DEFER)
> > >     73                         return ret;
> > > 
> > > Only "ret = -EPROBE_DEFER" is handled.  Other error pointer will lead to
> > > a crash.
> > > 
> > >     74         }
> > >     75 
> > > --> 76         if (lp87565->reset_gpio) {
> > 
> > I guess this should be:
> > 
> >     if (lp87565->reset_gpio >= 0)
> > 
> > If 0 is valid, or '>' if it's not.
> > 
> 
> lp87565->reset_gpio is a pointer so that's not going to work.

Ah, I assumed this was a GPIO #.  I missed the gpioD part.

> There are two options.  The first is to just "return ret;" for all
> errors.

No, don't do that.  This GPIO is optional.

> The second option is to say something like:
> 
> 	if (IS_ERR(lp87565->reset_gpio)) {
> 		ret = dev_err_probe(lp87565->dev, PTR_ERR(lp87565->reset_gpio),
> 				    "no GPIO error for ->reset_gpio");
> 		if (ret == -EPROBE_DEFER)
> 			return;
> 		lp87565->reset_gpio = NULL;
> 	}

Works for me.

Or:

    if (!IS_ERR(lp87565->reset_gpio))

Or stick it in the else.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
