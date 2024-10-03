Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFB514F9CC
	for <kernel-janitors@vger.kernel.org>; Thu,  3 Oct 2024 10:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727952950; cv=none; b=ngduIXQd247I9msEUGnpZdEBXS1YDdozPn7iBsbI2uaSsC4RfL9ya3/RELqm0MJm2/Q+I/cAU2DPfqAbGXH37xAoYRSBQPVjLM7JfTUoMboNoC+9PFXKdYWJUfLam1hzUZy2VSQVq16NW7o11wM7QQXFE5WmC1Mi7ozDecv3RBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727952950; c=relaxed/simple;
	bh=bl1J9uHL1t+SxYiDrslfTGhb7ZWw75hcSPtQ9oEB1o4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBuZ/Ux/2mxodsQ80m96EA5VROYw9x1R1lTbG3X+Z6jXaoAO9HjSe1JjqD8/0aNiJmtXFVBH3/Rv3eXHU+9LfZRpjutbpn8bFiIz7sltjNmCWPq6JpSglH3LMKRGzfoX/L7mVjz+DdXSxt+Ll0BarQkp0HnVERK9DZw64Q50tEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YFcOa2P+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YFcOa2P+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so8164955e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 03 Oct 2024 03:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727952947; x=1728557747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UIJ29ZZmbuiCOz/H02yJqh7NW6JNH11aYozskl/CpkY=;
        b=YFcOa2P+bivYLBnCVO70jaIXwBZUAdJIH79rOJfnk+ndAw/q049ZTSqCXQ5JUuK9Vr
         qTRm9XkjOYRTtaH54S34wRPY9uq505hoCVVnu5QJ1YiZUWQ5Fe955rraAisOBnXkVJIX
         lDIf9UGcswXojpeXHSQN287/IbgQP3ShyhSSZiuKrlZft0tXHTmurEawe0vPrhsmijH8
         Fm0IgtBzejARYFk6IUuXHmRZujWtNL/P5A1d0gX2mvGDkNWfE0uI2qW01uky6CKEtuz3
         PN2h/1va/4tu988lpPeKag95O+2AUnkXznhquA006AlvoIX/ZsPelVOU8G/dl/bzGa7s
         JSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727952947; x=1728557747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIJ29ZZmbuiCOz/H02yJqh7NW6JNH11aYozskl/CpkY=;
        b=k60XHFtWxX7FuTKBimNaowj+u2YkO6xPiqHq04Qe35wmygziRRnobZGm6oK0nZK/K/
         pmnEx3NPy7E5dfl88vRF0EH1KVzu7IwNEFlWNoyARfj4izFMicDD4YTc3uxVKdfHUGd5
         6oLbokjv9tHcAvrhfmuJNv+8mF1DaM2n7ELoYGuSqfTss6f1X7hViT+sr9Tu0/1xJXhR
         l68ZS/0bI0q8GTXwTSAXZU/U1Bk6Nh5wL8UIM+9Y/bG6+Q+SQ0HNksNppp7QX/6SrfXd
         YYO4jtXapvx5RAyusXzgTtlCM7I5ZVmvSqO5+HdwsKP/tGquheEGJ4oL4jG2Fl/D1Skw
         n6Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWp5gtCd6m46iT0j8CKKmF9pjaZqOw1+C234SUTpdg75Z4LHg4mcX3d3IKaB9AxbmV+MxGx5pVnJh9dDEbideE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+PWkYCibbVXsqoOYiv8iSLMJnedD5jYdWjKg4Y4ku5xwR2Q2k
	ucBonOjibsAhoG8Vwq2V8o1ovGFnpF8LF59f33MXIabOoos7cQvHDFYwU7nqUJ4=
X-Google-Smtp-Source: AGHT+IHseLyKrntM/k8lPBcSYPGxSnth29/1KsSzPhnElZMTWDE1jxRrCCO1LeVe4WcDE8gvczpQNg==
X-Received: by 2002:a05:600c:3504:b0:42c:af06:718 with SMTP id 5b1f17b1804b1-42f778f3619mr44325955e9.28.1727952947074;
        Thu, 03 Oct 2024 03:55:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79d8d2fcsm41802035e9.9.2024.10.03.03.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 03:55:46 -0700 (PDT)
Date: Thu, 3 Oct 2024 13:55:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrew Kreimer <algonell@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] media: platform: ti: omap: fix a typo
Message-ID: <9a0c9644-cbd7-4d9c-9a73-d5b37380fd70@stanley.mountain>
References: <20241003105158.15702-1-algonell@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003105158.15702-1-algonell@gmail.com>

On Thu, Oct 03, 2024 at 01:51:58PM +0300, Andrew Kreimer wrote:
> Fix a typo in comments "tobe -> to be".
> 
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>
> ---
> v2:
>   - Add driver name to subject.
>   - Elaborate on the change.

Thanks!

regards,
dan carpenter

