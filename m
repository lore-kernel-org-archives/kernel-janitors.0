Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4057D149DF0;
	Mon, 20 Jan 2025 09:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737365171; cv=none; b=VRaT/15Wl5w/n2GxXW/Ljb59Kj2tQ8g+Hj5+cqo3yKnJXjxHRO7pPlJn8/37eH2Gh0xAcPRktzQI2sRShIfwSbBCdHoRHmX21seQVcsmzwvqt6nHZHYUk0xidrZGwmZ9TH6fbB/Q5AQCXgBmRz6/whLfS589tOsDY+6c9umui4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737365171; c=relaxed/simple;
	bh=XLHW9Xlxwngn1I2lo/Z1hj+kDSsOP1FLCFa0VV5xfCE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KVj0JnyZ7g/w1kMrgTbo9WcM+XXWluuOaGaZF4T7a5OgCV3siJu4ECiFX+nN3ukhIBTjWfxACGQOIF+IMAKvoL2M5dxvcPo39KQPVvHBkyuznF483wl+7XF6E8y2IfJPYM/eTupSS5hIyxtvwWYt1VtRUHU/eK7Cxr5iTnL3eaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=a5BW+f2P; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="a5BW+f2P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737365167;
	bh=XLHW9Xlxwngn1I2lo/Z1hj+kDSsOP1FLCFa0VV5xfCE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=a5BW+f2PvqMj5ersOmtnCf65IJhY46344qAOOP1z5Igiqft3KSvTgMQ3ymw+2QKfJ
	 kp/58w87j0UHxb+da2CSIaWwg93z+i3NS6ErA8T8dTjOBiXGl+YqT/sXkGvDnCCYHr
	 XAD7oxPufYgQ1LENk8uKFqGuKDmB/pAMDDx4iUe2UrDnsyPZV3SIYxCAmJQ9bHCzcU
	 0b5n2nwO1OMZJdavUStvB6qdW4VzsKDXtt14S2YjGARN3qQ1nPlyLNDKYknlDnZ1zs
	 B7+iN6E8EC5QQZDurKnBiPjalwjs3Yd7Pl+SmnPa/0HM8Lz/FRyzAOMWZSa1nkzyMJ
	 LV48ZhQ+xQw/Q==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B95F017E023F;
	Mon, 20 Jan 2025 10:26:06 +0100 (CET)
Date: Mon, 20 Jan 2025 10:26:00 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Su Hui <suhui@nfschina.com>
Cc: steven.price@arm.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, mary.guillemard@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: avoid garbage value in
 panthor_ioctl_dev_query()
Message-ID: <20250120102600.39b1be80@collabora.com>
In-Reply-To: <20250119025828.1168419-1-suhui@nfschina.com>
References: <20250119025828.1168419-1-suhui@nfschina.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 19 Jan 2025 10:58:29 +0800
Su Hui <suhui@nfschina.com> wrote:

> 'priorities_info' is uninitialized, and the uninitialized value is copied
> to user object when calling PANTHOR_UOBJ_SET(). Using memset to initialize
> 'priorities_info' to avoid this garbage value problem.
> 
> Fixes: f70000ef2352 ("drm/panthor: Add DEV_QUERY_GROUP_PRIORITIES_INFO dev query")
> Signed-off-by: Su Hui <suhui@nfschina.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 0b3fbee3d37a..44f5c72d46c3 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -802,6 +802,7 @@ static void panthor_query_group_priorities_info(struct drm_file *file,
>  {
>  	int prio;
>  
> +	memset(arg, 0, sizeof(*arg));
>  	for (prio = PANTHOR_GROUP_PRIORITY_REALTIME; prio >= 0; prio--) {
>  		if (!group_priority_permit(file, prio))
>  			arg->allowed_mask |= BIT(prio);

