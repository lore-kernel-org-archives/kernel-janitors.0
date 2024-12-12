Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB89C211709
	for <kernel-janitors@vger.kernel.org>; Thu, 12 Dec 2024 12:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734007521; cv=none; b=A60sFM8dbgtdL26fOBhq+e4iKnuTmDolzdFDaXM46X/HwUD1XFFev+zywOMyFe+QWQCQ5EKDMHoWMqFVlXU/Imze48FT1pqmZ+38hbQWFL+CKEWMCeW+OzQisBlvqm+//6VJusfM8uq9uFx8d1WH8it9E5rCTfjTy61PraGNuBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734007521; c=relaxed/simple;
	bh=a1c+csz78lwGyO+6sWEuvcLVxfOtf9ra7N4OQm7xEfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eskKroeod8iKiYf9P135ugQCUNZ5g54z+pV5h6f/Xfaff9xaq3SkYMuwufn7mNgklMchz6HChcd1uvTi9m+U3fE/7ExJpPbUmxm/p1a8Xzpr2KzWdr7IZF0iGinUunMO6q+ezVsby1v3wW66qhoeoqX1HpDu9z/zjBK3SeLAOoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CaVziD81; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CaVziD81"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso3566205e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Dec 2024 04:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734007518; x=1734612318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b0MIlrd8hgKTeaMZkhqf3o5F9gaR/A/34B2prwrX9Lc=;
        b=CaVziD815998e6WExfp1njY4vMIzDEljtLeVj7vNyv939K77cnXT0tophhnVUMHZJW
         xY53SholZrTDWgeliaSI7OGBf+PRx4gV3yy8oDX5SfALR7HmtFD4dPKjNylrtRidFd15
         aEijEwwa1LH/q9uP7pD37azOn9/nRNRk9ps5Q7qSA6UM396z/Li7Aq9eItpbC2Cfo0v0
         YFuU2F4Lb/l1MSwVym/h/hJdHhmxhA9FNQXe0luRy2IVcfov8IDf1WrWqG1olAzlyeKH
         nUzqKGpOPTedbpYtVzDHCCH43wRLN6v+hq33vIS6mdSOkJQFpi5DONNwmbmDPsxvdf/z
         9/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734007518; x=1734612318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0MIlrd8hgKTeaMZkhqf3o5F9gaR/A/34B2prwrX9Lc=;
        b=TvHA9KPdrN/NVxbzvy8mjoTKrybE8Cpsf+U98ddSFuP01/+Q6NQrIohnVvUzDmIlpr
         oyTvgS8X07l8Om1fQfUFbuJKZgM5T5WkFVNBh25X1hxpw17FWKgR6PYQ3gc00uERzxoj
         FXwteftMqKx4zbuuItOB2p5fAIDvg80Tdg2YEDY507XpiXnM8WersM9S034XU99gETzS
         y163M6wOZeRvDK6Q3sxsd0MFQFt9X4fZUjHcojECd8on8rcO/yfZXtTM9JoyqUg9JA6W
         vEgW17fnucS4R4ulOudSTrS1Ea7lnA0rw+ba8W2ZCea8nyWa2NAzIte3uvJ0d2RBw7HS
         aD9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1XS+W7QBhzh/17YMhiZE49j+7SkRZIiZi6VPP0pQJsx9PDFB1vIOYdiObKPJax7JE8ZyAabEtwk8ku39P2BE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxinW1dT8Q7f+iYU5goNdDynnA5mewbhgxaJUa29VuYlOP6R+Hv
	w+k3QGbCXGA794de2UM6b5RRQW8OLbbGfUhMue1Dsu5miE3CscpxpCVBk6uNHVU=
X-Gm-Gg: ASbGncvhHEGJMRhyDPTmouGuKEOXR9q8NEgUgsBsqxO8LZAUTLUnYqHFjeSJH/rSR20
	MNh0E8B59kv7XhvjQMJY7gDmnW3Bp7P7WFTkm6ZrYIyUSK65CdZ/PWntZrDtLDHOLlWoh8+eBWH
	Dkz7JVmdhe3VnL/yxEmPgo7lYaxpeoyjxNRJc9SENBlH51rM1HorY/f0a/tLqyYp93xfiUu2RDd
	limgJBmY9/yW+lChaNPcFnwszppv7m4pnCXyPEk/w7hZBZJllQwpBLd0rc6rg==
X-Google-Smtp-Source: AGHT+IEyNpazD7YeXxHYvPwjQS+Xs0/1F2YZVhWJvmtRAVKWT7Dsk7UichfBnzoTMoxDG9nSIZeQ6Q==
X-Received: by 2002:a05:600c:34c6:b0:434:fe3c:c662 with SMTP id 5b1f17b1804b1-4362310c025mr22321795e9.12.1734007516330;
        Thu, 12 Dec 2024 04:45:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625716e5csm15409365e9.36.2024.12.12.04.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 04:45:15 -0800 (PST)
Date: Thu, 12 Dec 2024 15:45:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/vc4: unlock on error in
 vc4_hvs_get_fifo_frame_count()
Message-ID: <92dfd6cd-2e10-4606-9502-3619c4b265a0@stanley.mountain>
References: <02c87d9c-76b8-4d93-b0da-0e4f7d4952ae@stanley.mountain>
 <CAPY8ntD9XzrzrhX=1XojjcZmRm60KLc39HZq0bJ9cEq0J7nQ9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntD9XzrzrhX=1XojjcZmRm60KLc39HZq0bJ9cEq0J7nQ9g@mail.gmail.com>

On Thu, Dec 12, 2024 at 11:54:28AM +0000, Dave Stevenson wrote:
> I don't know how others feel.

These days we have "warning: this statement may fall through
[-Wimplicit-fallthrough=]" which triggers a build failure so fallthrough
bugs are pretty rare.

But I only care about *your* opinion, Dave.  Everyone else can bounce.

I'll send a v2 which adds the break.

regards,
dan carpenter
