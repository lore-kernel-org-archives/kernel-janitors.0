Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C6D130AC8
	for <kernel-janitors@vger.kernel.org>; Sat,  2 Nov 2024 19:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730576402; cv=none; b=cZspf6K6OTSWOitUVnOCVTTJvYtlp1Es6yjX7TBNZ/+NI4Ybtr1DRlqs13lgUbbH5D0GGfp5mnxjN3JcyvXYsJ2xwnClVASgBWz6zPkU9fc2+/XJFfAyFmjIsvNwn7uY7CHh8F9NlBdrSz9yNKWVDseKbCG34xnci5bMQtLSVos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730576402; c=relaxed/simple;
	bh=F6IZAEofDbdC4lDW3iu38ep6yj9FSsEE8dp6aaqYybY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VGga8OFD1EjrUR9ojBMYMpecMvVu2VH/YpUJiIqE9m2Ijbg1FZvAbTuoUExdrTYy3TyLZaoewYfuIjmq4l5mvOmxtAoBGVgtiLnNBvV3zGgWZKUBV1dtVlhLOehhK14Kc5RVMvDm2Uh5Yqk0E4S41r6PRWZl3BV0sLbX0evXPr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d0rGLr2u; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d0rGLr2u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730576399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V3g8+26iKRPY6D+zbC3t4hy7sOkk/+U+1XxMzqY8gvI=;
	b=d0rGLr2ukc+brWumshi0yZpjCpXdl34avRbZ+/mF3FFhTzMu+QupQY1LoEcYJp5MqmKfIP
	hJl/zdOGwOYJ0qKEZEbf+5aOMCMpaFcMNo8QIkAf2sPJo8SI8LNigOGuMrZbqJ9YJuHx5p
	GBe8qS3O0NzN1O6I/QlyrytlAENcKxQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-Y_s4GzxLPAWrEFOhZyWEMA-1; Sat, 02 Nov 2024 15:39:57 -0400
X-MC-Unique: Y_s4GzxLPAWrEFOhZyWEMA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a9a0710ca24so213683666b.3
        for <kernel-janitors@vger.kernel.org>; Sat, 02 Nov 2024 12:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730576396; x=1731181196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V3g8+26iKRPY6D+zbC3t4hy7sOkk/+U+1XxMzqY8gvI=;
        b=h4DEcWz6jbzlFRliysgpsJW4rKcJMGOyUumDHdQl0fG8AojiVIYLqSVVJM+1ZRD2jy
         GUSNof9X4TGpeD3AgK413Hfi0PChEAwcc1eXlfBdvsAiF6kqOpA7fYAxtsCVTc+sjkUw
         sxcJVLoDnZQy5JCbqWeyvFMG2OgwCm35Ae09BlT7SYpF2UtgYviTmQB8riHnL292yfQ4
         GPBj1cPKnyB2k9RyMC8kXP+h/697waAQVFo7RTf+RAvu7v+4mYPshE9n8BjUZfe8tch4
         OAZbCcTI7C9D0AzUI0AzMOHDdpYzF1wkqWgS8Z2RAw1YtwzuH+v88x7G+A36QTEYdwmr
         E6TA==
X-Forwarded-Encrypted: i=1; AJvYcCVFBpQJWBB3DLdklt4AX0GjCnClpQi+Zqldud+eXyI7fABjMMffVhRYhpz7NQ5GWEMsFh7+eEIdMcPm5AFw3ec=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlc33McLOXz4Q+LVOZIiX1b2c+aFZYxcOLGM26uTw3ZjcjToGx
	qu7T91RKoy7CVA4GixIgi5nY01sFjQpcdwBbh68oNtw1Svki2ySGSfk2+YWb36iy0Jt+/9mU05J
	wqQQ6oJfFrRB114lCtrdnxFna/OmRNdt4tKV8i7ZYEEbw3i1DEopRfOQ9Pagja8/DqA==
X-Received: by 2002:a17:907:3f98:b0:a9a:6314:40e7 with SMTP id a640c23a62f3a-a9e3a5a063amr1351144466b.17.1730576396049;
        Sat, 02 Nov 2024 12:39:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNVFKoD8PA1DxG79/9olz+kxVoRw4fAPXTHo91VPYL1mYIazwv3WGi9wHF74EZlWsXftkaFg==
X-Received: by 2002:a17:907:3f98:b0:a9a:6314:40e7 with SMTP id a640c23a62f3a-a9e3a5a063amr1351142066b.17.1730576395500;
        Sat, 02 Nov 2024 12:39:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cece71fbeesm592478a12.54.2024.11.02.12.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 12:39:54 -0700 (PDT)
Message-ID: <b318af93-cbde-486d-854d-918b61795b1f@redhat.com>
Date: Sat, 2 Nov 2024 20:39:52 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/intel/vsec: Remove a useless mutex
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 srinivas.pandruvada@linux.intel.com,
 "David E. Box" <david.e.box@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <ccc08a262304f7f8c2e435349f0f714ebf9acfcd.1730563031.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ccc08a262304f7f8c2e435349f0f714ebf9acfcd.1730563031.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2-Nov-24 4:59 PM, Christophe JAILLET wrote:
> ida_alloc()/ida_free() don't need any mutex, so remove this one.
> 
> It was introduced by commit 9a90ea7d3784 ("platform/x86/intel/vsec: Use
> mutex for ida_alloc() and ida_free()").
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> See:
> https://elixir.bootlin.com/linux/v6.11.2/source/lib/idr.c#L375
> https://elixir.bootlin.com/linux/v6.11.2/source/lib/idr.c#L484
> 
> Review with care. This patch is clearly the opposite of the one in Fixes
> which states that locking IS needed.
> IIUC, idr_ functions need locking, but not ida_.
> 
> If I'm wrong, could you elaborate why? (because many other places will
> need to be fixed and the doc certainly needs updating)

This is my bad, looking at the ida docs they clearly state
no locking is necessary.

Back then I was working on / reviewing some other stuff using
idr which does need locking and I likely simply confused the 2
and suggested for the locking to be added.

Anyways dropping the locking looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/intel/vsec.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> index 7b5cc9993974..9e0f8e38178c 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -79,17 +79,13 @@ static void intel_vsec_remove_aux(void *data)
>  	auxiliary_device_uninit(data);
>  }
>  
> -static DEFINE_MUTEX(vsec_ida_lock);
> -
>  static void intel_vsec_dev_release(struct device *dev)
>  {
>  	struct intel_vsec_device *intel_vsec_dev = dev_to_ivdev(dev);
>  
>  	xa_erase(&auxdev_array, intel_vsec_dev->id);
>  
> -	mutex_lock(&vsec_ida_lock);
>  	ida_free(intel_vsec_dev->ida, intel_vsec_dev->auxdev.id);
> -	mutex_unlock(&vsec_ida_lock);
>  
>  	kfree(intel_vsec_dev->resource);
>  	kfree(intel_vsec_dev);
> @@ -113,9 +109,7 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
>  		return ret;
>  	}
>  
> -	mutex_lock(&vsec_ida_lock);
>  	id = ida_alloc(intel_vsec_dev->ida, GFP_KERNEL);
> -	mutex_unlock(&vsec_ida_lock);
>  	if (id < 0) {
>  		xa_erase(&auxdev_array, intel_vsec_dev->id);
>  		kfree(intel_vsec_dev->resource);

