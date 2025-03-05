Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA6721480C
	for <kernel-janitors@vger.kernel.org>; Wed,  5 Mar 2025 14:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741185443; cv=none; b=VOCId1Ng8ErDATcmfHPYqi+deMOZInldrgpgkQzBLNZ8EDbldny9Rolm/uU7J9DTHj1junMJJY1Cqqa870Aj/VydqwQg2LX2AwQZ1FeJwkyG3mI74RxV5I1W+y+EykOYytz8/Qh+FTMXC55OLnGQbMRlSp+zQWCvA0/gHUGZTwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741185443; c=relaxed/simple;
	bh=/2L73gYxIFC4MZUK06kGXbM8CUdBu7Uz2d/2/j+LcDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOm/5OrH+WbY4izY/j9ZrBaV0OIVg5bOntftmvgjclf1MsaR7BNcl/v4EprzJl9uk9Bt7qg2TzL/Y+OuTRtU9xxhs/bcq9TJMEYino8Oxf2WFL7HZo9dI+lueZixP1yHZAztp4brAw9T0qIPvynhek7H60ce61GK9PyHI+lGNOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s5lGOS8s; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5lGOS8s"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43bd732fd27so4264745e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 05 Mar 2025 06:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741185439; x=1741790239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iwOQvwTg5BHs7dRwnkQr+dhmEfDDx/7fnNHWIfQqz+A=;
        b=s5lGOS8sYOB2KSN94BuUpU0xyWRpPqpVvUD4gGdiZ6sU++6xrfyWk7UqXLOA17avJU
         790O1SQhni+E0zFjQ6R76xv7bSNw+VyIXsqmsS4r5VPwOKv7zrW0JhvD0tRQ57entRcM
         BehhHT9VANrAjMlwun2t7mmJPb59k5C6saFTzZfPHZo+ksJO/kduqY+BCeCDQ9RSx2rf
         RhS/YPE0cvi/snLbgvTDrVtb/gP7Jw7mv6hdPRdQK/QFmntRdjRLINa9dwhlVTwpWncL
         iK7JBGmh/ddb2eMCvlpFZLnGWWzGxnDlJ5lPu2El/j7u6xqcxEL1k0KPL/n1rPfoV3/7
         obrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741185439; x=1741790239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwOQvwTg5BHs7dRwnkQr+dhmEfDDx/7fnNHWIfQqz+A=;
        b=oyXFkb+vWNk2Rv7x5DiVqWg1tm24C4dP6zn0CryBb11MbQd3KPb80e1d5hCOx0rKyo
         KYEYrR82H1ebnxjPtZAYsnE5utWLF5LVwcQqqid6EdomdvzSguFD/t0ZdxAl8XKKAfke
         RcNH8G6Gc21vjh5iLSzK4EF+7zgPPX8ng7J9E2dzF4s5+XQA+dKmpc3cFH37LWM25fnY
         NJO/V7UBpsQZECH46OsQ1Oms+2MSPifX3sMZMSPk0iPGRR3qSF/rYV3WkjGfNjMJ4GyG
         Y9nJ1UlInHcdkHI4zjf935RCyxgMy4Cu3k+Y/qXsVSqRBsJbeitu6+R9y6xN94JkC4xB
         Hy8A==
X-Forwarded-Encrypted: i=1; AJvYcCVoBQyhs+9RgTf1EhvzU+docW8NOJX/wI2vTB+QR/ODuMBYJQEMbhz0qUx4YluikCLREkhXitfnisaHdUpTxI4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7h4ok1YZo4oXf7Wz6UugV8nU2U1ub8BEzPlbcdK1IfU0s1EFT
	ATr6quBcVfpqXPSM7Pd1x9z7zGgTZ6e/RZcWP0rt/HwrAS+CNjIgBSfIepvEVDw=
X-Gm-Gg: ASbGncvv4N+z0V+Y+vZ6cviGRoLxWVzUTDAJuFdzgkzSi0qgbjfvaMxrpoaIvllvmyt
	CgXQsH/LQWRDyEWnyrGpid1pJKGJRkS/8hUeKyk7rLDTqmgolIU4MDUfmB+F5jC/J4a7vw1xixy
	aPYD4mfChXRA9U7SMWdlyGliS+QCxIy0lZK/wJuEyLm8xV41KQNewJRNzfHVPiVtcuQfW3F+5hY
	kE5ByqMT4jKCXn6yHGGVnY6PnkpEw07pIBD49x4Pitpqhl2VPrKSOCBDhdBMVK8qSECGvbVnGXR
	IdZnGZldF9zpOJeQHih4pOgJ46Ee2AM7GVxhQH8blVOkGLXsYw==
X-Google-Smtp-Source: AGHT+IEMxeY9Q/Lqs9IN5AO0arzXvUgn/JnK58WwLTaOCw86mTQyFLw5mdcoyDfgg9Sb1o7X+y2SwQ==
X-Received: by 2002:a05:600c:a40a:b0:43b:da56:4d57 with SMTP id 5b1f17b1804b1-43bda564dd8mr1635005e9.10.1741185439498;
        Wed, 05 Mar 2025 06:37:19 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e485df5asm21429993f8f.96.2025.03.05.06.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 06:37:19 -0800 (PST)
Date: Wed, 5 Mar 2025 17:37:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] nvme-tcp: fix signedness bug in
 nvme_tcp_init_connection()
Message-ID: <739d3443-61c4-4b69-866b-142efde59062@stanley.mountain>
References: <0f3be9ff-81a1-4c33-8960-75de2c239ae0@stanley.mountain>
 <20250305142554.GA18330@lst.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305142554.GA18330@lst.de>

On Wed, Mar 05, 2025 at 03:25:54PM +0100, Christoph Hellwig wrote:
> On Fri, Feb 28, 2025 at 12:39:41PM +0300, Dan Carpenter wrote:
> > index 8a9131c95a3d..361b04ec5b5d 100644
> > --- a/drivers/nvme/host/tcp.c
> > +++ b/drivers/nvme/host/tcp.c
> > @@ -1495,7 +1495,7 @@ static int nvme_tcp_init_connection(struct nvme_tcp_queue *queue)
> >  	msg.msg_flags = MSG_WAITALL;
> >  	ret = kernel_recvmsg(queue->sock, &msg, &iov, 1,
> >  			iov.iov_len, msg.msg_flags);
> > -	if (ret < sizeof(*icresp)) {
> > +	if (ret < (int)sizeof(*icresp)) {
> >  		pr_warn("queue %d: failed to receive icresp, error %d\n",
> >  			nvme_tcp_queue_id(queue), ret);
> >  		if (ret >= 0)
> 
> I hate these magic casts.  What about something like:
> 
> 	if (ret >= 0 && ret < sizeof(*icresp))
> 		ret = -ECONNRESET;
> 	if (ret < 0) {
> 		...

Sure, I can do that.

I don't love casts either.  I normally have tried to write these as
"if (ret < 0 || ret < sizeof(*icresp)) {" and people don't love that.

regards,
dan carpenter
