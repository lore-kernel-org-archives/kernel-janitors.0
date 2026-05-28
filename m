Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36F2260580
	for <kernel-janitors@vger.kernel.org>; Thu, 28 May 2026 06:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779949121; cv=none; b=WsHpTiwJbvojYILxz8XkkkHufrqIKHjkUbZUqgP+Ay7hsqyZoz9+Aue9JKf+r1yM/c8rdhQ6U87o9eVWKlOoSknSq2rNDjQOTuuiCXj8PffR+J5KiTwwZhJGoymy1Z1znl/UIlLbSqnE1Nsre3EAp2QRUkse06iclYAY5sxvL4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779949121; c=relaxed/simple;
	bh=cBYhh9+9lKV2kQqJfLCbZ86xlNMvNm9ttBlvusNRvYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5i1KBNKxszNd8xJRuELwLr2ZCeDxSlX38nT1+9M22vsJhhysgeGVegmaBlliWzbUMwvTH8DeclyCTfMpGs0+dZZS4xy77sbFV+NAmgJJ0yH3CXVbq3lPm0hcnnxDLRGuXY1MB6gTrxAOyv7Q0GiPDI8rJ+ftSzApyUnlDr9apU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2iewQHm; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2iewQHm"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45e8a834cc2so7386229f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 27 May 2026 23:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779949118; x=1780553918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eDowC+J9NkAkNKGl2xFdM++bofz3BCUgA7OJQhuHtSY=;
        b=C2iewQHmQRhnU46vLdrotBUBsoffrs7z2KgZKm7GelELvfNKQ8X+m7pmatjeoISaZ6
         PGJlBzp+aew7LV46w1OkgeYYOuGUbzj2fZjtrPi7sL91uNDGffsnKWTwlnCNRBePhylc
         eKkRfuDIenHD5qpsdRRMXkg58hveYXvI1KHJPlSCA3+eoWb81dGoTFerg6Krea/cQuLh
         /E6xs48FuwVb4eOFjOIjWzwgMgK1ghfTDWyF4BHk2ewjK9vOZjbRGLWBOLvt+zWHOTev
         MVkGkh0AMO9UtcE2VmPWPQLhXWvTtDr42UhFD/Gu+od4QaciSVf95fD19M1VOvz7ABAc
         zYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779949118; x=1780553918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eDowC+J9NkAkNKGl2xFdM++bofz3BCUgA7OJQhuHtSY=;
        b=DAToG7+d2CfDyBDMKeRnnxQbB6cnvLT+kefB4OVVwD+yIFaWjRb6Ck2uBMsOjVM5pP
         JKCJlHTESexlcjBpWMMS/fJpygMR9Jj+3dnyIDP13kCn6IEYookY/N06YH/ZAu6pBJae
         MuuZ1dWy5x/DA1oqOebto0uTeYU1NiL65d2oz/WVIPsecPqwbiUY+KfMnjly6aToL5HV
         DwpSFN45HFF56lw//5X0Ivua9HVNeyIv/8md979ZsVeKebQQHVxnNUpdcgsB4w6tyCaT
         quXuLAHgUUHa7AsdfDrJVwemYj66Ll3A3919Sjuh2eNWovBvJ+mhie0ng6L0LRzTKXDj
         qjyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9NYHaAOVpV54JWvP2CN2pv3+CAWH390wHIJ7UIlyuf/cguNFK+XBhdc6O8mTFMsWF+f+pD4oWXaA3lBd1idw8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1yOHyPdiUtngXpCSYJzUPTrPuwmSjevIko9MQe3V3khUeopOU
	kUQg1tw5FyofasPCYg1VR43qdQ4ElBQ9zBomBdGaLWXEB65sJYAxskjx
X-Gm-Gg: Acq92OHqduNUzU7xt8g4izyF14/5gN6ZSzQr3Ve3EOZqmmTHPHaL+iwGD7OslJKzbvC
	7xHmelLfoTpASjRK/44HRj9odNSJjSWGJLGifg15U7uw/cJx+18HLl7yKJC3nSXWDqobTGAMfuW
	b9CobVrTE9K+9x9Pqm1jYGfvsZoDTwj0k09avXBaKmwFAIh2uteIhEj7CZRsBhrP0k1JtNBhBPt
	41w8C6+omE9vMSjhxM+iYbZhJVF8K7VKCGWZ0yU61SSnrDTW2JG1afZpweksZ8px4gNu/6E8NVW
	BWS6SJOCK1S+orkcDsWBnJHQNfp9SO2WZC+jnune+j16CHdhhdaTbVkIM5REDrXty5myqh2M1Wr
	muoX2WSo9umwn9L+o5HuvnlVfAPuBeSRBSIxnRW+TnkNqwj8E+A/e6hGoqi8fS8BlwPpx/OVuFW
	2oMB5oMEqIcZubniUUwJ6UB0aONuBq5pA9gg==
X-Received: by 2002:a05:6000:480f:b0:43f:e43a:f4a6 with SMTP id ffacd0b85a97d-45eb3691f71mr43798818f8f.6.1779949118000;
        Wed, 27 May 2026 23:18:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5a281dsm10925489f8f.24.2026.05.27.23.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:18:37 -0700 (PDT)
Date: Thu, 28 May 2026 09:18:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm: zynqmp_dp: Fix uninitialized variable in debugfs()
Message-ID: <ahfeOh091V3BuuaB@stanley.mountain>
References: <ahP3Xagt1LJrhmFl@stanley.mountain>
 <935aaec5-5417-3cde-f944-3c04ffbd3458@linux.dev>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <935aaec5-5417-3cde-f944-3c04ffbd3458@linux.dev>

On Wed, May 27, 2026 at 08:31:59PM -0400, Sean Anderson wrote:
> On 5/25/26 03:16, Dan Carpenter wrote:
> > If the *ppos is non-zero then simple_write_to_buffer() will not
> > initialize the start of the buf[] buffer.  It doesn't really make sense
> > to allow non-zero values for *ppos, so check for that at the start and
> > return -EINVAL.
> 
> non-zero ppos seems to be handled properly by simple_write_to_buffer.
> 

It's not an overflow bug, it's an uninitialized variable bug.

The simple_write_to_buffer() is designed to handle partial writes so it
leaves the first "written" (scare quotes) part of the string as is.  But
in this case, we can't handle a partial write and the first part of
buf[] is left uninitialized.

https://staticthinking.wordpress.com/2026/05/23/simple_write_to_buffer-is-complicated/

Also this appears to be dead code since fops_zynqmp_dp_pattern is never
used.

regards,
dan carpenter

