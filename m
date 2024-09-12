Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B88A1C0DEB
	for <kernel-janitors@vger.kernel.org>; Thu, 12 Sep 2024 20:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726174140; cv=none; b=JAzp+tkwtfYB2IH8q/JgjYP4QrtP6LN77fw5BJJ6uHlJcFm/vlsHjmiPX5TDd9CfVmT4yqmQv+d17HTWkfygb94DZXa9P1XXN+u9zaFthmbQmng8eWjbNVOtmJoqUtY8wGwo3jNhEualHzcdmhEAuwLM2msJyTtfsUPeDN7LFMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726174140; c=relaxed/simple;
	bh=yIP6S9iCrMiW5fAQkDzldFnKUGGLDTbn0cgLJErdI/E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KApunTq/1OnCLeRd3xq1l6V2pW2Gp7zANVtmkN8h1RQsEQE3wGlV8jFvEF374ewVVvNBgniK5zGVYgSPVpAXQt5DUudAxmuIc3JaOk7LL/4O9HE+Be1GAHgo93J2XG0PdgZncMmyHIBXjb0t+ikaFOqZr/RG6GrX9C9W+V6PY2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GqzAI6WT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GqzAI6WT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726174137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vDpmMjelNalx2jwG4t1xNYLZluds06xeruDv/xAuYKQ=;
	b=GqzAI6WT9OUelHs+BnwoUiyfBmTvEEOJcjxQqrjXcqIIXUlLJmeYGAnk0a2KB4AnezkyXQ
	1mEGm+ILmwM3lAWSobikCzpOIKHxA7jsZk1BuJc8TgRjRE16jzLChXgYjKwfx8S2exsRSP
	EXifLEN3g/AqAhH8tuFX/AZPs5c9knI=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-2JBgcoUFOk-9iCLijvWMsQ-1; Thu, 12 Sep 2024 16:48:56 -0400
X-MC-Unique: 2JBgcoUFOk-9iCLijvWMsQ-1
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-82aaa33c18aso24868539f.3
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Sep 2024 13:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726174136; x=1726778936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDpmMjelNalx2jwG4t1xNYLZluds06xeruDv/xAuYKQ=;
        b=UBO5a7aoPzRLkT/OClJ8eIHBnb5Ja5MlteqY0CyknrTqlgGZpoQDcVLqTmBc36SKl5
         8NlFTsWbjZwYj26kOL9pIZlDK49eS8XJqqGpWvb909Ce8fRdTED3Y5KaVEFdd9pdlHY1
         ulylCjU9o4BsiBXxsp4GEmLWK2Tw+JumGKbUCOBh6/bu3e2l5OpCp3vJoBb84Dyka9Dn
         W47hZepulQCnwK4T4DW4JKeTLrQUa0Jisbeh89fCFJRNukfXjYYQW39ld5ETFSRgiKew
         i/v3R1QwuN4YrVz3hJI4OzACMA1NaPGadZh8Ar6CUlOob9J2reVsfiQwKIANpHszmsEH
         KuXw==
X-Forwarded-Encrypted: i=1; AJvYcCVWswbmRVf+H9teCSiSiY81g7TkHX8xwZ7jh7cxYAzFv0JfxIfrF8Y8Lmrlu23AdLj40/5JoUnzB7DWq9fHJ2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwELo8JYgD9CxGwnJw4c3G8f2Zeu56Aj5OP75dgNJWyaEhE4vMN
	tosVK9Sk/QLIF47+ohmNQuf89AJmyqFCs1ZFfGCwXmr4E5d8imoHTCn/FeuOdBjpR77fJKBKWwC
	J280dnO+GuebTApfHw3zCHvdPq9uCI6Lc14qmnksXGlVnIfnt4PssF6+kGCoRQyqBGg==
X-Received: by 2002:a05:6e02:17c9:b0:3a0:4bd3:6cd with SMTP id e9e14a558f8ab-3a0847cde94mr11229485ab.0.1726174135789;
        Thu, 12 Sep 2024 13:48:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF27lLlFUrUcBat8oysYWhOtTVjDxFqpMhIx9lYi5bD/C/pP0LIVOh0yQJnIQl2kFEKYKcbRw==
X-Received: by 2002:a05:6e02:17c9:b0:3a0:4bd3:6cd with SMTP id e9e14a558f8ab-3a0847cde94mr11229455ab.0.1726174135458;
        Thu, 12 Sep 2024 13:48:55 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4d35f949133sm778323173.164.2024.09.12.13.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 13:48:55 -0700 (PDT)
Date: Thu, 12 Sep 2024 14:48:53 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, Yi
 Liu <yi.l.liu@intel.com>, Christian Brauner <brauner@kernel.org>, Kunwu
 Chan <chentao@kylinos.cn>, Ankit Agrawal <ankita@nvidia.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] vfio/pci: clean up a type in
 vfio_pci_ioctl_pci_hot_reset_groups()
Message-ID: <20240912144853.42ceb733.alex.williamson@redhat.com>
In-Reply-To: <262ada03-d848-4369-9c37-81edeeed2da2@stanley.mountain>
References: <262ada03-d848-4369-9c37-81edeeed2da2@stanley.mountain>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Sep 2024 11:49:10 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> The "array_count" value comes from the copy_from_user() in
> vfio_pci_ioctl_pci_hot_reset().  If the user passes a value larger than
> INT_MAX then we'll pass a negative value to kcalloc() which triggers an
> allocation failure and a stack trace.
> 
> It's better to make the type unsigned so that if (array_count > count)
> returns -EINVAL instead.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/vfio/pci/vfio_pci_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 077d4a2629c8..1ab58da9f38a 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -1324,7 +1324,7 @@ static int vfio_pci_ioctl_get_pci_hot_reset_info(
>  
>  static int
>  vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
> -				    int array_count, bool slot,
> +				    u32 array_count, bool slot,
>  				    struct vfio_pci_hot_reset __user *arg)
>  {
>  	int32_t *group_fds;

Applied to vfio next branch for v6.12.  Thanks!

Alex

