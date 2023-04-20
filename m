Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8650AC77B72
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 Apr 2023 07:08:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233710AbjDTHI2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 Apr 2023 03:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231797AbjDTHI0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Apr 2023 03:08:26 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AEC04C2C
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Apr 2023 00:07:48 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id n31so142258wms.3
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Apr 2023 00:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681974465; x=1684566465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jhuncWQnqL53OVPD8IqXPC3FkGRRZlVikfJFBCGy4Lg=;
        b=WMEpDHV7pbMxZMffcDDIHxhaGkYx2XqFvYHjIoBIBlINf9k3WbufMWyUOlwWN5d0tu
         1RXDC4hl9L8rJFvbFc89UoEM8EX9cUMm/iuXePPQp0fG61AgFR7ABVXC9dRjvGXueC5Q
         GqnLtObmqH/UrrXHz5RH1I5QNVAXMEgT3Mol4uDLRAcXHGPSpG7OVqrK7TOSe0F/sEvE
         mABcwkDCqOLK2+3auuFkjWnJPoxjWZAuKbsZ1/WbiY3r/ckeYRKQEkECPnqWWXLG2Qis
         1zrMZxVE4zReeW19RdKYYDXjwgVn6CplOZqLyoVuBtmirIfLIzF8Cc2S9P3EYJzluPVU
         XGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681974465; x=1684566465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhuncWQnqL53OVPD8IqXPC3FkGRRZlVikfJFBCGy4Lg=;
        b=ZAC0pD2kq+WZzzlEl75K8L2Z7dASH79CCMma1Y/2Ul2pzGZlIOl/PbLTW5YJevFFau
         mtGjVoFUO0UT8IexvZtc8Z5MnPVkfwHbSNKlFinTMuhwhgRdt9R4rRlC97AG+bb8zzYt
         wcpP7NXvWQCUBvsl+1qL5m8gVyrmahqkkTKLT7KHTafhZUi6Px3/ZsuDvVhpTMJZVWun
         xVMAvL0ddwKEj+951eLNBaDpCrAGxFnxMSpurnIQxbr3z7ONLWGZw2Umy3ychnY2VSFo
         boCkNbYEqUl54b1e9QdAIEo52iU/obYrMBdSgj5GkI1PCpuMiuHdke2H4xq3BgbgyOCz
         +lYw==
X-Gm-Message-State: AAQBX9fZU1Y4wqylgyiF79GBXSXrWHyUwCEnuYiTyKVAThzStDilZkxC
        WaAXxQPe2mKwPsuS7ANnHpcEVw==
X-Google-Smtp-Source: AKy350Zo94A6yq/YLyR7BmER4zmeAFkMPDoyvCk/JuFshZ+UEMq6+vN1jWh66hFJIzvEyyUcdr43RA==
X-Received: by 2002:a7b:c5da:0:b0:3f1:7ba6:d5ab with SMTP id n26-20020a7bc5da000000b003f17ba6d5abmr386787wmk.36.1681974465598;
        Thu, 20 Apr 2023 00:07:45 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z19-20020a1c4c13000000b003f173419e7asm1014486wmf.43.2023.04.20.00.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 00:07:44 -0700 (PDT)
Date:   Thu, 20 Apr 2023 10:07:42 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Maxime Ripard <maxime@cerno.tech>, Stephen Boyd <sboyd@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        "Ivan T. Ivanov" <iivanov@suse.de>,
        Dom Cobley <popcornmix@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: bcm: rpi: Fix off by one in
 raspberrypi_discover_clocks()
Message-ID: <758c22df-eb9f-48ab-84c1-b24f325d068b@kili.mountain>
References: <9d4496c2-e102-4fc6-afe2-5a917930d15a@kili.mountain>
 <1dcd711f-681a-a80d-4007-b808a29e46b9@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1dcd711f-681a-a80d-4007-b808a29e46b9@i2se.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Apr 19, 2023 at 05:55:12PM +0200, Stefan Wahren wrote:
> Hi Dan,
> 
> Am 19.04.23 um 09:56 schrieb Dan Carpenter:
> > Smatch detected an off by one in this code:
> > 
> >      drivers/clk/bcm/clk-raspberrypi.c:374 raspberrypi_discover_clocks()
> >      error: buffer overflow 'data->hws' 16 <= 16
> > 
> > The data->hws[] array has RPI_FIRMWARE_NUM_CLK_ID elements so the >
> > comparison needs to changed to >=.
> > 
> > Fixes: 12c90f3f27bb ("clk: bcm: rpi: Add variant structure")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > The clks[] array, on the other hand, is correct.  It allocates
> > RPI_FIRMWARE_NUM_CLK_ID + 1 elements because the last element is a
> > sentinal.
> > 
> >   drivers/clk/bcm/clk-raspberrypi.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
> > index eb399a4d141b..d4b43e33035c 100644
> > --- a/drivers/clk/bcm/clk-raspberrypi.c
> > +++ b/drivers/clk/bcm/clk-raspberrypi.c
> > @@ -356,7 +356,7 @@ static int raspberrypi_discover_clocks(struct raspberrypi_clk *rpi,
> >   	while (clks->id) {
> >   		struct raspberrypi_clk_variant *variant;
> > -		if (clks->id > RPI_FIRMWARE_NUM_CLK_ID) {
> > +		if (clks->id >= RPI_FIRMWARE_NUM_CLK_ID) {
> >   			dev_err(rpi->dev, "Unknown clock id: %u (max: %u)\n",
> >   					   clks->id, RPI_FIRMWARE_NUM_CLK_ID);
> 
> the change looks good, but shouldn't we also reduce the max in the error
> message by one?

Sure.  Let me resend.

regards,
dan carpenter

