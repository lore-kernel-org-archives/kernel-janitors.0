Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D48B6F2E8
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Jun 2024 08:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718008343; cv=none; b=j/0HPrTWs5QNXgzcVVYvnvZgh9xyUW+nqG1bpsDyFJrc+MN4ZAbHJYrClTKoKMp12/dHOeEp1HgRkz4MK9KGB2VZt7paXb7H8Ii5szUo1mmICcf2kHDaRhoogYrfuLc3lrXpextolLzw9eaEhqVTj5aZ6cnDmgQoJN3s8ElrDfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718008343; c=relaxed/simple;
	bh=NMlcYcmuSGPRF4yrItr4CuF2mNzLKhvU6KEPBL0SggE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TX4UVunE91XQ9LjBWE6rbr+Gmek1c+S4UD8rm/8XtLBnr/LO+Rnb8VM8mVf4I93Ii68VuBpker3Rr39a/lE6jfLmRJLf3ydB1/OPUumr9A4kzotFlWAR0Qs06jkEP2QyQIMFilVtnaaV4jdCcaCe6aNQ1VOEKg0+5+zolM+wVUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BnnJryfz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BnnJryfz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718008340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hSRcH/8de8I+xRtp7H6QKboIq4H1BR83RocjPY6icfE=;
	b=BnnJryfzIdf+4BlDPcSB7jIOyVa9rWLbYaB4fUkvCA6vh96ZLs7Zc0F777l/fpzftb6VZP
	Pa0FgdnadoHYN4Wj/mYSXP4koF6jBGuD/7WlWbY+suedGT9TiPp8b2jtQ50DDVphbc3TMw
	IZwE0QphXrV6qtc93pElO1H38WsJxdw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-tjtwWYcMNGG1R-V1-TBK8Q-1; Mon, 10 Jun 2024 04:32:15 -0400
X-MC-Unique: tjtwWYcMNGG1R-V1-TBK8Q-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a6f2d98f41fso7270466b.2
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jun 2024 01:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718008334; x=1718613134;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hSRcH/8de8I+xRtp7H6QKboIq4H1BR83RocjPY6icfE=;
        b=TEyCdvLVvKoE/jjuSvbqOQL7Oghpci4c66oO1mh1/9PxWg/6VL0YzcxVAziunVgQNq
         UJg5WmiSw2c99fOAKWPcK9a+FNqTRDBh71jotcn7QE0ZjJNuUsrqDeDc/ySU9+MlFw1e
         v3GYsYMAR37kEZw8NCC3zQzq0mZMpkuQPLiXumxJ9KDjsu0pZW5R8/7LnLt2PmeJpqzm
         rLqprtKV+KQJMBOdRTw9HvazZhNnGQXibdlF1mgq+JSf8VGZ8SjGbz5ovt4EuD6+eQwf
         IjO45jf/ug3yDIT4hSmMLpznkmJCCBxUdk/a/NYebS3/gea00jw08+jCtg7g/P7qD8FC
         iWog==
X-Forwarded-Encrypted: i=1; AJvYcCXWcOoiRPvO7uMHnElE7I77xWpO8kZF1/24krerMWzKVeH+E1qhnayM2qbtRKd7QQUiRIwtNMS06WpT5fpmm1zM/LIAlIsFRmItcgWe9WuA
X-Gm-Message-State: AOJu0Yzd3IQn3hsaRr7Dq9RpV7w/liUnacQHFfY68fMLnRdEjVpxwyp+
	PpURkwCretqHbNyEzTvUJRvKlRJMbhjy9PbO78uZaIhPXi87mxitWRWfcY+0uSTJii455FuXlWB
	UtCg3sPxdveeGFhc80VKc/+QLEFYEsZwU4YRwFKCxKZKSzSKybhI6GyPgzqKKLAC6gg==
X-Received: by 2002:a17:906:6b01:b0:a6f:117c:60c1 with SMTP id a640c23a62f3a-a6f117c6798mr232882066b.55.1718008334484;
        Mon, 10 Jun 2024 01:32:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNdowhmu00ckKngsHHAEOjW9e2OU6ATnmpJMzLrmBT1lN3+KYrPR1LaT6Wx0JstaTndpl+FQ==
X-Received: by 2002:a17:906:6b01:b0:a6f:117c:60c1 with SMTP id a640c23a62f3a-a6f117c6798mr232880166b.55.1718008334104;
        Mon, 10 Jun 2024 01:32:14 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c8df2c332sm55431a12.61.2024.06.10.01.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 01:32:13 -0700 (PDT)
Message-ID: <b5de3aaf-24e4-4bb1-b34a-f9f45efc0eac@redhat.com>
Date: Mon, 10 Jun 2024 10:32:12 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tiny: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20240609-md-drivers-gpu-drm-tiny-v1-1-6905fe4ada50@quicinc.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240609-md-drivers-gpu-drm-tiny-v1-1-6905fe4ada50@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/9/24 7:20 PM, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/bochs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/cirrus.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/gm12u320.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/gpu/drm/tiny/bochs.c    | 1 +
>  drivers/gpu/drm/tiny/cirrus.c   | 1 +
>  drivers/gpu/drm/tiny/gm12u320.c | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index c23c9f0cf49c..d15f4d3baeab 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -736,4 +736,5 @@ drm_module_pci_driver_if_modeset(bochs_pci_driver, bochs_modeset);
>  
>  MODULE_DEVICE_TABLE(pci, bochs_pci_tbl);
>  MODULE_AUTHOR("Gerd Hoffmann <kraxel@redhat.com>");
> +MODULE_DESCRIPTION("DRM Support for bochs dispi vga interface (qemu stdvga)");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
> index 4e3a152f897a..89484f7084bd 100644
> --- a/drivers/gpu/drm/tiny/cirrus.c
> +++ b/drivers/gpu/drm/tiny/cirrus.c
> @@ -760,4 +760,5 @@ static struct pci_driver cirrus_pci_driver = {
>  drm_module_pci_driver(cirrus_pci_driver)
>  
>  MODULE_DEVICE_TABLE(pci, pciidlist);
> +MODULE_DESCRIPTION("Cirrus driver for QEMU emulated device");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
> index 0187539ff5ea..07c6640022c2 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -755,4 +755,5 @@ static struct usb_driver gm12u320_usb_driver = {
>  
>  module_usb_driver(gm12u320_usb_driver);
>  MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
> +MODULE_DESCRIPTION("GM12U320 driver for USB projectors");
>  MODULE_LICENSE("GPL");
> 
> ---
> base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
> change-id: 20240609-md-drivers-gpu-drm-tiny-a3370189f560
> 

