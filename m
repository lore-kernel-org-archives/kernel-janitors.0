Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866DA331EDA
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jun 2026 07:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075335; cv=none; b=ETILEEkHpDLLN96U6EQgP29hkvCVVuUW3BuIiAkyXwdLWo7Oa2F9KtkUwkxp2vZR4rw258Vxl4V/zlZs+D+Ak0NlvTbXF1c6y5rPKjglsqPcjoqBupNXVN9LVYqXSHl/HG4rymKT8xBLOA/+ZI/iZPzD7a5Zp0zAjNSB9yEbC9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075335; c=relaxed/simple;
	bh=jrcQ/583+R3CHJddOVqfeMRFjXhkgPkP3fN87Q62ZoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbjpe7vXeVjAyiNg6bLms153rf9oMW6g4I7NMW1WQFs7+VK5hbEyhS0PiBxu9PppR7qlQerONE41O8jY8+wHjIMuq6VDHb8IQDvk0DzrybxUOqWNA4MGmclwMf2asZr69X6rjG1mPV+Q2UJgVzUofVf3vt4KrTZfUJP2TMUs1N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lf55xpF/; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lf55xpF/"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-517de710886so5046941cf.3
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Jun 2026 00:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781075333; x=1781680133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rFFLmi2Zspzs29/Zve9KRNQHJogssJd0t8KLoa+VU+k=;
        b=lf55xpF/obQydV15uzESYRViJyqVvsIJOI1f6gz9JrKmeIVxS6XyHvsQGaIPzst8kg
         3JWU7A5LTQTlDvVNwK3l38aMltxn/o51+c3UzmMt5qJQKA2AGEVsEPy1nd7ldKjnhYSe
         6xxyzQCCzUcZehO+VMOmvfChsuDl06IfVlZoP0wB5ti0gYULZdgH0ZnSz9UNay7mv/v8
         DZUlZnMm1k5v+XSk35CfT45FRCClXoyuaNYU7OY/N5yOkbM4JjiLANhpjEQuG5jR3U6h
         xrSe7Xmv/v5HY9+WiMlbRUsERkZpyRDTl413qSu2V9suDX8RMoJ1McdKuYtcnYKZkQRR
         ofBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781075333; x=1781680133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFFLmi2Zspzs29/Zve9KRNQHJogssJd0t8KLoa+VU+k=;
        b=pikZZ3lztVGfgIU7y4uT1PWF1/3QDorl+lzzrBlVjom3CDx+ch/wj+ftWIj04LIZAJ
         Jt7Xeytsqih2xQtysoGwKiAVx5R9HMjSev1aWgCY9jZCrXo/cu0r3VSUtSVSecW/MO1T
         JY0yi0q12NrUHcKwwoLv0/2cIDTQKtey8P/x/B3ATrvM2lCpARxnGaUsCknR+q05MO+A
         gy5X/q4ILf+ydLhaFFYv5AYAnP7lTT0uGD3YLSedrrfwOniqBQkbFb/IMVPLenqiVNF0
         TBK57i9OBQLBLX71X8mXGgDh9bsN9sIXZhNPB0ZZ1N0EObQfh+DusFJipWfvGZKdiMrb
         ZE/A==
X-Forwarded-Encrypted: i=1; AFNElJ/58i6S7VwE+wQSBolm9KyfLUB2czBzaboyigUubFU8BLvfzmkX4StC1FIJXcFL8W8aITAfpdMaYIMz7+Yqj78=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7l3SgTyxuL/ae6BNVB23YACMIs8I7yKCKO9bP3SyTShD3d1qZ
	J5NhpWt7FtFY/hp2CTOYaBs5ByTr3FGZQQYjYo2uJYeOer76zRsXGCEp
X-Gm-Gg: Acq92OErnQkuSk0z1xCR0wMmpB9Pff8NKfzabQ8DzwWqI0Yv/9nR7vHmtW+byG30Tnf
	kMVFjKmvwzEIn2YgU4PrCvr3TDdzs0bE82bcqxTxccsNoBJKyvM83ps21/bDYVN3AzpcxiGEqeA
	T0Umyo2LPg7SFu9f73e5e0+0g9yNHNODOqUuADu1LozM+qeSwvI9ZfmxyFtW23DQtuNsqBkz0aj
	HHFNjIviyc2Kj/gF/Gc8hZ3haDiG8ZYTV42eZ4L7kbDroljiOmnNu61xnWAGdjRSE8jX2MCl/5w
	LGrUnqCIzw1GEQCWA6VSuTKTr401YO/jLmTL8x+UGTYb7a+QOyo7t95Mgytqz+FG6M+7gVnl/yi
	mP9ktouBMDlmnHuNkU57FjlDA1FbPB8EY0dItGh+YtVaH7cDZB75zsG8nxj6CM+pMzNARJZAzH+
	WWVYLFMEv5IRA5/52REEf0TUYwu7s=
X-Received: by 2002:a05:622a:2509:b0:516:daca:ea8a with SMTP id d75a77b69052e-51795a4149amr309829301cf.20.1781075333520;
        Wed, 10 Jun 2026 00:08:53 -0700 (PDT)
Received: from localhost ([149.40.50.222])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775da6f41sm202565081cf.22.2026.06.10.00.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:08:51 -0700 (PDT)
Date: Tue, 9 Jun 2026 09:19:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>, Nuno Sa <nuno.sa@analog.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iio: backend: fix uninitialized data in debugfs
Message-ID: <aiewiqInppHKilw1@stanley.mountain>
References: <20260526191946.409160c8@jic23-huawei>
 <aiEpmqKwFuIMRfdl@ashevche-desk.local>
 <aiEtIGOFhF8AfUCT@stanley.mountain>
 <aiExQzpIOwPgwd3-@ashevche-desk.local>
 <aiE3N6zErq2WcCvS@ashevche-desk.local>
 <aiFVuvVtaWbjfVzA@stanley.mountain>
 <aiFWg6vC2cVbONTK@stanley.mountain>
 <aiGRzFrSU6QUL4R2@ashevche-desk.local>
 <aiJo1kjN3_XDUdBc@stanley.mountain>
 <aiKIoqR0IQBZ-1ZD@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiKIoqR0IQBZ-1ZD@ashevche-desk.local>

On Fri, Jun 05, 2026 at 11:28:18AM +0300, Andy Shevchenko wrote:
> On Fri, Jun 05, 2026 at 09:12:38AM +0300, Dan Carpenter wrote:
> > On Thu, Jun 04, 2026 at 05:55:08PM +0300, Andy Shevchenko wrote:
> > > On Thu, Jun 04, 2026 at 01:42:11PM +0300, Dan Carpenter wrote:
> > > > On Thu, Jun 04, 2026 at 01:38:50PM +0300, Dan Carpenter wrote:
> > > > >    168          ret = sscanf(buf, "%i %i", &back->cached_reg_addr, &val);
> > > > >                              ^^^
> > > > > Uninitialized variable.
> > > > 
> > > > s/variable/data/.
> > > 
> > > With what I asked in the previous reply and what you explained there
> > > (thanks, btw!) I still think your patches are not fully correct. They
> > > will require to atomically write all or nothing. If we want support
> > > partial writes we need to go with that differently (reset ppos when
> > > we got enough or more than enough data).
> > 
> > Requiring writes to syfs and debugfs be atomic is pretty normal and
> > works well in practice.  These are very small writes.
> 
> Perhaps. In any case your patch will break existing partial writes, right?

partial writes never worked so this doesn't break anything that wasn't
already broken.  Another option I considered was just initializing the
buffer, but returning -EINVAL is the right fix.

regards,
dan carpenter

