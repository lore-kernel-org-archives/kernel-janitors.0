Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF53C0015E
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 Jul 2023 14:19:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234540AbjGZOTY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 Jul 2023 10:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235081AbjGZOTF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 Jul 2023 10:19:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151D9420C
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Jul 2023 07:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690381037;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eSalCi6glzfTgG5uK7V7MEndFxat2B7581xZZuweQRQ=;
        b=EFGtr6MQS4zpHBFgLVBF9hzoHXgijild+7TCDVjrNRcgPG2LAiKcSTeAa8MQI0VIhfqmmZ
        T5nvkhONb1LkCYBn1y+Fh+oOw3joG78NdJJghuOoNJJy7xmGwK7HHs5BpcNPcWYiH13rKh
        xkF5g2rdzXGv24RXLNvaSKbpWC/vAQ4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-bviQw_iNO6GFUQx9lHvePw-1; Wed, 26 Jul 2023 10:17:16 -0400
X-MC-Unique: bviQw_iNO6GFUQx9lHvePw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-989249538a1so447176366b.1
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Jul 2023 07:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690381035; x=1690985835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eSalCi6glzfTgG5uK7V7MEndFxat2B7581xZZuweQRQ=;
        b=Ryf+DT+TN+QfJxHRoi4sMZLusqrGoxisaVyxmI7ScpYa5vtjgzBZ/9d2rr68zVNsSO
         tbDrRuGuoxyQY7Iy5kZrnGXi07OlBS9umRi1MH5jo1bL8YaASAxCFXuoO+pinS6jKN7C
         1Xyhl1+RNWFPNDS3sso1iVVVI3b5ChfLyuQrO3AnBjzVV5dhL18TuipLbHGOQHi83bhd
         ZjDrO8N3Ri0ix5T1iReEId05iLyWLk3QoJ7PggdOFHZNgyni6sHdUlABONMhcv43ufLw
         u22rO9kFbftX4b6UE2k21MhPjQDmiyJH8mBGbr6xU5ld/N/FXEGvWK/SuVogHKXrK2Ag
         g/lg==
X-Gm-Message-State: ABy/qLZapxfvs1Vf+5PGCD/b6TVhXpIOnz2E3kJ0AfmvgsV775YK8KQE
        NRs4dObWvv/kDz5oi9VfPqe/Ea35nncrjmv7jiohz0aehJP314caeqRFbXXf4ERSOxXbC32FkMf
        Yp5F0eRAkJY0PEtBekRYd2M+hFiqO
X-Received: by 2002:a17:907:77c1:b0:99b:4867:5e1a with SMTP id kz1-20020a17090777c100b0099b48675e1amr1693639ejc.41.1690381035542;
        Wed, 26 Jul 2023 07:17:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFzwVzYhIJKrbWH0uTb/rp+H6gY0SxUXduNWI+NgdvL6tG3lphQLT14y2Of7kie8hiukdNYDg==
X-Received: by 2002:a17:907:77c1:b0:99b:4867:5e1a with SMTP id kz1-20020a17090777c100b0099b48675e1amr1693619ejc.41.1690381035209;
        Wed, 26 Jul 2023 07:17:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k27-20020a1709063e1b00b00982842ea98bsm9536631eji.195.2023.07.26.07.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 07:17:14 -0700 (PDT)
Message-ID: <3b62fee2-0768-d662-1f6c-9229f59b1776@redhat.com>
Date:   Wed, 26 Jul 2023 16:17:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] platform/x86: hp-bioscfg: fix a signedness bug in
 hp_wmi_perform_query()
Content-Language: en-US, nl
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Jorge Lopez <jorge.lopez2@hp.com>
Cc:     Mark Gross <markgross@kernel.org>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <ad0a6ad9-099b-40a4-ae91-b9dca622ff4e@moroto.mountain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ad0a6ad9-099b-40a4-ae91-b9dca622ff4e@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 7/18/23 09:05, Dan Carpenter wrote:
> The error handling won't work if "mid" is unsigned.  "ret" is used to
> store negative error codes and declaring it as a u32 won't cause a bug
> but it's ugly.  The "actual_outsize" variable is a number between 0-4096
> so it can be declared as int as well.
> 
> Fixes: 69ea03e38f24 ("platform/x86: hp-bioscfg: biosattr-interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> ---
>  drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> index 1d59ad600b84..dea54f35b8b5 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> @@ -123,7 +123,7 @@ int hp_wmi_perform_query(int query, enum hp_wmi_command command, void *buffer,
>  	struct bios_return *bios_return;
>  	union acpi_object *obj = NULL;
>  	struct bios_args *args = NULL;
> -	u32 mid, actual_outsize, ret;
> +	int mid, actual_outsize, ret;
>  	size_t bios_args_size;
>  
>  	mid = hp_encode_outsize_for_pvsz(outsize);

