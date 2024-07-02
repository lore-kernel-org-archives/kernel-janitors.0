Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4BA200130
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Jul 2024 20:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719951259; cv=none; b=CAF0fS78TEO2Ot/jcuabtFx5i90ixLNjlOOTmb4myrFtp7UQ2jxX27rxlqTZfb/3wMq0Ct0CdquRLaIQvIrVj66HQJ9bzaYTPHgkSpvT9JFBfC5LZ9HqPTvwnc0FfwhQ4W+D3DrYqymSHIcNNCnPD8e91XkeN7txNFHz8deaHho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719951259; c=relaxed/simple;
	bh=6yQX24i0j5POCJvd/ZR1KFxvOAs2rK2wuTtDubWxa24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhjMiufkoS+wAp7+lqsz6NYdxWqQKJ54HKI8R4vIjTsG8DTTl0++nK+Pudm2uJOFXFMEOT3pA6gZXdkFuFkUboBw3gPRTzpFk0jrd5ANaIQuGpVIfn6xlZfF/2kg5CnLvLeqhzrTC96pN6l5gHT6KtCMFVPjju0h1eCzxGueDSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X5TGz9u1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X5TGz9u1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719951254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fBu7ePDVo++7D4IjJbMnU5rjjRnV5+agERHDVqnqF08=;
	b=X5TGz9u15b+jH5WSWOH9w/trU2cR71Hvq/LNs/PjEJNIqQe16OzGi/CR1WXLXFMofXOzwk
	/+3wPLCd9jYf0wXoIiA5kJjkpvWuIWbofIItHUrYQGUkEVaPwOusXaJ8e6Z5PVE4Xa80nP
	6yvuuMgv0gpGrHPWDfxMA9vF/21UsX0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-ebJKVG8JNpKCLHN96jFgXg-1; Tue, 02 Jul 2024 16:14:10 -0400
X-MC-Unique: ebJKVG8JNpKCLHN96jFgXg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42565672e0aso28952765e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Jul 2024 13:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719951249; x=1720556049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBu7ePDVo++7D4IjJbMnU5rjjRnV5+agERHDVqnqF08=;
        b=AEFyuok85WwuRP4jx6XHTGWFdhM9MXWWsDRQ8wVbftEyjdmKKHiyasR9z43JR8+FY+
         ud+Bv127IbhsaC3/iGfjGXXmQ9sm3RE/P5i9bomAGhO3BV+UNoQpSJXUv45PoMwDgKKt
         HB1x9s19Y4zPJSi7vRYhI6wtydFQLZpvb+2uQ6RDfjZ41DHZbJr+ZabLI5fmQspnR7iI
         fKWgtB7Jf5luMDrQV1SdMZZeTfIR8o1yn7tVNoqPl1TpOJvi4fUJ3sqVTxlv4laU3cHN
         rb2ky6IDImNaWM9bOk5XFb4auMeOzmjlg+9UBp37LCsX4oIYgneba4B6ZYdbJsn5cS8m
         pFYw==
X-Forwarded-Encrypted: i=1; AJvYcCXixdOW9LuLnzzPfqJyR1cg/wnA3Is/ybQKJDoW/85sSmuqfDtI9iRMXzBzgYmhI6dvQ3j2C622YN/kTuvBJUBUsAyh/RH32p5XZgq/sfiQ
X-Gm-Message-State: AOJu0YzKmiOUNqxg50VibuO2tUZOIgvEkTzUWQcxKrzeAvqvTlLMtPvd
	7GVvPcQrwvWU/gSUjE0XqeIpI7K/Tg6khtA4j8lwCg0zuZwPrz0D1VJOAUy3eeFuD6Nsm16YgTp
	Cr3ZM3Qi3I+OjfAXwJIiKER/cVIDzGn/7XTIyAgeeg4xpGSzk9TzRJMaL8RiujRyovA==
X-Received: by 2002:a05:600c:5113:b0:424:8836:310c with SMTP id 5b1f17b1804b1-4256d4d3063mr114936085e9.5.1719951249210;
        Tue, 02 Jul 2024 13:14:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3yYy+Pj4KvbuOhw9OhwaRAp+IJ09cqGiSTJv3EMe94RolCEIKpfHnntszHbV+PrhqoxF3tA==
X-Received: by 2002:a05:600c:5113:b0:424:8836:310c with SMTP id 5b1f17b1804b1-4256d4d3063mr114935935e9.5.1719951248617;
        Tue, 02 Jul 2024 13:14:08 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f5:eadd:8c31:db01:9d01:7604])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af376easm210890935e9.5.2024.07.02.13.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 13:14:08 -0700 (PDT)
Date: Tue, 2 Jul 2024 16:14:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] virtio: add missing MODULE_DESCRIPTION() macros
Message-ID: <20240702161350-mutt-send-email-mst@kernel.org>
References: <20240702-md-sh-drivers-virtio-v1-1-cf7325ab6ccc@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702-md-sh-drivers-virtio-v1-1-cf7325ab6ccc@quicinc.com>

On Tue, Jul 02, 2024 at 01:10:18PM -0700, Jeff Johnson wrote:
> With ARCH=sh, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/virtio/virtio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/virtio/virtio_ring.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

tagged, thanks!

> ---
>  drivers/virtio/virtio.c      | 1 +
>  drivers/virtio/virtio_ring.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> index b968b2aa5f4d..396d3cd49a1b 100644
> --- a/drivers/virtio/virtio.c
> +++ b/drivers/virtio/virtio.c
> @@ -609,4 +609,5 @@ static void __exit virtio_exit(void)
>  core_initcall(virtio_init);
>  module_exit(virtio_exit);
>  
> +MODULE_DESCRIPTION("Virtio core interface");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 2a972752ff1b..1cac7d5b3062 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -3244,4 +3244,5 @@ void virtqueue_dma_sync_single_range_for_device(struct virtqueue *_vq,
>  }
>  EXPORT_SYMBOL_GPL(virtqueue_dma_sync_single_range_for_device);
>  
> +MODULE_DESCRIPTION("Virtio ring implementation");
>  MODULE_LICENSE("GPL");
> 
> ---
> base-commit: 1dfe225e9af5bd3399a1dbc6a4df6a6041ff9c23
> change-id: 20240702-md-sh-drivers-virtio-704eb84769cb

