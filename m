Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F102ED15F
	for <kernel-janitors@vger.kernel.org>; Sun, 12 Oct 2025 17:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760291911; cv=none; b=ihZ57mgzc9sHNULbT0jxceqjVgYHuOlmTXhleqXIrxA6J5a47QMR3desYcbVXlZlzPXQad4CVwIq6UDx5zaf6rV5Gn2PZwr/TJ8cg+nOeShVDsjSr4YfJlJ2XFUTlQf/0RzJ+9y/uskJ7iP//h4NCR891Lq5dGkkpMu0uzSoER0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760291911; c=relaxed/simple;
	bh=4s+gF/J790Cn9pggWv1hmT2wDXmwcmgRyJfiSqUlECI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYCaWBEJETG8VqhWA7l883ZcHi7FvD24iHGehUly6omKG0LrOijMhfxCk+xVavAtoFkH2nkixssg6yVFv4e8d8Rucd+J7Qi0WE1WgZk515qw4iZPrVhmmd07g6cGZWYJMl6AX+xjjTq4lnWXklCblxH/Le1MB5+oRP+6JZa8vQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3uv7OS8; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3uv7OS8"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7810289cd4bso3457334b3a.2
        for <kernel-janitors@vger.kernel.org>; Sun, 12 Oct 2025 10:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760291909; x=1760896709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64F5r2tOG3BpkRMdKwJdv92rwanay9eWarkctmegkS8=;
        b=m3uv7OS8tyvmcio1IQhE6HcbyqDd82AHvFcQ2y87b59LVvf556zgrnJ0QquQjw/f2B
         E+04CMUPLw8bf5OXMyDb4C70ChEhRwQiM9lwAaUs80b+kSJgUUqhaDli1MUh0w2R7n8H
         J7QNKlqiHzpiawBvSJ7qs0tojcmE1D1Y3nXEafdNnfuFe+yTygXgQeMujn2wLFICEjaM
         s+RUiOZbx9QMCc9zVhsr929WlbV8b0T7d795D66F47XCOxAQ9A+m2jfc18SCHvnXtWo7
         rAc5y0ESHSRS2NhfTSdjBKz3sR4I8ftj8FsX1E8NDiMNqBGpQnV/ZiGMVtg5XMreo+YS
         DcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760291909; x=1760896709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64F5r2tOG3BpkRMdKwJdv92rwanay9eWarkctmegkS8=;
        b=dnVwQnfaInL/xwhtbL4t2cToZhHlMlF8dcP4XZ6bTP2THtiLpYfZdCFLo8VF4nX23l
         z3aNxBD+AvBZjQ3vfCExVnPz0FFtplxuEefvqg01Rvsq/7+Q6u6udWcM+nA3ow/NWkWk
         W1Wjdra0pDK/MzfBOhOjMd2PGWgAc/aPP2wH++Dre03twYUCSD99l9LDPEw7HTVeLm6I
         E2NnbDVyehuqKZeh/zCUyUlZ51vFnHVLUbE2lkUg76hR85WooXEkCjdMixIs+U/oj70f
         i3uFOLWbSUTaaAoffay7INy9bUE/Zz6hSMIzqYgb3ruNHuJFkndzFX//t8AERRF5EFpC
         Nkjg==
X-Forwarded-Encrypted: i=1; AJvYcCVWjNBfNMgFNTgx/FdaGatRGaQTgLNgHfXQ3iq6damI+jrAeazrF0QVzefDIq00d8w6zwdAJAJ+ohgNjMm9OuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOXUH8XH64c2ZtMQ0e5iyI90MYct9A4hX03BXrdmhr776Fk9CM
	/QE8aPlROjGUlcghnrc+/JM/dhlI+5+SRVtJM/qKG4MXFrZXt14rlL7q
X-Gm-Gg: ASbGnctF+GMo54LgCO4oixLMbnDwMAYSu9/s8iH4OoiS+9a7Lylpsx/N3Qpp0C0F5Gn
	dKavkQBFylecGn57MeBUlvYo4Z7hEklj+JBitg0gAjZvMnTa2o7cchUQBukkjbtpnLM2xKQNmd9
	Qi4M02fvK8mNiqhITgBe53iGBeP2+4FVMx8s3n9BH0c1/a3zqNCZDRQldUcVcXHh6SkkeyAAAs5
	mVaEcHaY9s1srI435DmmGO8abB3GrDK4e1CXEJv0u2jd464YsVoq4fjmDo70f/UFvY55cAGprMm
	3+cyI4qPpzcTw/loC0+o83K6R1UIm/rfURKy1HmUamuB5vPqM848nFx0wvq2KcoQyr8+SdhCfL1
	D8hodC0xkREyCTEQf7+wXnaXn+He+GO3JcNTBpBTBImrBMz97Gkoo+y+X7LP72QBO8JSvdEUBEe
	Q=
X-Google-Smtp-Source: AGHT+IG8nnQxDxsBVYzafksaEJPul0aKzanbkeJ7dpfTmGPVKK73tgD+8/uxJvZAtfTfdi4C6RIOcA==
X-Received: by 2002:a05:6a00:1954:b0:772:2e09:bfcc with SMTP id d2e1a72fcca58-79387c191e4mr21395603b3a.30.1760291909038;
        Sun, 12 Oct 2025 10:58:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2c6csm8959672b3a.57.2025.10.12.10.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 10:58:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Oct 2025 10:58:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Cryolitia PukNgae <cryolitia@uniontech.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH] hwmon: gpd-fan: Fix error handling in gpd_fan_probe()
Message-ID: <f66fc8e9-1564-4c65-ad27-a7525a081aa3@roeck-us.net>
References: <20251010204447.94343-1-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010204447.94343-1-harshit.m.mogalapalli@oracle.com>

On Fri, Oct 10, 2025 at 01:44:46PM -0700, Harshit Mogalapalli wrote:
> When devm_request_region(0 fails to get a region regrion would be NULL
> and devm_hwmon_device_register_with_info() fails, best to propagate
> the hwmon dev to PTR_ERR() as opposed to region.
> 
> Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> Reviewed-by: Cryolitia PukNgae <cryolitia@uniontech.com>
> ---

Appied after updating the subject.

Thanks,
Guenter
