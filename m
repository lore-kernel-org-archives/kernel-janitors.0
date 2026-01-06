Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86469248F68
	for <kernel-janitors@vger.kernel.org>; Tue,  6 Jan 2026 16:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767717027; cv=none; b=QVrmjQwH/5AJd2W47kbcf3jKWg+sL/5VC3irAPIsMbkNfnGf3ZT7h12Kix9rJClv8sEJ71yOVKyOL0V4R6taJUDjXnaIGCDm7U+cmgV006wJNxy3Pp51rSuojz7cm0p77CD4BxznNd+BVChWhBGAq11Ifh9Gm50wkLiYTh3pry0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767717027; c=relaxed/simple;
	bh=U0j51mleQ1XhvbVqXphZJy29E+snKGgnLb9jc3YD3Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rus+Kr1hj/NzjMNcr+3xVU+sfQUiNNbBcu6JNUEoQp6d+XPfxUqbkh7TvocuK2oWFPPCMCBr4GfUysVFxPuZUOss6GghvU/KE49giYODmrvlgD6vRj87ioUKAXPLingLzmnU8o6LId3B3gy1Ti6N1uMFD44s+JUzJ9GioBfQdg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kg6tEjkV; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kg6tEjkV"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so240503766b.3
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jan 2026 08:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767717024; x=1768321824; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YFywE2icKNJ+cB7uTyuGoCkXxbifngq0AAd5tIXgGGI=;
        b=Kg6tEjkVXeWggMleNA4u1nE3Elaq0qOy6IJ9HN5XnUzZ8v7iVTjBghY+RFmI59/0e1
         81ViLmRLAnO4oGs3DOI+gsaGXXblp1Foq4aDEJuJzycXtsOk7XEjL1l7w8RHcWUzKGSJ
         cO+6hd0PSt+tvnDaGODYdtGaqs0VVARxusywnvb96HZQHy2yUoyxYXY7SCqL1kLCaXnz
         7G1BbEoaXRCxfFLiONXXsCiGVo3ceR8pKUMk2h9ED2XsB73ef6nCtYfZlLJVbWaIT9nG
         z5lRhCGwn7NbvvE8j1DjwkBQEk5vPKSLf2ZZ+C/I/huwWr9moXgY1r5zbljmToXBOeWM
         4nrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767717024; x=1768321824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFywE2icKNJ+cB7uTyuGoCkXxbifngq0AAd5tIXgGGI=;
        b=W1pIVChVI9AFZ5NqWjv66+eC+ERimZci07Tk5R1/xWNNamxfaRhdWniVR/bTvbn7iW
         ju9AuA4WXSbpPmsKA50j3g7jhsjMcLBQcFxCvvhplvBMjnRe3oD4h6guxzpZTmQiBDpm
         ladUpSbT1+ogYXo+lfjcXNiPYSv0Yg3wPtDW9yrdDBsO3JjcoV17lF1wi/pbUyIApESG
         mbEjIORxybOfSspXtozTjF3i8+Rwv9+tDOtHkTUeOw3fx0NHiqosuuLDAvgOR65n++Fn
         X8gj2UOoDX5TePHZOFL8e1sjtzhLcqGUVTxy2CNDlJdxxr42J/ruebIp/TIB1iKrNT+t
         74+w==
X-Forwarded-Encrypted: i=1; AJvYcCV9FIKvrB/qz/CI++ViXFHe5DG7E9+Y7YZlJ1KHRgVKwK3LZMSDTCl/464kKfI1iJ7rqJWmoZyK+jsHVBzLTjc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu9NTeh2SDbkgBbDPIStwz2m5XDbSW9x/tbXdBZaFFpI/orjEA
	3o/3T3u0yYQ+qqKVTIwGPtd3eWpQe11gPXrWagYw1j4fdXH0iYj5eStuGufBjvfHlQ9yuBv+wL3
	ir3Pmzyy+i0Ye+9HdwzE5aeOUJmS9AdP6iEV3
X-Gm-Gg: AY/fxX66NHMOIzndGDjBJB7wmHJVUkCVc8vY+giqckwCVyHv83CG0eU5ZgqkXwFXr4I
	8+yyp8SJ7ijsojTgLXPunpbqrQOLMxqR1CFOGUGb3V0vXUuWIp67N55630fuE7dXPj7ixg7HrJx
	8cjrd+q1+gDfMbr/cROJz70nt+F3lEzCihU91I/wahiEEbbnEPoj0x8HX2ObyEwwNoTCHmwcLge
	J2WSw+oWeZM9DfykHg2vAltWnfjpHzN1qiztQsaJSh8EJGNvb0PtHAReHJhBRWbzs+CqV3m
X-Google-Smtp-Source: AGHT+IGiqs1gDfUISyBczs4HyJmVzzzKZpgRC6NkJpj6fa6eM1SDvFi4fb2rgcGA7Eu/T1LDB0EY4X8+Kh2dwLV669s=
X-Received: by 2002:a17:907:c15:b0:b7c:e320:5232 with SMTP id
 a640c23a62f3a-b8426a49324mr367887766b.5.1767717023650; Tue, 06 Jan 2026
 08:30:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251228063440.2623595-1-safinaskar@gmail.com>
 <20251228063440.2623595-2-safinaskar@gmail.com> <CA+=Fv5Ra7fFTd2wA77iM_6X7NooApfoMJX5z1j60cXex_uxm7w@mail.gmail.com>
 <alpine.DEB.2.21.2601061310110.45251@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2601061310110.45251@angie.orcam.me.uk>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 6 Jan 2026 17:30:12 +0100
X-Gm-Features: AQt7F2ryRckCS1QLF5YuAHz3r2RQu9Pt7ESbBtlhCipsrDrEYweGbF2trlCO0MY
Message-ID: <CA+=Fv5Rw3vJGLsEyuKOBMyZTcQd=ayV5jT6bhWNn=uzXKsw13w@mail.gmail.com>
Subject: Re: [PATCH 1/1] alpha: trivial: remove ^L chars
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Askar Safin <safinaskar@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

>  As a matter of interest, why would the presence of ^L characters cause
> any issues?  That is just another instance of white space and it has been
> commonly used across some source code to separate functional parts, e.g.
> in the GNU toolchain.  It can be ignored unless you actually send the code
> to a printer (which I suppose hardly anyone does nowadays).
>

I guess you're right, at this point it's mostly aesthetics. ^L is just
whitespace and the compiler ignores it, likely a relic from the old
days. Some editors display it a bit oddly, and most of the kernel seems
to have pruned these over time, but a few still linger in arch/alpha,
which fits the age and heritage there.

Magnus
