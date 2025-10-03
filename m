Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BBF2D77EF
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Oct 2025 17:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759510970; cv=none; b=OmW0SAKlGqJx9thMYhszNTJWfhCEKvml/kKztGPp7QgMFo3oKJWgAQpJVaeGgcX/ILYVdhEtlKA68AxCGhdwgDTe45p4h+Kt0DPn4WGDALtO0HVQA2NZReCX6UK4JDcCx6+L+/erD9VOPiyHlBLDHn9UvOpvdXZ0SwfuKjhG2Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759510970; c=relaxed/simple;
	bh=uUL4M6USjXif7+Zg4JLkgLeVCj1yxgT886bmk0gM+/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D91m/fRphCR7Iy85fMG4KbjxNXLLOSRt0F+bVlDCeGDBTF+wwVIfkugA0rw/CYyDEmIKJfv1Wg8lLsOHJBmpegEVjkkHZFAUqP/b2VrBwQyCln+8dmUJKceowBlhH1xl58ZjZQVEY40AN92NHDVxf2upFy9b9mCwZrCocetnMDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eyO2G74h; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eyO2G74h"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-267f0fe72a1so19496135ad.2
        for <kernel-janitors@vger.kernel.org>; Fri, 03 Oct 2025 10:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759510967; x=1760115767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hRMekBaFzTjIb38gYN8i89LXzPK5ha2Znw032LPsVsM=;
        b=eyO2G74hdIrYrldzJIgP12opx7vwCRt1H4fwH+AheW/DnOCQBazSiSHKzNI6QMTYmG
         ZmUd9pu1SFT5BIhgI+OIkkE6fXj/6wGa+dpme9oB/nJEBojBpQXaN2UCWYdLw8orAYNL
         1idvVfBTPxIkq8NH4Q9ATxZmrp3hYWwt1kDsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759510967; x=1760115767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRMekBaFzTjIb38gYN8i89LXzPK5ha2Znw032LPsVsM=;
        b=GkD6EcoBKaBSAmb+/zhg+cMpNufW6kowddizGr48xV28Nm2vK0wjQ8WMouv7D4Yhcf
         KSZOZg+JhV/MBAEak/T4LbsSaMwnaiA2zU76J5sRPwV/e9WsQ4g8EfPlEX7jpzc5VVYP
         nR/7tQ6OrXjLJMMKRWxg28G4DO0j1xIiyqFN3BBk5EFSS4JJOVeco5o947hmKt+amrrL
         GDSc0aVwtOsRaiDuJn5dPnJqDc+OIsdwKxVCgJBBbP3MDHHJjbrpN2rsHmzikIN8idfl
         pa6TcnRuzWh5lIJztbmOYzZxpnGJ7UYB0d0Wyj2lUyqfRZeD0G9qgfYbt8bIGg6V8Bw4
         K/sA==
X-Forwarded-Encrypted: i=1; AJvYcCVTxbkkg59zVyZbHfpr9GeJsH4oWBa+ZlhkMxeSiuR1dmGK6xo8RHCcH9Cm+jIc0hA+Se/ShSu0I/DFyCBFBHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvYR5k4M7dBellLaQW3oN+8uJlrpttHOS/akv5SOpOFy7pPbdu
	9KpDrgljZiXJVYsIVCVPbvT/Mlz6wvnaTU/c3/khz3uusRdQ04CdiQISGw8VKgk+mA==
X-Gm-Gg: ASbGncsftEsK/hPktbxBScJQX3ei3Etz69dXFa6w9l1LGtUEqXwENDE/5HB+qf2vndR
	uQZuotEgun2VleNX2es1HgoHMkHwjTpHk6i/TkTtfoN+9gTvRyjckjogEV1zdU4faUHCSXkK9um
	zf8xzHlQ1Nvio4L1VKn0IXon5fsQG5iqLNdMBorXmLU8lQ5BPYxrJbedYbn+yozS4I4ni1JovHq
	PGBd7FZCM+nMiERPWRXRBh6N7UxRF9vBZuErEPcb+CnNRbbnwKuuSezlYcNc0voaZqYCNt+gZyC
	DCHNC7pxS2ztphTWiwsZekLdaYU7nfQI0swnviKIrnjyffA/L0acGqs/zrnxhdV7rkLpvV16LEQ
	6uly7AqPwIP4j2YW/TFll1XVQrGmU7+jfv7NFbBWVXPjAmIILMkXILir8PMNHNxyZ3KXMZ/8NUz
	R7EMfwQL6OHkBdrbKTZOHdFTEJVTmF
X-Google-Smtp-Source: AGHT+IGw+xASGD5iDLfdgpAflDlmLL0c/ls7XDKeDwt3g+ZHIWOjmN0GPr8i61t/oBD1yS/q76AXeA==
X-Received: by 2002:a17:902:f602:b0:24e:3cf2:2450 with SMTP id d9443c01a7336-28e9a5cdadbmr43162355ad.2.1759510967432;
        Fri, 03 Oct 2025 10:02:47 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:9212:ce9:ffd0:9173])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-28e8d1d5358sm54712665ad.103.2025.10.03.10.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 10:02:46 -0700 (PDT)
Date: Fri, 3 Oct 2025 10:02:45 -0700
From: Brian Norris <briannorris@chromium.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] PM: runtime: Fix error checking for
 kunit_device_register()
Message-ID: <aOABtRxgm7maMsy_@google.com>
References: <aN-Xe4lgox1cCAaR@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aN-Xe4lgox1cCAaR@stanley.mountain>

On Fri, Oct 03, 2025 at 12:29:31PM +0300, Dan Carpenter wrote:
> The kunit_device_register() function never returns NULL, it returns
> error pointers.  Update the assertions to use
> KUNIT_ASSERT_NOT_ERR_OR_NULL() instead of checking for NULL.
> 
> Fixes: 7f7acd193ba8 ("PM: runtime: Add basic kunit tests for API contracts")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for the catch:

Reviewed-by: Brian Norris <briannorris@chromium.org>
