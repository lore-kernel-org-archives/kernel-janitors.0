Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277C530B539
	for <kernel-janitors@vger.kernel.org>; Thu,  4 Dec 2025 06:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764831542; cv=none; b=dgESHUV7K00AKGrwvTvsMe18VDLhgH3h0KGLCWtmcnwF3c13NtlbgvBH+/9t7AOOWW3/oJnbLW/uboPe1XzfMQ/fXwy1jnhYD1ux5EF3etqFpwXRs2kxzY2LD+nF2EjBFw5wpJsYXjbAqXI+7jQqiKXTichE4w4eyjSq5As3Zr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764831542; c=relaxed/simple;
	bh=FLVYwv45ELn/07TAYyC+eU+BsaL9KbK13lUXzd/xqdQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hTC3SJm4VgvBGh68rspulXldAwNFLA5AbrCzW6vUgKEnj8xCm+zpwcmd72Vw8Qzc6OmTecHuToGKxNbCg2YeVdZCq9OE6TLI0zi9EwwNuhf1GfO8eKz9ucG6uQcjrxsdM+zXR4XMoWk9ZRJp3yFELobWvZducBw72dza6vPW6/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W4CD8DwD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=n9hYZPfl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W4CD8DwD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="n9hYZPfl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764831539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b1dUiMKw0m9OgEVcpxGNs60yf3zzRP2Q8ePCg7lCbBM=;
	b=W4CD8DwDwa3P1RbzQugIZWMWcNsvEqiDaY29IUnn1HJeV3Us8EgPDbuspYJ9VWUkk1V5m/
	auxYZ/WBZ3wikS8h8M0A05tp8t/UAK0YvpRIi8VmjTXAjpBZuvD7sRn2Qfz5mqsFKxobig
	gofg3yhME9OSPK4A3F8/n7RYtqECiiQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-E_dQEBc5O0Wn5TsSGkWZ-g-1; Thu, 04 Dec 2025 01:58:58 -0500
X-MC-Unique: E_dQEBc5O0Wn5TsSGkWZ-g-1
X-Mimecast-MFC-AGG-ID: E_dQEBc5O0Wn5TsSGkWZ-g_1764831537
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4779b3749a8so3959385e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 03 Dec 2025 22:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764831537; x=1765436337; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=b1dUiMKw0m9OgEVcpxGNs60yf3zzRP2Q8ePCg7lCbBM=;
        b=n9hYZPflNXLp2hoA4j98NWqAmH3GEOWjOFle5G6QddxodndiC9N81rSets/XVTqw4d
         Cn0ttHoroPARom0bjySBE0Rkhuqz/sTmHHRjIIh/A0mZd48mfwWIBwxVmYT5akptU6hR
         bs68wSy7slEOyKZTOnxj9s3YyVLG6fu/CLOgvx056LfXcG9g0AgryVJKJYGMCjkzMcux
         KMPL/s7HkQSPWOkErmN4nfxWyo7qLAFWp3Xv23L9xPgbCy3Azr32i8wo4/9MfT0vQO/5
         0EJxhNPkvJHRs1rF2yzQ0fC95VtI7DUCxN1t6ML4BYQeKp6G03qF1lLRsLGuFtEuBEY4
         sGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764831537; x=1765436337;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1dUiMKw0m9OgEVcpxGNs60yf3zzRP2Q8ePCg7lCbBM=;
        b=Qag25OJXTTM8m+0g/rKRfdW18bvS96aztKi22kyJxsnwFYc3AYmuCPQ9Rp5qnXzGdi
         oSp+OalDPzNu3VjBPKdTWRxm+7ScN35+BlB+ipzFwehT3ZOKiy2Zg1xTwZhTR2TIJfJK
         i8lysDaPTfescdjAjTg5ei4R7HAAQpOVEykxkk0Bpo8gRvlRVbS2VXf7alGZAQ+TNCr5
         kZX6XBz04orgOTJEsQWrtVrZjSjHdx5xsOh6uUIup/qF6X+okY3UkMwtMtqrQWZEhr5+
         +14HjpdWB6adeBVsfwE3NOjqM01RTwNk77jnLOVSvofR8kh+HdjeiGDj9IdMkRUNRFho
         Uf9w==
X-Forwarded-Encrypted: i=1; AJvYcCVz/7ilCUXcQ+NugRCiyFOEaAYP0tgMILvN03Qa9KHNldOiIHlk+dR0SHkMOP6EiLInH5j91RguRKTnmugIQGo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0QSqBVau2jOsmKERAkGGF6o1ZR31VJRdYH3OxBqA6qI0B7QuS
	FPXpiLkQd50fkATLfuzfledbsvXdJEONkmrdNpqr3O+DVXlHDdhxVIu7CgpTvyyFlWpCWCZFwAF
	ZxoZYUSXt0euWZE09HmBVKGXfSd8m5t7u/Jg6bjfvGJAzU4ruf4Yi4BDI4Q+lYi/pikVWjA==
X-Gm-Gg: ASbGnctbFhBPogNh+qgb9STGOEIY/Tkoo3eBPwO7v0kFAoFJBpOTVraBLcgqO0moAIL
	5wJFdnqloGJI61ZguKhhEsuD4sN6NTguDpHc0FUs3cy4O39fsq7VeJFZ1QwsZO3ywNWQLpCpM55
	eLM58yKoFqCrbo7udDZxWasXZgo+UU3okc5MeVOHd23CxSJovvjpiU1YAT9xMZPfqolp+RDNAAA
	DG9sGDvjvS/TIe85lCta7vhKL8tQ4A8Qzf4l1GrVOUAlqwl+nrrRdLkOrJrtSwJhDcxUclWJ4KL
	8cjiKGu3IvLTSA+TgilF7M9BE2ZE+hSW8Y9mvyW4wKrx4Py+nxf4Dc/L7OIPZWogdIf1JoflzRp
	3m4bbguLiDJJzmHOUfke47+px6n+UP5/j3+e9T3ISd0gfGJHgisyBF88yRujmM52kFcZH
X-Received: by 2002:a05:600c:470a:b0:46e:396b:f5ae with SMTP id 5b1f17b1804b1-4792af34f62mr57868295e9.16.1764831536892;
        Wed, 03 Dec 2025 22:58:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJx2MgmvBWhxcwH/t9cq4qgpf/8RWK2dAXWuJnkHcfFWb6Y2/9+dXROv4VUqnLVPbmKN7bDg==
X-Received: by 2002:a05:600c:470a:b0:46e:396b:f5ae with SMTP id 5b1f17b1804b1-4792af34f62mr57868115e9.16.1764831536503;
        Wed, 03 Dec 2025 22:58:56 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4793092ba4fsm17681925e9.4.2025.12.03.22.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:58:55 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Zack Rusin
 <zack.rusin@broadcom.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/plane: Fix IS_ERR() vs NULL check in
 drm_plane_create_hotspot_properties()
In-Reply-To: <aTB023cfcIPkCsFS@stanley.mountain>
References: <aTB023cfcIPkCsFS@stanley.mountain>
Date: Thu, 04 Dec 2025 07:58:54 +0100
Message-ID: <87ms3ypwb5.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dan Carpenter <dan.carpenter@linaro.org> writes:

Hello Dan,

> The drm_property_create_signed_range() function doesn't return error
> pointers it returns NULL on error.  Fix the error checking to match.
>
> Fixes: 8f7179a1027d ("drm/atomic: Add support for mouse hotspots")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

