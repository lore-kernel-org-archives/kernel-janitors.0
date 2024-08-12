Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE0516DEAD
	for <kernel-janitors@vger.kernel.org>; Mon, 12 Aug 2024 10:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723458766; cv=none; b=dNFM6+hf2rSHXHRTQJ6zSgIvsHbhhYqICEQfRnUvCkhW01fpSm14j3iS99Y690DMSQrf/rAitJIDibEwWDNnko5gkev7DBifA2zROcKtq0biQRlo/HnhKpf6rXBCe0TOHiH+04id3jBiSwI/zHEuEdxzHRT3b/7KZ88Z/GwGApU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723458766; c=relaxed/simple;
	bh=Ht62vOhMcZrjLamlCSfxgzc4eTH3YSmA1P+CsJkd/PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvG0eEvbNEE81TcAZ9/JS79VBiSYIpdFExBWpbbspMSmqB18jMO/AUELGAXOH3GXlGWZ769/k5O/Wa4MdzZr5V5HZgFikLDNzxPYZDqM8RZnHh1Q4Y/3lv6LHP6et3joS598OX/DSGV5V0fuw/k1SaqCmpkhG4IT9jzX/l0AoCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o+yGHRoU; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o+yGHRoU"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7aabb71bb2so432249466b.2
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Aug 2024 03:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723458763; x=1724063563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MuMB18ettI0lvCVPN8Uzf34Q8sUnJqKE6aKvTS+gZPo=;
        b=o+yGHRoUa7A0ybLAocXtnlhsBWvoQoHQ3UlgBzFInvRuKb9Uiu9DkFEgidAxxlidO/
         wBxiS0xG9wyggxuZVMo27dtTS7SDPscaJ9rcqdpHVHd0ZumNxOF0XnxF0JdKj0Wnf1Lt
         vliyxUS7Hmu8w5Li0resm7r4JHqvK3z4IbT4nVk9DdblrRmUSE5Dtc67d3e6FY6Bh2wY
         tY4awBcWV7q1FmG/2y5m2afrL59zl3rFszn274hxjoaeKTTo3JKvR9QCg0PgQtfTqyrh
         9WYaOgkZXuEgkDGZcbOTEJPvTs3TgjtM+ibPdTwItmN3mU8bs5aVcqQ218vTfoZGTgTU
         WI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723458763; x=1724063563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuMB18ettI0lvCVPN8Uzf34Q8sUnJqKE6aKvTS+gZPo=;
        b=EbNx/rBi/xsKZrpOmwdU0emVn0CE7KNI2gQnZf3e7mguIZOXPLvA09D3p5HHHTEUJT
         +vV1PfIx7+Kc06JXhYFumFQ8Vt1LkaR3Jrc6kUuYAFFlN3+qAk623M7X7x5BtzdUrTog
         ei6pPxUuLAL4/bDu/W6/Dx+uCNIutDoKyt9boTNNfyUxhNZybTDcc3wA/4aY3difnF68
         WbrGLGBtbmqmIFmrXRB0FAYdK/iHUwwsDVpQFi3yUK+GPGAUZJ0j1h5prFsQeUZg1bGF
         p78LoAMKNdilQY8lt9TL0bc17iH59cyffIx4NGuOfstgBi/BKiTtqN3hkLS/gDayWhH1
         DGOw==
X-Forwarded-Encrypted: i=1; AJvYcCVU0lE8t7p8GgADB8Cvzr3IEqLKy7u0etT8aCl5lcjTKes2WQytLF8qigRWhkvAEJXjDyS4LJ27mQ1RWb5JW006oCzXrZ7V7ZfP+XhXoylP
X-Gm-Message-State: AOJu0YwSc9d+uvhZLPw/V4PWKCBIjbaSgbQt6zhYFycD2hRpKLhx0loJ
	YI05bMXh1uuhGB61gadnuJV+dBO88H3E32vETT1bmZV5Dijeh6vlw/yH/Q4u2h7wi24beesVr/h
	F
X-Google-Smtp-Source: AGHT+IGTb0RPGjV/HCXKGAbFBigJr9D3mcpwdhEQ4rq2EtnP9756Nqrz7UcEH7QHfheStLdcF/BGHQ==
X-Received: by 2002:a17:907:97c3:b0:a7a:abd8:77a5 with SMTP id a640c23a62f3a-a80aa654862mr717740566b.43.1723458762661;
        Mon, 12 Aug 2024 03:32:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb11a5c3sm218864266b.92.2024.08.12.03.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 03:32:42 -0700 (PDT)
Date: Mon, 12 Aug 2024 11:24:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2] drm/ast: astdp: fix loop timeout check
Message-ID: <4b5923f3-27c2-4f7f-b3b0-542a62032b64@stanley.mountain>
References: <9dbd4d2c-0757-4d5f-aa11-7d9e665e7633@stanley.mountain>
 <8c1ad0a1-bbc5-4274-bdf5-fcf2e043a869@suse.de>
 <10624c71-d134-441f-a7e6-d757b60f54f8@stanley.mountain>
 <2af277bf-f07d-421b-8ffd-25c9761e3eed@suse.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2af277bf-f07d-421b-8ffd-25c9761e3eed@suse.de>

On Mon, Aug 12, 2024 at 09:30:00AM +0200, Thomas Zimmermann wrote:
> > I feel like if we really hit this failure path then we won't care about the
> > tenth msleep().  I can resend if you want, but I'd prefer to just leave it.
> 
> Please resend. Even if the link training ultimately fails, the rest of DRM
> keeps running. 100 msec is not so short to shrug it off IMHO.
> 

Sure.  No problem.

regards,
dan carpenter

