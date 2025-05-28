Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300A32AD22
	for <kernel-janitors@vger.kernel.org>; Wed, 28 May 2025 16:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748448945; cv=none; b=mM3LWvCgZSQdQv5APcXIi/7BGm3Hmk0LXuHFBgxsWs3WRUCO+af8rTmZ7kE6UY5+KWM9EAoYEYoHlAlU/ysm6tzPZztTw4ykOLjgovOYvAMDb+wRM9h+7Td5IIWPeg2v9x3aI08NOEzOgYWA4BPM+LUgAlVAw/YaqD9RPvGKXLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748448945; c=relaxed/simple;
	bh=7szsciP4s4R9wknqXBXBTZqN3lbaKfXPhicwDQ8Hmdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gx+eQ+Rpr16FWfHePBZD6v/We6w9KcfWrxXrhTEu8rJMKPlcDnHWTp6eUUCL8cSCZHSfaqxebZ7CI9GC4Cgvns7ERejL4HINPqyhBQ2BsebXuJ2vsiS5vbtUlztr20U8Gu8BNlcRYdr6VAS0mI4TJ5d6jB7KchWwIvQ6F0s7s/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gL3Skzeh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gL3Skzeh"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so422455e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 28 May 2025 09:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748448941; x=1749053741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+C1RzNTr6MbSo58wcEFxOVAmKna9VJA+FNUjpMEd4H8=;
        b=gL3SkzehCRPTbEareMaVrIuuL6aN9um90oEuhc5yudHJfX8iUpFwRjTv6VAtRpVUEu
         ecAF5HVrSVpLSDuTcwdCGvtq+A3LrsFZWosbDZi4JZQaHdkErRKv9mq2KROHE5T7r47x
         K+JFF1SZaGOziosFC3+L0UHqqfItztS6aMDZeNddyNnIyuQBrF+nR/75OSlXJZwtTEzY
         dD5nuonu3a0OvG1FFjc1Hp654WRktMqyWlWOILhcM+AJBXOP9HoQuitiDqLX0LdIMtYV
         AXH3N04AZ5E+nRN1c8ZtvKmDrBTMlLTOa0cR2rxDHdbGDSUMGTR50BNX/gOuVuqJR2Ox
         mQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748448941; x=1749053741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+C1RzNTr6MbSo58wcEFxOVAmKna9VJA+FNUjpMEd4H8=;
        b=eQ4IBPaEwDH22lSqGIqKJgZWNpGI2ap0dy8lrhM9F6ofRYBRHkLweQbkmeMrqHt+sG
         Toxkw1fiSt60YJt7jonXK0pOdjI6EPWw+7EuUBmH0LAnUOCuE4b3c6DGDGN5y86I/NEi
         4aVzturBy/F/KLBN+nUBkBhtF+4FOLtPg9WPOuOy6rUuLFogszXXLCasCYio91hhdz+i
         hkXsIU37vvH/FJEC+aSmuDMJxIJKk5cvCkBhSnFM4QhdyaNFL3Dngu3hhLFprQEyAfQz
         /z5G+qzFb/n/jvuwPF9TixwHyo3ehAsgWJqbbzB7/gBUAX6AOnDYfJJ3D7IWavWW6uVL
         r53g==
X-Forwarded-Encrypted: i=1; AJvYcCUiOdtkepFx627Z1+EiVP2P7f8eVLnvh5uq3A2TomBHtE3o4MDh/tgAyt9iibaw+YVqKLzTD67QZqAnLFSc/0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgAC0CopjHQHqCbHXb4tITw/T5EuQHGOyQZB2jdRr/efgXxgOG
	IzDvlY9240wTtO9RqfPvIXGUNOeA1KwpGsVuds/ImzQUC81v8CXs4X3w+OgItzOqUHY=
X-Gm-Gg: ASbGnctfn/TDifc6jxdVeoSLp/ZrS7ZIFxrLiL+76z6v3Wgvg0BTq4eNU2C/XIxLw2m
	yZxovXMyH5FudML/kgdXyKFeLUegysQDYFcPLd4q9pn1fhGtXs/6nI1h7Z141ZREbbZ9ucZRkdZ
	wyjC8PcN/E1b4QdxpG6xxbLVlZo6YBJZL3qHfgyfvMfUfcKlX2w7B4yZ60W4wJLMOp3Lxrv0GVh
	ELuzkb2uVvsAy0S/6QYcDO/Ga3Fk2UnDNsIR0b3jeZfqLe96qKRxcrt1BQ9XkXpQCvhFJO4QGhN
	wzHSagUmN0WfkSyrSE7zktzThSDOiOLPeZ94fXMexmB4Rwf6KXu0YKU=
X-Google-Smtp-Source: AGHT+IGY3B2n3dEpBIQTEIc4UcD13zJbfNxCVilIBzIvGrsLXjUktw06sdl/F0Rxa0Z5ypRV303Ptw==
X-Received: by 2002:a05:6000:2389:b0:3a4:d238:682c with SMTP id ffacd0b85a97d-3a4d2386cfbmr12567851f8f.53.1748448941430;
        Wed, 28 May 2025 09:15:41 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4eac8a74esm1859615f8f.45.2025.05.28.09.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 09:15:41 -0700 (PDT)
Date: Wed, 28 May 2025 19:15:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alison Schofield <alison.schofield@intel.com>
Cc: Shiju Jose <shiju.jose@huawei.com>, Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Li Ming <ming.li@zohomail.com>, Fan Ni <fan.ni@samsung.com>,
	linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] cxl: fix return value in
 cxlctl_validate_set_features()
Message-ID: <aDc2qGgYVzXMSUpz@stanley.mountain>
References: <aDbFPSCujpJLY1if@stanley.mountain>
 <aDcqO5hlGrRXzIPT@aschofie-mobl2.lan>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDcqO5hlGrRXzIPT@aschofie-mobl2.lan>

On Wed, May 28, 2025 at 08:22:35AM -0700, Alison Schofield wrote:
> On Wed, May 28, 2025 at 11:11:41AM +0300, Dan Carpenter wrote:
> > The cxlctl_validate_set_features() function is type bool.  It's supposed
> > to return true for valid requests and false for invalid.  However, this
> > error path returns ERR_PTR(-EINVAL) which is true when it was intended to
> > return false.
> 
> Shiju - Can you trace this one through and add the impact statement?
> Wondering if this is going to fail gracefully, or badly, further 
> down this path?
> 

Sorry, I would normally analyse this a bit more myself, but it's only in
linux-next so I assumed no one was using it yet.  It ends up being fine.

cxlctl_set_feature() has a check for:

	if (rpc_in->op_size <= sizeof(feat_in->hdr))

at the start and sizeof(feat_in->hdr) is larger than sizeof(uuid_t).

regards,
dan carpenter

