Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAA325BF10
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 11:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750852257; cv=none; b=Kczbz+uLKTpnFUK1yO/xfxJ5510m9do52vV3Y4LRJeRxDR4MGvxp0L1rEuTSzfQpAr6W9U5V7pjwZoyhwwG7T23nQnQTJU7/lhyc5qrbXZh/hAmwa+MRH0WGpVEz0DXS92mv6uiPyeacK2Bxx7ooiQrldAZt5dpQ5qYgbXzj1SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750852257; c=relaxed/simple;
	bh=ccKVrwIbREFXa4j7XcS1J1dbdZcxku7g36ksBtNIWss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZen7nF4BuzM0zw1YlOGTnvt0cSHQoC8IMCW1Xxye1l29P0QIRp/yPs1dOU4Nat9OEKZGE6PwpXVooZrlKWO7L1vIM1W/2Z7/yUb9mUdZZi8893ar5MqunVMQjrfsnUXuNMhEfA01vzNECbncKDoqHCyFnWodxYGJ2qTDnCQP8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YcZ6Rw2i; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YcZ6Rw2i"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2e9a38d2a3aso4907052fac.3
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 04:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750852253; x=1751457053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AoutNGAerTcoF/aenrsm72CtVJG212QTVx4YhnzRYkQ=;
        b=YcZ6Rw2iiUo0d/sP97IM92RZq4tDAZiQyKcL8QUOQfWN7APNa5yFR6WgvYJpTcRO/k
         S5C8mFIwpiY9hGlsnCX8IpoXA4E+hwJDQ9ZnBjQJJpbDKW8aSXY2Jr7ugztdh3/9r3U2
         SVaMIUAhZ/js61l9kg+xl1qSUPgJM/l9oW1qnQdwNbSEPbbHsg5jlxkzO9sV1K0F9qEf
         zj1qp97U5caV+Vuw4Gk/FJcPXggzduj/RcbBX6K5QBdKR5dIC88zCA+UPqH/QD/lsrnd
         PQOu6DqlA7U0ws6s7gwEpzFkbvWcXRdwvgMFtNIo7qoffzeyXXyZGepLQuh/BHqFFpbr
         s9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750852253; x=1751457053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoutNGAerTcoF/aenrsm72CtVJG212QTVx4YhnzRYkQ=;
        b=p+pp3/LQfpOzVYF/04TShqYFx51Axma4tZI7ErwrSqgAgE5cVlzyJ9W4o2Tt2s5yCU
         O9lAbSPrC7laavsZWzURVE0Iu3LiVKf+wqUgziNyvJ//I/hTqxIfwWcN5/movA2Yu3br
         y/nHlbehcu8PRCGO5/cpssx67e3mfhIUczOpvgZa4iny9E/mo6HSQHm/h8RegVV3QL1g
         H/abD9trymgA9eoPTKqaBzswiR5hzgT8nf8+NzjBzsJb0cIU6OzcJZAmRmeTTAmYXM8C
         tvxnje3JA3sYv6KeOS/PcI9Hp4G5soROcDF4z+KMctTCwdvFem+qEwxcwmT2A22E6B7P
         7cmw==
X-Forwarded-Encrypted: i=1; AJvYcCUASzanaYqH6h3RXTZ6b53R2rQfAedg1Ck4vbDZYIJ6i+vilLL+rhQPAPjZ/CgqL5RqNWIc+hC5RZkOST/gzUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYRpLKm0tg/knPOrhXehtrc81hEkA/pMnic95mBXCRrWGSg87u
	IRyNAMk+SSDYGQAFgR4E8Nz1Je0BGXqg7cCwbQXywIVuRmge5+V+oxNkLvDzCszgfTA=
X-Gm-Gg: ASbGncvLh+/QykaaeoTuoad0rE0jZhTu3XVHXyhlCm07md2ZJJxQ4eZ1hDVjRDmfUx2
	niPIsoCADecXEbNNxvlvnBD+KkSjPd7ulIdouotUhFNLluPwBxk9+gPenPOlnmlYoushbCXbM+K
	PYQ32FyRW4VqD0iEtl9qkMnkvQRKmp4+3XTXGyyAbD6LsX41C9yXbH3efYLwRencpH46z9p98l2
	EpzlDVM5NqsHxDemp4lRx/ioD4EdlHtFZqONUiee8hmm3OkyfifjhBsxQQtxU3BcZ8zVsOmo255
	BURWH0NhUE9FI+P4u4kmk4NdY40PBTFF+TPCS08mPz+ICP02lCR/vUu1c459E9honWQJGNvkSKm
	X9lA5
X-Google-Smtp-Source: AGHT+IHhifNSUvdslHEt+i0G2mhKHrYMYK7cb4RljD3ks4W3/ayaA/WwVBmac+YjncuYOBkqkdy7sg==
X-Received: by 2002:a05:6871:2104:b0:29e:4ba5:4ddc with SMTP id 586e51a60fabf-2efb27645a8mr1809349fac.24.1750852253475;
        Wed, 25 Jun 2025 04:50:53 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efbd439555sm185735fac.25.2025.06.25.04.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 04:50:52 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:50:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, Ira Weiny <ira.weiny@intel.com>,
	linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ACPI: APEI: EINJ: Fix check and iounmap of
 uninitialized pointer p
Message-ID: <ba07c097-80e2-45e2-b579-fe270c04fabc@suswa.mountain>
References: <20250624202937.523013-1-colin.i.king@gmail.com>
 <31b6548f-8ff7-4bc5-8a2c-78a5a9d5eb40@suswa.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31b6548f-8ff7-4bc5-8a2c-78a5a9d5eb40@suswa.mountain>

On Wed, Jun 25, 2025 at 12:31:10AM +0300, Dan Carpenter wrote:
> On Tue, Jun 24, 2025 at 09:29:37PM +0100, Colin Ian King wrote:
> > In the case where a request_mem_region call fails and pointer r is null
> > the error exit path via label 'out' will check for a non-null pointer
> > p and try to iounmap it. However, pointer p has not been assigned a
> > value at this point, so it may potentially contain any garbage value.
> > Fix this by ensuring pointer p is initialized to NULL.
> > 
> > Fixes: 1a35c88302a3 ("ACPI: APEI: EINJ: Fix kernel test sparse warnings")
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > ---
> 
> Good catch.  Apparently this isn't in my allyesconfig.  It's weird the
> zero day bot didn't catch this either.

Never mind.  This is definitely in my allyesconfig.

regards,
dan carpenter

