Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930E430FC10
	for <kernel-janitors@vger.kernel.org>; Mon,  5 Jan 2026 10:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767608282; cv=none; b=ejXMkqmRGpXUcae7QBIeF1j7cN0Mi1D61s/cNrf4Rf62asIU4npxcirMFuwXNe14W1rlt1LzIY30LwU/sS88QSR8tYoPUaeIjIQp3FurX54p9sSMHdv7oyqNfI6CSc2UgR1roxUfmL5qqeCfRZwV0X1U3GGNBBmaBjyJ8fpwTa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767608282; c=relaxed/simple;
	bh=NyXaMzDErEA3jOKkS6g7KIPNUYJqH4kB5dkra/tYLyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XErSia8GQbiUBnF5vfPyx1U/8uy7UeXQaRGuaSn8Sdl15mMGZBpWjUA0FLXzVwXp2A5cvxc48qSasiLEPgZXKGcVoXnQpQaXQEzoWglDah61WAi0b26ggX73p4A7BrgYFfNf3lYyzvtVNlpl4ABfcjtDdiT6pS0e1Fu4lLACIls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r+nB8QZV; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r+nB8QZV"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so11340345f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 05 Jan 2026 02:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767608279; x=1768213079; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMXZd0k2gZxn0kgU5s3lzwvKxk2LyOp4km2h9OrJH7Q=;
        b=r+nB8QZVDn4QauAWQvOzwAr4PH/K8EOtelqRKDJGW3qwdVvMn5cxsXsmnrrqWKmAeS
         sFyFFGtPjxFeQKkBuorQKDsSW0V+FaaIYsh6Fs607zMtIFqDbVQMWBdM69iZ7/0N7OI4
         pHl+DUKJ7uzEIjAqddBTYJNrY2RCZ/ZerZDjhwgfp0KO/2BmxqvpsNmnA4Q9dBM7aqnS
         fbwCouy3EaR32n3mUYG1zwgYbekKuz+Tg1hZwZLcTZRC2Pj1BqTyiBnPx+h7h+ARK4jz
         0puzKQ0aXeiTlV3YQtpfAlFhGMZ5qBZiPzsWkfVozfRuPRQqjkkZ9bydiKFgDWRvZOWq
         +DrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767608279; x=1768213079;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VMXZd0k2gZxn0kgU5s3lzwvKxk2LyOp4km2h9OrJH7Q=;
        b=uzpCkYlCW3qRTLCoCEU3qwud+BkOwVWf/9DOltg74AEEO846RICIoga2xe/TMa6pWc
         LZV3DDYz5FVUYnm1I1AxNgEr7br8nw2r3JHPnHwNvgPMta+BS94SyHJI84ty66Rc6zVN
         TUb6r+Gc+qTkmBfo6xb7MJKK47eeT8kKFyI7N9tWcJ2Zb8XiOH0Icsi7ayPHsHYOqpiK
         JWZTJNQ83s/xjfEt+IEAYFOAYRofxiU9AA8VsYiH9vzWQc9n3+9K//g4tpgCxwWzSfAn
         R7d0qGJhOYqrNW/AVoZZBvFL0MIT4hsu2u+tlGqCWx7/Y48WDwN16VpKnvjyL16KoQ4p
         QPvg==
X-Forwarded-Encrypted: i=1; AJvYcCWinAwgLrNwRwmvXu2KaUMRB3ZtddoEXTJqOA9BYgVGBqvKQgDoJ0fyVdmWd29/ou4Zxrxz7WMiijcAY5MxMuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWrtxFcOktHHyaCn8Za+8vUlwdUeMf6vxE7W5WX5E88DqzBNBi
	slghRI6bhAJtm4ovKEXbXc86YtPE390Qx7hORaW6tecsv4R5z84P6YsD2wT9vKb3WCk=
X-Gm-Gg: AY/fxX4gQ/hI4y3gA6zWCvbkQMmB/HlI2EPMlqUlfswHZ4UcAa6hZbRRWK5VF09hWhf
	yuKGIlVRiZE+aK9DKDyBxhDuFeiWtLelw20JAMw8Tzym4ck2zz99m3pcX6PI0AsSJiyTq9LTzvx
	IncDZ+krmUUMs0zk3HFZjjVJ3QP3MlfeYd037NKby2udN5WcqwS1oaU/VTdi7pqUxs3+S8CZlx0
	dqJufohnilHgi5LZDmsAvt9BCTERbC8MyjSDx/SQGz3qRL3Yh81Ro1k5fwGpgezCkuP8A1cajcO
	xfuBniBrQWbfy4dHgVxhX3N6+NMH2jImLYtacgmSoSjN2X73oeu5nGqDbMuYQzdvz/qm1oiGxH/
	rUq0kYvO1jfxY/X3yzbla+MRZkPeWLKBKZC/7R57q2DoaICCgoHz8SU9Pafg3GEhA0XkoSgM33Y
	J3j6o2dARe5cuRWncE
X-Google-Smtp-Source: AGHT+IEkiG6mOIxmE+qAmWBQCXghDrypzkvELGSywwjbqNdPJFgJnMlRBOP7ilekWub2UAgbWww8Tw==
X-Received: by 2002:a05:6000:2c01:b0:430:f62e:d95b with SMTP id ffacd0b85a97d-4324e4c9cd6mr71242039f8f.15.1767608278863;
        Mon, 05 Jan 2026 02:17:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4327791d2f3sm69077587f8f.11.2026.01.05.02.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:17:57 -0800 (PST)
Date: Mon, 5 Jan 2026 13:17:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zilin Guan <zilin@seu.edu.cn>
Cc: markus.elfring@web.de, James.Bottomley@hansenpartnership.com,
	jianhao.xu@seu.edu.cn, justin.tee@broadcom.com,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
	paul.ely@broadcom.com
Subject: Re: [PATCH 1/3] scsi: lpfc: Fix memory leak in
 lpfc_config_port_post()
Message-ID: <aVuP0lJxn2pc6cNa@stanley.mountain>
References: <149a576a-6a21-48c6-b121-b20c6173f7cb@web.de>
 <20251230062008.1021449-1-zilin@seu.edu.cn>
 <aVuKJPNjNyt3_yEV@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aVuKJPNjNyt3_yEV@stanley.mountain>

On Mon, Jan 05, 2026 at 12:53:40PM +0300, Dan Carpenter wrote:
> On Tue, Dec 30, 2025 at 06:20:08AM +0000, Zilin Guan wrote:
> > On Mon, Dec 29, 2025 at 10:09:04AM +0100, Markus Elfring wrote:
> > > …
> > > > Fix this by adding mempool_free() in the error path.
> > > 
> > > Please avoid duplicate source code here.
> > > https://elixir.bootlin.com/linux/v6.19-rc2/source/drivers/scsi/lpfc/lpfc_init.c#L563-L564
> > 
> > Thanks for pointing this out. I will use a goto label to unify the error 
> > handling logic and avoid code duplication in v2.
> > 
> > > See also:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.19-rc3#n262
> > > 
> > > Regards,
> > > Markus
> > 
> > Regarding the stable kernel rules, do you consider this bug severe enough 
> > to warrant a Cc: stable tag? Since this error path is unlikely to be 
> > triggered during normal operation and the leak is small, I didn't think 
> > it was critical enough to bother the stable maintainers.
> 
> I don't agree with either of Markus's review comments.  People have
> asked him to stop reviewing code or at least to stick to pointing out
> bugs or complaining about style and grammar issues but he doesn't
> listen.

I meant "or at least stop complaining about style and grammar issues".

regards,
dan carpenter

