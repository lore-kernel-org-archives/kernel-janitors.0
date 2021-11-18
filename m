Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9E8C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Nov 2021 08:38:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BB7A61875
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Nov 2021 08:38:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244695AbhKRIlR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 Nov 2021 03:41:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242185AbhKRIlQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Nov 2021 03:41:16 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60BD3C061570
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Nov 2021 00:38:16 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id w29so9927816wra.12
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Nov 2021 00:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6wIHZu3L++EE3chnjk5wdQblPMI2XDfaZyckw2TtuBY=;
        b=sP/3If8Aeiz7gdXPgDZ8z5Jt8ssWo4+Ct0fLnZadau6EO6Pr97LOQdqs66VJSlrnmO
         ixLrW6ROu3Io+2telMBRt6cdQPbW3CVWR4yXTZR4J7ordNQu7Ihhu1d/M3YokcSh0Iof
         y5xdHIi/A2YVWxTMOMIoM8hPrjfrRKRth+bNQ1WrhbJwSJYDZyGwD8jUImi/WVfG+771
         UBeIvl2RnuBdNKD/WWp89AVNlPgB9k2A8DpJNxehTFuUTlmgHlvcUJmcvxs45BigYrwg
         b2P7PCDsC00HQOgtw63YQrexQMj+TCPUkBbcU4PG6ZJwrCNCP4aKsCqkJz//+rS9FY2Q
         LkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6wIHZu3L++EE3chnjk5wdQblPMI2XDfaZyckw2TtuBY=;
        b=B19tWli6LjwKx9SZtn3wi1y4Sg2vOmQu/eDEXLtSsE5nwHkwpldpo4b21+LuNOGwc1
         1j4BAaO3VHkbGPo/nintqP8lA+f2PaZlCq3wyYsF+vVnDU5jXgTJA6YGkagfR3/zJEx7
         pNCHLtQY6PE3/uV+6R+1I2WrfkMWtnZtNF+bIQtxC8SPBb1a1DFoaPH66lJ193E0p8D5
         1IhODM8NXvBlmKV6seOH5A4VaWTRGzXgLcBrw3dn9i0shWxfGIAQXTRMuei/lncnk6vQ
         2l2l4OPiWkK8G5QLzyCY9s7LvNCals/vghdr3CEAZxMJ98/rdqnMUjhiKq1Y8JPH3rDt
         rKXA==
X-Gm-Message-State: AOAM53191JwboWg3WNRrr4VdscYLMlj8+N8vW5rqhe8lMei2x9TYn1/C
        RIIIJiz2hc87O152o9uEOzwjG9NSueLqyw==
X-Google-Smtp-Source: ABdhPJw/prusGUsG9CrY8Ns0Iu0HwhB6PmLpHbXmD/uU0tGAeQxHL3PZjQ+zFjgAXuKu2hI/BaW7Zg==
X-Received: by 2002:adf:fc88:: with SMTP id g8mr29568408wrr.334.1637224694874;
        Thu, 18 Nov 2021 00:38:14 -0800 (PST)
Received: from google.com ([95.148.6.231])
        by smtp.gmail.com with ESMTPSA id r7sm2266882wrq.29.2021.11.18.00.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 00:38:14 -0800 (PST)
Date:   Thu, 18 Nov 2021 08:38:12 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     luca@lucaceresoli.net, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] mfd: lp87565: Handle optional reset pin
Message-ID: <YZYQ9KtYvsP7RfzX@google.com>
References: <20211117111701.GA23355@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211117111701.GA23355@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 17 Nov 2021, Dan Carpenter wrote:

> Hello Luca Ceresoli,
> 
> The patch 50e4d7a2a667: "mfd: lp87565: Handle optional reset pin"
> from Feb 26, 2021, leads to the following Smatch static checker
> warning:
> 
> 	drivers/mfd/lp87565.c:76 lp87565_probe()
> 	warn: 'lp87565->reset_gpio' could be an error pointer
> 
> drivers/mfd/lp87565.c
>     46 static int lp87565_probe(struct i2c_client *client,
>     47                          const struct i2c_device_id *ids)
>     48 {
>     49         struct lp87565 *lp87565;
>     50         const struct of_device_id *of_id;
>     51         int ret;
>     52         unsigned int otpid;
>     53 
>     54         lp87565 = devm_kzalloc(&client->dev, sizeof(*lp87565), GFP_KERNEL);
>     55         if (!lp87565)
>     56                 return -ENOMEM;
>     57 
>     58         lp87565->dev = &client->dev;
>     59 
>     60         lp87565->regmap = devm_regmap_init_i2c(client, &lp87565_regmap_config);
>     61         if (IS_ERR(lp87565->regmap)) {
>     62                 ret = PTR_ERR(lp87565->regmap);
>     63                 dev_err(lp87565->dev,
>     64                         "Failed to initialize register map: %d\n", ret);
>     65                 return ret;
>     66         }
>     67 
>     68         lp87565->reset_gpio = devm_gpiod_get_optional(lp87565->dev, "reset",
>     69                                                       GPIOD_OUT_LOW);
>     70         if (IS_ERR(lp87565->reset_gpio)) {
>     71                 ret = PTR_ERR(lp87565->reset_gpio);
>     72                 if (ret == -EPROBE_DEFER)
>     73                         return ret;
> 
> Only "ret = -EPROBE_DEFER" is handled.  Other error pointer will lead to
> a crash.
> 
>     74         }
>     75 
> --> 76         if (lp87565->reset_gpio) {

I guess this should be:

    if (lp87565->reset_gpio >= 0)

If 0 is valid, or '>' if it's not.

>     77                 gpiod_set_value_cansleep(lp87565->reset_gpio, 1);
>     78                 /* The minimum assertion time is undocumented, just guess */
>     79                 usleep_range(2000, 4000);
>     80 
>     81                 gpiod_set_value_cansleep(lp87565->reset_gpio, 0);
>     82                 /* Min 1.2 ms before first I2C transaction */
>     83                 usleep_range(1500, 3000);
>     84         }
>     85 
>     86         ret = regmap_read(lp87565->regmap, LP87565_REG_OTP_REV, &otpid);
>     87         if (ret) {
>     88                 dev_err(lp87565->dev, "Failed to read OTP ID\n");
>     89                 return ret;
>     90         }
>     91 
>     92         lp87565->rev = otpid & LP87565_OTP_REV_OTP_ID;
>     93 
>     94         of_id = of_match_device(of_lp87565_match_table, &client->dev);
>     95         if (of_id)
>     96                 lp87565->dev_type = (enum lp87565_device_type)of_id->data;
>     97 
>     98         i2c_set_clientdata(client, lp87565);
>     99 
>     100         return devm_mfd_add_devices(lp87565->dev, PLATFORM_DEVID_AUTO,
>     101                                     lp87565_cells, ARRAY_SIZE(lp87565_cells),
>     102                                     NULL, 0, NULL);
>     103 }
> 
> regards,
> dan carpenter

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
