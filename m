Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800E9EEB3
	for <kernel-janitors@vger.kernel.org>; Sun, 12 May 2024 08:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715502049; cv=none; b=OmTPvr87eOGxdW9Gv9synYs0VpNsPNjMJqBH5EaTDrXFhCL8VXwYk6meKPnmK894aE1HSjqrueFLzIdDemQhClOvLmiMxlGm7MUhs+HRycYaHVjHGywq7MY6HCYQgFQ1U1fVJGq7FrQpDTuVTO9s3hXyrExbR7yNIDhT01KWDCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715502049; c=relaxed/simple;
	bh=57aIvZSlXvHd2XNr6XUvBTj1SaQbsmoHThuid5rkxjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QprKl056+EZ74yyJaKjsE9BVIDq+Jufby/rzP2nX5EfwOH4yRao5Mygeu8e18WqWtmn/873bmFVki1Sr97HCX2cbtJBSSJjP7ayrAX+3eioC9aP7d2z2rDlJhNsWmq6ZHeEE9ypBDqRDXBZosagIDvWHQKCrq9AaTMQfR1gdrnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EP4NhPXr; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EP4NhPXr"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a59ce1e8609so766657266b.0
        for <kernel-janitors@vger.kernel.org>; Sun, 12 May 2024 01:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715502046; x=1716106846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aA2OPIGe9/26kCTNuDnbmS99Q0tmMHaLiwj2IVXEJuE=;
        b=EP4NhPXrgCh0Y+nCrC/A+xOYfqnHp3W77DPdncZCfvE/5ZlUzliAKU4SgrbH6uaU/f
         JvOclsTe9KLMxcpaV2B7wEum5yskQ3samvYxcydNV6OhJi2gRZUtnERhovVBk3QHPPdI
         fBdeGsrH93lAMjqtcP03S331ukgQ9M1AEWqrQBEBoPW8QXtDWrLoAeunquR+9X1MDkdI
         Vteh+s9fD+SDe5Y91NzIe78od3RSswcb8k9AZLM6H4xPg8W9fT1pds6U0AYgipQFpYgj
         2gq4xzsWEV3oWP4wP3ijrtxi095VJxjviTQbP9YWEBx0NMAqVQ7p1C+FhzcnyCYRBDx1
         zNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715502046; x=1716106846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aA2OPIGe9/26kCTNuDnbmS99Q0tmMHaLiwj2IVXEJuE=;
        b=O7NBNYp1jPXcsONz61e5iSVtHlXHa0FDmQPYtmYwdZnxBDltBo9ulh6PqRNv0slLR5
         KmUo7Ow54g1w3iShcfYcO6eGqnyY0ZBLta0T4sAV1m4xyUS6ce3dmSL4Kb8CcrjJEIOx
         Alzg2j6ht9bu5LRCsM6S7DzNuYvko9OzEO7iUR1jiqGDr/AjcatCGhWATfhJl2Iekv7b
         KyqkNXNs73kaEptsGytdmGFXfaj7erJpjSy/7K3aLduDo1HZcXBxLPYVvAxmRwgi5vSD
         73STJF5XqgVliVi5DFUEtRTDxMUbUYUC5D1ejSZD7O3OOtGveQw/By5/hjMJE8C2y2kd
         kGWg==
X-Forwarded-Encrypted: i=1; AJvYcCV4J7XR+aLV2Ccr5USyYQCwuNvfVeOfQTUFDuD8zu3flsnhnSVcSYIMKKsm3nTvmrakOsUYhYrzRA8kQy0mGRSTHYrjSHsy5P6F013+OB5s
X-Gm-Message-State: AOJu0YxqvGFnWFF6zxUc420/aqoFzM4hH9xWtxXs3D6RfKVuSeU4dNmn
	8Hki8Eqi41rMKTnPHuCaaWEw4wP8kJtzGStm+gJey0mmA9VSBM0sGw4417LHvaA=
X-Google-Smtp-Source: AGHT+IH8IAAcuq0uwpTf6fMx0D8wB462+TGmZE1W/D5t26zWbQkpZSc39eY03aIz5zXbSAbXfLd1/g==
X-Received: by 2002:a17:906:57d4:b0:a59:ba34:f047 with SMTP id a640c23a62f3a-a5a2d1de87dmr521612466b.22.1715502045535;
        Sun, 12 May 2024 01:20:45 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b01399sm438058766b.172.2024.05.12.01.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 01:20:45 -0700 (PDT)
Date: Sun, 12 May 2024 11:20:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Simon Horman <horms@kernel.org>
Cc: Shay Drory <shayd@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Moshe Shemesh <moshe@nvidia.com>, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net/mlx5: Fix error handling in mlx5_init_one_light()
Message-ID: <38283c14-c8b2-4274-9e34-9d5951816a59@suswa.mountain>
References: <a2bb6a55-5415-4c15-bee9-9e63f4b6a339@moroto.mountain>
 <20240511142304.GH2347895@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240511142304.GH2347895@kernel.org>

On Sat, May 11, 2024 at 03:23:04PM +0100, Simon Horman wrote:
> On Thu, May 09, 2024 at 02:00:18PM +0300, Dan Carpenter wrote:
> > If mlx5_query_hca_caps_light() fails then calling devl_unregister() or
> > devl_unlock() is a bug.  It's not registered and it's not locked.  That
> > will trigger a stack trace in this case because devl_unregister() checks
> > both those things at the start of the function.
> > 
> > If mlx5_devlink_params_register() fails then this code will call
> > devl_unregister() and devl_unlock() twice which will again lead to a
> > stack trace or possibly something worse as well.
> > 
> > Fixes: bf729988303a ("net/mlx5: Restore mistakenly dropped parts in register devlink flow")
> > Fixes: c6e77aa9dd82 ("net/mlx5: Register devlink first under devlink lock")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Hi Dan,
> 
> I believe that after you posted this patch, a different fix for this was
> added to net as:
> 
> 3c453e8cc672 ("net/mlx5: Fix peer devlink set for SF representor devlink port")
> 

Ah good.  Plus that patch has been tested.

regards,
dan carpenter

