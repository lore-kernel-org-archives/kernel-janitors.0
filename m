Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8303BBC5
	for <kernel-janitors@vger.kernel.org>; Wed, 28 Feb 2024 17:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709142180; cv=none; b=NKcJxuM/1h2CgH2gD/Cm8ZvVhQ+0Gz8o7O6Hcx2K+45nUueF9m8IIR3TUBWVSYEvURNWIz6vTGLc1V1KIGqCtYAe38KukQRkJaCgq66KuThJcsT7O8uAlAkvSgDM0TNqU0N4KXQygm1fo3Z1D/klnVc1xa9oRDsjgXtCPiwqnhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709142180; c=relaxed/simple;
	bh=OnTfdMWKLwh8ThOMjY8rRqP+fXnwlTEZOKp8/UdqfZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0KBEnidGgJ5b8+fUmoVx0Oug2ev+EHttucE/YQT/8K+W6oAb+z6x1gjcm8HymQybqFqxv8S+v4QFcX8VJfTyvoLMxDq3pTPfeinyW+kYnKKeUOPYzQuLyBPhTpkBHn8g/iBDdhpVfr8JOLNseOzlWxViZAubXLlGVft2Qi/oNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HB3WysVT; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HB3WysVT"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33d0a7f2424so28214f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Feb 2024 09:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709142177; x=1709746977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5XTL7Wi5fSoGtPT9aaYhGYa7xeX5imrSZZwRbhwuwVM=;
        b=HB3WysVTsoXuAk6qBgsO1dAToEe0AoD0mUK32iptO8rvhe33gL0+nKv/2tryZrxNkX
         ot/LrAEsqqF+PFt6Rt+BbNkRR+IE0AM6S98LXm2rWu4e/uG8hMReatmoDebdsFDhpl7K
         knR1FD0tgH3HyGGWzFTO8eTNUaYEdtRV3npePly4vlxNhVjP9FuhzoHljDuJtMwrpCRk
         wLdSkeU23YwOCVcALZiu0Lltz4wkI2aSx1i/63U/Zukdm3jmKtrpAe+fgqFftAbJXgnz
         a4RAOs+T8tgvXMJnUrYuwVZfT+Xb58k+Mn3sVksiXbRLjk58GIlpxyuc60yuRL32dWHC
         F2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709142177; x=1709746977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XTL7Wi5fSoGtPT9aaYhGYa7xeX5imrSZZwRbhwuwVM=;
        b=jPRhnxcXZjiBxry6GYynmRbbuFWfYKzCj+ZnY+rcsC+Jy76Sny7QYOhh3KU4OzIPQk
         rhEq59jRRsfIo+oxydeI2rohB3jyI6BZwPdLgAnxyQSthehr4TDyTpqcjKmaru1J/Wgb
         PaCt7AuWUGXFaQpQXW8XAVyXb5xKOCr4PNOD2MTP3fQSjN5kj6D+73fl9kflkfrNE80p
         Ddr+g+Ec7374F0kd7pMcg2EGrlhxzZ+Rjbe6g/sNy1Glyrg1TFi4QMGvohrviH59ibbZ
         wFXnUa5lzUCeA9O7jdmfFTve34+xba8IIAZMb1QgLH2ouqAavQY7RQ6bEBUjfYUjr5XF
         q+0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmmluhIx3ok9GowQKKRwujrFGlkp4vZ+OnNRLAZq4ltbwbVporB+Ra8Z0H/oCULNPNdZk/D6q1I8rP05mGImuidfpaj5Je06IA+C1Ge9nS
X-Gm-Message-State: AOJu0YycNZbZv4/4BijQH37d/k3AcdkEYX+a+lUGGHNgr/fUECF1Wilp
	X9nNoAExYHOlbsgU8yYauXTq+/gXjsvwP/LB4WdRvJpwTwm74Ndlt4eMbawbyrc=
X-Google-Smtp-Source: AGHT+IEPgnl6zrKV1TWi+lu4XTy2PTm0dyVStykU3E0t1mjb2hp9hd9ASfakK+UaUYWfPrmiDRXcrw==
X-Received: by 2002:adf:f049:0:b0:33d:3099:e67b with SMTP id t9-20020adff049000000b0033d3099e67bmr157217wro.63.1709142176705;
        Wed, 28 Feb 2024 09:42:56 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bw11-20020a0560001f8b00b0033da4b06632sm15535993wrb.6.2024.02.28.09.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 09:42:55 -0800 (PST)
Date: Wed, 28 Feb 2024 20:42:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cindy Lu <lulu@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Xie Yongji <xieyongji@bytedance.com>,
	Maxime Coquelin <maxime.coquelin@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] vduse: Fix off by one in vduse_dev_mmap()
Message-ID: <81e2238e-3ed8-44dc-82fe-256155c271ba@moroto.mountain>
References: <e26476e0-68ae-412d-a5d9-4996bc30d038@moroto.mountain>
 <20240227104743-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227104743-mutt-send-email-mst@kernel.org>

On Tue, Feb 27, 2024 at 10:48:49AM -0500, Michael S. Tsirkin wrote:
> On Tue, Feb 27, 2024 at 06:21:46PM +0300, Dan Carpenter wrote:
> > The dev->vqs[] array has "dev->vq_num" elements.  It's allocated in
> > vduse_dev_init_vqs().  Thus, this > comparison needs to be >= to avoid
> > reading one element beyond the end of the array.
> > 
> > Fixes: 316ecd1346b0 ("vduse: Add file operation for mmap")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> 
> Oh wow and does this not come from userspace? If yes we
> need the speculation magic macro when using the index, do we not?
> 

Yes, it does come from userspace.

To be honest, I'm not sure about speculation.  The similar places in
this file protect against speculation so, probably?  I'll resend the
patch.

regards,
dan carpenter

