Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F893793D2
	for <kernel-janitors@vger.kernel.org>; Thu, 28 May 2026 08:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779958801; cv=none; b=EdDCIY9HJOT9QDq3YKX94MmkZM5gxZhLZfP8ZvUf+3lE1C936zMYzpDems1xeadin1fJXYEhYVtuSdFQxjf9MWFgBBmmhFTqHv5IBUkuB2nfRrOyyzxY9j7B3EInO9CVyhbP18UF57SBwOCCTu14HkqE6A0VuoB0f4+/WrVQQTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779958801; c=relaxed/simple;
	bh=PvJzGSkleW56Vujfk2IxYFkzTxjlsh1WeVJw7raldzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9te5lh5TYexmktP57TkIzDlJSM95hfqSfJ5HY7xXzCEuR9zrf/rc5iMlWdih+OF/DMzYAeHY3nWe8eSmSOcrw4j5pUFKc+kgDiYANh4t3MIN8oCVAV1SrToleR9O4UBj9SWsynOGJGTRAWBwLotsE+Gc2ks+fGjVdtc1tRhgbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n9KNIb7Q; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n9KNIb7Q"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso43852585e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 28 May 2026 01:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779958798; x=1780563598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KgapLk0U8W9ohmKNOKBlmGBZxDjWC3tsNDHbpGJHrbQ=;
        b=n9KNIb7Ql9HC/XN/49KEIX5SU7f2d6ndMzWAj0Us4jRm75ZD152VgY3M0zvjH2XrP4
         R2TtEyNkyJCfRq3SObVZ+EFNAsu50qCvZluNzMmQn7NulqT4Kf1XudXZN53A/jdbsENR
         raXNpnXJBM4KyUJNjvgRR5tBuN8+4pz6MKocdLKaF+SdCHNIWewQ1KKpWGmC2hK1Lu1E
         9l+AH0Y1VWYNj95IM+PJfcCdwuJtESatW/Yg2FzwNrUPEOio6ma9Nc0AMiBLYDnGpb9W
         Sgq7h3UPxLxUzHfqEhoaJswqK9fdpnP0lDrj4XmhRbMWW5pfLxZsYeREi0Bf9HihvpHN
         qHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779958798; x=1780563598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KgapLk0U8W9ohmKNOKBlmGBZxDjWC3tsNDHbpGJHrbQ=;
        b=E7fwQj4moNK61wY8FF7n2K5pS1KWi81i4wN48+8vwsrWRpjzstJvgCjFcdSRkyzF+4
         JZ5Ubj9cAvVt4yxO9DN6AyP8/7mQ7t31IK/7C9zw+IiEYA8lkHfAkwKlXcaPq89gEhKH
         dKA8MSfM4tAexJVzEa8NLdqMfbXfySmt5s0Qq2pvNK482jdnX0Jy8qryzShMhWOe2Qet
         ZgKzrnG5IpFdpoeQC+fjcoylT2A6gmyXAEGL8LTIzrkzzz62aQOuxhj0wESoUUdFQ349
         tabtj82QVmF/L29rXfJ0QgpQPG5owy2Tg7ShC9bOxYwJgm29GVEEB0wzfYbzzDPjgQtU
         ibEg==
X-Forwarded-Encrypted: i=1; AFNElJ8EBwzdCx7xXWp0VAer6/ytrngJRCxhF0sfd0T3KpwAiwra8+P7T8HWTleTt6Ax+L6oemPvlp+jyBsUDkVpo20=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTe18x6bKi6XTEucK5qfZuu6EEpavYjjYQIuX2Y11d0BirFMw7
	7d3KAcdgq8M7F89HDoA1L7G31cg7Q4SVY9jXaeEwqBU4Khs/gP+1t6lM
X-Gm-Gg: Acq92OGS2aG3mYx+py9uIsmxobHhMUi95c4Y1NoE+t+XipmAvEdLMJ61FFBZVpnRk0m
	H38hycOF1t6ZR+HuIoerlPvB/tvBJR0K7QHvg81V/qjxvn0Qej0IWqEVICtvgApzJPAg0Hy4gaS
	UYcQB3pNBJAz7xNZA55Ri8hJ46tABmgWRk8Viukqs4nJUgES4bI5xfOYgkl1504jnqM7lmgaJPz
	YthDdpPzNpRfT5WjVEnEYZc27o/GU8T4wK74GHHEOjZLX+1G8l5GkS3l8JoV9p9j4BN2ifqMeEv
	10GAxsAdT+grQebJXaHXOMvgxmhJ2O7lNkkXrlOs95xRj/hRt2BKuQw/xHKMULpiYvR02LJfWqe
	MjqauzjP/QGXuy1y3j5+DvnjC+95L6ZRATny6w+nU+VLWK76fnB7IUKxwMixftx/pjrl6ALXl5R
	h31nrwtLQxyya23v+ebGXVr451nDtmSRrX/Q==
X-Received: by 2002:a05:600c:35cf:b0:48a:5c23:cab with SMTP id 5b1f17b1804b1-490426bc737mr484669565e9.19.1779958797723;
        Thu, 28 May 2026 01:59:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49091d55972sm26972035e9.0.2026.05.28.01.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 01:59:57 -0700 (PDT)
Date: Thu, 28 May 2026 11:59:53 +0300
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
Message-ID: <ahgECVKG-djR9_l3@stanley.mountain>
References: <ahP3Xagt1LJrhmFl@stanley.mountain>
 <935aaec5-5417-3cde-f944-3c04ffbd3458@linux.dev>
 <ahfeOh091V3BuuaB@stanley.mountain>
 <9189701d-168e-1e63-8a6c-f6926029c336@linux.dev>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9189701d-168e-1e63-8a6c-f6926029c336@linux.dev>

On Thu, May 28, 2026 at 04:00:53AM -0400, Sean Anderson wrote:
> On 5/28/26 02:18, Dan Carpenter wrote:
> > On Wed, May 27, 2026 at 08:31:59PM -0400, Sean Anderson wrote:
> > > On 5/25/26 03:16, Dan Carpenter wrote:
> > > > If the *ppos is non-zero then simple_write_to_buffer() will not
> > > > initialize the start of the buf[] buffer.  It doesn't really make sense
> > > > to allow non-zero values for *ppos, so check for that at the start and
> > > > return -EINVAL.
> > > 
> > > non-zero ppos seems to be handled properly by simple_write_to_buffer.
> > > 
> > 
> > It's not an overflow bug, it's an uninitialized variable bug.
> > 
> > The simple_write_to_buffer() is designed to handle partial writes so it
> > leaves the first "written" (scare quotes) part of the string as is.  But
> > in this case, we can't handle a partial write and the first part of
> > buf[] is left uninitialized.
> > 
> > https://staticthinking.wordpress.com/2026/05/23/simple_write_to_buffer-is-complicated/
> 
> OK, that's a bit strange. Can you add this to the doc comment? I certainly
> missed it when looking around for appropriate functions.
> 
> And I like the explicit copy_from_user variant better, especially since
> we are setting the nul-terminator anyway.
> 
> > Also this appears to be dead code since fops_zynqmp_dp_pattern is never
> > used.
> 
> It's of course used in zynqmp_dp_bridge_debugfs_init.

Ah, yes.  I just did a git grep and the CREATE_FILE() macro confused me.
But obviously this wouldn't compile if we had an unused local variable.
Duh...

regards,
dan carpenter
