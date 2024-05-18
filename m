Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24CA4C3D0
	for <kernel-janitors@vger.kernel.org>; Sat, 18 May 2024 18:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716055591; cv=none; b=gu1uHS7+JPMFCf8gGV9JJ5iINq3yWwM5thn123yU6AZYgDk+oeiuII3Rm8J8aQcrYWt9/d10URDzRb8L9IJrks1TWmiLulqxkhgt8fw1g/OwJ2Ajj3QBaemRW58rgNt2696yTYNylKq859eCWGwSlLwdWRHwirYSGbt7htzyLSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716055591; c=relaxed/simple;
	bh=SFtO3a4RKrkjrGHguXWwcDovKIMDazuVdb4cBPkaPTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FlA8d7YzyVdPruKVmf+0ujtUdOr3dB7zcAmDBYpTi3UIedRkU06Nl5BtNakTyP2wOJYQsVfoaEGu3mSWSA/55alq47rmfO59wEwD+ThegrKMaR8zgvKW2iu7SJ4QxPB0zmP3tah+dMqwu0ikheOkYspwU+0M4b+d/bg+0smqnDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dypsSydO; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dypsSydO"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f4ed9dc7beso1669099b3a.1
        for <kernel-janitors@vger.kernel.org>; Sat, 18 May 2024 11:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716055589; x=1716660389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eNjtPFN4gwk8FY4XhBI0pqmWHSzhdefGp6JGYF0RnSc=;
        b=dypsSydO/wW0nk8lSSROpX0nlTLl0hYxzIVWa8PD8KvF6CVya4v2vQHt83QgCCv467
         JkY4vrQDAuV7qZqFnkdZ2tV3gi0zz9HT7PvzNoRTUjKMC3PZyvH1KeAyHjebPDfSRxOo
         z8KZic9m1yBDUulQ1evYi6/Rj9ab2ow+Yxt0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716055589; x=1716660389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNjtPFN4gwk8FY4XhBI0pqmWHSzhdefGp6JGYF0RnSc=;
        b=VZkZvC6ciIJos8iweXR9lngUJv8B2SC9r8HbobPf5iK+aZRf9MOHmEpRHkRBk9TVFa
         TYs21VHeP7AEUqSqVj1scCB5p5nVasbJ6XligLr9R2EXeDTwACXOAUgpfrRSgRityeVk
         75vshLyf+R/2HUfEXexMfC33usMIL/tsbpZ0yBfIoPFBvGElG+YFtZMfeYLuMwmBTkWb
         Nw2xbdT8iMztG7XMYgSH+QWRdn6Mj5ovZ9683soQOWHctrAsvxFIS1VOEi7itklBgtxI
         OEeXWSYORY+jq8zzcnjZBxUHG8s7yKLLOgt4CmH3JHDc9hSCVB7od6q9rRNq9JwJ/7fG
         CUYA==
X-Forwarded-Encrypted: i=1; AJvYcCWFAOFXzf9jnkEMFxEjHxvVvGWHaE9BCOUrBQejKqBRnSrPWOYNaOOeuKcXmTuc3K/udEIoED6z3DnjHWrFRMlhIFhap/JH16zBV0BM5OuP
X-Gm-Message-State: AOJu0YygbxgnwKwLHkQwE8wtPbWWGI/LTABj5IQx1dzBLL4bKQLiBtnE
	oBtkBomHwccd66kh4Qook4sya4CayIu61uy9G3q/WQTvHfai5/wICPjP8vjT/w==
X-Google-Smtp-Source: AGHT+IHKKqnL3U4K71hLrs2mUP7g9TMCITdHz9CzBkr4YA8T0fm3oAZPwvplNN097FJEGyMYNzbtLA==
X-Received: by 2002:a05:6a00:17a7:b0:6f6:7c56:e989 with SMTP id d2e1a72fcca58-6f69fb7d5d7mr3783518b3a.2.1716055588805;
        Sat, 18 May 2024 11:06:28 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f67a5ffc54sm5978034b3a.34.2024.05.18.11.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 May 2024 11:06:28 -0700 (PDT)
Date: Sat, 18 May 2024 11:06:27 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] dma-buf/fence-array: Add flex array to struct
 dma_fence_array
Message-ID: <202405181106.99C0C03BB@keescook>
References: <d3204a5b4776553455c2cfb1def72f1dae0dba25.1716054403.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3204a5b4776553455c2cfb1def72f1dae0dba25.1716054403.git.christophe.jaillet@wanadoo.fr>

On Sat, May 18, 2024 at 07:47:02PM +0200, Christophe JAILLET wrote:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1][2].
> 
> The "struct dma_fence_array" can be refactored to add a flex array in order
> to have the "callback structures allocated behind the array" be more
> explicit.
> 
> Do so:
>    - makes the code more readable and safer.
>    - allows using __counted_by() for additional checks
>    - avoids some pointer arithmetic in dma_fence_array_enable_signaling()
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/160 [2]
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Yes please! :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
