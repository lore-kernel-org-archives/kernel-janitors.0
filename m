Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83844254B0A
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 10:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740738154; cv=none; b=jLn59crfHSsC9FjDYRc32vn34x0u5lf1FF0nSOa0V3uB1AunUmm/dB8ZXv3yvexNzO5CIzwDl5i6eQXKWISyEn9VN1dQetAf7a2A349tzEueIE2MAnTg6rYKoG8QDLvRqkpGb9Ps+1XtGRTxrjGFOBHeJx+Lk/VRztBxff3fU7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740738154; c=relaxed/simple;
	bh=q9+IlSHTysuLXGwcVeT+yMYlF+AeEVla2PHoUzCEQdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtPvVyQnjeCGivjWHEsbgd4seukpw6Nb/UGMrwrxsBvuDhlpuBuyrrbV1YpA/YPqlnr2GvwrpQnF2edzVTX+15Ns1jOYyYKsr81veXXeJo1Xk8RQF+Imq6evB0na6skgbVp/ZFb1IG53O2C1e63+7hacMRCGYX4stLCr7ObS/kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BwBr/a0c; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BwBr/a0c"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54605bfcc72so3474611e87.0
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 02:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740738150; x=1741342950; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5R1GwEARUIu4D0vBS31y0VlPu/BaWoEI502D8t7cc8=;
        b=BwBr/a0cG27cv1nK9Vvt6KhjrEZG8voC8islMNiyaO23VpeteXmo++DGUZi8ZRsGjP
         izyMBWg8CKpmYsI5qRajp7ySmI3ByqvBFTA/hNy0drhdhHsuZmF33MynjkOrh8pCYLSJ
         rWcSbOYbJ/cpiD7e/jmULastMJ8Hpxrh5+3DqA9iwklu14tE67ftdG+t8G2LFRgZ/nhZ
         9MzBz12i6CsvB6LaCEbYWN67Q2efD3KJsN2lieUj68jtfXuHhKjxOYIyCGk0LigXK29G
         Myihf9Me9L3eeSAi8N9SBA3Oa96Xcp8awZka7rPe3vgwFD2ZwMxvRFNpy3Aw7xe3MYU9
         zPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740738150; x=1741342950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5R1GwEARUIu4D0vBS31y0VlPu/BaWoEI502D8t7cc8=;
        b=sJesILaGJ0hNNECVMRmF+wcTpR20VERIQpqBx6N1Y0MbwKXgdVngzWafS4ehayv9hR
         PumIVqmrY46+1T0aSuKslFnz6Nw/z+itW38AsO3uM8/d0waVuwO4GeLC6O2fOZJ5qeFA
         QEeVrvh7X9bQgb9MEb+TuWrjjCnR5NihKTzyUbqs9o80HVd02BQwdGqVK013GAZrGV6o
         LIq2k4XZlYgOltJrjd27YpJ2IFELaXe03U3WnPb6Udsw8YDB7VkXU7Pg6JxDAOGZ5Xeb
         Mo7Y2mcKUpfvZJNiJuhlq97uOw6KKTCNkXo8KwH5QeCSn3h/DvmYbpvscn6DXaezuvgO
         Z/ow==
X-Forwarded-Encrypted: i=1; AJvYcCUAILs8RDe9sUUEuAWKQQWP9uX6UYaMdWACgs7RCFii3GDdaJbr0vvxUJeJEHhYQ/vL4gk3H+TptkytCjgOF3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzteZptdBmRuIAlKZhMjjeARebYJW0Cym9ODjaMcasT3J6W5wXx
	jKZIUFf/Jz/Q7zESOSVugRl/fCiIGTnYMIPl342LKBL/eR/JPbDVM72Pen6pAcY=
X-Gm-Gg: ASbGncu/yNg+BnXPc011D2HieYU6xVYuijwxZWmtbl2sszRRpZfIupIj8IhXBsOypzt
	+ejYP8A5cLgKno+HAroLZtW9eUPvKY6llrJxWqJQvy7+R3ynKjPP6b5omtxGQyAvDgnG+hbDg3Q
	J2E0PrGR/Ihj60mbOqfV+wLOU8ySaQH0DfaLyH6I/q+rfVs6WNfu47PIO0soGrifQ1+vLLD2/u+
	YFec6jX0YIKxW2pBWuByrZ5H4g2DXC08T+xPEK0OEPjoLugqirLwpK47vj4S+T1m4aLAvQdUtH7
	m0S+5wff6GylcOCzCl3uRCPE+CaVIuaGjRQ0xvfp6SZxGiQcgaT6gD7jfidym3RY8tgddpwePTp
	iByNjuA==
X-Google-Smtp-Source: AGHT+IEcFPCTorTFbzvj3XxGZ+gp0Pdf9edgu6c5mZ8c9NQpwr+CURuqlRmoz1kSiZZiiCQv03r7hA==
X-Received: by 2002:a05:6512:3b99:b0:545:c51:4a03 with SMTP id 2adb3069b0e04-5494c125ad5mr998344e87.11.1740738150508;
        Fri, 28 Feb 2025 02:22:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494e8399c4sm197441e87.213.2025.02.28.02.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 02:22:29 -0800 (PST)
Date: Fri, 28 Feb 2025 12:22:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/connector: Fix spelling mistake "provded" ->
 "provided"
Message-ID: <57owgwkyiaxw7xckoug6tsrzk3g3z5yb74wp47av42rrvhxqby@tzr5aapdua4k>
References: <20250228085350.678446-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228085350.678446-1-colin.i.king@gmail.com>

On Fri, Feb 28, 2025 at 08:53:50AM +0000, Colin Ian King wrote:
> There are spelling mistakes in drm_err messages. Fix them.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Fixes: c627087cb164 ("drm/connector: Use common colorspace_names array")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
