Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A143D279918
	for <kernel-janitors@vger.kernel.org>; Fri, 24 Oct 2025 11:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761305352; cv=none; b=Ebar3pysCoiOJ5eZmBP0EwAqQSa2v6lkBHTVe7WTwgLencN0LjB9WBtrXru7GLJOB55jAIRC9PQVayB6YCp6pj2LTSiCWSFLz3Ngc+rA1HJCMXn4XNACCwKAS37BoBqQGjwBDKRpaqafYDcKagVxNL440IKV/givQlFoKiKuX4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761305352; c=relaxed/simple;
	bh=TrBaGBhRlDGf/oFozNzPjl2vxSq6m/EPCkCnukf9mcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tw4zSzKKxPU006eRTrhOlPO9BvbJXxXtHi58WkGf2BMf+cQ48ctmR/q3tGhDWWVu6xHkMwR2TTDMovYGoyxxQAPyGNGTDzWhJyPWWtJJQO9D+yLUV1G8688stxZSLTIokbHRG50+XtC2Q30EKilZtDKaGcMd3AFDAWv+ORtPiX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niayEyWW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niayEyWW"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso1961866f8f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 24 Oct 2025 04:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761305349; x=1761910149; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9xMJQfYM2b5QJELS93NnB9DkzeOAVYdK40Nq6yQs7Sw=;
        b=niayEyWWRvynnqfLko/3i3XXCOQFBVNJprmDbvDo3Ck/+FVdD5ZH9cxVnGJ19wOpwE
         rfl6gkcPeg1dCqd8hs48okpZKCuhVPfDgNqsHqquJofy+d+sJ1lpzPyqC/cwrsUV2Hot
         E4P6pGmeo8oRfW7Ahmx5g2VjFFrzi+pS9u6Bq5Xr71Xqrv2e7nKKT422wRgTPbmhD9HB
         nATU6rofGeJAvQi/JNHnZh7gJ5BdR0qIkf8FpQUqLP2+zEheDQspGA+uxT4KxggQRgjp
         oXnTZ+oA+GTUVSTEBUhu7JgXTWzzaC9B6QDjW4aVEy2VjF3+I3Q0KLCRjoV2rUMe5yVg
         Na2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761305349; x=1761910149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9xMJQfYM2b5QJELS93NnB9DkzeOAVYdK40Nq6yQs7Sw=;
        b=ZFSj4R9BCz8FGl/LuKFa55++aKHiZe+w6r/rnNgL1M2TFsaTHWbmErR8Vb+F4WiADQ
         3xWKwWGDfAOn/qtCWRhGaSaQwF062XzFPpM32pfDx5tBaMIaa1H6L+ef5038XZ4DH53G
         ZZjeMm8eBwLqakizbAMdlZPcw5NzfdqV/XoO/Wlq1Im7SriX7qbvZSkpIwBcZaNVpOMW
         U8pKoarNYThg1RHGThobr6JP7X5+vQd3D3dl2z+r/PCQW6bBeXR33Q/ZgHY9BPe2SWOI
         hlgLQAFY7Ngufld/Yn7xXvnNam9mAbpYoAoaQiWeQiLot5lyRAtH6+ITKEFb85V7C+Ht
         lkaA==
X-Forwarded-Encrypted: i=1; AJvYcCWk+2uHGVAaWWcF6XNNnV+qcKD0tzAuD2pLJRsSOYzn7IRJpRmFbYjUmG7aJ3RZmCt7MRaY0yW0cxPeGlhJeS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsQKo5a+gweHE3md0PMbA/lVpjk26LkIPKlnPWfw9QiMsqmrMp
	QH7ze8CXD4mpJ4pxgp3iuVL2J5W8A8tAjDwJ4/tFh8JpGYVLYqpVUtwf
X-Gm-Gg: ASbGncukah784nr9Ll2cNvOo0Tn+VBI22gCNDMVGwDgDmV7P16dgN7dxZUuIQG+O8lo
	Ngu3qLnmPPOq9LcDL+GKcwSh8RlWpBh+LaYMQmJUh0rrpGdg0X0wxvTN/tRWS/uxgdDUzqvyUPx
	ta6RuJhdX37Esbj2pMe3ycFnRtuRCUmTncqK1MeF9wjnILXmszZVCSTMAEacmUgVl9NrQnw/fuX
	wJBd47dkuVkFzOPbBjLSlPCDfyuFgOE3/TkmkFteCzmIKgAgmJ6s1JzqWRyRLGic/9QCKo2ruR6
	GkGersyspdI7VIQoEgXn2YOYyktCAp6QZSgkDtJSMShhzVlJtMb63cnPZQd84AdEwK9+yKCE5tS
	W0MQhrvkXDYTgYyp/AVjDJuRTemeMZKsGl8gh3krKBRL+j2CgmuBNPIt4voiU+4sH2FGLV+812J
	ZMlpBDKbrBnw==
X-Google-Smtp-Source: AGHT+IEWS4OWz+EwzEUPz27QJ0JvgqtX6/43yqFialI1Uz7fDpRCKIWzIgPESbtf0+fCYUefY/LGGQ==
X-Received: by 2002:a5d:5d87:0:b0:3ec:8c8:7b79 with SMTP id ffacd0b85a97d-4299075d0d3mr1818638f8f.61.1761305348844;
        Fri, 24 Oct 2025 04:29:08 -0700 (PDT)
Received: from fedora ([37.29.213.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4369b33sm144041215e9.14.2025.10.24.04.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 04:29:08 -0700 (PDT)
Date: Fri, 24 Oct 2025 13:29:05 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Harry Wentland <harry.wentland@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/vkms: Fix use after frees on error paths
Message-ID: <aPtjAcNP3fuRNBs5@fedora>
References: <aPtfy2jCI_kb3Df7@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPtfy2jCI_kb3Df7@stanley.mountain>

On Fri, Oct 24, 2025 at 02:15:23PM +0300, Dan Carpenter wrote:
> These error paths free a pointer and then dereference it on the next line
> to get the error code.  Save the error code first and then free the
> memory.
> 
> Fixes: 3e4d5b30d2b2 ("drm/vkms: Allow to configure multiple CRTCs via configfs")
> Fixes: 2f1734ba271b ("drm/vkms: Allow to configure multiple planes via configfs")
> Fixes: 67d8cf92e13e ("drm/vkms: Allow to configure multiple encoders via configfs")
> Fixes: 272acbca96a3 ("drm/vkms: Allow to configure multiple connectors via configfs")
> Fixes: 13fc9b9745cc ("drm/vkms: Add and remove VKMS instances via configfs")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for fixing this:
Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/vkms/vkms_configfs.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 07ab794e1052..506666e21c91 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -204,6 +204,7 @@ static struct config_group *make_crtc_group(struct config_group *group,
>  {
>  	struct vkms_configfs_device *dev;
>  	struct vkms_configfs_crtc *crtc;
> +	int ret;
>  
>  	dev = child_group_to_vkms_configfs_device(group);
>  
> @@ -219,8 +220,9 @@ static struct config_group *make_crtc_group(struct config_group *group,
>  
>  		crtc->config = vkms_config_create_crtc(dev->config);
>  		if (IS_ERR(crtc->config)) {
> +			ret = PTR_ERR(crtc->config);
>  			kfree(crtc);
> -			return ERR_CAST(crtc->config);
> +			return ERR_PTR(ret);
>  		}
>  
>  		config_group_init_type_name(&crtc->group, name, &crtc_item_type);
> @@ -358,6 +360,7 @@ static struct config_group *make_plane_group(struct config_group *group,
>  {
>  	struct vkms_configfs_device *dev;
>  	struct vkms_configfs_plane *plane;
> +	int ret;
>  
>  	dev = child_group_to_vkms_configfs_device(group);
>  
> @@ -373,8 +376,9 @@ static struct config_group *make_plane_group(struct config_group *group,
>  
>  		plane->config = vkms_config_create_plane(dev->config);
>  		if (IS_ERR(plane->config)) {
> +			ret = PTR_ERR(plane->config);
>  			kfree(plane);
> -			return ERR_CAST(plane->config);
> +			return ERR_PTR(ret);
>  		}
>  
>  		config_group_init_type_name(&plane->group, name, &plane_item_type);
> @@ -472,6 +476,7 @@ static struct config_group *make_encoder_group(struct config_group *group,
>  {
>  	struct vkms_configfs_device *dev;
>  	struct vkms_configfs_encoder *encoder;
> +	int ret;
>  
>  	dev = child_group_to_vkms_configfs_device(group);
>  
> @@ -487,8 +492,9 @@ static struct config_group *make_encoder_group(struct config_group *group,
>  
>  		encoder->config = vkms_config_create_encoder(dev->config);
>  		if (IS_ERR(encoder->config)) {
> +			ret = PTR_ERR(encoder->config);
>  			kfree(encoder);
> -			return ERR_CAST(encoder->config);
> +			return ERR_PTR(ret);
>  		}
>  
>  		config_group_init_type_name(&encoder->group, name,
> @@ -637,6 +643,7 @@ static struct config_group *make_connector_group(struct config_group *group,
>  {
>  	struct vkms_configfs_device *dev;
>  	struct vkms_configfs_connector *connector;
> +	int ret;
>  
>  	dev = child_group_to_vkms_configfs_device(group);
>  
> @@ -652,8 +659,9 @@ static struct config_group *make_connector_group(struct config_group *group,
>  
>  		connector->config = vkms_config_create_connector(dev->config);
>  		if (IS_ERR(connector->config)) {
> +			ret = PTR_ERR(connector->config);
>  			kfree(connector);
> -			return ERR_CAST(connector->config);
> +			return ERR_PTR(ret);
>  		}
>  
>  		config_group_init_type_name(&connector->group, name,
> @@ -756,6 +764,7 @@ static struct config_group *make_device_group(struct config_group *group,
>  					      const char *name)
>  {
>  	struct vkms_configfs_device *dev;
> +	int ret;
>  
>  	if (strcmp(name, DEFAULT_DEVICE_NAME) == 0)
>  		return ERR_PTR(-EINVAL);
> @@ -766,8 +775,9 @@ static struct config_group *make_device_group(struct config_group *group,
>  
>  	dev->config = vkms_config_create(name);
>  	if (IS_ERR(dev->config)) {
> +		ret = PTR_ERR(dev->config);
>  		kfree(dev);
> -		return ERR_CAST(dev->config);
> +		return ERR_PTR(ret);
>  	}
>  
>  	config_group_init_type_name(&dev->group, name, &device_item_type);
> -- 
> 2.51.0
> 
