Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257D819EED3
	for <kernel-janitors@vger.kernel.org>; Thu, 10 Oct 2024 06:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543264; cv=none; b=SZjKTWOZvtqJi/srhWD+r/uZOwJBuSIimsDVOwOa0/KaHWWZkd3T0VzBQcasUxPs8zohj2f90FMt00DAVOdVdpCFsfEzEbdpQ8ddRgUF1rWF0rQKEh2IQ/m/SkBHt6ZAPKEw+h5J37kAYxQ3dQJXk2O0ehwItyPFaCKRaBl3hgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543264; c=relaxed/simple;
	bh=0ms1chKdEWxTq/IFCWt6Vhx8aIoVGjaB7A8yNhqcslg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBUzfAJcHQLMH/DbJfDHIeVfSkebUoDy1GATTqzMsCi+hz5Avn8tY9ao+ngExrS8I17sbLwT2Z3ybxCJkYMwHBV0QGD3vPv3B5KiXhOJFTb3ey4tJgMwteDA6Ia9Wn+p3yo0zPPX861sKV5K+4+wx1PL82Hu9H8eWsNey5Rv0UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mR6Lwqxu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mR6Lwqxu"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43115b31366so4424375e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Oct 2024 23:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728543261; x=1729148061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4m5R0JtPpfaojQZL3OlH+ec0WCCRm/TpTjzYrE2iFl4=;
        b=mR6Lwqxu+ZJdXt40L763SSOqyzsfdRXHR1yYcnv8/87p7EW7yoxV1OQBjBOMfVgZYE
         fqwmJNHK+UW1dl6S8eBLXtXGRHqBXtFcLXqd00y2zU2To0vgmVdyaKCePo9NlyEk39py
         xkCtB2Efuo+uwdpNU666DUoiu2IlorucMQ2mFjUJrQS72z5eTlNgrR5EEZiO+HrOgPh6
         VjtiMyrctU5efucXWll38HH9MOwrrKeBxRh75ZWtOhCsVYZhEBsAvQK+U8m3w6PRzVOI
         F/8HhAv5O1A5DKEyWHRSPuZQDEMRtIQyXBTmUvYbfyKuwgKPpoEaeaNrB0Myv3HyS3Td
         kYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728543261; x=1729148061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4m5R0JtPpfaojQZL3OlH+ec0WCCRm/TpTjzYrE2iFl4=;
        b=GBaEtFlGhXaP6+1FprNby0ZXYn1cerzNHLvJ8pMHatrJGgJP0AngL+q0/bo7BViPSr
         8GwjX09P9/k0sASNhzokDk2QWRt6GO5skQY1rGOU0zbsNeTnB2HSjKJKCnKK0Jmxtbw/
         HXaEazskBPuQBfx5cXGRkOx122boyHXwx3ds2cqy9pDZJ4ajBy5YBupNdW7W3zdP6eUH
         zKSKZuj3vEJg8ds3bnMTAbUdx2oUKw021iYqvszRjAJnkNvKZ+rh10frKxF1cUkGVA9R
         mx3vCUJIdxpIJxe4UKCDchra2K9sUS12XtL1rHH1bfIMZRX6ukNcEck6ddmb2VMSyqz+
         DGQg==
X-Forwarded-Encrypted: i=1; AJvYcCXYWNcrS3NFSMKxNTi01I3t3EVacpDalSfaTBjeypHM0Fo5ZmoF7DiWINdIwGSmpkRFy55k4i6UjPeFG27Q8w0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0fkg8nFrAa9dH6FStL7elNEdQuluz2NAfGkLxY9uiruKCZs2x
	eaqh5PjaqPYWY804IU39wO8vEb7w+/NQmunujFPKepf8LN8UUsgZeynHY7W7riY=
X-Google-Smtp-Source: AGHT+IHT9IlJQF0bRhontqJBDQWsf+MVObv5bUTBsaOIzFmxsVdQfGzrmTIzPD0VfNHeePPUMsSx3Q==
X-Received: by 2002:a05:600c:358d:b0:42c:b9c8:2bb0 with SMTP id 5b1f17b1804b1-430ccf03b0amr37644685e9.4.1728543261409;
        Wed, 09 Oct 2024 23:54:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b9190dfsm640951f8f.116.2024.10.09.23.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 23:54:20 -0700 (PDT)
Date: Thu, 10 Oct 2024 09:54:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, skhan@linuxfoundation.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] drm/xe/guc: Fix dereference before NULL check
Message-ID: <1a5407c4-3b0f-48a1-940a-cc6b3ff3fb12@stanley.mountain>
References: <20241010064636.3970-1-everestkc@everestkc.com.np>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010064636.3970-1-everestkc@everestkc.com.np>

On Thu, Oct 10, 2024 at 12:46:34AM -0600, Everest K.C. wrote:
> The pointer list->list is dereferenced before the NULL check.
> Fix this by moving the NULL check outside the for loop, so that
> the check is performed before the dereferencing.
> The list->list pointer cannot be NULL so this has no effect on runtime.
> It's just a correctness issue.
> 
> This issue was reported by Coverity Scan.
> https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssue=1600335
> 
> Fixes: a18c696fa5cb ("drm/xe/guc: Fix dereference before Null check")
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> ---

Perfect!  Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

