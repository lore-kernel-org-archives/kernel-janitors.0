Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A59218733D
	for <kernel-janitors@vger.kernel.org>; Fri, 27 Sep 2024 10:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727434670; cv=none; b=sVeftMvWDFF0fKFH7qzYQ7MZzKHKlUqR8pSGkhZq63cu6j4aTYTY724mCk82OMDWaoiWMlFCsB+1fpedQbEIxkLpGZDYsmJ3K4ih3WTAUkyE8WP1Vi5syt2dN4tZi1pH+b24MM1GwQtqbZeqNZ5G+mhOADy+fzgnBIR/+gRQFtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727434670; c=relaxed/simple;
	bh=YZgFpq1hQ/M4LJjPWGkx0QMYy3YqeF3F35HN/4OvKq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trCrtkh9MwutzwPqbohdB2lAGg4gh09nt4QLcxQtzstC6muIGetgm8JRlgiRgTrjnHMmSxZrIYmA/aRxFVpnNaKBiUzzDBtp+iXrzwX25LNWy3BWJBkf2iAl+nexB5pLqS43y8Tk7eWZbn8EByXZnMshZ4F/scpKaJXahW9Boqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JJtlKNma; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JJtlKNma"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37ccfba5df5so1244600f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Sep 2024 03:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727434666; x=1728039466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H/gJ4n0/JEYirGmCXA4CFRFlIdN6B2ALRebGpyiobAM=;
        b=JJtlKNmawHljZstS0Z3osOAC+gN6Mrc9auqZkw36ZLb0NMVwuwcyB0eKA6aeVKSyyu
         Ew4o35UjCVHP+8R+cOqMJ4jfh9KbfCnJtxODZeys/VEUYEVw9NrIne5TflLiH1ikNVJ0
         zd0Knuh8iR5Ew4MfRwwjv+2hJrwdZ8ovmVFkldesGOxkbPKbh2JOeDGCuXDL0p7/I+IQ
         Wn/UAbT7E580pN9BGvJLXht7upnPZSpPuXY7cgHy5JYjyYdrzPt4RligdAla2yNziXEK
         OfMHgZGexUIlWcf8h0TK4hyeyM5zDRxNRkvD4cLjF/v1sLOCaZcnXzcoS3UvrMvkAozk
         T9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727434666; x=1728039466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/gJ4n0/JEYirGmCXA4CFRFlIdN6B2ALRebGpyiobAM=;
        b=IDFjaGeiGNH8BBvHmDZPAx1bfhbRn6s1E4yhUWBtkDTXyGfRurNEPctOVKsQ7Gr6Q6
         wBdk7iVYhsmG6VUEV5TeOiIfnglPbz9jQmx1f55AhoybVSosPfuhwsY7GhQljalMLsYC
         cx8CH5JDpMyjxj8vHP+MocHpOlB60ef3sNErkaisPzJ6oxpkHVWhX2JlRWzR6rSUedl+
         9iJT46xlP0+ffvkPsd6qYsaxALtZhMRKhjHxj1DetVTaNn01atGHW/xc+jQdaCybumfO
         ki40ziVIJpDmFD3AYg0KVHutf4iMVf5yv3hLTNSZNlhHLDsOcZeSc1//SqdrO/6x1cKA
         Fzzw==
X-Forwarded-Encrypted: i=1; AJvYcCUMDIS+DD88f11OAay0SDePbVBMWsevbiothMgS6FrxwOxHJExjXHTyNG03kLLS2032vTgFHN65ez7yEJr18p8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh5uBxGxdGrqmBduh0PRuy8klKoD/9RMVqfg4MM7RiNPauz547
	nYd5nI8yNLRJjdZwFPs9lLETfavJ5ryy16JKAg13OU5FykcQpwITFHBKwVQheBc=
X-Google-Smtp-Source: AGHT+IHsZ8uZoC2TgFmkkqu47kPVnjvWS2f0IprjIc68V9e4dQg9h3d3zvuwcxMOX7+Ce+bYc8+VpA==
X-Received: by 2002:adf:e6c7:0:b0:371:8ea0:e63b with SMTP id ffacd0b85a97d-37cd5b2cdefmr1948803f8f.52.1727434665802;
        Fri, 27 Sep 2024 03:57:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57de10e8sm22572925e9.13.2024.09.27.03.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:57:45 -0700 (PDT)
Date: Fri, 27 Sep 2024 13:57:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: i2c: max96717: clean up on error in
 max96717_subdev_init()
Message-ID: <4b187b7e-7223-48f2-add4-bbc167ab7c4e@stanley.mountain>
References: <23251b8e-c148-44ef-bc9b-f39cecc4fb12@stanley.mountain>
 <8d281bcbc504abaa9838ff666a36515cf7e57239.camel@collabora.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d281bcbc504abaa9838ff666a36515cf7e57239.camel@collabora.com>

On Fri, Sep 27, 2024 at 12:47:03PM +0200, Julien Massot wrote:
> Hi,
> On Thu, 2024-09-12 at 11:51 +0300, Dan Carpenter wrote:
> > Call v4l2_ctrl_handler_free() to clean up from
> > v4l2_ctrl_handler_init().
> > 
> > Fixes: 50f222455793 ("media: i2c: add MAX96717 driver")
> 
> The right commit to fix is:
> Fixes: 19b5e5511ca4f ("media: i2c: max96717: add test pattern ctrl")
> 
> Since there was no control to free in the initial driver.
> 
> Reviewed-by: Julien Massot <julien.massot@collabora.com>
> 

Yep.  You're right.  That makes more sense.  I'll resend.

regards,
dan carpenter

