Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009C022C6CD
	for <kernel-janitors@vger.kernel.org>; Sat,  7 Dec 2024 17:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733591150; cv=none; b=ZQeTLv9YzzWhB/e3EaHG2UcDRobg3ZePz74DD5Gtqfa3iA++y+OQtNYudpEPaTd2ErltnXgCzKV4HJn5SIWVfourqPWipaboOexS8CZILRjj61geM8WMP0Yr/0SXDFz/ahjTjMdilWoxpOK2aU6mNtA6qn4dakis0EgcEqRJwOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733591150; c=relaxed/simple;
	bh=5Ltu9nIauUB0tWOUssK/hP/8hcg18CelCLFC1SSLQJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wmy3kyCGB/2/QQkM8+FI1cnox1jHTYc+mtMCL7RFjmTeH9h/kKXCqYEhbRP/ji6fvzfWkk7La2NkyA2H0vMpWxHnspaFiiJMwnImvW+3Blxc2fnNOYHg0bArQ6KN0nx9bBqwiT9bH8LfeXdSzjQET8O5HZ4bWKyhGKoJaI9TOu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bcr+dO47; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bcr+dO47"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434a90fed23so20237535e9.1
        for <kernel-janitors@vger.kernel.org>; Sat, 07 Dec 2024 09:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733591147; x=1734195947; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pk4dOE8x4+OW5hLEkb16n/k4Vd2DfXIi8+SR8qfyj+w=;
        b=bcr+dO47vMOaSD5a+6sJxsU1oXgRm+0gLLgqcuMD3UaLGGQnP6VcLS395tjNePGNKC
         mFGc67UOD2UoR3ihYCA+N3veFSKX0smWBbEH4PCJxMBiMdkhv8D2dk8o/wJhc6CDYRkm
         yfPgzdgb+G9brsl1OVgPDeCPtj5bok3yHeMaMfn4LgrFN+SCCpAzLi6ayYGLdV6ryr0k
         NS9+1jG+tXcT9E38iyTzMfLijM0Iq12obKERnF6zO1ncllUAot7MXI19GFWLdbvNjaaT
         pVBlAjaycgnmpRbr3mip3BDTxoDuEVjCAObSdMTQbFs4Ai/+EoRqScSs3Zy2yReD3B7M
         I1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733591147; x=1734195947;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pk4dOE8x4+OW5hLEkb16n/k4Vd2DfXIi8+SR8qfyj+w=;
        b=BLdnbNJsbsvejwxCF/NSpUpAoripWE+G1o3r2My1psz7wZPAzJDAaapqTtZdK+QMmE
         Izk7Abj5NlujfXy1Wkk76Y4medQwA1/T8eMj/W1QIyoxTXbFvgz109kbNw85zYvX/qjk
         Jiu34iUoCx2uc14KtoeYD9yHdfefir2PVD2BUUFXfi+iPvqzVfYc0G88HbBR3PvMowr9
         iGMrF2GAt4BDX4pPsJsPL9ZMrBXKNicTXru1F8OVAHVMuRbtJpYnUwTZMN9zkxpUPat2
         9CvbHt+V/ZgJYZxJhjjGDO++fJqfitIP6AXnR55j9bMjgG3wn326YJiF7UEX10r60k//
         FTkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSGC5E3n7JdB79qBo0RPcSsNzzg5bvQl+/FOvhFQGmF5JWMRMnau2KQalMlLNoxBi6EcSC7wTXBK6+wwEuFY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzfOKg3ajjFbUsmdgmGKumce/Cvq7TZK2sce+Ctowup2SXXVT2
	uhe38Bn3FS5upWW2YNt6unz8v6mlils4onJqxmzeSOGIXwNwj9xsQBJONe5Z3t8=
X-Gm-Gg: ASbGncvF4E6Gaap2tB8AGa9YFQADUYO/GbqNlHlSLU3LNFlhXF6c+ddWQYxtc2UlgMo
	TWDBt8fZ+Dsq+Lqwr0vt4NXCm9BaCk8ervnJvZuDIQrzPmHzTQRrVDRWIzn00kfRDNmpp3ictUc
	WSekJIGayPoMUNfzeY2pp+02dgu8ioLvgyD32apw+2ArHpBeveBn0t+/DUuwFJKLidmr42ejVhu
	mYOkOUOxAEOEW+WaIcF7bZTAlA1pI19nfAfTS4DZO8g+J077Pm/GzM=
X-Google-Smtp-Source: AGHT+IGg5h+0E5Jyx7sVuRubySPLaxRCj0fP8G8xiSLkhV7eNH7cjkBRQQuiu07DAS3WYMNZao+pPg==
X-Received: by 2002:a05:6000:784:b0:385:f7ef:a57f with SMTP id ffacd0b85a97d-3862b368e64mr4977264f8f.27.1733591147326;
        Sat, 07 Dec 2024 09:05:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f59ceb6sm7779925f8f.42.2024.12.07.09.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 09:05:46 -0800 (PST)
Date: Sat, 7 Dec 2024 20:05:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtdchar: fix integer overflow in read/write ioctls
Message-ID: <6b4f7a14-297f-4fc7-bc4b-a9e7d822fb23@stanley.mountain>
References: <020f98d2-eee1-434e-8236-775cca9fd157@stanley.mountain>
 <e3da1bba-9740-6b6f-385a-1bdf25f056a9@huawei.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3da1bba-9740-6b6f-385a-1bdf25f056a9@huawei.com>

On Sat, Dec 07, 2024 at 12:17:33PM +0800, Zhihao Cheng wrote:
> 在 2024/12/7 4:26, Dan Carpenter 写道:
> > The "req.start" and "req.len" variables are u64 values that come from the
> > user at the start of the function.  We mask away the high 32 bits of
> > "req.len" so that's capped at U32_MAX but the "req.start" variable can go
> > up to U64_MAX.
> > 
> > Use check_add_overflow() to fix this bug.
> > 
> > Fixes: 6420ac0af95d ("mtdchar: prevent unbounded allocation in MEMWRITE ioctl")
> 
> Hi, Dan. Why this fix tag? I think the adding result('req.start' and
> 'req.len') could be overflow too before this commit.
> 

I've looked at this again, and I still don't see the bug before the
commit.  Secondly, commit a1eda864c04c ("mtdchar: prevent integer
overflow in a safety check") is missing a Fixes tag but the message says
that it's this commit which introduced the bug.

Which commit should get the fixes tag?

I should have added a CC to the stable tree though.  I did that correctly
in an earlier draft of this patch but I messed up in this version. :/

regards,
dan carpenter

