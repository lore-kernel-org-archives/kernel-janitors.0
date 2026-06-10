Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B576A3FB07E
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jun 2026 12:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093962; cv=none; b=gnGHxfdh//PLAeyWy2uwmaNTXw0iX8/du5C3KOUbmhjVUCHbVAXXRO1TR7XC8lhQXkDs3o4gfEcDKGa9K12zER2QPJ9OWGjSQqnslvLcotXJn3L4ZiWzxkXvvBWElny0GxpG7hly/hEEiglBE0qkoOru2ZVogIhw3vrrpkKOXmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093962; c=relaxed/simple;
	bh=zxYJs+l4vwEP1WsqTw7YX4PmfhSmZk3Nu7mRqrVorus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XotDmc/gn6Lnzox9UJ+Dn+tjrsjC2HpvgWSH2mclK5YSJ/KjPDjKbpBzdkg8xkkOsFL2xQdCh2xcwvW4g7OD7gEaK0tt+YShcOaRPGM5+598haYqrGmAHoaqhQ2A+vFKOJftX/qfV8GLkubk2NMmDci5+QDfMxHyLBzerZqeBRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZjzbMbs; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZjzbMbs"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ccf887de87so76559296d6.0
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Jun 2026 05:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781093960; x=1781698760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GX8so8D0LdsxLyGx+h3I0h7Z/PH7ZZYi77dt1OsmmTU=;
        b=bZjzbMbsL2upz4g3Q8tnYU/piqtm12xzjhtoaMnfuwn7xF60673QjBt/tCx7YuS2Dy
         CpEHRkhcKf8ODGN6Cf8nOWJMNbIhEyJwxCdR6RvAwLnH5R1QNZivbL6budXcJmrWzKZu
         XVzyZ0O20l0mfEWgui6ovCYVb4b+InM3L/qPDb7PjpYxcFk8q543AdxsJcNnrzyLMynB
         DU5UIiIIeiID7UbcBnSZOYuLvKUkFJVdw0mfDwBBNit01dbFVWTV6Pvnoe/0b+XFRNrF
         gdo/fcy5FxfSACzwrjceDAMYsrVKdr208+hkNeFX4MGYVqhiYOFIKiwCEGGIg+Uww+Pq
         lYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093960; x=1781698760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GX8so8D0LdsxLyGx+h3I0h7Z/PH7ZZYi77dt1OsmmTU=;
        b=Dm7ww8H8eZKssmeurqm1V30UF8l+vjF6dAjkdgTDUjEeWOrmz4hNBMGQJLjjUheO8i
         oI8KokSOhMzQQM6hmk7oyoQTJs+SDy4ie60q1dAXGza3IK6hWLjW0j7XfJWc9KTY4u2o
         j0ZwK46/GKyZldm6QQmxMx23waOgIkYpfNalM+hkCJnNms872I+NRxoSbVT7u2pxaH1s
         i7plIB2X6QhpxHdRU2l4c/6JfRAMSuCNcbhz8pawbvXZroc2om3U9WZ0hvp0lCdSM/rc
         Ac5rsxBaxn2fGA25xFo8ekjbsbSsmskfCr+hmFc0Wv2ozqSGXqsP5yRWWzRhiVs0Wwdy
         h1UA==
X-Forwarded-Encrypted: i=1; AFNElJ99WTIsuCzxnSINz200coPh+oT2jnFYUNhzWn6oCARv8uXhCgD413GLlfFpUs5L9YGDzgmIVM6cJ50b3HbcYFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZOviYydZD9ahr+UyS3nos83JmdjMcBfGrI7mmCSvDqDw+n2kd
	nG4j8WrRnKS1oSJt9xdjKB9dBTiAblgoRQaJgd6Hk2X2JcFnlkUneQEh
X-Gm-Gg: Acq92OHtpyjtdG+lPFWtFjxf4QNXXGDB98iLBOOGe1xa5TuLbystR8CKNQySDpoj6IN
	/knBghyQFduNQ0RLdLA2/vy3TiIk0HNPMEnrH0IOxnJnI/qaxuOpfE2TG2iIG2BDQDEtKWpKdQT
	/iESI8EBe8kWGR4udoRm2NqwzGHZIkvdNOuzzst1WiQJGCDg1pgQWLOmEyVqQqJXff6c4tmXj5o
	1rpVbWlQPJfMT8Se0oHY7f1xB63ZspETFmR5nlyWujs9twfF6ozGfPctPYZvFkqywKTN0cz9CBo
	hZxzJLiKBQIHCDoN1hjsJukdZdJELWH78ubXs5lg1hIlRcYveAnQPZiTBUpQY3y44g83ctyO5rf
	XelVbzPw0RK1Gx8ehNuM64B0BuF0fqA2HesR3/wBjeLCNoZNOoBOW4z9OrBIq4QTalYfVmIWTm1
	vcGbD2GRkIF8HRp4WgHaybw0YHAaz/
X-Received: by 2002:ad4:52c7:0:b0:8ac:a6bd:503b with SMTP id 6a1803df08f44-8cee5fed5damr322934136d6.15.1781093960602;
        Wed, 10 Jun 2026 05:19:20 -0700 (PDT)
Received: from localhost ([43.225.189.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdb9bd6sm258065746d6.13.2026.06.10.05.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:19:18 -0700 (PDT)
Date: Wed, 10 Jun 2026 15:19:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>, Nuno Sa <nuno.sa@analog.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iio: backend: fix uninitialized data in debugfs
Message-ID: <ailWP0rNKbVAn4kG@stanley.mountain>
References: <aiEtIGOFhF8AfUCT@stanley.mountain>
 <aiExQzpIOwPgwd3-@ashevche-desk.local>
 <aiE3N6zErq2WcCvS@ashevche-desk.local>
 <aiFVuvVtaWbjfVzA@stanley.mountain>
 <aiFWg6vC2cVbONTK@stanley.mountain>
 <aiGRzFrSU6QUL4R2@ashevche-desk.local>
 <aiJo1kjN3_XDUdBc@stanley.mountain>
 <aiKIoqR0IQBZ-1ZD@ashevche-desk.local>
 <aiewiqInppHKilw1@stanley.mountain>
 <aik_bXUpVc90_eIy@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aik_bXUpVc90_eIy@ashevche-desk.local>

On Wed, Jun 10, 2026 at 01:41:49PM +0300, Andy Shevchenko wrote:
> On Tue, Jun 09, 2026 at 09:19:54AM +0300, Dan Carpenter wrote:
> > On Fri, Jun 05, 2026 at 11:28:18AM +0300, Andy Shevchenko wrote:
> > > On Fri, Jun 05, 2026 at 09:12:38AM +0300, Dan Carpenter wrote:
> > > > On Thu, Jun 04, 2026 at 05:55:08PM +0300, Andy Shevchenko wrote:
> > > > > On Thu, Jun 04, 2026 at 01:42:11PM +0300, Dan Carpenter wrote:
> > > > > > On Thu, Jun 04, 2026 at 01:38:50PM +0300, Dan Carpenter wrote:
> > > > > > >    168          ret = sscanf(buf, "%i %i", &back->cached_reg_addr, &val);
> > > > > > >                              ^^^
> > > > > > > Uninitialized variable.
> > > > > > 
> > > > > > s/variable/data/.
> > > > > 
> > > > > With what I asked in the previous reply and what you explained there
> > > > > (thanks, btw!) I still think your patches are not fully correct. They
> > > > > will require to atomically write all or nothing. If we want support
> > > > > partial writes we need to go with that differently (reset ppos when
> > > > > we got enough or more than enough data).
> > > > 
> > > > Requiring writes to syfs and debugfs be atomic is pretty normal and
> > > > works well in practice.  These are very small writes.
> > > 
> > > Perhaps. In any case your patch will break existing partial writes, right?
> > 
> > partial writes never worked
> 
> I don't get this. Does it mean it never worked at all, or in this particular case?
> Also "never worked" means the same issue you pointed out (uninitialised buffer) or
> something else?

I mean in this case.  The patch doesn't introduce a regression because
partial writes were already broken.

regards,
dan carpenter

