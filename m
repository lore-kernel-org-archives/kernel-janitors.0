Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D31379
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 11:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZqEKQOmn"
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46EB5A9
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 04:06:43 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c523ac38fbso63290311fa.0
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 04:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698664001; x=1699268801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RPDLogMX2Okl0yWKKv3brKmDR3BK6A6t8hBL6zMzTPM=;
        b=ZqEKQOmnxUMMQIMHczCPqIFQYtD1i6rCDD9eI4pyX77D6LMP8ON9Cm2UDhHp81grRh
         FStLIjUklpSxd7dyrw5p8Xz+gfR6paxRNSaAJZOfuHY+91CIc6nvLl20KbW/abmSvG+0
         7IeNqhw79CEBQZCkXW0R0aBmsbetHVSpuCjxGKax2Cm+roIHCmdj5GuTHXEhXVEiikwl
         FnH8GDdq58fbkfogKaIRU598L3tqENVv1Y1ryoK6E+aQE1dXdz/3ZOTXN9Ri5985pu30
         C03EHTVRNPkGMa+P0yHSLi42/+oEAgMk+yYd92mpQrpOpKvWE0O2dpRYNCUr7Jhv9+7e
         VzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698664001; x=1699268801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPDLogMX2Okl0yWKKv3brKmDR3BK6A6t8hBL6zMzTPM=;
        b=p3do6Hflho44hOHrq3YISFTujxxbvYQ5iYd0kE2wbP3MM8eyhApo10nmKEcxx2TAWE
         dEbhbiidI3eGjmiz+y9vo17XmIkxGFOpFPyzEIGjv1iQhm/w5QS3MmEo+8gokUZ37j8g
         gTBBluBkIOjnDRIyNaskWE/u2LaRfDNoJnpIE4F3T42Q+Z+7bOufcJJq14gTBhFN2c5z
         c1QL4UuQCxBN6qNMBiytpkLJu24jfbBWkchPQvojmPlJwd+ZdgBWdFzDoqR5wDPzclKd
         WYVmU8bMUBhQK8DA2rksmNvw6HNEkMRkXs3E8fd/8pYD5dYDhcnr0y6uVB8VXZ8GmFe9
         5UIg==
X-Gm-Message-State: AOJu0Yxbgyu+iOP5cdFBo3flfAtwYh+BMrRPkcd5xwihmZB3peumt6Ub
	zF7hkV9B1W/yE+bDdZFwCB3AiA==
X-Google-Smtp-Source: AGHT+IEUF8qSE8BtR3dxKojdv94s9eYZmdvIVxNuat/ryX9vyqJd2oVzRTWo37qXTG/xd6BKZkoX4A==
X-Received: by 2002:a05:651c:2122:b0:2c5:a1b0:d95a with SMTP id a34-20020a05651c212200b002c5a1b0d95amr8130145ljq.14.1698664001170;
        Mon, 30 Oct 2023 04:06:41 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n35-20020a05600c3ba300b004068de50c64sm8934726wms.46.2023.10.30.04.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 04:06:40 -0700 (PDT)
Date: Mon, 30 Oct 2023 14:06:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Tero Kristo <t-kristo@ti.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] firmware: ti_sci: Fix an off-by-one in
 ti_sci_debugfs_create()
Message-ID: <cd8ab7d2-d59b-4973-9180-0389b29fad0e@kadam.mountain>
References: <7158db0a4d7b19855ddd542ec61b666973aad8dc.1698660720.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7158db0a4d7b19855ddd542ec61b666973aad8dc.1698660720.git.christophe.jaillet@wanadoo.fr>

On Mon, Oct 30, 2023 at 11:12:26AM +0100, Christophe JAILLET wrote:
> The ending NULL is not taken into account by strncat(), so switch to
> snprintf() to correctly build 'debug_name'.
> 
> Using snprintf() also makes the code more readable.
> 
> Fixes: aa276781a64a ("firmware: Add basic support for TI System Control Interface (TI-SCI) protocol")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> v2:
>    - use snprintf() to simplify code   [Dan Carpenter]
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

