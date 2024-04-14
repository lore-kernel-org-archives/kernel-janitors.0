Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9923022F08
	for <kernel-janitors@vger.kernel.org>; Sun, 14 Apr 2024 08:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713083712; cv=none; b=gVl6DGoe7mfQCNeNwExCf8kf9pGvfVEU6PrVtGh/U/Nb3WDufGrK4dQSDeYupQShmm0OiiYRUQJpN00Ijt//2FobXCeJC9KAIQf/2KQllIy54iAVuv+I6OQQQYJ8HerHJKUAYzB214NozSXcHhxTXPUQxG547UgwZG+WOSk4uuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713083712; c=relaxed/simple;
	bh=ZPYqqtyateQAglR+k6OVKvCAe8YRzI/MA8ssd/t5pbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2K9mb5hCYFqF5URMLfLwB63fXoOE28XmWO5oss7zf7Km7VnY6i1WYPfYrqK+eiPzO7gVJ3taICRLDTo4/WqzDXxjTQRqhdZUdzXX8St857B/uyHWoxtn0CGlY2zVvLDlVzBz6hNxUkCZqoRxkylxPkWgPnOH7KA50+KCaSwU7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XYPKsv4n; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XYPKsv4n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713083709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FmgfpCrRtCqNbVMsFXJuOmvk/MLLt9gA4dRZP1RBeX4=;
	b=XYPKsv4nHsJyS3QUHXmumrhZXZRXuITOhEcFQsM+ndkOKREgXxt7P9E8OKYyFHquOIwQdS
	cREg5IMBoYHBapoQ/dio9L1mbAwKw/nS+txgLUzS60PYht+bBpWjlo7Pc95fj3ElAK6nCv
	YSdsVJ6SYqSnHRz2aQZGd+h3b7LoUEE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-Aczs1Q0eOIqSNTKqtUdu5w-1; Sun, 14 Apr 2024 04:35:08 -0400
X-MC-Unique: Aczs1Q0eOIqSNTKqtUdu5w-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-343f1064acaso1387935f8f.3
        for <kernel-janitors@vger.kernel.org>; Sun, 14 Apr 2024 01:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713083707; x=1713688507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmgfpCrRtCqNbVMsFXJuOmvk/MLLt9gA4dRZP1RBeX4=;
        b=BNP4kLPGnTARfemrN8l15tcrc231R29WZx/zQro+egPj577Q2IstztY4KrxeEEsRz6
         7CVrKQcfc98raYc76b6D/yRoV94AiQ+vwbq5ra0a5k6tbQsn6JSASERkNpo7Rx6ah2gW
         4N9jkL8yrM9Fh62yQu/heAt/URiD16D/GsameX6BirwO8vqMWpTEflbOLWXuKAW2+AW/
         tXWVNBw+B2rPdW6vDQtFhnVI9p/zaaZiVIqEs2x6jegXRprLgdk69FqDrDf8V0TPZZVy
         jKF7ssqHGG26lM9I0LfU7bOyvEcIPF+qk3aQKwpIicH/zPUI1zFA7MIHF7z36mcBrlAM
         aJ0A==
X-Forwarded-Encrypted: i=1; AJvYcCUBO3d9EdJgdueYBQ/mBMP1FzN5euaQoylclp4WMwKkVciyktL8v0/B8osiIJNl/zGOhndHs8kE9RXolW8+4+avJ1Vcyt4rPyEy/LAAzp3a
X-Gm-Message-State: AOJu0Yxf79w4lTqfxTbukT1EdoxGEa+zSdePJXvCJGuIUGxuK9fd1XDa
	fzg+x+UGdosKPFuziXYTprV73DB4qzdDeZ0ua1RSycdkjDwAymg8qxeNT13HrJsdZItbUSDaxDn
	u1K6ueA2u/Zvjbr4wyGf0ibc1HnAe8RRgLb/jKvCorgfmNLSaPkdE1cJL/GPVpIVvvQ==
X-Received: by 2002:a05:6000:232:b0:345:663f:f0a1 with SMTP id l18-20020a056000023200b00345663ff0a1mr5215820wrz.55.1713083706779;
        Sun, 14 Apr 2024 01:35:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEud3PzT7Nr9AygoJHk6xDRgJwZJGsPs20hazfYSLls12vM50Lh6SjxqeEIXzgG7uN3p2DHqQ==
X-Received: by 2002:a05:6000:232:b0:345:663f:f0a1 with SMTP id l18-20020a056000023200b00345663ff0a1mr5215809wrz.55.1713083706195;
        Sun, 14 Apr 2024 01:35:06 -0700 (PDT)
Received: from redhat.com ([31.187.78.68])
        by smtp.gmail.com with ESMTPSA id k9-20020adfe3c9000000b00344a8f9cf18sm8576894wrm.7.2024.04.14.01.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 01:35:05 -0700 (PDT)
Date: Sun, 14 Apr 2024 04:35:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH] vhost-vdpa: Remove usage of the deprecated
 ida_simple_xx() API
Message-ID: <20240414043334-mutt-send-email-mst@kernel.org>
References: <bd27d4066f7749997a75cf4111fbf51e11d5898d.1705350942.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd27d4066f7749997a75cf4111fbf51e11d5898d.1705350942.git.christophe.jaillet@wanadoo.fr>

On Mon, Jan 15, 2024 at 09:35:50PM +0100, Christophe JAILLET wrote:
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
> 
> Note that the upper limit of ida_simple_get() is exclusive, buInputt the one of

What's buInputt? But?

> ida_alloc_max() is inclusive. So a -1 has been added when needed.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>


Jason, wanna ack?

> ---
>  drivers/vhost/vdpa.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index bc4a51e4638b..849b9d2dd51f 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -1534,7 +1534,7 @@ static void vhost_vdpa_release_dev(struct device *device)
>  	struct vhost_vdpa *v =
>  	       container_of(device, struct vhost_vdpa, dev);
>  
> -	ida_simple_remove(&vhost_vdpa_ida, v->minor);
> +	ida_free(&vhost_vdpa_ida, v->minor);
>  	kfree(v->vqs);
>  	kfree(v);
>  }
> @@ -1557,8 +1557,8 @@ static int vhost_vdpa_probe(struct vdpa_device *vdpa)
>  	if (!v)
>  		return -ENOMEM;
>  
> -	minor = ida_simple_get(&vhost_vdpa_ida, 0,
> -			       VHOST_VDPA_DEV_MAX, GFP_KERNEL);
> +	minor = ida_alloc_max(&vhost_vdpa_ida, VHOST_VDPA_DEV_MAX - 1,
> +			      GFP_KERNEL);
>  	if (minor < 0) {
>  		kfree(v);
>  		return minor;
> -- 
> 2.43.0

