Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5F1172BDB
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Jul 2024 15:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720797163; cv=none; b=BcZUNeGtAEhuMamIrE7YdXp34fCQW4sO1YBFzQ8OwFLlc4m1STWwL4UdmlaKZzo7WNZoVnUmOZQ9TIUL0HwRRLvt4y7oEsMzZeS7nZA/7WcnWSouYY6+w9PlBFMOguJ6VQUb2rk4md5jremBpJfocRyIjAcJV+1F2u6pyqlH9dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720797163; c=relaxed/simple;
	bh=9Elco0jrI14dsSz5iWTmdNQrcLzKyx5FN7AKXrL7zxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lv2Cm+qScnHDaEPx1kcq+2dJbdYbHB4NqrrYnMbbGJx+lD3xD5Z9o43cepP+QHiNpJkZJNQY/PUbtYlRIBXh6BZ6po+9d0+dSOI/ODgqC1PfjgilG9JFXtTCk/MVqt0DdyJt1upSuSTepE4d9ZmMV0FcP4CQG4uIG2gnL9uxh3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VvorxtMW; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VvorxtMW"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-25e0663de76so927869fac.1
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Jul 2024 08:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720797161; x=1721401961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rt88iW4L24gNZ5mfcSmKf+MLZYXAgtP2FGJ8f0TB3k0=;
        b=VvorxtMWtidozq3ZxbEKJD4dMNeTxjuE+RIv7bC2PzWQsLhvn74getMfQV5ugpNXGO
         PAzZLB5DETmwSvlbNgYGOG1Vh5X62u51Uu4IihS88U6cZzXqp+gKxflOZudbRA0yfncO
         F1II+cCjOINYud6zGBlIDaFNmGNN8mTNMmx0ahhGd6B4tIY1A4p9uAOG1ZS97Kii+MEO
         mM9m1DJ19ZVvaZIQ8R/truBwrSmmt8EYHWpsE+I+TOW/r5HxkdAGCq/8dLLTP1ED/LHd
         DnPECv0f2ZzmMUOI6pVb7UiHm9C6nSuuJF9pCMB7TlH6Gz6ArJwagDzFs37GSY4xXFz3
         Ht8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720797161; x=1721401961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rt88iW4L24gNZ5mfcSmKf+MLZYXAgtP2FGJ8f0TB3k0=;
        b=CDfvFwZ0boMBRPzV/IZfk6ZQXt69SzBSeY3SsxYssrei2YngTs24xmAQ7BDft94MWQ
         97Ar2pWvx2v1BExo7cX8oiFTeUEVSLrBYF8M4AGDIIC/Gq9NJg6wKhWj8ROmyCWa+BME
         xs1J6unvD1YcbYVei25TANJg8lvn+7u/9AK8xa0NgivE44ekb8H4zYgNWYEuSypuksgS
         Bn+6Epwb4QdacGgRtFGB1RhXSdkVgxySmhMTbUNuInL9lLB433lsFUW142BsvcpPg1fX
         jqfjNJ/4q4K60tc9sRQt/gDkmM+fThN2N5vHk9y8pOfn4gNmm9AFCNt2/KF99M2o400Z
         f0rw==
X-Forwarded-Encrypted: i=1; AJvYcCVyIvMNdOVnNghTkSYpUCdrbtJ1vTlgJI/GdbJaPinfXnoUubUPwkXScNpRKVHmJs+tklrzGozkZQdBESLaeZjUTfV3YpSymdRrz27x8/qm
X-Gm-Message-State: AOJu0YwAJ2+NggeCv/+I0k4Ba23VKwNXV/kKrX5zZC6/TeX+LxriMUx8
	xEMFzne3MsiX5KFlw/XIQ4DylAPQD1NLmWea/RsORaB6uksme9ZSd+E2xs3xBRc=
X-Google-Smtp-Source: AGHT+IFRujCPbv+JGhve8HXrVori+HKTUQ3sHhSn4FFU8PoDISrKc47mDRc08i0zN5Rtsbb7Vo1b8A==
X-Received: by 2002:a05:6871:552:b0:25e:b6d8:5552 with SMTP id 586e51a60fabf-25eb6d8647amr8957294fac.5.1720797160737;
        Fri, 12 Jul 2024 08:12:40 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70374f78d92sm1605651a34.19.2024.07.12.08.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 08:12:40 -0700 (PDT)
Date: Fri, 12 Jul 2024 10:12:38 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Eric Curtin <ecurtin@redhat.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] nvme: apple: remove some dead code
Message-ID: <08e9da6d-fb31-4b0e-b0f5-318b0ebbf10e@suswa.mountain>
References: <124bbda3-7ccf-4e6b-b30d-7115e1c2620f@stanley.mountain>
 <CAOgh=Fx6hcJdbQpna2JJhnzp=YG_nyg-gpd=ZH7CewudtgDhAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOgh=Fx6hcJdbQpna2JJhnzp=YG_nyg-gpd=ZH7CewudtgDhAA@mail.gmail.com>

On Fri, Jul 12, 2024 at 03:29:21PM +0100, Eric Curtin wrote:
> On Fri, 12 Jul 2024 at 15:13, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > platform_get_irq() never returns zero so we can remove his dead code.
> > Checking for zero is a historical artifact from over ten years ago.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> There's quite a few return paths in platform_get_irq_optional, are we
> sure it can never be zero?
> 
> Not calling out a specific case here, but it's not so clear to me how
> we can guarantee platform_get_irq() is never zero,
> 

The platform_get_irq() function has a comment which describes how the
error handling should work.

I wrote a blog about this:
https://staticthinking.wordpress.com/2023/08/07/writing-a-check-for-zero-irq-error-codes/

TLDR; platform_get_irq() used to return zero on error but it changed
in 2006.  I believe someone told me the historical situation was
actually worse than I described where the error return wasn't always
zero but depended on the arch so sometimes it was -1...  Then after 2006
zero was success for a while because there was some hardware where zero
was a valid IRQ.  But now zero is not a valid IRQ.  I think Linus has
said that zero is a stupid IRQ number and support for that hardware was
removed.  So now it never returns zero and never will again.

There are still some xxxxxxx_get_irq() which return zero on error, and
those cause quite a bit of mixups.  Last year there was even one which
had a comment similar to platform_get_irq() that said to check for
negatives but it returned zero on failure sometimes.  :P

regards,
dan carpenter

