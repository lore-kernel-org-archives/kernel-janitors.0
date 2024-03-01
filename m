Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCA28C02
	for <kernel-janitors@vger.kernel.org>; Fri,  1 Mar 2024 16:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709312187; cv=none; b=McSNxY0U2MwFM+wnZK9fEkikut11MBxvdrBLNdqTPKbLXybtC6Hq588p/dugLn64VMiGgNsCB5Tfn4c/dh77gTA86iBLxXykvGMYUXZloL6CzvPJOpsMQpUwIc9JX+o6WxM2V/Kmk3FYce7/XbiqI0tUvUm7yPx5+dXbMJken1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709312187; c=relaxed/simple;
	bh=/cFMkXs1YLuLcWkvfAIme/Dxe5G3rypX0cn7ux3WWHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKFI41qTnB7EQsT3SZ8dAOderWIXoRO+NtPaOJJGEtEBew0q/J1/31YIfgSPWqtWJcnQhyVHoTt0+1in6WQgupq77+tBEnwAaXlNgj/XYqWPzW9vK9xK/3fAOc7anS38s3Za3/M8fUU2iIf6PLZF9XEP3puvL0SGNd5yop3FJXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CnHPZZ4P; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CnHPZZ4P"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-412cd73cb57so2213175e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 01 Mar 2024 08:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709312182; x=1709916982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C3VqmontYstpREaYRLuFgnoF0ld9uXpBQEwscACOSmI=;
        b=CnHPZZ4P3NldBSArxCs6//bWsWyy5eLw5uTEyPHwG3nZUFdVT8yBGw4D1/Jv6jFq6R
         3W0JL2D1cPLDlSpSwNsSL1f15VWA2DXcjzHEgX258hV6J5CC2MceoAhPzEV4kzHvCQ5c
         GavLKzD8MfzVhilAdVmgq2KMZlfalDRNX4c5yAnB7jJ4Y+cNBMZ5TnOCKuXIBF0u9G2/
         r8h1rNrTgIGFc1S8Kh3IE8lV4fIvZgTxdlbhaMM02B3Y7+Tkl3noGaDYbNBMMJNqIlRh
         fkUJYhPnDNIQXZTiJjOoAPdVCFCyeldxiznoJ/LGYGpEO7dN+8amUaF8OYM0bIrztmjG
         CbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709312182; x=1709916982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3VqmontYstpREaYRLuFgnoF0ld9uXpBQEwscACOSmI=;
        b=Xph0sQP9PkrdKj+8BxluHnkXv881ef/S06GOISAHt233Z0nD+CdPyJ2ZAOof8cD1Rq
         cCeCkHtMP1cPCsNftEWLXUOnZfgb8VwYOmE50Hnf8xXcIakU3ulQnOHNhBqytz6ZjkRl
         z65/O67YRIznE0ATWzbl+2Eqd08gbPGAl1VS4hfZzSP3VnITnop9oNLITC5Nwjw/d9yh
         16R6W7Uj8a1s+FDtVPGWyrCHpTeRc7DvcZRr3XAlGOH/IgLHdpgy2yRsZhxZ8Bn80e3E
         oXi4iO+kdrdDFtgWjvGKk+NOuW5pxAB5b+eg7luJcnvTyO1QlBYKWfBINbILy/b69sdf
         oU8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCvuaqmDpUpw1iw2fXG+fzK0l4+cwEZI5u5vm4CxeDwvtDPcduwjS/fgoB5H8iSSbydlvooT6p6jO/cZ/i4N2Ye5Xwi2x2fH56t3g9nwTb
X-Gm-Message-State: AOJu0YzM/UAEeS5RdSRlUVWs9SPK/ASpQRDLvYGk54zBsxkMMVSW+4yY
	00MQeMhKOUFdsb5jiAzURv2JsfGeHXANjU+R/kz2nVlPXAS8yaHwBvjytlqndgg=
X-Google-Smtp-Source: AGHT+IGgN8ojolxlaeOgWQJDi81cvaJNFC52G5ZvMJnSJLlTJJuzLntA1bBA/gTcgOaSnW1MlBUEnQ==
X-Received: by 2002:adf:e9c1:0:b0:33d:3fed:39f3 with SMTP id l1-20020adfe9c1000000b0033d3fed39f3mr1816627wrn.52.1709312181785;
        Fri, 01 Mar 2024 08:56:21 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u14-20020a056000038e00b0033e10b7a1bdsm4823816wrf.32.2024.03.01.08.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 08:56:21 -0800 (PST)
Date: Fri, 1 Mar 2024 19:56:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] io_uring/net: remove unnecessary check
Message-ID: <da610465-d1ee-42b2-9f8d-099ed3c39e51@moroto.mountain>
References: <7f5d7887-f76e-4e68-98c2-894bfedbf292@moroto.mountain>
 <3d17a814-2300-4902-8b2c-2a73c0e9bfc4@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d17a814-2300-4902-8b2c-2a73c0e9bfc4@moroto.mountain>

On Fri, Mar 01, 2024 at 06:29:52PM +0300, Dan Carpenter wrote:
> "namelen" is type size_t so it can't be negative.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Jens applied Muhammad's patch so this part isn't required any more (and
would introduce a bug if it were).

regards,
dan carpenter

