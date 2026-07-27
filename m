Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E496C3EB0F0
	for <kernel-janitors@vger.kernel.org>; Mon, 27 Jul 2026 11:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151921; cv=none; b=Kgm0Zdb9ucpGvIcOcbjWC/nfGkFoRaQaa84l596p8sDD183r2wMuburXuq/m0jzdb0Sr9CXG7WgBOGfg811p+QCHAyk4vAVaIyrZgpwPycZ/CDwNRqOQVFtaF3J6CB7MVxCLzqSi/xtoHrD7rVeqzMEYhIZaE5pAbe7vwtTzthg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151921; c=relaxed/simple;
	bh=PPHCGLHp8F6a/S3R/g30TrZ7BdMamp29pClwl3bGMQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwIjXWiXglsRaHq7wMY0ealCOi4H00lZYwk7ALW27gePiSbSH/sbSn3UqBp2/yga4/YaWUasfqmuToCKEPCR74vDWR8yS7Lor9Al0z5cB2U0IZSK3mDY3eqXP6eFwSs/SDyY3y02Z9lhVuNLARe65Nfs4GjgXbpRsecNyF1Rq98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q2ojDNAQ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q2ojDNAQ"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso2397529a91.1
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Jul 2026 04:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785151919; x=1785756719; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QyC9mdpjeVMS9mEWtOssGaeZCvP0zDJ8dCOHi6clafA=;
        b=q2ojDNAQEYvAESznIPcpkVkzsjF+CR595Cu9kaWFHNCp3MmxaP7/LE9kYP989HhOGI
         Rgt8KiKsnCQgQ4uuz/Rv+rMGdWO64GKETKT2/RvjSQgqaBmDxjzboeIPbajrJfK8VLG2
         soraIOYXXl9m+IGqqz7ciLcpHIroR1jOunUabk3kXt5cLpU/a+x89NFMbEmgRxrX24qe
         aXW4vInSg3rqQBrobv1Xd1U9sqXNqhO4uLn90r1QU9KkUKjLb3lSsBgc/xEjDQ/8epIy
         kdwYwLXYJ4mxg5ounr8MnWs9W6qZFFtmXq9w0T5TwdcY9i5FhA4cg9ZsWJ0Z6h58m2Sf
         iD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785151919; x=1785756719;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QyC9mdpjeVMS9mEWtOssGaeZCvP0zDJ8dCOHi6clafA=;
        b=oGJ+b7yHxmhwo9e+BMdx4U19iLLupwWLb3/wi0NzfY0QWv+lUebwUWxFbxABEJXPqV
         J6psYUBrFjpzl57RaF7tf8V9rY3KBpAT1bmDSGz4nqCP0Cdd9McJwsNPhLsf0P/EO5oH
         siiXBTsqlhz0R8QwRoc1m2nWHSSZAi+nViDLuk+rRqXPHYtGN//JxHoits+CqHm9LiDA
         /KHMFSJgnVALkZHa1JTAgpz2g0MwezdvUCIn3vvpV/HKxq7nJibvFCYwqs/Nli9ctVL/
         wIoxR4Ybn5AgCP8sShPQR3l9fB+vNRsKOSa0XPYhzXdWN+3z2V+s3FdnnqxMoLgDzQXE
         TJZg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+qaEA8ngfgI3/Rj31ME0sWpjD1ttX/fAL92gsNG6x83gwHvY1GXZCvvhZf1LN1N7wjCSfWstB6C0dlJtkVco=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYkteRi6e5ZTVXkV1LOMru9vOn+UhwqV2A+c8VSLEqxd4GqElR
	4w5J3vUlkaWk43YxIp63YEnG9eRyBRCFwbGoEAmmfZ+zhVlNo0agsbRD
X-Gm-Gg: AR+sD11keQlJHdqpDnu7dJ4z6mHvGkdSPUYM2r1MUiV3zhK89nidKeuK7vb9+7dVxpE
	nehOlmnEaTmSLgaSas9Zgsvq+me76P7N6hIqumhztgh12C/YfOsknQm8X1yQFpLDYTI5wohgyLa
	cw6iFrG9iy6Ij+6oJygSC8GNalaWeUyhFhkjvQJCTYKnJkoWAhL/+kHB0IdLDRsD/Hs608meHy6
	2XmWgLFaM3JvK+SL4y5I0t1u96QI1QqeBBX8lGKWo7/e1FWMmHBtuoC23EM++lWG/GeqF5VPW9j
	i8NqXeeLxy7xN1Zlgtq5ttZKSkYAGvW+m5byXFtyNO/gEn+ii9DZ8g1leWoZh005TCVk9iCFOYP
	DcrJ3HshAlfdCLPG39hkhcHDwPxvHpqeC60E3qdXQ10tM/QG68ub+pGCqUv0wK3+h8zlMVWgw
X-Received: by 2002:a17:90b:5710:b0:38e:b3fd:d584 with SMTP id 98e67ed59e1d1-38f2aa99deemr5981029a91.15.1785151919217;
        Mon, 27 Jul 2026 04:31:59 -0700 (PDT)
Received: from localhost ([172.216.252.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f04175c1asm4880106a91.12.2026.07.27.04.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:31:58 -0700 (PDT)
Date: Mon, 27 Jul 2026 14:31:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <chleroy@kernel.org>,
	Roy Pledge <Roy.Pledge@nxp.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 1/2] soc: fsl: dpio: Use scope-based resource
 management in dpaa2_io_store_create()
Message-ID: <amdBqQfIsAjxMsqX@stanley.mountain>
References: <690827f2-e746-4378-bb7c-9948cd69dc15@web.de>
 <d95d2f4c-f3cf-44eb-b61b-79ba7891674d@kernel.org>
 <d2e5df25-c8b7-4ee6-8ebf-1725542baabd@web.de>
 <6607bb4e-a747-4791-b93f-f82f26e4a334@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6607bb4e-a747-4791-b93f-f82f26e4a334@web.de>

On Mon, Jul 06, 2026 at 12:38:08PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 6 Jul 2026 10:34:43 +0200
> 
> Scope-based resource management became supported for some
> programming interfaces by contributions of Peter Zijlstra on 2023-05-26.
> See also the commit 54da6a0924311c7cf5015533991e44fb8eb12773 ("locking:
> Introduce __cleanup() based infrastructure").
> 
> * Thus use the attribute “__free(kfree)”.
> 
> * Reduce the scope for the local variable “ret”.
> 
> * Omit two kfree() calls accordingly.
> 
> * Omit the local variable “size” (for another memory allocation).

Why?  This seems unrelated...

> 
> * Use the macro call “return_ptr(ret)” at the end.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/soc/fsl/dpio/dpio-service.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/soc/fsl/dpio/dpio-service.c b/drivers/soc/fsl/dpio/dpio-service.c
> index 317ca50b0c2b..b252c3c7fa65 100644
> --- a/drivers/soc/fsl/dpio/dpio-service.c
> +++ b/drivers/soc/fsl/dpio/dpio-service.c
> @@ -652,23 +652,17 @@ EXPORT_SYMBOL_GPL(dpaa2_io_service_acquire);

Missing #include <linux/cleanup.h>

>  struct dpaa2_io_store *dpaa2_io_store_create(unsigned int max_frames,
>  					     struct device *dev)
>  {
> -	struct dpaa2_io_store *ret;
> -	size_t size;
> -
>  	if (!max_frames || (max_frames > 32))
>  		return NULL;
>  
> -	ret = kmalloc_obj(*ret);
> +	struct dpaa2_io_store *ret __free(kfree) = kmalloc_obj(*ret);
>  	if (!ret)
>  		return NULL;
>  
>  	ret->max = max_frames;
> -	size = max_frames * sizeof(struct dpaa2_dq) + 64;
> -	ret->alloced_addr = kzalloc(size, GFP_KERNEL);
> -	if (!ret->alloced_addr) {
> -		kfree(ret);
> +	ret->alloced_addr = kzalloc(max_frames * sizeof(struct dpaa2_dq) + 64, GFP_KERNEL);
> +	if (!ret->alloced_addr)
>  		return NULL;

Why convert the ret allocation but not the ret->alloced_addr allocation?

regards,
dan carpenter

> -	}
>  
>  	ret->vaddr = PTR_ALIGN(ret->alloced_addr, 64);
>  	ret->paddr = dma_map_single(dev, ret->vaddr,
> @@ -676,14 +670,13 @@ struct dpaa2_io_store *dpaa2_io_store_create(unsigned int max_frames,
>  				    DMA_FROM_DEVICE);
>  	if (dma_mapping_error(dev, ret->paddr)) {
>  		kfree(ret->alloced_addr);
> -		kfree(ret);
>  		return NULL;
>  	}
>  
>  	ret->idx = 0;
>  	ret->dev = dev;
>  
> -	return ret;
> +	return_ptr(ret);
>  }
>  EXPORT_SYMBOL_GPL(dpaa2_io_store_create);
>  
> -- 
> 2.54.0
> 
