Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0C9C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Feb 2022 18:13:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237745AbiBRSOH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 18 Feb 2022 13:14:07 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235927AbiBRSOH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Feb 2022 13:14:07 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B3B9536302
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Feb 2022 10:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645208028;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=allXv7l7AABlpxX04lRv3Cwzs5kQg/QtV6XqLVwa9IE=;
        b=BNQ9WMOEN5JcmG0GIgAdLQX5bVCGvj0iTkJjuboWFNXzTXfyGyOGEQQH0PPrmmSDFSpWNh
        eZzpldySlKIvmDbuQmEEKkrMyRxfF2qGD1pnXsNekPAngq+JwsxaHHVDNaNuz9fwOPIlv6
        nYQoXoxmaekpNzn6hXKeVb1koIPahJU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-r_7wZWYBNtG-lfKHiecVzQ-1; Fri, 18 Feb 2022 13:13:47 -0500
X-MC-Unique: r_7wZWYBNtG-lfKHiecVzQ-1
Received: by mail-ej1-f72.google.com with SMTP id ga31-20020a1709070c1f00b006cec400422fso3395290ejc.22
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Feb 2022 10:13:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=allXv7l7AABlpxX04lRv3Cwzs5kQg/QtV6XqLVwa9IE=;
        b=iJBfWvN4mNPrGDIt9JBvFO0goV+l039yMpD/ASUjmuEIk5HrGix7xCCYrDDjHhQvWP
         6bi/+qgoWyNKnO332ogskCMEj3n+JjTfroGphA5lTDONdt4OFSk5xI/N8kxfaLAyf9Ny
         7VHKZWC69b68WGjXyeCi9A6lqWw0MhkpV8EeBB+4rRYqwTHGPdWNwD3hh++/c2eMAl6p
         14d/hkt27U/FPkdtHJntk4KzgQpAUHbo18iqluS9dOJzvfSZ5Sjr9DlM6mVctzTGj5WL
         OZFk+3WSstYP4ckKtxfalUEl/EfruPRezUTKwcQNT7JzqcS80fQ0ZoZvmWsbtPuDYP0r
         mYoA==
X-Gm-Message-State: AOAM532zwtzFoyjrAw//FUVpuqKgaZkQzI8qjeBo2umfimfsIZqQEbZE
        5dfbAnUQtt2DEBJy2N72Iw9WurB8AAzwbo4XEcpBIt6BZF5z0KmtkYiAt1JykSh2rXy0vsQ8p5A
        XKbYMvecVudmUbEXqfu0F9dkMSHUY
X-Received: by 2002:a17:906:39c7:b0:6cc:4b11:3258 with SMTP id i7-20020a17090639c700b006cc4b113258mr7064140eje.213.1645208026337;
        Fri, 18 Feb 2022 10:13:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyX11EidnQqwK2G5Pk3O4sLg/l0Nzzc+0BsN7FcgtQYyv6gSwnsIgVWtHN8zVp5gp688TRaWg==
X-Received: by 2002:a17:906:39c7:b0:6cc:4b11:3258 with SMTP id i7-20020a17090639c700b006cc4b113258mr7064122eje.213.1645208026158;
        Fri, 18 Feb 2022 10:13:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id m12sm1773082edl.74.2022.02.18.10.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 10:13:45 -0800 (PST)
Message-ID: <c5e6837b-ce26-4e1c-8e3d-db5798cfa957@redhat.com>
Date:   Fri, 18 Feb 2022 19:13:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH V2] power: supply: max17042_battery: Use
 devm_work_autocancel()
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
        Purism Kernel Team <kernel@puri.sm>,
        Sebastian Reichel <sre@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <670ea51361f96035f49852c617325af10ffa07ea.1645205558.git.christophe.jaillet@wanadoo.fr>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <670ea51361f96035f49852c617325af10ffa07ea.1645205558.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 2/18/22 18:37, Christophe JAILLET wrote:
> Use devm_work_autocancel() instead of hand-writing it.
> This saves a few lines of code.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> V2: s/devm_delayed_work_autocancel/devm_work_autocancel/

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> 
>  drivers/power/supply/max17042_battery.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
> index 87128cf0d577..ab031bbfbe78 100644
> --- a/drivers/power/supply/max17042_battery.c
> +++ b/drivers/power/supply/max17042_battery.c
> @@ -9,6 +9,7 @@
>  // This driver is based on max17040_battery.c
>  
>  #include <linux/acpi.h>
> +#include <linux/devm-helpers.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> @@ -1030,13 +1031,6 @@ static const struct power_supply_desc max17042_no_current_sense_psy_desc = {
>  	.num_properties	= ARRAY_SIZE(max17042_battery_props) - 2,
>  };
>  
> -static void max17042_stop_work(void *data)
> -{
> -	struct max17042_chip *chip = data;
> -
> -	cancel_work_sync(&chip->work);
> -}
> -
>  static int max17042_probe(struct i2c_client *client,
>  			const struct i2c_device_id *id)
>  {
> @@ -1142,8 +1136,8 @@ static int max17042_probe(struct i2c_client *client,
>  
>  	regmap_read(chip->regmap, MAX17042_STATUS, &val);
>  	if (val & STATUS_POR_BIT) {
> -		INIT_WORK(&chip->work, max17042_init_worker);
> -		ret = devm_add_action(&client->dev, max17042_stop_work, chip);
> +		ret = devm_work_autocancel(&client->dev, &chip->work,
> +					   max17042_init_worker);
>  		if (ret)
>  			return ret;
>  		schedule_work(&chip->work);

