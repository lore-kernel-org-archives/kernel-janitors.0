Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109181547DC
	for <kernel-janitors@vger.kernel.org>; Wed, 18 Dec 2024 17:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734544322; cv=none; b=nQwdEc1WYktKqS4KyAP29mVihz/jqkxuDvmNF2VRorpeaxFPO8ilpaeP+WbH+ent4XQecMSxf+5hGN2bOmBux5YiuNfbDVGCaphYz0ORlWtuh6rBtT8IIr0uBhbYgQZNmFxT/OR1Pow41ioLy3WehQISh0NRS5AKnWbKHXSHNi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734544322; c=relaxed/simple;
	bh=2So0nul1mz0/2K4Ol25NHSdvjvCJf1yUkrkJLZzp1jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JlMpUAX8GSR+54XBeV/zCm+cWGXpdv8Nhn3WsVY/OJQLrFaqGEiUtoT0NIt+FyJVkyh+hlAhMNlHsWm31Q4jE3hNt/SnyLuQbQiDQLRs7vIOgrO+7ihiU32LpeN0wOPYgF4nS2fT38yFkxuQw6sSRL4fBX6KcHI5UsxibNO1TXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eVM2C8Oe; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eVM2C8Oe"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cec9609303so9417413a12.1
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Dec 2024 09:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734544317; x=1735149117; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WuTI8JBt/EZ+l8PFms5uxro4CHQ/QT9ZzGcBaY71A3k=;
        b=eVM2C8OeHoEjet1QRZ2YNkAD/OewghUWzeX+AWuzumsyaBz+5Xvvn3/KfTbiBVWxin
         6vzP6NXiX4taQC1GFnLKb/982MWXadCAyerVBa0MdkMKN5NeiUTOdlWk6lzJtzl0800K
         gZwfFNH71MAGSwFVWXWyVamphZW+RcUVY+bPlGPJDwlnc/D65286cJ+TvcqJMIOv5699
         IL7AbPJWew/kUrnC/W1hVt9k/xg3MGySrdKqX5lxXB3ywI9nWn77NWaBmKBO6/+r5o0b
         oeTfRhH4zlYqJ/tvi3TR+4/AFrz8sFUaD9CJW7n9i680u2VQaVG6jRM1w2tk/bsIjReZ
         PCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734544317; x=1735149117;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WuTI8JBt/EZ+l8PFms5uxro4CHQ/QT9ZzGcBaY71A3k=;
        b=rrnsW9IjnW+67AnRSmlB96V4AWEyNjGXH8CVmRKPnLdPzR4mNZtMsapsfxSkCPCDhY
         021yhy15ZB9WDYK/5iD1228BA+NdlQjOnevlR2PhZMKcNLTlHYbEMIq4Fn+8iMflvYYV
         Zz4lMJcGLXYxQG3eskXQExhd+x1Q8LEKreEg5iJ9/VH3EO1WkjYSNHbISS5Sht+Q9wvg
         uuimicz2nXEkbwTbQyFhTm9zQunO/+/h2z43Dejruvx0dlTp8pSrqpBXjGLM9v1HI9pE
         KwDV/b69PMJ9Llah7xbylpq4fqYmxPFEwuW1L9wq1Tv+Caat6Y+hqI9Cnj4U1wZKGvjj
         1Rog==
X-Forwarded-Encrypted: i=1; AJvYcCV5v5AD/vQOEWhvbSNfB7fajzBxrGEGmyKct7qdbWbbaiUgm+WEpLOcilsYjgIKwYdhXJAz9gci5NqDiMWBsK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzamLMZxyr7UufjFw7wFIXaaWRVhPgRjtIQnroWKG8AHFjxi1k9
	0XBejz4MpI5vPZLijxf5OjfnvSIgHKU+knFeiSbx4fdanU6DKKcTjiRUPjKDaXs=
X-Gm-Gg: ASbGncsucEGLOv3nJcIiLxGlbGVzhh+7Oh+Rg3SbuixToKJrSQt5A3WNtSxdqTvRcLT
	wHp/d+6hYCqQgvFB+wVsymnm44XVWH993Yb+z0xYHJ5mRiOFODB4Sbqows/F1giQN/tWadyibYW
	Bx/5pNCLnzonurQMuKQDorqRzoZdP7wbMiFgmbZjepZd5RwQ1vs8CV709mWr1KNolDga+uCj1cd
	gw9vSfVg4Yo2+OH6vfH9AjixAlm5ul9s2iMOI1xXIdX7C8DMOusPB8NJ3JVUA==
X-Google-Smtp-Source: AGHT+IH1c0SiqJ9S0vW3GjpTrilhfirwlgVe7LxPXAmcmvdcFWW1srbLC4xqZpvUu0l/1LZk2/U+3g==
X-Received: by 2002:a05:6402:3581:b0:5d7:ea25:c72f with SMTP id 4fb4d7f45d1cf-5d7ee3ff3acmr4017187a12.25.1734544317452;
        Wed, 18 Dec 2024 09:51:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ad1b31sm5553348a12.33.2024.12.18.09.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 09:51:57 -0800 (PST)
Date: Wed, 18 Dec 2024 20:51:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Geethasowjanya Akula <gakula@marvell.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep Bhatta <sbhatta@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, Dan Carpenter <error27@gmail.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Subject: Re: [PATCH net v2 1/2] octeontx2-pf: fix netdev memory leak in
 rvu_rep_create()
Message-ID: <116fc5cb-cc46-4e0f-9990-499ae7ef90ee@stanley.mountain>
References: <20241217052326.1086191-1-harshit.m.mogalapalli@oracle.com>
 <8d54b21b-7ca9-4126-ba13-bbd333d6ba0c@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d54b21b-7ca9-4126-ba13-bbd333d6ba0c@web.de>

On Wed, Dec 18, 2024 at 06:38:25PM +0100, Markus Elfring wrote:
> > When rvu_rep_devlink_port_register() fails, free_netdev(ndev) for this
> > incomplete iteration before going to "exit:" label.
> 
> 
> …
> > +++ b/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
> > @@ -680,8 +680,10 @@ int rvu_rep_create(struct otx2_nic *priv, struct netlink_ext_ack *extack)
> >  		ndev->features |= ndev->hw_features;
> >  		eth_hw_addr_random(ndev);
> >  		err = rvu_rep_devlink_port_register(rep);
> > -		if (err)
> > +		if (err) {
> > +			free_netdev(ndev);
> >  			goto exit;
> > +		}
> >
> >  		SET_NETDEV_DEVLINK_PORT(ndev, &rep->dl_port);
> …
> 
> I suggest to add another jump target instead so that a bit of exception handling
> can be better reused at the end of this function implementation.
> 

When you're cleaning up from inside a loop, then the best practices is
to clean up partial iterations before the goto and then clean up whole
iterations in the unwind ladder.  So this patch is better the way that
Harshit his written it.

regards,
dan carpenter


