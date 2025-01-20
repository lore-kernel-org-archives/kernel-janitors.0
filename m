Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23AC11494AB;
	Mon, 20 Jan 2025 10:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737367288; cv=none; b=P6+jbiSVGnwLW6dBWI1R5RgN17Jh8iv7o7PGzP1ZBgFyEWKdrX3vF54gtCINW1OCFX64oYr+nH+BnzEB0BGLZXVSKOkkZy4Su2HiwKUTOXRJ+msgA2YFQPykjZTDO8GrnXB0OZghk/0DZLPbGnAHXliIyRU42ydt9IK8LqvO6oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737367288; c=relaxed/simple;
	bh=keARo32BcZntTOmSVguM832t/TVip/4qPnK44rQYJVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZSG1FCYwDyHq/B2FpvrP7pnglXHpki90jlYNU6WqxnN6D6O4ujXukSU9HuNELSkIxEwK2rMj15t+RsKLx/XOjnv8e682jqDNlqwyuDLYDiIfS/mDDI4OCPQJHgx6Vv3Td7ceJ3ChK+RFRfnXalKjXSTlwjdjmA4VKi4E+633Z+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC5641063;
	Mon, 20 Jan 2025 02:01:53 -0800 (PST)
Received: from [10.57.5.233] (unknown [10.57.5.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A3E13F66E;
	Mon, 20 Jan 2025 02:01:22 -0800 (PST)
Message-ID: <c72f4ab1-dcb1-48fb-aaf3-f9af3e74979a@arm.com>
Date: Mon, 20 Jan 2025 10:01:19 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: avoid garbage value in
 panthor_ioctl_dev_query()
To: Su Hui <suhui@nfschina.com>, boris.brezillon@collabora.com,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: mary.guillemard@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20250119025828.1168419-1-suhui@nfschina.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250119025828.1168419-1-suhui@nfschina.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/01/2025 02:58, Su Hui wrote:
> 'priorities_info' is uninitialized, and the uninitialized value is copied
> to user object when calling PANTHOR_UOBJ_SET(). Using memset to initialize
> 'priorities_info' to avoid this garbage value problem.
> 
> Fixes: f70000ef2352 ("drm/panthor: Add DEV_QUERY_GROUP_PRIORITIES_INFO dev query")
> Signed-off-by: Su Hui <suhui@nfschina.com>

Reviewed-by: Steven Price <steven.price@arm.com>

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

