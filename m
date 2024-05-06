Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB0F15B0F4
	for <kernel-janitors@vger.kernel.org>; Mon,  6 May 2024 19:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715024581; cv=none; b=dHQs/ztHa6nmYrWS7ImPhataFETHlonfks8+5ZLmwKihIdaj7PQzYW1LR3Ul/ZF27J0R0Ee6LPHVZomhNCvvg0Mt0OFv8Qp4Ug0DVvyiCee1FkznL9d8YhZBdNgU7Myi24J0xw3fqOEP5AG9iMsR26wo4QM5xxzklfa87awCVmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715024581; c=relaxed/simple;
	bh=h+2r0KY2d/YSb1EViAvSbFH0CkwFTDZBvlP12Ftx8GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cv9phgKfRy5XScIFCFYiMQaEV6eimoFYe41XD4uuTK5SboWEKANK8RB0sq6bMkXID1nPloazNLKFC7C2vvHJqdXPcrLQkqoXwkHb5gqW9VOWAwS8uImptin+p0hobPrFNTNxGoe3skjw2hiXWeL1vBAdsSZk+0g4EQpQtmSidq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pe9Br3NS; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pe9Br3NS"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1eab16dcfd8so15782215ad.0
        for <kernel-janitors@vger.kernel.org>; Mon, 06 May 2024 12:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715024578; x=1715629378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RAOWZHhFt8Wc+lwUcH+BSWxp87XVVq5/2anFeAYpi+Y=;
        b=Pe9Br3NSEqtiC4lnjmbMr08Cd2JU8dM1J14wrr3YCH094butT6YRTQrsX1+5Dt5RU6
         YOnCR2mFsItIz7yBLDJ6+W6LHa9z7PvoIGOzS8auTPT9MDHVIA3+a8+XJdRMjM0l+AoF
         /kRp1ZkKhmMj4dq8aLwPPioLpxQcJRxL3YHG1ofWIlYMCQJRzT6pV/Wads4uS14t7Isb
         wsbzGWN0ho+x7OrUYh1P/YqDLfPR7lyh6h8KE1oby/mIyIV9UnJ2Wl1jZEuGM8kWJ661
         xknNlMif6TgKX7TI8eHNUX75gNQipK3ZNLrpBzuxR/98fBq4lV71Wk5q24zWNQWHutRd
         hLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715024578; x=1715629378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAOWZHhFt8Wc+lwUcH+BSWxp87XVVq5/2anFeAYpi+Y=;
        b=pay5vvppBxk4WVxPIQBjC1yW+bUj1vV4adANbgphWKLugZW9JOq9mwuEGtr2QIKgR3
         iJWwhv2uztaN6mqttNSzhwxv4HuM0jNFRBA+X+INhuxqfrYfIRCf57yxp2vqrfuASZH6
         sHW3/pXKeLeQqureAQ6EvlTMZWxK4kuR6ClAXwMO3nkDmQ+Ypuvcc8sAB5Pp4LuzFLg/
         MOMc5OnDTwCa9MSTFZ50F9tee2ndU99GvtxPKXZbBMUXsB4O24bRXQ4lC483EompZRyr
         mestujsWAAZ73o5ByWMFoiKrOguQS1yUmYq6Yk0W2sUnHxF9Aeft8PIeq1qRAVuwiQOb
         k2Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWO+HkL4IBrqbFlfh3wD7JSCGJgtJhDSnzDGT+FgYGH/764RZoRPvN8rX3u88WEgpy1jIKhnxhlS7DInTmJF0mwiMTeojXODCDzREG6K9t5
X-Gm-Message-State: AOJu0Ywk6HHvs6g+Tsh9hiwEMeFVxCMnc9bgrbQSfkfsMrVVQXI6eCgS
	w6qtv+c2SFWe2Vg0ogcfQUFO54uJPO6UD8WGEyW2MqeP77VnV8PPUcrLYO21Yd1es3P1uv848bJ
	v
X-Google-Smtp-Source: AGHT+IGwS1FDFCkf5egNjpQBZQYUjij5H16IdPJ7aQt+EL6jbiC0XsfnTSn1KSAGBqBRJX2WD4uCeg==
X-Received: by 2002:a17:902:c412:b0:1eb:1663:c7f7 with SMTP id k18-20020a170902c41200b001eb1663c7f7mr13806723plk.43.1715024578211;
        Mon, 06 May 2024 12:42:58 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d0a8:32b:6e71:43af])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902654a00b001e435350a7bsm4904648pln.259.2024.05.06.12.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 12:42:57 -0700 (PDT)
Date: Mon, 6 May 2024 13:42:39 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Olivia Wen <olivia.wen@mediatek.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] remoteproc: mediatek: Fix error code in scp_rproc_init()
Message-ID: <Zjkyrx5j8R+ejwbv@p14s>
References: <b2114e3c-fa64-4edb-a1ff-d2009e544c3f@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2114e3c-fa64-4edb-a1ff-d2009e544c3f@moroto.mountain>

On Sat, May 04, 2024 at 02:26:46PM +0300, Dan Carpenter wrote:
> Set the error code to ERR_PTR(-ENOMEM).  Otherwise if there is an
> allocation failure it leads to a NULL dereference in the caller.
> 
> Fixes: c08a82494500 ("remoteproc: mediatek: Support setting DRAM and IPI shared buffer sizes")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/remoteproc/mtk_scp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e281d28242dd..b8498772dba1 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1156,6 +1156,7 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
>  	scp->share_buf = kzalloc(scp_sizes->ipi_share_buffer_size, GFP_KERNEL);
>  	if (!scp->share_buf) {
>  		dev_err(dev, "Failed to allocate IPI share buffer\n");
> +		ret = -ENOMEM;
>  		goto release_dev_mem;
>  	}

Applied

Thanks,
Mathieu

>  
> -- 
> 2.43.0
> 
