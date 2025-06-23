Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA742253B0
	for <kernel-janitors@vger.kernel.org>; Mon, 23 Jun 2025 22:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750717519; cv=none; b=V7YPgjf+hz9GTB2agKfiJo1A0EZJ5slnuXbLoATg/VoNJ0beFK4+vCSe5gKc85ErefydhPUZ/FoqJyaWXqa8jkHxwNLy1FZy87UhB2mpK1OvfRNl9fyDrC/1LMlXCRL1kYeeg+s6/DDr8+fxmlFgSV9lb11NPlMFjzfIM2FTNrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750717519; c=relaxed/simple;
	bh=iSqfQdhhNrFUcXqgyYNd2M03410UI/DXw37Kxcdnpw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAah8tfVM4bQSD4hQ9CtWDoKCnb0ukHRA+ZwJSKiM39z6RbG9seaotYYduelGpI6p+YU4J1ImTA4JwqJPdEJgK24lv80e5lYj7MWk+jjY4gzo5f0JWPbpADMh7fjoe5sxkYA9duq2yD2aDC1CMmKtZ3dknOQpQ998LmSO+iBJLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IrXt+LlS; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IrXt+LlS"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-408d14c7ebeso2974098b6e.1
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Jun 2025 15:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750717517; x=1751322317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YurwFid4CmPM1zECZ7NAIyg8xcw24kM7tKeHyFwlZDY=;
        b=IrXt+LlSxmPKwAhyJk5C6CjfpEX9I6oWgVeVt12x4fJ36lCI4p5sGh4hUQHsup7KXV
         tH2XQFM46tjozQK9A4RX8SD/4OLMu+CKdHZzd7VVMSM/fmNV/gjaWbKfXy2sFKWNwqYZ
         is5dI88r1mZLmemKAZZxHYDP07YcUWoU+Y6n+EeJczj5PmW3/v6+eooju0jstqXqj+Vb
         xUslRJ2MxDA6D2WNJQY/tWNaE9r9h/mxCTGjOxxtOn2i0hHg63FdnxLXA9DQ3c15Sfh1
         Y7OSTN+aZq00mjtbfZ7lVqxxF8PvQz4nApZtTdqVOTpOQepa3vk2qXlOcMtj/QQ4wWxC
         W+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750717517; x=1751322317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YurwFid4CmPM1zECZ7NAIyg8xcw24kM7tKeHyFwlZDY=;
        b=GdydPvCz+5EWrw7Da722b99Pn2kV9fmUCCQcD71XtV3dlBOoT5vwuMJKhy4HbLnrWH
         zt6YINcdy71zD08oWpvkrFxaIz5LhNTaYnwjUtZdVBt4ederU9ihoSy30jsqs8/F6crP
         F6MSMJDBCtGKAhaH5hQEEjdUincCIZXEfWODqkOxJgMe1DgiZRJjYO5/EAg2cvNXAzuH
         z0TgOf4iUcUdbArjjciyFp4fwSP0NxGnfOKPLcyrNkOYXis1Cj95HfKk6+HT5JNCh+Sj
         /7LUNFLfPuHgHQGpY09iQ+GywMAtszHyBt5CmU2dYtsHhsOoylhGZtrF9lDONRRXXxfM
         tB6A==
X-Forwarded-Encrypted: i=1; AJvYcCXf59kmPH7/O/rI17gJ9gsTWDIyjhIov7ZjKseYvYtFacqU1E3NLwHtLf73q4nGHkh3PlpEslp4jcH9fOQlnvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzwskRflYhAj4tGbt3L7047Y5AfWUZvhwzRf1/5TuSMTnjTHxn
	wt6k28e9Iz87s+qkWKwbaVxleunNVHSP+wCcch4IH8rQwnFEJ+9d2Xu7aSK0e6yiHNI=
X-Gm-Gg: ASbGnctmQma4KjzP75WOQtvjRtuBE2nAWuTsMAuv4nwSYTso+99RH3o3kYSLX66yBYt
	cHdt0PLx61uTDKhM4VmQ5v5a+O3ukdjRvG+/mVtmlfcAMcUrRW7DnXdx/crpoj2jOF7bTMP7JRe
	n0UdN+ZRbBsdz53eVOvXHB7BpWBa2Emz9xPKm7i34NGtH+r1lcHOtVRSjpTPRXXZQk2jspOqumU
	gd3JTuGM3GvC3Su9m6U11HRPxRBPMT8rpgO+Vdaxj176i6/7RTI3um8fRLzwAczX/uIIyczxSiF
	TlKI9jSdbLcEF9vkPfZ1W43cFm88cAE8ULsfSazLKfkZ4kIMUr5DCfj9H08R/l5MJCUu8g==
X-Google-Smtp-Source: AGHT+IE91XZYWlprKGhHxRhe/CzOGIt6hPjcFJioO4ZNtu61oT2yO1/raktvIuwHoxAPy2DMwidNoA==
X-Received: by 2002:a05:6808:2008:b0:40a:54f8:2cac with SMTP id 5614622812f47-40ac6fe3646mr10872876b6e.37.1750717517244;
        Mon, 23 Jun 2025 15:25:17 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6d3b353sm1557857b6e.46.2025.06.23.15.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 15:25:16 -0700 (PDT)
Date: Tue, 24 Jun 2025 01:25:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Rubin <matchstick@neverthere.org>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] staging: gpib: fix unset padding field copy back
 to userspace
Message-ID: <cc005697-1911-485f-9c50-30442558851c@suswa.mountain>
References: <20250623220958.280424-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623220958.280424-1-colin.i.king@gmail.com>

On Mon, Jun 23, 2025 at 11:09:58PM +0100, Colin Ian King wrote:
> The introduction of a padding field in the gpib_board_info_ioctl is
> showing up as initialized data on the stack frame being copyied back
> to userspace in function board_info_ioctl. The simplest fix is to
> initialize the entire struct to zero to ensure all unassigned padding
> fields are zero'd before being copied back to userspace.
> 
> Fixes: b8394732ff0c ("staging: gpib: Add bit and byte padding to ioctl structs")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

The fix is good, but the bug has been there since the driver was
introduced, it's only just now that the static checkers have started
catching it.  Oddly/sadly Smatch doesn't catch this one.  I'll have to
investigate.

Fixes: 9dde4559e939 ("staging: gpib: Add GPIB common core driver")

regards,
dan carpenter
