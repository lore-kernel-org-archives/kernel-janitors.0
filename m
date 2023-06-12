Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FC5C7EE43
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Jun 2023 10:53:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235984AbjFLKxS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Jun 2023 06:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235664AbjFLKwz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Jun 2023 06:52:55 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB23A5EA
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 03:37:32 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b227fdda27so31236611fa.1
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 03:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686566250; x=1689158250;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UJOXI7NWxaGlAMXmYuetibwBgSH1F/dmnVvJT284BrM=;
        b=dcpbylz2unBUx3QQ1yfe8Ymt3rtgY7I28W7wVVItLYasie0P05wvcpTpkClHhVDGfD
         cavvddE58vjTvYf/GF+66bHNkadx3T6w6htc9q8q6WRPM21L3jglWeBcAAw2frw6Ioga
         dacj2C2lVNDOSBleYXbTIC8ahP2U/6uqV7NHst8FMgQJicc6Rr7p0vS2PSEc8KZMgq3S
         1Rlq/7F3xbY6/NgVeQ5vVj34/fDEkB7NhHS2ccdwoIzPu3jme8FIv0AkVCPljblukCBR
         6OXoTsIQpABrrm3Fgj55x42UUzE7tvtFCfPzeX6WSzPCQdp4JwMpyHXTb98C3WhU+Maa
         oBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686566250; x=1689158250;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJOXI7NWxaGlAMXmYuetibwBgSH1F/dmnVvJT284BrM=;
        b=ch6FJMvzIS8DLoOTfG11h4QqdT5sPLfaIe9kB3ZjvtxMWzeTVfW2sdRRN1YIBZFaj6
         +KAFcgWySs6HfQl/QRtqnotxcVX5ERGOifxBGdUEupn8eK9Q+n01yo9gVUQHwjtrcc2g
         q6gzY0GM+5z7HEeHQ3qj1u6YzMHm8XvVFJLLNfXqqwt8DheHnYGkhpQ+KqqQ+q1X5Tkr
         +3f9ObZyBnRjj5kzMXAQBRXbuKp2n10R7fhdKo9tLWI9LMmSF28bQpw7VeZ7o6XuPqcg
         IRBVLGRaTJgoGK7YHYYaCi/XndU7hymT9UXv2POYhXkvRd62ZNkWKBw/6uW6+C1rDHrn
         6Rzg==
X-Gm-Message-State: AC+VfDx3VzMfXRTHImB+bPFfqc6xhV1JT/pPOFEychE2t7YqzPULkbPg
        5KQ7FSbyOjd8FskNC7xZOen1f8p/5Hb2KKMIhXq4/A==
X-Google-Smtp-Source: ACHHUZ4uehM4jQ8rsUJZWcL5ncSWhd7m36oC/WdXiwDlPhdGAUTl4fXk3Aq4tkLkq9IE3ADNKvU8Jw==
X-Received: by 2002:a5d:6b43:0:b0:307:f75:f581 with SMTP id x3-20020a5d6b43000000b003070f75f581mr4652304wrw.18.1686564124203;
        Mon, 12 Jun 2023 03:02:04 -0700 (PDT)
Received: from [192.168.7.189] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id c2-20020a5d5282000000b002fae7408544sm12009223wrv.108.2023.06.12.03.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 03:02:03 -0700 (PDT)
Message-ID: <5cb3a029-2452-dbeb-691f-1c29ab7019bc@linaro.org>
Date:   Mon, 12 Jun 2023 12:02:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] usb: dwc3-meson-g12a: Fix an error handling path in
 dwc3_meson_g12a_probe()
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Yue Wang <yue.wang@amlogic.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
References: <9d28466de1808ccc756b4cc25fc72c482d133d13.1686403934.git.christophe.jaillet@wanadoo.fr>
Organization: Linaro Developer Services
In-Reply-To: <9d28466de1808ccc756b4cc25fc72c482d133d13.1686403934.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 10/06/2023 15:32, Christophe JAILLET wrote:
> If dwc3_meson_g12a_otg_init() fails, resources allocated by the previous
> of_platform_populate() call should be released, as already done in the
> error handling path.
> 
> Fixes: 1e355f21d3fb ("usb: dwc3: Add Amlogic A1 DWC3 glue")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/usb/dwc3/dwc3-meson-g12a.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> index 365aec00d302..e99c7489dba0 100644
> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> @@ -796,7 +796,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>   
>   	ret = dwc3_meson_g12a_otg_init(pdev, priv);
>   	if (ret)
> -		goto err_phys_power;
> +		goto err_plat_depopulate;
>   
>   	pm_runtime_set_active(dev);
>   	pm_runtime_enable(dev);
> @@ -804,6 +804,9 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>   
>   	return 0;
>   
> +err_plat_depopulate:
> +	of_platform_depopulate(dev);
> +
>   err_phys_power:
>   	for (i = 0 ; i < PHY_COUNT ; ++i)
>   		phy_power_off(priv->phys[i]);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
