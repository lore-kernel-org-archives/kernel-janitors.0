Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87D43A26E
	for <kernel-janitors@vger.kernel.org>; Wed, 21 Feb 2024 07:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708499773; cv=none; b=sdYzflJMROCzUrm9v3QJIzMl/x9zBetHWvER6vHptZp1ApbPH40cAMYtUm+oBb5cDYn1sNx1ZLSvFi53uqz4zFMWmAAQxBkdWKOpGq88MniaeystGdqlunmeH0vXCudzb6svVbLDarZ/VwJ7uYLd917WC4+w7NaeM/M3d7fXVjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708499773; c=relaxed/simple;
	bh=wkLAEBQr8OqY63bSzLHVJZpa0DZYKA/19CYDFKRQsv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXDE/Kt47e79+iFbjprAYsA44y9osPSNAAvxLuYAaxJ30gok+bquo8qIzZyc85/chr615TytLsytXzJDAgTUHZKOIoGk3+1sgZrMwT6eQc0VVMgXZ35Jn/exhTaTHWbWQG5FCdkNvViYFii7gtjv1UvBHt2ZJCwxwXlpnwJXK/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qLjog0TK; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qLjog0TK"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1dbf1fe91fcso25628785ad.3
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Feb 2024 23:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708499771; x=1709104571; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YVkY57PGrXF7HDeyEq0gu14Rt9F9yCgxKA8JQPS+gCQ=;
        b=qLjog0TK4W2ByJEu4T3+C7BAXqLgytEJYZBPP2bs2erkuaehPPIarAEgP+EY5gOSoS
         icIfBf9OvA4G++8RCKnhX3Q/zCj0KRFjni27DrSyRtuJRaXrez7EjZKZy5qJRmrm5jAx
         o91qjLBzrx7/A/jnNbQRoUhlA+1a3YO8bpid7tNRZzU0uEo1PaeNyDNoVlB6H5oKeOyv
         Y+67FOB+yxCrgl0jkTNbxFDFwI00cHPk2894RencpluP0I1xyASJZ7tdxa38zpqHxZ93
         sHZNPvFm60ZC0h1JZRY2iIh1OUxpa2+kOUGtL3XnoVSpTeMxeNhtwYgFMFx3EYNhsFYC
         i16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708499771; x=1709104571;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YVkY57PGrXF7HDeyEq0gu14Rt9F9yCgxKA8JQPS+gCQ=;
        b=lAV3ADSq0sELtBJNRbpiobzN88/uyn+1nQ4g+eX4BC2Oab2wesWBUI5jCiW8rLgjAu
         /KUUJVoiDBF0ZzshZImdqh5nvwrdCzLrUOmqc35nx6PqwSRyLDxMR3jSdUs8r230Blmc
         xhCrcvOq8L+5C+H7InYO6blBhxj4a2FRxMn75GES/Q/IQqb1mUQ/IWVj6d2Nivi2lu81
         j46rlDwZaSpJZ08QH+kOLCCOMqXbHERvuEaC3pJyRYoZte3Ao4GPFiPL3EM1D7oADO4x
         zy4HotDgAmwl/UPrjWWDcpVuOjIrL0cDazqVk7je+hYVHLPaFmjR0p9CjoMiq6qr7cJS
         Pb1A==
X-Forwarded-Encrypted: i=1; AJvYcCVGQs0s9qnxlhe70/WlmYXQ07US1jj4aTAwxL3UXlAITsUpduiA1BSkPSnXpCh0M7YQoK72AUlHWG+5dP/Tdq3mOdWRG1oRntD6ZmbOTKtL
X-Gm-Message-State: AOJu0YzzSFEw6Qvde9ATJTkQhiFG6d31cwSajsG2qmp5+kMkBAb2Xrg/
	CL3FKFHFQO7V/+UoQe57SD3EoWt35PM/Bij41PTR4W4M7brJrYo07rnboYHFwQ==
X-Google-Smtp-Source: AGHT+IFJseXOB8SzQJOx52KJSNABZWO93XSLQ3J8TgYtz3c9BhFtZivo9ic5RjdmOMgrSHlSH6V6vQ==
X-Received: by 2002:a17:902:d4c3:b0:1dc:10a5:8be7 with SMTP id o3-20020a170902d4c300b001dc10a58be7mr6016047plg.50.1708499771002;
        Tue, 20 Feb 2024 23:16:11 -0800 (PST)
Received: from thinkpad ([117.207.28.224])
        by smtp.gmail.com with ESMTPSA id kn14-20020a170903078e00b001d9a91af8a4sm7379488plb.28.2024.02.20.23.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 23:16:10 -0800 (PST)
Date: Wed, 21 Feb 2024 12:46:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Alex Elder <elder@linaro.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Erick Archer <erick.archer@gmx.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: ep: check the correct variable in
 mhi_ep_register_controller()
Message-ID: <20240221071604.GH11693@thinkpad>
References: <bebcd822-d465-45da-adae-5435ec93e6d4@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bebcd822-d465-45da-adae-5435ec93e6d4@moroto.mountain>

On Wed, Feb 21, 2024 at 09:20:19AM +0300, Dan Carpenter wrote:
> There is a copy and paste bug here so it checks "ev_ring_el_cache" instead
> of "ring_item_cache".
> 
> Fixes: 62210a26cd4f ("bus: mhi: ep: Use slab allocator where applicable")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/ep/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index 8d7a4102bdb7..f8f674adf1d4 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -1497,7 +1497,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
>  	mhi_cntrl->ring_item_cache = kmem_cache_create("mhi_ep_ring_item",
>  							sizeof(struct mhi_ep_ring_item), 0,
>  							0, NULL);
> -	if (!mhi_cntrl->ev_ring_el_cache) {
> +	if (!mhi_cntrl->ring_item_cache) {
>  		ret = -ENOMEM;
>  		goto err_destroy_tre_buf_cache;
>  	}
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்
