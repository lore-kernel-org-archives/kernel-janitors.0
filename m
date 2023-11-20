Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WbaRnwLm"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37AA9D9
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Nov 2023 05:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700485583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1NQ5cLT8IYekGwpisM4dl0LPbfY/xJ50HrjMwWPtrYU=;
	b=WbaRnwLmpb3qhrIn+WhFGlH6wvcocV5QgjMUuva0NXaiBzNvEj1sz6lDRbQ/FREvdRc+Lq
	PqrpOUKfRTPOkGHIBmvA8oXQtz/KFMZheIj65odubdia42NzVIunK9xnkGWS58bzAmGtiU
	pAr3sQ2RIYGNImBwj2KwfdJIF2egLKw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-PpVSSbWkPGOyoxxIJQhZLQ-1; Mon, 20 Nov 2023 08:06:22 -0500
X-MC-Unique: PpVSSbWkPGOyoxxIJQhZLQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9ff5b5c16beso86588066b.1
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Nov 2023 05:06:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700485581; x=1701090381;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1NQ5cLT8IYekGwpisM4dl0LPbfY/xJ50HrjMwWPtrYU=;
        b=ii4rwizjcjGyFkl0to9ct1bDuiyCmmCK7OzWCeaU0U2jaCqKKDpNuhMPMqSMay9jUW
         x+iaOtheI8halDXBJxK7z/udgxn6c1cH4baCxqNAvR5lgzIo6ZUILspXjfYsKLanEzQq
         IahR9E/cKLz4KkFD3MUGe5BBkWXFnfnyEg8o1kw+7UKeE/npjSeIn4r9bCChoYgPeP7R
         xWx3FXr006m7Bc/vf1/RJLimRxgY2cyZYeV9ysKoidtmISrQhKdMFw2+AVkwY0Pdyclq
         21zvWFlC1Hz9SGx//tibWbapBAa5yLY1+HmXltBhQWJgBRagg7WZfyT5R6K+b94QUouw
         VK5g==
X-Gm-Message-State: AOJu0YyBBWS+zdr7ORsRUzFlobZQ06M9Q0u6c/FrDAIa6Pq8VeOFNKm3
	EJLmg0rINPSJ9pyaBFFq8qDFLQXsRQUjCKs8X9LA+/7f/4kGFBOw3nt8Cl3w+ofz0bEZIHgFLaD
	zcEJEi5TNc/Vq++xk3kFOgknuGGEP
X-Received: by 2002:a17:906:108d:b0:9ad:8a9e:23ee with SMTP id u13-20020a170906108d00b009ad8a9e23eemr1789483eju.13.1700485580963;
        Mon, 20 Nov 2023 05:06:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELvwN8Lt65+G4ZeqKhE8MZ0SNLIYY1WF/08aEqSUqx+9JN7mTwCSurwBgUSjhY2I4Zm3RUzA==
X-Received: by 2002:a17:906:108d:b0:9ad:8a9e:23ee with SMTP id u13-20020a170906108d00b009ad8a9e23eemr1789469eju.13.1700485580708;
        Mon, 20 Nov 2023 05:06:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h5-20020a170906718500b009bf7a4d591csm3920594ejk.11.2023.11.20.05.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 05:06:20 -0800 (PST)
Message-ID: <9bb5500a-c66f-4625-af07-454f6df5a32a@redhat.com>
Date: Mon, 20 Nov 2023 14:06:19 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/dell: alienware-wmi: Use kasprintf()
Content-Language: en-US, nl
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Gross <markgross@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org
References: <f2b2c9e5d80550e480a627c1b2139d5cc9472ffa.1699775015.git.christophe.jaillet@wanadoo.fr>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f2b2c9e5d80550e480a627c1b2139d5cc9472ffa.1699775015.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/12/23 08:44, Christophe JAILLET wrote:
> Use kasprintf() instead of hand writing it.
> This saves the need of an intermediate buffer.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
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
>  drivers/platform/x86/dell/alienware-wmi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> index a9477e5432e4..f5ee62ce1753 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -429,7 +429,6 @@ static DEVICE_ATTR(lighting_control_state, 0644, show_control_state,
>  static int alienware_zone_init(struct platform_device *dev)
>  {
>  	u8 zone;
> -	char buffer[10];
>  	char *name;
>  
>  	if (interface == WMAX) {
> @@ -466,8 +465,7 @@ static int alienware_zone_init(struct platform_device *dev)
>  		return -ENOMEM;
>  
>  	for (zone = 0; zone < quirks->num_zones; zone++) {
> -		sprintf(buffer, "zone%02hhX", zone);
> -		name = kstrdup(buffer, GFP_KERNEL);
> +		name = kasprintf(GFP_KERNEL, "zone%02hhX", zone);
>  		if (name == NULL)
>  			return 1;
>  		sysfs_attr_init(&zone_dev_attrs[zone].attr);

