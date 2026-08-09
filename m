Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86364361941
	for <kernel-janitors@vger.kernel.org>; Sun,  9 Aug 2026 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786287625; cv=none; b=GBl3D90NzR+0XaVPe3gVdogPRNrR/zU6GlFW+d5N0fNEFLHHpFyPtLvCd+Sm9L34I87mbP2NttWWQ0o9YbFX42WmcaO7OECJhtTq0CRs9Nbg6eqOhnUdy69fH9G91kECt7CHHZpcqn1uvs0JUGXI7w4DTUbCt7mqj/LmExgL0/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786287625; c=relaxed/simple;
	bh=++2CDr8sslAi9FkAF5CJbSrtCQTx4S/16bfjERCe4qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACfy1+VFKOIfBNw4gcVMV3qddFSTQOicYAreqVf6HpvyUGNe455Vx/E9SThardaGR1L6cJSKekbmpAfcz3DPir4d1ABME74y1rtqtUg7S4NdNSTPpNRBtY41Q+8+a/O5Y0Xil79USv+bB1SGDBFHQrcywUw45QmU8h1Xh/z8u1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lc5i4eUm; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lc5i4eUm"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c998fd549a8so762586a12.2
        for <kernel-janitors@vger.kernel.org>; Sun, 09 Aug 2026 08:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786287620; x=1786892420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lTzrk2R8kv6gXqCQ/BV0ySdWUtQekk7wApQHuKS3F5E=;
        b=lc5i4eUm2lKKGaSIbAb3UYaFCfFiN0LAuO9CdSu7mcy7dMfpaEnLH9fVgl/UHwC/f9
         qHat+EhlGb8F2W/ON1O2rlhBeHQ6cGXw2kLbMZSw4plqJmIyNGYaX0txa395vSoQd0e1
         a0TMX9x8C8bEBX1gh3LhPE6kG35+KdLOOHIFq5gVNh44Ht+2n0r29MeRqmQeRhstzQ63
         L28sIj7KR/J7lFiVh5a1g5055IymnS6pVJiLQKgzhOlH43U7kpTqPJy4hzBVolOp4Aph
         yKmDN6ixeJEO+i5pEtHn649N8m+EhUdLZRdhrGQWfG/CE4FJQrqjMW4bke723zAnTLXg
         MRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786287620; x=1786892420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lTzrk2R8kv6gXqCQ/BV0ySdWUtQekk7wApQHuKS3F5E=;
        b=ZH5F+ks6FB1v9DzJUAdrNuP4KDSNTQuWU2t2RnczCqUgWwZLnFhAj7bHmAe958/VdW
         uIYskpt8vS8dJsy5VaReOKl6n26eXSZGmpOV7g2BV6j6SHKdLl3ezg4KV3cH+zFZD6gH
         yAVhiwQK6h9MBYX6o4wlXFv/kRdEjbNOek+SGnE49po660rCKwDwJznyZEgFxPxDXm1e
         0AIgzfZsCXI9ra3VjiFJrHOLxN82KDxmm6+tPADfcTsgq09SvqRI2H1loChmWExsJJPy
         tiEVC6CfvbHSAmvcfzoHi7YBydA09iiS24P76jP1Ih67UPPXLEZSR29sitsJ1sgl0Y3E
         4ZAA==
X-Forwarded-Encrypted: i=1; AHgh+RoJoR6ji7WeYHy1Gc09x4bSwqIXGOV269pwX6kDn0Eb9C015uoqakbvDEBVud8WTGeuSk1OWzKo/GYATLFLClg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwZi0xIuWTXnDx7OsfvPxQYSigha4DQjCovs5rmIAf0TD1E12l
	n9cqLTPmwtNn5FM4Q4BdtNmg7fJM+hoJMB8mdc3popJJby/AI5PhNTHV
X-Gm-Gg: AR+sD116S+Vh8+prA47cEl84Xmu+UrODiJ5yOfvVll+9IdqGgOFTn8pK8GnuTwugapB
	XW79Ezzwazu/QdhaAYPKMwHs4UJWp8/qL9CnguJaF7qeczAFPQX9hXVkWnSgF4wk7FmPekUJ68Z
	0sT6bEcxcu+9D1T5D00WhpDzXOxGXR8KqauwzaWtHGCaeUECVKWXYUpajQl2KlDOr7LRCR4X7tS
	gQkbbXA4V6y6TcLpUjq3TTSQamSA1fQ5+IS2ub1h0Wf+9QTdAUpMIUQBlnUrOkOlFEya2c73MhM
	HKMHwf4g+Io5eF50nqGWOZFuI/AyoH7RqaVvjnqVkGk182SmWYrlN2/FBU7dUE5ek1avRthR94L
	tENlVTiuc3pfHB/B3yGSc3zpKDxxmpwxLB2wu5ve6OZ232zSKnaV1F5dt43SjNHYQcfsGCldh1/
	vbxPPJSg26P0+x9lE6Js2XAarvrDeSFVHXeHd327vi3gPw/RtHJEwPD903NQVPN2ZegICDNT6Lw
	0NBLT5WAIdGBQ==
X-Received: by 2002:a05:6a20:6a1f:b0:3c6:61b9:917c with SMTP id adf61e73a8af0-3cb85e2b463mr38599908637.11.1786287620225;
        Sun, 09 Aug 2026 08:00:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101b7b39bsm26361846c88.14.2026.08.09.08.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 08:00:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 9 Aug 2026 08:00:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: apple: Constify some structures
Message-ID: <50bec487-2900-47df-b9ae-0ff13791f4de@roeck-us.net>
References: <99019b7e560c2d9c087be340e68f9cce4db1988e.1786283336.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99019b7e560c2d9c087be340e68f9cce4db1988e.1786283336.git.christophe.jaillet@wanadoo.fr>

On Sun, Aug 09, 2026 at 03:49:10PM +0200, Christophe JAILLET wrote:
> 'struct watchdog_ops' and 'struct watchdog_info' are not modified in this
> driver.
> 
> Constifying these structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    7319	   1768	      0	   9087	   237f	drivers/watchdog/apple_wdt.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>    7543	   1544	      0	   9087	   237f	drivers/watchdog/apple_wdt.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.

Thanks,
Guenter
