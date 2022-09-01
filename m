Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E236ECAAD1
	for <kernel-janitors@archiver.kernel.org>; Thu,  1 Sep 2022 08:26:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234200AbiIAI0J (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 1 Sep 2022 04:26:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232877AbiIAI0H (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 1 Sep 2022 04:26:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A99B9D8E32
        for <kernel-janitors@vger.kernel.org>; Thu,  1 Sep 2022 01:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662020763;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A09ae80YMwEtv8c2P0dV0w+SfIPFZiwExmKV//2uEBs=;
        b=X+nYqe4ZQULsX8y4JspnXngkZkOq2k19r7aEIGUKvZpN9EfNJNXT4h+K1pZ9VbknFIArx/
        ML/OPSHyjJm4HI20Rj7V+1MNgSWibsRnbyd1Q6P3dDdfeu2cPL+uaHSeq9Ozh6R+SuWwPz
        DsyrbAoKFGcVhKvTek/aECu/SEOuU9Y=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-158-gMnbWLaRN2ih031La2na6A-1; Thu, 01 Sep 2022 04:26:02 -0400
X-MC-Unique: gMnbWLaRN2ih031La2na6A-1
Received: by mail-ed1-f71.google.com with SMTP id y14-20020a056402440e00b0044301c7ccd9so11203985eda.19
        for <kernel-janitors@vger.kernel.org>; Thu, 01 Sep 2022 01:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=A09ae80YMwEtv8c2P0dV0w+SfIPFZiwExmKV//2uEBs=;
        b=dy94IKoph+j5OWEZvcwfll4lmsMjZ2crXjYkTOch9jBam6zUNGgO1Ts7PJ2pXz2d9J
         vOVVvgy7EpykL9MfTOT2g6i09CDB0wljG5i0YGhQO648mvsEu/hRfsu7t3kqMtLaSass
         hQqxc6BWwY606XzqiVuov/vnJnWgmOpwpDxHZb+JoNphlx3K+kL5XFYaFcZq95awc54g
         iTJ5SINquQjv1vU9z1WbZGvhxXFGB2HGlEDPtwjQ3nhckaboMO51svgZISPlhQ+JBkiU
         d0EzzwG4wCNDa424RVVYk12DO7qlSVeUGEZjqfx8y9gUCIeb61oCJg5BfEvArWcrqjHj
         dGGA==
X-Gm-Message-State: ACgBeo0XcMR8x0SQ4I+wrak1E4GcRCQ4qljCsz3AjzpAUvKAB7U9EfDq
        Y7A2ohhaUDpbUuD7UR4gNmjHnadwVvu2von/vM3APYoPq02MzjILi2LTMi8g5ZcTqL+pieKsej9
        bqfDxU0rsknqL2NthTwHByx5UCNW2
X-Received: by 2002:a17:906:c14f:b0:741:8829:6a97 with SMTP id dp15-20020a170906c14f00b0074188296a97mr13300557ejc.232.1662020761713;
        Thu, 01 Sep 2022 01:26:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Fnz/LP8fNwC4/7RZT3pjlM3+Chrs0EMIh0lNE1sBrd+eKUL5Prpomwog2Dvkuhdn7LuCiNw==
X-Received: by 2002:a17:906:c14f:b0:741:8829:6a97 with SMTP id dp15-20020a170906c14f00b0074188296a97mr13300547ejc.232.1662020761553;
        Thu, 01 Sep 2022 01:26:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id g22-20020a056402091600b00447f74138d7sm947603edz.8.2022.09.01.01.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 01:26:01 -0700 (PDT)
Message-ID: <2c35e3ca-3fb4-d91e-38af-841050d58ccf@redhat.com>
Date:   Thu, 1 Sep 2022 10:26:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] media: atomisp: prevent integer overflow in
 sh_css_set_black_frame()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        kernel-janitors@vger.kernel.org
References: <YxBBCRnm3mmvaiuR@kili>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YxBBCRnm3mmvaiuR@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 9/1/22 07:20, Dan Carpenter wrote:
> The "height" and "width" values come from the user so the "height * width"
> multiplication can overflow.
> 
> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I'll also add this to my set of pending atomisp2 cleanup patches
so that the next time I test the atomisp2 with my local tree
this will also get tested.

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/pci/sh_css_params.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index 0e7c38b2bfe3..67915d76a87f 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -950,8 +950,8 @@ sh_css_set_black_frame(struct ia_css_stream *stream,
>  		params->fpn_config.data = NULL;
>  	}
>  	if (!params->fpn_config.data) {
> -		params->fpn_config.data = kvmalloc(height * width *
> -						   sizeof(short), GFP_KERNEL);
> +		params->fpn_config.data = kvmalloc(array3_size(height, width, sizeof(short)),
> +						   GFP_KERNEL);
>  		if (!params->fpn_config.data) {
>  			IA_CSS_ERROR("out of memory");
>  			IA_CSS_LEAVE_ERR_PRIVATE(-ENOMEM);

