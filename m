Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C701E7654
	for <kernel-janitors@vger.kernel.org>; Wed,  2 Oct 2024 10:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727865969; cv=none; b=m1O8SFqi+tQtJOV7hgM7NGTPj4BX6x56MPjFV+D0uh1G9uJa742RnVIOECkW5oGAToDpjXRosBKWdNh9PmoQSUvrkmlz42HbiT4E0i4Wm3h7hB4ht7GEZ2nfE5LGD1SwRS/TWrvubVSCpRDCrbJzVWTqXtYmL0Bdovob7a1rDdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727865969; c=relaxed/simple;
	bh=j1jipKhBpX/FlRTd/1TIChevsQmJqofboK5tmbX95yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GeBduZ9nDwr/EyrzEpn9C8Nu2WeANR4O6tE9tx6mBi9+tEhk3Z26V+rCe5OEMdwBnDQ0amL1c2UOD7iC/yBTlUmLrtYXHWFtbuebs4zGrernwawBDbAhxzgHcPfilQRcmJJWhpxHOGT8cum6ABjx5b1k2GqyKDznUEpsNNW2Kkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zxS7cprL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zxS7cprL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so80409355e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Oct 2024 03:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727865965; x=1728470765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fk5hvgS0hGjJuo5sxC+sNtdExW//wukSgwsI+Pq5YRU=;
        b=zxS7cprLvBQqL3tgqg7e0S+2wKvbGTQEfS9z9nNGe2Tc3IizJEbNAEnVNV1BlQhLSz
         RzcYh04yDi87YUbNQrQdgPB/hN3BYsIlQdX0270iJXOAO3+DTIkRHEC5VrVKAaZfcSnl
         ZeHwu8vVY1abgPLG0XT2rpOdiK+x8PlmiLJKONsdnjBDBg7gC6H3AApIkigiBxg1sLZX
         q3rxSdJWExV4PaR7hOqY8bjdNpB/2BQ6IhyFM/1EEeNyOPeCPJSmOByi60JatiPKt+24
         vZXCHgG0j4F2I/I8S9uW87H8AqH98d2luVrGd0sP5gmFmDQFibnI4Av8Mumkl7zd/2re
         ohbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727865965; x=1728470765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fk5hvgS0hGjJuo5sxC+sNtdExW//wukSgwsI+Pq5YRU=;
        b=QMdS7c0gX/K+Z9GFxltWJz9Q+FGO1VwXcwan7TWPDS+4+qaq0myuDgAYUItWlL0cqN
         /7N6xI5TivY8qheQsH0nb/QLEmewtGLgu2S5T5faTvQkkPOqG9L4I8VidKJ/0rgp54FC
         36SU5go5NLfIWnU2Xt/bv3eUBfJzL15q9wjnspdw8JKq2UAJKBYh7h8gQ+/xwTOVyND6
         iC7oZzxmo5tDsNLU0+hvGXRqf27RoAV+RJwule2NIhkbNuEg9Szw/nEvQX5kx2VW8w8j
         ABpHHktN65h7z3gRTcf1V9G32AnZy5EdlBBDk/Ly12yoqxLnwQe4IXrS++4ptx8y4O8c
         O9zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnUyY1nLclZMW1mTvzId/1BtD3VewgLOu11InQwJ9ACpYNLXbeh4DyLjttpV9DMFB9W+biix/zyg1UT4p6mVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrEVEBoQCgy0LtUQD6avC2Q5+3vtz/vxZae91+oZRH2o4w3kAg
	iQpDJsqLiqdSfyyiYwKPKgvYK00MyQud0ytiHKcHxbp3fch11R8OKPoqudJRiyk=
X-Google-Smtp-Source: AGHT+IF/EJDPE+HOPHXbRDSTkeiUO+hzHFC+iz5emuBJaiUOpXAfIJKgswRfUyuHfngLDtPziZdOUA==
X-Received: by 2002:adf:ec08:0:b0:37c:d1fb:82f4 with SMTP id ffacd0b85a97d-37cfba0a6cbmr2320172f8f.36.1727865965374;
        Wed, 02 Oct 2024 03:46:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f7a00bcb0sm15117345e9.43.2024.10.02.03.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 03:45:55 -0700 (PDT)
Date: Wed, 2 Oct 2024 13:45:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Yu Kuai <yukuai3@huawei.com>, Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	cgroups@vger.kernel.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] blk_iocost: remove some dupicate irq disable/enables
Message-ID: <7962c626-87d3-4c6e-8fac-16653cd2868d@stanley.mountain>
References: <d6cc543a-e354-4500-b47b-aa7f9afa30de@stanley.mountain>
 <Zv0MtvYFTHlff_zT@infradead.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zv0MtvYFTHlff_zT@infradead.org>

On Wed, Oct 02, 2024 at 02:04:54AM -0700, Christoph Hellwig wrote:
> s/dupicate/duplicate/ in the subject.
> 
> Otherwise looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks.  Let me fix that typo quickly in a v2.

regards,
dan carpenter
