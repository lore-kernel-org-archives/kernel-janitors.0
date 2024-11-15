Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619E12B9B7
	for <kernel-janitors@vger.kernel.org>; Fri, 15 Nov 2024 08:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731659057; cv=none; b=R6PhY+DtQpaPuENsy3f5PjqyCQ1qlxtBWm22rgntyhIs3a05FpLnysIuXp8QJWhQEZlsWPj9g2lOXTYEj4FjyDd8sRxBv2SxykLXont9spz5/M06mx5SUugGZ1ShpcwYKD+O/IJymaNtWBxQ2xCnCdpBtFdVsBHnc1bQJEUNN3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731659057; c=relaxed/simple;
	bh=ibYVGR5cGY11jXY5MH7HJGwhiLSdI3f82ZXTv3gR5vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5AqQ8Ms0b17CUrXHt3G0B46Hx+JCbBcE5Zp1xaE0p9X0GHziU5AieSE3P6f+FHGPhXHvhxWL2IaTeBUcBhcOs0CRDu8vAwE+WN4xO4xiipe5oFEQ+OtMVVDzROH3xJUePR4dTehSH9MFsE1E39GkwdUJ7Gca3HMbb+kAiVhtvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CXQBiES6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CXQBiES6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so3569205e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Nov 2024 00:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731659054; x=1732263854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eWRrZUkhxGjMZeY29OrWmdvCo90xdRe7Aypy1R6OUmE=;
        b=CXQBiES6E+fgzH6WENOoQQifQin5TYPlQSOCuFDopaXXVhld5/Ol9lURGlRvcE6ZjV
         5EUkNFfQzteGdubCFuOV3ds9nAQHi2wy407T8fceoVh9H8ULHzonkq06BDp6IQ1X6z7i
         hDY/w2SeAQUBP/RgfntRzG1i4ntUYAKLslhbTcrltoqGKxcvOj2B5XKjhbqvfieyq49I
         ZrbdJ+/QkPTefaaYXCEzXPPhlLntHNiUN2HdFiGxmKeTC1tPSpLr0FWZLDlBHDf3HwK2
         k5qBwOAZdoatmpcQOvTj9TKQ13/tXdiBV1CZVGu/KouASWiG+81fARGCE8PIZzsIdv8q
         /ykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731659054; x=1732263854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWRrZUkhxGjMZeY29OrWmdvCo90xdRe7Aypy1R6OUmE=;
        b=TWE2DfFENBX0hivdupwhY/5JqfYJtdJ6BeZKCP1TQRJWgnhXStgRp5T3UJA+/OyV93
         HOVLcV1M+CcEoRhx6lARzN5+9jkgmY0vXbRUIxsFBSeOjlSt8y2hr+lrfKxKXx6S+pg1
         /OLr/QORlBKZTPeqUQk7LvGZAWKrge9j4qhZ/4C15vjjaWhgTxNMp1JwWvrn+hrDe+fD
         4fDdD6tn30WKir9LRvYAk9xJzP0jWfgHGAxQyrqQDaarXGgjVAbMqCfE5d7Vckt6CE1Q
         LkD3z77DCqUzaHAc7pDGzCsJQdKakxfrUAE0jty8gUcKk6BzhBi7egg31RodlbSK21UH
         QRqw==
X-Forwarded-Encrypted: i=1; AJvYcCUg9eCiuO35n79U9lCtz57/B0s0FjnbmPGJvOhcde4QKG8uGQvP6Nw/kynOkVWP6f/NQG7RE4ZLJOahH5yO7A4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMpmM+vWlJ7WVZQaEP72+Xg+Ozn4xBC8CJc8Ub+BLyVn8wFYQz
	EVHbwgKK43i9pQUxLc2Pa+u4je6aHM98ASFJ+zeKZbt9LsOzUc+t0CkgBmlr1Gk=
X-Google-Smtp-Source: AGHT+IE6iZRKIEII2jo7jJBhaHE9KSdI3yml3wTWpJc85CoFNhJyDFKxbpJmnFwfiCV7cb6knB5SAg==
X-Received: by 2002:a05:600c:3d15:b0:432:d797:404a with SMTP id 5b1f17b1804b1-432df78de80mr11268285e9.22.1731659053736;
        Fri, 15 Nov 2024 00:24:13 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab78918sm45682765e9.17.2024.11.15.00.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 00:24:13 -0800 (PST)
Date: Fri, 15 Nov 2024 11:24:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: stuyoder@gmail.com, laurentiu.tudor@nxp.com, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 0/2]  bus: fsl-mc: Fix two double free problems in
 fsl_mc_device_add()
Message-ID: <e18e02dc-4628-4205-96da-fff67afae8ab@stanley.mountain>
References: <20241115023206.3722933-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115023206.3722933-1-suhui@nfschina.com>

On Fri, Nov 15, 2024 at 10:32:05AM +0800, Su Hui wrote:
> This patchset fixes two double free problems in fsl_mc_device_add().
> One is reported by clang static checker, another is reported by Dan when
> reviewing the code.
> 
> ps: There is only patch 1 in v1 patch, patch 2 has no v1 version.
> 
> v1: https://lore.kernel.org/all/20241114082751.3475110-1-suhui@nfschina.com/
> 
> Su Hui (2):
>   bus: fsl-mc:  Fix the double free in fsl_mc_device_add()
>   bus: fsl-mc: using put_device() when add_device() failed in
>     fsl_mc_device_add()

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

