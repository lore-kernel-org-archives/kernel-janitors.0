Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCCF1E7C32
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Mar 2025 09:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741944122; cv=none; b=iDeykVW72Q4DWdB/CKJgrfe2b02tlpYPvBwjwIiFgDq89JOsqYrLKNwbYFLerjwEzszirPy0yxId9zQkgHmyRwSPvsP+By/EHPi1amO3X8sp4EGnjcHQWZRn1Ilaugw+JPmfn7miP4wwp9IUqP618oQTut2XaxhL1h9mm3u6Of0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741944122; c=relaxed/simple;
	bh=WzAIVsamvsqiiRqt4lty9wTGIar3adKdVJo/UWq6ZJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwhLXFpWna0TBRaJ2PY41K4DsEYEr8lKN0gFNCPD0B4L4NKSnsD9C4/xOogx8XI3uJfnt9xqhBYPuJT96yxfTmczNMbViRO9sea6G1KGY6q4VifMov6e3lbZlqBwahhQ+4dWmu7UB18qXwb52dU8sc0dkxLY1Gs/sW4XFih+Gd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gBGuYlJ0; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gBGuYlJ0"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39130ee05b0so1847693f8f.3
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Mar 2025 02:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741944119; x=1742548919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QJrUGm+I0VeL1o2Iw4igeaLz8LtSBUgkIJ2qa7hBGGQ=;
        b=gBGuYlJ0EfCM9PahybbNye58pgBqOtls0E1P9Qo6NDpmhNiSOl5LmXdbGd34gM0QhH
         13w4WG2tEKlOp//LTRI0MePFeQ/qonZnE7zL1vuEJC6UffwBPbx1spRHQi8a5u94X0AV
         +CFahoWyNlOsQaA2wqDbKyQ6Gt+mLfWRgt8yzeDf5b/N+c+XixAcQtLkO6Nw/DNygv2K
         /XhSj97XZcXLe8/BGZKMtP+kSrLdZ/wc9DbeX6EW+STWKF5G1m28G1FATUWiU4+E9Mtu
         5xFcIuXO7G0BVdGNWEB3jNXRZreAphSAly1c97S4s92juI3+j6Et0zLBRxdYLeXIyoIo
         cu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741944119; x=1742548919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJrUGm+I0VeL1o2Iw4igeaLz8LtSBUgkIJ2qa7hBGGQ=;
        b=fgDq5tSPsds8qtwWvB5s5X2YaPFwFWGT7fAOzAJ+hxCSQcZQRHkCF4cbXu63fFsaWD
         J5TnUp0WgmNZrMquLHpCPc1tw1UT+wG1q4pmcSxi69He2g25q/DITUmCtwTsS8rjzJUC
         WTwmobRI14SjHUNUo3lbQyJBNbl/NvyVK48ligsjFHjwMi9vZNOSSiCqufuDgUSYCWdc
         7CJA56dXlMp7FYWOGKET+ymR9NoWgdmL8aMhAZLaHuCjw/GmDHeo/FsIynzB4ykJXc77
         5eYfZMJ+3cS5rVMS8pSoJgBF/OJeHkgZr229c2EOqaXeeOZ+ZptPEDuey/yZ0ghNV70M
         t00g==
X-Forwarded-Encrypted: i=1; AJvYcCWC+6wzXpR3A/Gy5CcdRyVybnBWGJRKPdW0vyv9AU+qoicmlkDsP3mMjT2lttZ5fHztjGFrcqYGOPX6ULtQls4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxIbsQEofiJaVgpKD/PjHPIAPxNd5p0fEBjcKTC32EtbHYeGW8
	epvlrEaeVfb/JxH7mzvBvO07nKYZQCNhpyVFn7ymLRzCPPjXZmvHrufc11SXXyM=
X-Gm-Gg: ASbGncvPIHtlB4cU6seuyn97m1K+pQEudkFD9RO5I8ggKwCxM442BtDu8+RwmdQf2MU
	7n2NzrzOhXSpxy/7PQVenyvPCMCsPqTPNblPYpZvyI4CyoxZYm0tvAcs7a/GNBFNgrs9wTKeJDU
	h6JQ4i/Yw3ggxdIoa50at1JLYsZhPAvDMCsemkbmjShXHX9aa3pEbEHNLgv/mPVKNUxnKCQ1YSx
	Bm/I5Bn2YnnYP7YWzBijQei14rMnSZKDYxTSwpZaFuuaGXizg6esNSl346IVRndVkdshKLVZcPp
	poa+wJ94zdSPKMXL4Bh2jbwCf5vlGLbJZwkQdscRwS0vjDzE0Q==
X-Google-Smtp-Source: AGHT+IFFPCKVtvQ6CGKlDDaxAhRZu9swSbTZM4Im7uWc3KAoJGx39LZyY5gIccrMjFgAH1WXoacnJA==
X-Received: by 2002:a5d:598c:0:b0:391:1473:336a with SMTP id ffacd0b85a97d-3971f4119f0mr1912619f8f.36.1741944118769;
        Fri, 14 Mar 2025 02:21:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395cb3189a0sm4996922f8f.67.2025.03.14.02.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:21:58 -0700 (PDT)
Date: Fri, 14 Mar 2025 12:21:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: zfigura@codeweavers.com, shuah@kernel.org, wine-devel@winehq.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/4] selftests: ntsync: fix the wrong condition in
 wake_all
Message-ID: <1111e313-18b5-42c3-9e53-ba46c3826fc6@stanley.mountain>
References: <20250314071454.201697-1-suhui@nfschina.com>
 <20250314071454.201697-2-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314071454.201697-2-suhui@nfschina.com>

On Fri, Mar 14, 2025 at 03:14:51PM +0800, Su Hui wrote:
> When  'manual=false' and  'signaled=true', then expected value when using
> NTSYNC_IOC_CREATE_EVENT should be greater than zero. Fix this typo error.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  tools/testing/selftests/drivers/ntsync/ntsync.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/drivers/ntsync/ntsync.c b/tools/testing/selftests/drivers/ntsync/ntsync.c
> index 3aad311574c4..bfb6fad653d0 100644
> --- a/tools/testing/selftests/drivers/ntsync/ntsync.c
> +++ b/tools/testing/selftests/drivers/ntsync/ntsync.c
> @@ -968,7 +968,7 @@ TEST(wake_all)
>  	auto_event_args.manual = false;
>  	auto_event_args.signaled = true;
>  	objs[3] = ioctl(fd, NTSYNC_IOC_CREATE_EVENT, &auto_event_args);
> -	EXPECT_EQ(0, objs[3]);
> +	EXPECT_LE(0, objs[3]);

It's kind of weird how these macros put the constant on the left.
It returns an "fd" on success.  So this look reasonable.  It probably
won't return the zero fd so we could probably check EXPECT_LT()?

regards,
dan carpenter

