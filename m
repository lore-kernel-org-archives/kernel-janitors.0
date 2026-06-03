Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BC61A0BF1
	for <kernel-janitors@vger.kernel.org>; Wed,  3 Jun 2026 12:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780490893; cv=none; b=Xej4PA9GqpUdgyQoIvavRoJJAUfUKRScnlWfsMexHb8sMC91h9p7WDBBtA79jmC6NTIz+xf58PSUTXLTX+Ou425Bj8wCvux6aGDrqY+mZqhdq9VzuNWczg/6OXFEG1QKgFNeLuoVoJZdL2LWxW3U/2xGZ6Z7OOYQJAuzDblXt2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780490893; c=relaxed/simple;
	bh=xlOXLAxObYM0H755ypmNgwyw2u8sfHRzxCVxtOPiR6U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F3FEZ7LkDnWMrd124hd/ltchFRgWDOjn74W/M9dBTgQCd8qd6g5NWMfIgOi8DlLgSC7c+MwrmUrxjGctwsCAWt5qdk4J0CiERLVGeEydZQSTuYbnuxft9WpzI1oWHhxYZt/CxIYamE0itzMFdsnAHChz2xAfQO6iUWA5XjMY3zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFRqvq6p; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFRqvq6p"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso115394835e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 03 Jun 2026 05:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780490888; x=1781095688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVsxgh2ujbRwP+s61o1Lj96pnFL7ang79UkYU7JexyA=;
        b=cFRqvq6plQZnwjW1N10E+4jlpg1bKDo3EqO+vO8sjh9OHZhIedszNF+NAhokMnyyDh
         qI3qO8sBZ/GXjCzS9F4FQ54h31PbGN6AZYBSHSOPqI051BXvXugtP4bwzzpGMl+HYK6H
         IndiXj8r2LBFHDUPaIMHxbqnC14UENlglKPipY295Qt4LjuXDv4xQCjVmu9OWF2Vek+e
         u+MYhvHbwv+FEWfxLYMzZlP+5CcAxP1PSNuQVvJOIlwVO5t9KN4cVhzE9StIImU/j6Ly
         43bY9LVD46ucBV0BG0NH5rNxVHrNxWCIKnkhWuhoyxQKXEsevavlsqt3Vfew+q/utvP1
         wYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780490888; x=1781095688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVsxgh2ujbRwP+s61o1Lj96pnFL7ang79UkYU7JexyA=;
        b=QBabM128iqyt1oPW3NZZoolda5vwv/1xCI1F65N65AKDdmrQsN4bKOeh0Q+VbyfYPr
         ee0PtSyAqOyyKT6AOlYqYqH6TPqvAhKDjY8rnbJob2h/e43YgY3EwDo13ZCvbhs6zDxF
         soBrCbLETz+o/Sckzf8RB4YrPMbkNR5AURay/QcpKSSLuFzEUnduAYypwD5tJBECfCOo
         4dbpqrwxC8IaUYjQrjDhq+YRJlfTcddgbq7TZNNMmh7J3vMG9bCqyUoic+OXwscVdhSM
         C94BM7Gb9jIwdbFP30HN7QHQhLxX25D5OczzwcU630rJ5Tv0gTzsJO5vYKM422wBuLe1
         dU/A==
X-Forwarded-Encrypted: i=1; AFNElJ9hqNzWG8EJcp9yln8ZGYNcq61sd0sXT0JM6HtOBr7pE9ggTR9QmiHJ8mK20jAirEpAc12vYO3ur9Te+APkJ0U=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt9j4nioiSif3GjXELa+jt/tfXluE5/+mniblLRTczordTIglL
	zgHN51mvtMKC5krVcdR8BX7AT2cKqD32pvXCQ3QJDCpLK+cj3Dei5vto
X-Gm-Gg: Acq92OGcXL3gG7KgxNRsJ9ZHER7HJAq8nQghYuH4QPHLxbmOdt1LHTqaKr9dZTdUqxa
	rcgAVWrmYFPBoERtRtClQj23SBuYhvMuseqD/8EH7FPhY7Xe9qsonKZ+KV2OuSYNcBTCsqdbBY2
	suQg1LWgi1ya6MH5eDlDUTdMb3seP4BwMG9nE2rXPPRph+dja5FJCdZ1KoOfyzTj8kxhlaj3Fg4
	6fCqN2SKL8HC4oFfd4wsXs18sDPELEVSdBel5cVnRdRE0dgMldi2VB9wwsVlsQyzXsOWdP6fK7y
	CPlJthLivvpd0oU8TYO2cu4X3ol8D9Jc2mgAnoZpsFEaIdRytaOPaMTyiTWq4BoGI6DBT09HYy6
	rbFpmuzhYmNrOGTr8L5OEshK4jr+mn6dSrEDAFF6JtgbmcngFEsw2THtPFgJRbe8rAzb196tPzh
	Qp53ocsNgZMT72nGianXQk1ywVLaoD9/zcMrhZwRUBS4Liy7g8npJEW9GoqT5YT0PZOYWmJhk=
X-Received: by 2002:a05:600c:8b2e:b0:490:50c5:8153 with SMTP id 5b1f17b1804b1-490b5e73ed4mr48400975e9.2.1780490888332;
        Wed, 03 Jun 2026 05:48:08 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6d16f0csm59311625e9.15.2026.06.03.05.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:48:08 -0700 (PDT)
Date: Wed, 3 Jun 2026 13:48:06 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dan Carpenter <error27@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>, Chintan Patel
 <chintanlike@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Use sysfs_emit_at() to print to sysfs
 file
Message-ID: <20260603134806.69df0b01@pumpkin>
In-Reply-To: <ah_cd9Ax4fzOhBp7@ashevche-desk.local>
References: <ah_Y_Y2RtqeGxchF@stanley.mountain>
	<ah_cd9Ax4fzOhBp7@ashevche-desk.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 3 Jun 2026 10:49:11 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Jun 03, 2026 at 10:34:21AM +0300, Dan Carpenter wrote:
> > This scnprintf() uses the wrong limit.  It should be "PAGE_SIZE - len"
> > instead of just PAGE_SIZE.  We're not going to hit the limit in real
> > life since we are printing at most FBTFT_GAMMA_MAX_VALUES_TOTAL (128)
> > u32 values, however, it's still worth fixing.
> > 
> > Use sysfs_emit_at() to fix this since this is a sysfs file.  
> 
> OK,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> ...
> 
> >  	for (i = 0; i < par->gamma.num_curves; i++) {
> >  		for (j = 0; j < par->gamma.num_values; j++)
> > -			len += scnprintf(&buf[len], PAGE_SIZE,
> > +			len += sysfs_emit_at(buf, len,
> >  			     "%04x ", curves[i * par->gamma.num_values + j]);  
> 
> Can we switch to use hex_dump_to_buffer() at some point?
> 

That gets hard when you really want to aim for something nearer seq_printf().

Oh, the way the loops in the code are written doesn't look like
it gives the compiler much chance of optimising it very well.
This is probably equivalent:
	for (i = par->gamma.num_curves; i--;) {
		for (j = par->gamma.num_values; j--;)
			len += sysfs_emit_at(buf, len, "%04x ", *curves++);
		buf[len - 1] = '\n';
	}
and will generate much better code.
(Although most of the cost inside the snprintf() function - which is horrid.)
num_values better be non-zero.

-- David
