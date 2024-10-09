Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321B6178CC5
	for <kernel-janitors@vger.kernel.org>; Wed,  9 Oct 2024 20:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728506709; cv=none; b=Mt5LhbzMikELCK5NXA2gH/hJTg62KTirbZoc6LuBPr4dyBZz0jvccHaJfhyoUJ8GXVMO3eubnkdRoJeUviQ39QTC1jVBC72wCGpqNZrQW1v4ASgYlO7Po1nISH02LxGN9ioPqSxIQe31xHCXbdZB5lH6Sy2fD4kYWqc51LguheI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728506709; c=relaxed/simple;
	bh=nYfwcpUZdYjL0pSQsLCQsnTPhCrsZbtNDAclhh7uAlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9iCLl6jwkTF38E2yktEi4B2brJD4jFPcHNRsMFSCWzf5c+4m+E2jmV+FYmLUNQHAjI9MhyByt6NpUd1KMwSZumd1lI3l+OlZ7nv8yUS4aBjX2FvJHEGPelF/UCharWzGMKQoe8Iymxa8QN34cHFdQq09u0xPmOLyS0mGrtWuoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CA0DUhOA; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CA0DUhOA"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5399675e14cso189493e87.3
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Oct 2024 13:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728506706; x=1729111506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ta9iSL75PsN6aTymrbgB+q4HfOgRpGxi4PmyF2v6vbQ=;
        b=CA0DUhOAYPkYbyJBh7lNPOw3xA39W0oiOzUZP1IhVzBGm59TXIEWFZHjqdtetS/Gp6
         XdVuCyUXA6OLvLn3KLh8qkJ/Rs5dhHY4Lvpw88zBMTRIXj0GTCrSOAHB7kLIILyjH/TT
         Bc4v0RUKGMrXweGr2SiOEVPL9alVXHpitlzevHawX8UpDeEaXFv46pWNFmP+3flUXRuN
         bsUmmw7Nsw2iyyg7zcFBXrAVALZbYwCGcKUTvssnnUxk2yV0EfNPk1uLLrL0lSHaYgZf
         XNG/6q5bzqznm4wwxN4Pk3ymaTj6rbelImEYFz3NhBCl7cbFWa0kJTMhL8iesewOp6Y7
         ZMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728506706; x=1729111506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ta9iSL75PsN6aTymrbgB+q4HfOgRpGxi4PmyF2v6vbQ=;
        b=TcShd1Apc3SVaUJQYGTIaNuUt+2f7DAaH1SONJXgXNoR6xUaTz+ooMsJHi+tlUJ6cP
         AceZyeWyO4AiIK8hbb/o8SJ/3EUjbOnbDPFPveeRWpfKCJN9P6sNTOdoVWOytActZX2G
         /8mRLpKnJF350hWkgJyR+UZYwoVwdM7nlQOGLIJMgU+2kWU6bUayHwOJ4DFdFN6Lm/Ts
         49Uf0DAD8v4edPj5ovWZ1HsHUATJ53Q1WERaOvOgiZdat15X1/vt6VzSlnF+ofP4XX/7
         4z/8cCaTho2WIaBoEl8XaWY8EGGEmEj604fQhCxRTLePZPr5QxGNUP3j/nQdI4J0XyJr
         mtpw==
X-Forwarded-Encrypted: i=1; AJvYcCXp3OEB9gB4oGoAOh2KWQvKzi2veIQM+Ecp+5XC4vY4dz3RI3rvROaqRvwx9bH0KkXKHZaF50QBc0fKB0haU8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlSiyQi8GohHwcbMJNH/98RA7OA/xbG8Pv0ThGWLnXTjpBqkOk
	b9OHScBj7071nLUG42SN5GBjjyjYN9BM6LhhrX2FZcfHGIQKV25B/hM2fVW8gTg=
X-Google-Smtp-Source: AGHT+IHAOMpRwEYJiHDMI8w8bMB34NUeQt076rTlzeHhr88PtHM4vDWcgfzfmZ8rkVIsUWadQsA5Og==
X-Received: by 2002:a05:6512:ac4:b0:52c:dfa0:dca0 with SMTP id 2adb3069b0e04-539c495b90bmr2596983e87.43.1728506706141;
        Wed, 09 Oct 2024 13:45:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4894a647sm266411f8f.16.2024.10.09.13.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 13:45:05 -0700 (PDT)
Date: Wed, 9 Oct 2024 23:45:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Everest K.C." <everestkc@everestkc.com.np>,
	Jeff Layton <jlayton@kernel.org>
Cc: viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz,
	skhan@linuxfoundation.org, linux-fsdevel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] fs: Fix uninitialized scalar variable now
Message-ID: <263ceb04-f909-45d8-b9b2-5de86617ea25@stanley.mountain>
References: <20241009200528.36343-1-everestkc@everestkc.com.np>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009200528.36343-1-everestkc@everestkc.com.np>

On Wed, Oct 09, 2024 at 02:05:25PM -0600, Everest K.C. wrote:
> Variable `now` is declared without initialization. The variable
> could be accessed inside the if-else statements following the
> variable declaration, before it has been initialized.
> 
> This patch initializes the variable to
> `inode_set_ctime_current(inode)` by default.
> 
> This issue was reported by Coverity Scan.
> 
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>

Fixes: d8d11298e8a1 ("fs: handle delegated timestamps in setattr_copy_mgtime")

Maybe the WARN_ON_ONCE() should be updated to check ATTR_ATIME as well?

regards,
dan carpenter

> ---
>  fs/attr.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/fs/attr.c b/fs/attr.c
> index c614b954bda5..77523af2e62d 100644
> --- a/fs/attr.c
> +++ b/fs/attr.c
> @@ -284,7 +284,7 @@ EXPORT_SYMBOL(inode_newsize_ok);
>  static void setattr_copy_mgtime(struct inode *inode, const struct iattr *attr)
>  {
>  	unsigned int ia_valid = attr->ia_valid;
> -	struct timespec64 now;
> +	struct timespec64 now = inode_set_ctime_current(inode);
>  
>  	if (ia_valid & ATTR_CTIME) {
>  		/*
> @@ -293,8 +293,6 @@ static void setattr_copy_mgtime(struct inode *inode, const struct iattr *attr)
>  		 */
>  		if (ia_valid & ATTR_DELEG)
>  			now = inode_set_ctime_deleg(inode, attr->ia_ctime);
> -		else
> -			now = inode_set_ctime_current(inode);
>  	} else {
>  		/* If ATTR_CTIME isn't set, then ATTR_MTIME shouldn't be either. */
>  		WARN_ON_ONCE(ia_valid & ATTR_MTIME);
> -- 
> 2.43.0
> 
