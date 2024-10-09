Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D457C13E3EF
	for <kernel-janitors@vger.kernel.org>; Wed,  9 Oct 2024 20:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728506136; cv=none; b=rABXjYZK/N3feGUxOKdA9cUTxWjWUFQx7gazguxj6XsKo4h6xsV2zFkovzdS1ERmTbRxCiKyx5NyyZnK9F98RuFMg1yyQke/6jbrxdiKQ40+D8QfOR7mJhHkYXf/Z4OdJAwrvcHecE2Yhe0H7pcawZm9NY+0r4vhsqi4ITVe0Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728506136; c=relaxed/simple;
	bh=Sm9hMLVuTico4hTaLNQJyYU2ZzVB7ziKBVwrcmJ8aKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOWdFN8FGwo4jfq7g0G9I6MmV27oEzdmAXH3yVHVq3ZPeElrdXsmSpLarQTViTGreFrw5VvuVyuF3OpynnuAAzAHx/BXP4gFwNOtQ7KP5LctkFnhBtNTsARFKnU3MnaUbv6qXc4Rc+wRfLhPIraMnZJqhZBqRNdFLAdlrkOk8go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ReJPmWYY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ReJPmWYY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37cc9aeb01dso97260f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Oct 2024 13:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728506133; x=1729110933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjYS14YTYv2OCMWHkLucdNx0+SeUm3LsT48uh8uJaRw=;
        b=ReJPmWYYRi047nSiMcBoaJ1r+z27cIBxf7JkBRMlpPgHDc1uL2xUZkDwg+0FLxeoZx
         BOgn4yKgiUxZoVgGJrMbKJvUZoM13R/rCqUvjuSqVR/G0CcaY9M7iVb8KG7amsCcWCdB
         zMiieJnKY/aQdXS8GmRI6eNctqwANEnGJDBrgir59zZ9q8lzVt3NIHHLTUBXeDL2eJNQ
         XtxtBD7gHe/p9qzYxANkmJhyC9jy/ijo0oS8qL4hCFqx/SNsan5cd4wIZBmlDiSE/GY4
         046gQzD9fFi6OJbWnqEyCoWBuNua07XkhErdemfuwvS1M1nvFKVwul6vs4FEP4TJt2jh
         S+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728506133; x=1729110933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjYS14YTYv2OCMWHkLucdNx0+SeUm3LsT48uh8uJaRw=;
        b=rokSVXWUsC+7rHZLcIuBqAH29eQsRNVw5Idl51l7SzMDDMe/BaZ6raF0gu6aUDObPD
         i5TJINaffcOOLoqZdJw/sfuG+XvbbsPNSJZCcPvrWANLkJCHAiegKfnpbfDZ4KCQEieq
         +EB+BMyspIrFiSNh5RohChUHCsl9claIIxA9gBtyPd2sjw3pc9LxTlH3GJQtjlK6Ix5R
         bIfQxfVXN1SGuLv9YRUfBA1br+PF7WyIAr+Xs3NaigFBL/LjVy65bx6NbjReyV+dkHzO
         Rv12yfw+Q2koU+qPiLUGeivfdYw0bjHSpwVO/VLlhynqe1O08KaW/rSmrrwnrj2bkOAU
         L+CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAVfO6uZ0Hm+ELcoMaSLUKEOY9UXo529FJOogByMP7e2wr9YRxv5vlaoXswZ3pZi8UnPCt8eAsAtRMffSmXz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxNFFbGyFiKL398QUMes/uoerzjrAUrZKNOQKWetOiswApr1hD
	6Vx+jBuujaL/co1MFEYIf9Y+j5oCVjxbTM640j0pQ1aTbx6GEk8Df5NKyIjxHYo=
X-Google-Smtp-Source: AGHT+IFbfMwsabJqo51FxMyaKfk6sJ6eDGqAwAcM1939Wwk+xOhuo14+AUTXfblGExsREK8B+2rfDQ==
X-Received: by 2002:a5d:6d48:0:b0:375:c4c7:c7ac with SMTP id ffacd0b85a97d-37d3aabfd1emr2434741f8f.49.1728506132947;
        Wed, 09 Oct 2024 13:35:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d2e65d618sm4572798f8f.23.2024.10.09.13.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 13:35:31 -0700 (PDT)
Date: Wed, 9 Oct 2024 23:35:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, skhan@linuxfoundation.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/xe/guc: Fix dereference before Null check
Message-ID: <07d9eb6e-87d3-4428-aaa4-8721a6844404@stanley.mountain>
References: <20241009184951.4991-1-everestkc@everestkc.com.np>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009184951.4991-1-everestkc@everestkc.com.np>

On Wed, Oct 09, 2024 at 12:49:49PM -0600, Everest K.C. wrote:
> The pointer list->list was derefrenced before the Null check
> resulting in possibility of Null pointer derefrencing.
> This patch moves the Null check outside the for loop, so that
> the check is performed before the derefrencing.
> 
> This issue was reported by Coverity Scan.
> 
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>

You need to add a Fixes tag.

> ---
>  drivers/gpu/drm/xe/xe_guc_capture.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 41262bda20ed..de63c622747d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1537,13 +1537,13 @@ read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_gro
>  	if (!regs)
>  		return;
>  
> +	if (!list->list)
> +		return;

Could you merge this with the other sanity checks at the start of the function.

-       if (!list || list->num_regs == 0)
+       if (!list || !list->list || list->num_regs == 0)

The list->list pointer can't actually be NULL.  It comes from
guc_capture_get_one_list(), so if the reglists[i].list pointer is NULL it
returns NULL.  However, obviously checking for NULL after a dereference is not
the correct so it's worth fixing and probably deserves a Fixes tag.  Although it
doesn't affect runtime, adding a Fixes tag helps backporters know they can
automatically ignore this one because the commit it's fixing is very recent.

regards,
dan carpenter

