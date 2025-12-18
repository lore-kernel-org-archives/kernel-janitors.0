Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C643358DE;
	Thu, 18 Dec 2025 10:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766052620; cv=none; b=ag//DKCSZc9K2RRlmh+mUNSbIPnn1pjR26fNGjB45TcxwL25M6f9A0wWO2M4HlBD7TEtc1/Y11H0v0g0h8IKmx21Rq96yIm9BEuT0ndj2xF017iO3Ka4rfKMuYVGKsT9iNOeUuB+gk4ZkFQYYnavZv1tr8GCEZE3aLV8S4Zaa+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766052620; c=relaxed/simple;
	bh=1vG3sm3zFKxD/Umg4+azYciFpdDn1Ub0LnJx0R8PAY8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aAWb/L7plYp1vKQBoFX08gBP0xetLv5JsvFINeEBnM9dIpWnivDRWLv2dlpI4E5GrpMqlVMFqeRlHXOkxxZrB20IZ114wl1dT48VnufUqXM6Jx8o7bsMuiP5eKm9aWgBDrnc2YhJM3wyzPbbHWgek7F6jd94HNjbU/RkMKMJR0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ly3VmBL5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ly3VmBL5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766052615;
	bh=1vG3sm3zFKxD/Umg4+azYciFpdDn1Ub0LnJx0R8PAY8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ly3VmBL5kIw6wVyKqvlxVYbxyc3nTwI5wA+CmRewlnpFh38pJxLqCv7Fo2m/pX3Jp
	 yFqO/PbqqT7elaR6IUzJNyH40pY4S3ims+AaCTpI2hqSVXAZLyEcj6mZ8tNUzTujjn
	 hUWCmeo7T/RdsNJT8ciMGHsFEHbfBVLtfp0l54QbvE7XsYhGFMhW8MAlIN4u0RlItS
	 HY28u9h4E11diWoOTtMCrz1pIKRFu9QsYk6ef+3iKSPqf/EvwClKaWs2ZCP3+boP1I
	 /qrwcU1lFhjXWE9xkT/SYcC2DemmwLIaq/OEY+xLG7Jci9lW/IfkMj4pMq2/Wkx5pO
	 77fnuwe1HpL2w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3A1D217E1146;
	Thu, 18 Dec 2025 11:10:15 +0100 (CET)
Date: Thu, 18 Dec 2025 11:10:10 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/panthor: unlock on error in
 panthor_ioctl_bo_create()
Message-ID: <20251218111010.7de4c49f@fedora>
In-Reply-To: <aUOxxvXXtHHfFCcg@stanley.mountain>
References: <aUOxxvXXtHHfFCcg@stanley.mountain>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 18 Dec 2025 10:48:22 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> Call drm_dev_exit() before returning -EINVAL.
> 
> Fixes: cd2c9c3015e6 ("drm/panthor: Add flag to map GEM object Write-Back Cacheable")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Queued to drm-misc-next.

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 98d4e8d867ed..165dddfde6ca 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -923,8 +923,10 @@ static int panthor_ioctl_bo_create(struct drm_device *ddev, void *data,
>  	}
>  
>  	if ((args->flags & DRM_PANTHOR_BO_NO_MMAP) &&
> -	    (args->flags & DRM_PANTHOR_BO_WB_MMAP))
> -		return -EINVAL;
> +	    (args->flags & DRM_PANTHOR_BO_WB_MMAP)) {
> +		ret = -EINVAL;
> +		goto out_dev_exit;
> +	}
>  
>  	if (args->exclusive_vm_id) {
>  		vm = panthor_vm_pool_get_vm(pfile->vms, args->exclusive_vm_id);

