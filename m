Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C9839FCC
	for <kernel-janitors@vger.kernel.org>; Wed, 21 Feb 2024 07:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708499271; cv=none; b=kI4J6gsm3ubtVwiZXgBbZwVUnc3mfyvVonpk6omU74PEQTzLr16nWwoFQRC9Lyyf5pwyRV4NXvG/7jFwJ6nfhZJdbLYXncPKNGU5mW7lh8L0+Uxi7vewdERM1vpd5dtN4A7bxe1wQMkahHhTLG5tjfyeU17bHwmnPvAynInyJt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708499271; c=relaxed/simple;
	bh=iBt7GgaipAQNgxegnjfd9wvWH/HcjSlObaEGobdnf/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpt3WBYFNs3zlANLweXr+rfiiy9p/rwU0ZDyro7wE4l5V/wt847nUC4aF1eyvkdHWIFfYDPYdhWj+dj5GgZN1l29YkVqFvuji/Q/5Ggf8hnCsPcCBfsv+81azS5uBW1/ARu3+Hp4BsOeJ+IX/hKs0X2wsbu/CUAp7cOiCepe7hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=clOwIJtb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="clOwIJtb"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d7881b1843so1734045ad.3
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Feb 2024 23:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708499269; x=1709104069; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HN6S5OkRpzjfW/oUatP0Qz5x0+v3A5sIvi8QPWu6N9A=;
        b=clOwIJtbzZdNNmTB3DcNP1rxBXqiJx19IH8sOj2z+HHyUKt76QaosgVvbBJ8sjClvZ
         OgWde3aU7zpLEY/shOrHDRDoEykCcWkIDHJtBWLMgNmtCwuwCOZnxSqwrXocY80HdxvC
         /KHBkvGF9LRZqSfenBJpQDDRlArPkiYAKb3dg3kRA/4/HbHqo8M5xk/aAuGT+TLioT5a
         gVFWbLnrlTaZVmCJE36uFIIMUMsK98+RlQtXxzbSk2yWJ4cpnqo7lOyuyd8jJcfOhAYo
         5eZgp6Mq+HeRDZqyzceFr7bbhpE0bWn7Jy/Vz2ymbq3oQnmXVw8ipJ9mlaa5/yOXV5Jf
         ro+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708499269; x=1709104069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HN6S5OkRpzjfW/oUatP0Qz5x0+v3A5sIvi8QPWu6N9A=;
        b=P3SHsfywzv5aJrKKxU0fuc4PP42ByVNgDy2uRfm6NMAiFa+/3k9vUcYgXok0fetx+z
         AevFmFWiKncxxyn3Zjg6MsZV32ucIUg2BT/dt8mt126+L3yoRXbEA37dnegQDlZGp//V
         85XX9fIPhka98mXEaW5MW/h+2HAU3wcjZMAKvovrAZsEotGWEJzFBodYU8DW4VNRt/QL
         HU0EZmOYA4tA76ZXeCZ5EijB1u24fctvKZIG817b4Cw9tYMqpeVdcI84kaCrtMsGYSaW
         49oVcVymdMKe+JHuNowUS72vsyizFxq9ezv8K4Mh836iyUYau4eF8Qwh+Wg+m+kQ18sq
         WCHA==
X-Forwarded-Encrypted: i=1; AJvYcCVhDO6Qs8fazxjp2Y1TAD8glJO1dqLjbxFhGDGIvtBD1RSoy6Oew4uNQjzpfXgi8JkfmFdUhEFOspupnydB20NBb9QhWR2Y1MtxMFN/suiJ
X-Gm-Message-State: AOJu0YwsWpofShU4uBLyCLUU0JXBFZRI08z6W1uSZgiERb4ey3/CbDhp
	iz7XwkW7/dA1aIoR4NIyiVWSRQen1hFK2BRMkkLsIfpA51jDiwICHXxVwzf+T7oRNbjyFv12foM
	=
X-Google-Smtp-Source: AGHT+IGw2tun5cH6q5fUCAvKCYRBsgdMhG+kJkVxK0Ihl/pZe6XSEZfaTek3RQXFn856xz5XBxgK8A==
X-Received: by 2002:a17:903:1106:b0:1d9:e18b:d916 with SMTP id n6-20020a170903110600b001d9e18bd916mr24917776plh.28.1708499268670;
        Tue, 20 Feb 2024 23:07:48 -0800 (PST)
Received: from thinkpad ([117.207.28.224])
        by smtp.gmail.com with ESMTPSA id jd20-20020a170903261400b001d94a3f3987sm7335617plb.184.2024.02.20.23.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 23:07:48 -0800 (PST)
Date: Wed, 21 Feb 2024 12:37:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Alex Elder <elder@linaro.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Erick Archer <erick.archer@gmx.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: ep: check the correct variable in
 mhi_ep_register_controller()
Message-ID: <20240221070742.GG11693@thinkpad>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
