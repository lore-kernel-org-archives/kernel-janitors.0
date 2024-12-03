Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3491E1E0B78
	for <kernel-janitors@vger.kernel.org>; Tue,  3 Dec 2024 09:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733219347; cv=none; b=hsTFYyUa2XZC+j0btxdoiuO5TIp9u60i+OjxDz4RcjxkkKjCuDZ/uWbfurTMb8NSrerCCXCO0Gj1LqrAMC5qu1V+cfe/5+9hjyC3OmPNQ97yV66On3e+lhLW0wROF9M8ipHl/wnjGmbvANE+eyhUmsLJ4wb66JUEWo0eKrNq0cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733219347; c=relaxed/simple;
	bh=66C7X0y5JSIvmxFiooKiDwrInLALIuU1cghHxsv7Mrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJpZKhHYH75ZrX204/oc+NE1RbDnVl+JquYGY5YGOmOzJgBJOK/M1q3e63xVlWdky2oBRlX58LiZbYKuqHRX5X6ko4QNoXolhxTTM11yduJSt8MrkWHau8edMHlZlRMjdZUsH8vfsyKVuO1gKoClUFAgvbK9G795Zca7fBfMTdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Os4/fbpq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Os4/fbpq"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a8b94fb5so31384185e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 03 Dec 2024 01:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733219344; x=1733824144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k5m6hg1T/8NDguGzINl2AjokycuEBlMQVbW4nuTy6h4=;
        b=Os4/fbpq6FR4D2jx0XLq3ouYACEKaboZsV3uXhNT/xJhqFPFoyLunsdtORGF58ChM8
         MaJn26loszUFyLfcPYRkAIba5cWHzYOOPc9xWOVvSGpB64fr9Hmhcr3FjyVKFw91hL14
         hYvmmddyHfYzHLNWckwX8WS+WGINd1/4wEm55inotYVykwIFSIzHXhAwpvdY1WcV7P9Y
         Z6uqGPV4S3lBBFGAJ5ys3fhvq0ij6cpV4/FP3P3PaE4+Tq2BJXnJ5a5Vb5m8ujCyt+24
         FAfmipDS+n/qxQXyzd2/Pbu/T+AB6VIlCOSbavxepgTlStwtF77macYegLPA80Pr3QrG
         xWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733219344; x=1733824144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5m6hg1T/8NDguGzINl2AjokycuEBlMQVbW4nuTy6h4=;
        b=YawX36QNUa4r7qo/QTYQKb+mCYeSmwgGOK1CvF+cIuDFmjnisVduQU5hkRlluRvylm
         E63zT20eIAUvFRDIkjHLBdmgRHwcj4Jdtv4M8443GaFOsGQ15eFQjQg2kAztU+Iwtb4m
         bxyzHwj5/7QJAgD5ULLUBky/IOkXqSi4dDMSFTtTf7wAzzbYqvR2SYyt4uT6YRsY8YbD
         Z5h81aQXkgwpxDdLjhZdbc/PNU+Jjzf3U54S+fAl/AT192Jo1MEbNuSXppMEWu6vT7Po
         vKw9yKrgIfLQFY3cFwZ4zEZ+AVi7h146lFS4Z09+PwmlG7vafBzHp0o/mRcNuvYu/w8D
         v0Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVcxKN8H4oyc3SR/1ij1HHxwlrh1+8FT7TsbPUDWQSOeEwvE+W/LNqdYn9Vzq8EMIK5zfTC8P44KvGVZWHDJQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YztBPVYJkrw/PXPQrt3pw8aEBJjupUoiZqN8RuQVlWu11VZCMe8
	TKeie9AXcoGCadPphTUX6lq2gd6X10i/9juDuk1dILXhyo1enzyNqRK/D0fP3kI=
X-Gm-Gg: ASbGncvRvhOfMBPPIwdTKfXwohnRiCeLb1Op654vAEiEZFC1crCKKO4yZy3EnEp3+hK
	qlCk9oA5Ips4wTeX29N34xS76NwufEx2JsExFQwy1CbmQ8Qc23URy4Ko598Ms6HR5zPq13Feh+x
	4MZh44pMw75Qx+zTCAlvd8DRO5Qx3VDKUF6X/onSTJSGSRArglECqhltqy2hHO6vMVdcUQYQ6/o
	0eejkpYPifQbDXvZrvaAFL9kXj0u4Q+h5RuEELJYZRQXNhqmSLe4zY=
X-Google-Smtp-Source: AGHT+IGiq5MfIfBd9OA4L42VqbX8iZSuCB9pKeFGXwzXoQE5bTKyZlB+OEQ8WGkhd7IzIABfKHMT6w==
X-Received: by 2002:a05:600c:198e:b0:434:9cf6:a2a5 with SMTP id 5b1f17b1804b1-434afb9ecc7mr189287195e9.8.1733219344634;
        Tue, 03 Dec 2024 01:49:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d04e7380sm15910995e9.0.2024.12.03.01.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 01:49:04 -0800 (PST)
Date: Tue, 3 Dec 2024 12:49:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yevgeny Kliteynik <kliteyn@nvidia.com>
Cc: Mateusz Polchlopek <mateusz.polchlopek@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Muhammad Sammar <muhammads@nvidia.com>, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net/mlx5: DR, prevent potential error pointer
 dereference
Message-ID: <46a97b8a-042c-4903-817f-efe3be5afabc@stanley.mountain>
References: <aadb7736-c497-43db-a93a-4461d1426de4@stanley.mountain>
 <ad93dd90-671b-4c0e-8a96-9dab239a5d07@intel.com>
 <bf47a26a-ec69-433b-9cf9-667f9bccbec1@stanley.mountain>
 <4183c48a-3c78-47e2-a7b2-11d387b6f833@nvidia.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4183c48a-3c78-47e2-a7b2-11d387b6f833@nvidia.com>

On Tue, Dec 03, 2024 at 11:44:12AM +0200, Yevgeny Kliteynik wrote:
> On 03-Dec-24 11:39, Dan Carpenter wrote:
> > On Tue, Dec 03, 2024 at 10:32:13AM +0100, Mateusz Polchlopek wrote:
> > > 
> > > 
> > > On 11/30/2024 11:01 AM, Dan Carpenter wrote:
> > > > The dr_domain_add_vport_cap() function genereally returns NULL on error
> > > 
> > > Typo. Should be "generally"
> > > 
> > 
> > Sure.
> > 
> > > > but sometimes we want it to return ERR_PTR(-EBUSY) so the caller can
> > > > retry.  The problem here is that "ret" can be either -EBUSY or -ENOMEM
> > > 
> > > Please remove unnecessary space.
> > > 
> > 
> > What are you talking about?
> 
> Oh, I see it :)
> Double space between "retry." and "The"

I'm old.  I'm still using fixed width fonts in my editor so I still use
the old school rules.

regards,
dan carpenter

