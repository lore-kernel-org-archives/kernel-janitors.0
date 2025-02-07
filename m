Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4278A1A7264
	for <kernel-janitors@vger.kernel.org>; Fri,  7 Feb 2025 11:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738928932; cv=none; b=nSHiBNtRADxNfl4Zi8XShr+7z0gi2/eHofMcLkCusMRu/Av6sRFqqKdH9/isPCOLNeELSiJO5OgNjxvtohXPhl8NVUa5QMxXd37eOHLbLDb/8LsCFqvgEqEMEh2SqnDo3isyvgx6RGds3kpMFnIuYKnqXdMmNpekX9EfrlUppRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738928932; c=relaxed/simple;
	bh=aOdbhIxfROHdpFOExOHjTZKvNnfkTXfFJJV8ILvcnis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eh4NWsHvpB+J6sNc/cwCXAHeT1MPMNHImDF6Ln7lEsLOdX7ZFvwzuM6JcZybYpZA944edK66JyZJ6taagbjZqwFQf77eG78KISibsdYT/72a2Ycn3tGxaLZ1OocFgQL2k2uxuHHK47n7RtKijne1wSKGXuUtwhSMVdfxmAndsVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zTAW+4FM; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zTAW+4FM"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so19497695e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 07 Feb 2025 03:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738928928; x=1739533728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dHNJ8Eew7Hg7Pyzt2+hfw+RIo9hE4aetoeK/N/PeZXw=;
        b=zTAW+4FM0XytLqj5EGLE4UWBd45jZGQiEn2I22a6noXTb/jW0NJ1BwxPGi4UWF1J3n
         sVSPDU+L/rmmD4DTux4FudIiC8ekcIYH2cpzl5sYEzZm7Ee3B3q3VyTVB/KFF3VL6BSH
         mjqeJ4I3mEt4YGANARUTMvwCjde6P1ZFpRr+vLgCY14poToRxPfofAXu05F1WsP9NmLE
         afdMrN7ff2c69ntrkIna0lPpMWX5EKvBRYs11eGc7ScIiWru223DDJQwRz57WMfHYh98
         n1b4MS8a3/vr75E35lzY+5dU/uTVL7TC611nTeNviBH2ZrgxdBg9XGKmqq7H/qSM+vkK
         9qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738928928; x=1739533728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHNJ8Eew7Hg7Pyzt2+hfw+RIo9hE4aetoeK/N/PeZXw=;
        b=pkNjAAtN49JvdetvWFAstMqhzOsw+c6Hy/TBgjU7ZJvpiizarUflhzQ97ErzpT4qVs
         CnY+MpvuMY7RwRJSY7rppVqMsGKa9YFt1G72X/YC73BRDIyNP8eYzJzxi8XIKgonidvC
         vOPtt+wP0SioaxQtfMNsS+G4M5xCgKh6nR3h0G1XduskVNBlxLU/gh/WKk51oOXbgLZe
         3RJsEEuELFEdHJ3RnZGfsNryKj+FV8B+qS8YXEsYo4Xb5NkN1t6kwgS3ApB102SrY3Fu
         JnaODfmpexMDb5RcwY1WsHXnF0sk3FzCN5S1espcyq7TK2u+i/JRsXxIdZxx1Upw8o70
         j8mQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3hirt2fPYDNLcDNrTChevlRGVxB9XYoNiPWjor30NJIcnWm7widWYCNJUiSNXH9SDT7kpaz94DXiqtNO3KhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdI9we6y9FBrN8XyvtFwlxrOCTH/Si/cWyqdnrFBqDJ8MsvlYq
	fNNwPWwvQtEMrZy5GwefLJVRw6tgK9V2LI2QKE/hmVF3kivjmeaut14YA4u70pI=
X-Gm-Gg: ASbGnctR57a2VJ7fMBs/XTZ3FT2nafCeumJDQjbnHcTHi1uN4qvY/o3Kua3aHeE5DKo
	2qJWn0ZhavdqXWgW211dtovOuEdKVKb/xYMh9JMLVp/xCwMu161yhJDsn56Wi4xgnM6eQrS+3Ge
	sdCfW3oMfjmwezuiYc9bA0WTzOt6iMjRtf9xzwFH7UfCpqkTFFo6v2aD6b4w7RZC7NWmU9lCgGN
	g/GEzz5qmBtUQInC008lG5Px1ExfymEN6gerI3OxjOWQRhFxhGvvfu1LvvQG6+RyPJRhj7xCu1M
	qNVVwiSRyXRZrWzSzVxd
X-Google-Smtp-Source: AGHT+IEr0OWNf6abQpoX6y1vt4hzbn9/9cpFB6IqywNlb0ApAbUXKRVMlqvR2p9ieTmDj/CQ8gYdUQ==
X-Received: by 2002:a05:600c:1d0c:b0:434:ff30:a159 with SMTP id 5b1f17b1804b1-439248d395cmr28322995e9.0.1738928928439;
        Fri, 07 Feb 2025 03:48:48 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4390d94d753sm87464535e9.11.2025.02.07.03.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 03:48:48 -0800 (PST)
Date: Fri, 7 Feb 2025 14:48:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andi Shyti <andi.shyti@linux.intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Josef Bacik <josef@toxicpanda.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Brian Geffon <bgeffon@google.com>, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/i915: Fix NULL vs IS_ERR() check in
 __shmem_writeback()
Message-ID: <1d15e298-4e37-467d-9527-bfd6215cf276@stanley.mountain>
References: <7f99a56b-d517-40b0-92b7-421c4fd813f2@stanley.mountain>
 <Z6XoU6GopCT-CxNK@ashyti-mobl2.lan>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6XoU6GopCT-CxNK@ashyti-mobl2.lan>

On Fri, Feb 07, 2025 at 12:02:43PM +0100, Andi Shyti wrote:
> Hi Dan,
> 
> On Thu, Feb 06, 2025 at 11:17:02AM +0300, Dan Carpenter wrote:
> > The filemap_lock_folio() function doesn't return NULL, it returns error
> > pointers.
> > 
> > Fixes: 25dd342f0cc8 ("drm/i915/gem: convert __shmem_writeback() to folios")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > index a784fb44e59c..fb263b421958 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > @@ -319,7 +319,7 @@ void __shmem_writeback(size_t size, struct address_space *mapping)
> >  		struct folio *folio;
> >  
> >  		folio = filemap_lock_folio(mapping, i);
> > -		if (!folio)
> > +		if (IS_ERR(folio))
> 
> I don't see this patch yet in -next yet (and of course not in
> drm-tip), which branch is it based on?
> 

This was in linux-next but it's not there now.  It came via -mm.  I
guess it's been dropped and Kirill will fix this in his devel branch
before resending.

regards,
dan carpenter

