Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8789E745F2
	for <kernel-janitors@vger.kernel.org>; Fri, 25 Oct 2024 14:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729865225; cv=none; b=hXr+QIaUci4SccRdGie1TsIMaKg0kUPwH2pxWTUE2lYcXKkXF1jvJ7MYsiv8dZVdkJ5nntvmEbjXee/GuRq3Hd9D3igZHdzqLW9HVJ6ITJO/xhgbtXAKsO/JgcRQDp9JfjOaaN1G0YR+PVeYaMClZzC47yNWn9PP+ZtQ6wC3rME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729865225; c=relaxed/simple;
	bh=R25u/LjXumh7VQ2NXXhe49BRHZfuAiM2pmfukxXsC1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ceCMXylExCECTeJH2C9/2p0y4rJ9vdJtbUDT9mXzKzxXo8hbvGHC0oNYq8SRTEqOzzYZaFskaEH9IowYdVeuPxGGtDKAq2MolmEHnr+mlQk5Vtcmz9Rkx61JK5USkXxSYAOLk/cCQWkzU3Tgrnmh2TE6xN/WyLk0KpxkDhCdC4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yO2UYc42; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yO2UYc42"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4314c452180so21762635e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 25 Oct 2024 07:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865222; x=1730470022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=luQpIwsQ81BxpLvWcfVNOBQaOkbZgajGGn3YLiW8HX4=;
        b=yO2UYc42/la6R7Dm+KqeBIxUVhZxj/11aJCpR/bLy3hzY6Wvzgke+yRRCCQbbR6N8O
         LMAh752RWIaU8HpXlpcJDJu/uYW9YBNUkAhb6nHff4MMyTQRAIG/mNGcf1wi94JzO4fd
         yh2u/i76JaVR13m8KHFZKeZTWrwOqvHue8AvWTjIEqfZbF6AvwYpdtjYQ3QP1Ohavxwa
         FsF0V6XmjC+8DxWN6TqWNBK/vrIm/9EM7qpxA2b1jRyHA6dfoHtyU5WicoUzZQs13wUd
         ssEGlfL8dAd/3U6iZq/JX9PnFsyKzXBnfvlGIyR2bS+nfwPneoLlUGbgfgLZEj6mItz+
         VPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865222; x=1730470022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luQpIwsQ81BxpLvWcfVNOBQaOkbZgajGGn3YLiW8HX4=;
        b=dK//lIagPAYkCVZosA1ppdqbUIB6Ln6UsEOg377KIJApx+72oICn0DEt9LXoTXdg0w
         1zW96LC77JbhdWuT4u/1jJGEBiHJpeKln2f0KfsHiTZHfAQvpxNW605k9/7M1VOK4Gt+
         iXNWSAdR8IMs1T/jbOMssWzpVFKo14627EPrLSPY/QSUmSuTkHF7LmZf8BoaruilBBbi
         gT/X9brU2UJtyUMHvGG4G8SQsiYqUqgh1kpcCyAPjlkDCYqgCqFu1z4cvch6M6x6BWuA
         WpOxgDi4E4fo2FckztVXQxylrAtekSYCUGGYDSZiWjfMiNUJJQZs0iGDJARQN2Rlp5pG
         TB9w==
X-Forwarded-Encrypted: i=1; AJvYcCUql6H8HfShnPMF87SbmoomDHPpVAdS7DaA8RXRnvSmNCHOMXXXNjfk9j9+L05gCxgSm6lzc58BYm6bVX0IdzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCM8a/ndxp3CvL7QYDIAvoiH19rvcx8a2i14QmbkAlj+uUx2bR
	Q8SNvD+k4diaQxIhDbxhZrqmxh9lFdrBlgCGfa7a2JSjuc4pMOXiGDSx/7Q80GA=
X-Google-Smtp-Source: AGHT+IG794v//4CoU35jZ4JOp2qrHO0NPj4GP9c6zL37F3w1s4Wzz6eOSMuHZrhCt0fTdpXgvlBABQ==
X-Received: by 2002:a05:6000:1a54:b0:37c:f561:1130 with SMTP id ffacd0b85a97d-3803ac0c1cbmr4633067f8f.18.1729865221746;
        Fri, 25 Oct 2024 07:07:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058bb4348sm1583563f8f.111.2024.10.25.07.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:07:01 -0700 (PDT)
Date: Fri, 25 Oct 2024 17:06:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] RAS/AMD/FMPM: Remove some dead code
Message-ID: <8412cc2d-7713-4a79-a7e8-5759e3320aa6@stanley.mountain>
References: <6b914abf-b3ce-4baa-b4d7-f8da9a840a3f@stanley.mountain>
 <20241025135616.GA407109@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025135616.GA407109@yaz-khff2.amd.com>

On Fri, Oct 25, 2024 at 09:56:16AM -0400, Yazen Ghannam wrote:
> On Fri, Oct 25, 2024 at 10:08:34AM +0300, Dan Carpenter wrote:
> > Debugfs functions don't return NULL, they return error pointers.  Debugfs
> > functions are slightly unusual because they're not supposed to be checked
> > for errors in the normal case.  Delete these checks.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/ras/amd/fmpm.c | 5 -----
> >  1 file changed, 5 deletions(-)
> > 
> > diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
> > index 90de737fbc90..3cde1fe17a7a 100644
> > --- a/drivers/ras/amd/fmpm.c
> > +++ b/drivers/ras/amd/fmpm.c
> > @@ -956,12 +956,7 @@ static void setup_debugfs(void)
> >  		return;
> >  
> >  	fmpm_dfs_dir = debugfs_create_dir("fmpm", dfs);
> > -	if (!fmpm_dfs_dir)
> > -		return;
> > -
> >  	fmpm_dfs_entries = debugfs_create_file("entries", 0400, fmpm_dfs_dir, NULL, &fmpm_fops);
> > -	if (!fmpm_dfs_entries)
> > -		debugfs_remove(fmpm_dfs_dir);
> >  }
> >  
> >  static const struct x86_cpu_id fmpm_cpuids[] = {
> > -- 
> 
> Seems like we had the same idea. :)
> 
> https://lore.kernel.org/r/20241024155503.GA965@yaz-khff2.amd.com
> 

Ah.  Good.  To me it's always encouraging when people end up writing basically
the exact same patch.

regards,
dan carpenter
