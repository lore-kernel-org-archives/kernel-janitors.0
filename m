Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543903B6363
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Mar 2026 12:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774875096; cv=none; b=gl3trCnQlVIfKAoTsg7yuAl/RMw/nNdrYEd+vh4lWkH6bKn2vYpC4IweliP0CKcNPasIgrcoqGqayTmnVCdvERleOROA/3IGwF6LSn7FcxdazhgGu58ezDBDYCZLzFrErophFlGjI0w2U95xm2ovgf8cqZM9kiqXMjwK0nifOZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774875096; c=relaxed/simple;
	bh=dFU7eDeg8xFC7NnSsbiUif4srtnlzOtbXD27lfj0wgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnnW0kfP2cEwC45JNytjiSnoT1UDuXKI0xHQ+w88WlxDquxwNE1Z8GQW8TUKsEYKufrteEG4t5lGF1NOwt2rodc20z7k5NsLnuVCd6I+p1qJaNZ/VmLRDeYrEIcU4mXx43y84ZzqFPY4HFk0F65mbRANU41RhO1x+C/jTi8so08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGMFbXIh; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGMFbXIh"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a2b383cefaso1889191e87.2
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Mar 2026 05:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774875094; x=1775479894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7x/oKLAJLt5Dcv5IjeqmvpGsInA1DnzID4mwJflJU0=;
        b=gGMFbXIhZDrg3HrbachQdC9BYpXTL7C2mRVi8qS0tIUTcrlqLFrsICRJ0QClBhNZ2Q
         R++Hs6gz7+FAOlyLOX9FW02+C24VhPJni/VEIxHjM9LUVZynn+XWF+aGoMAFDBZLEqjm
         3S0vLgV49yQE4n4JT8PZmuIgQKVZUKENj4Ls4GTEd2qfg9K+tWSAhxM214kY0ZSAWJXW
         j7hk3iIf+J+g8E6hDn3WYQuyekm3AjWSjIkJ3Lb7e/Yyg2wz5Ypjexd8psi9iCuNq3T3
         NLmyt7kr+xUMoMY2JGoJ+wCOED8nrvkmSt+6OjNZI5Mqhy+X5F1EI9qvWCZ+ijQQuIKl
         tGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774875094; x=1775479894;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7x/oKLAJLt5Dcv5IjeqmvpGsInA1DnzID4mwJflJU0=;
        b=jCc1nbTLg11B0/Gw+Sybr7eN7+E7yNAGUZuUURha2jpAqJGjpTMbRGqpaLAgj921Jq
         6ZH0pUaAZ9ra55SUXT3ldGx9/N7AJOj2MvIbAXQvRs8nzgTFueWLxhubb6lHMx5Pg2hu
         zpHIrAs7u8kMM9p/idvFT9jIISZsswIbPiLmVmlV11YOhGr7eWwrupPTkrp6azFKI08D
         0JRypo5Pa+TQ4utbCOl+6rhQQh9wPZplBCJ8EfxlTIOLY2nJ4Pvu9ObMf6k/HA9i0xEG
         u0u2wMMFld7rsLaIT1z0rLAHNz19dYA3pCQ3hRO2ILJtlIaVVwFqhdn/alosWHelhy5U
         YzLw==
X-Gm-Message-State: AOJu0YwEyUICv2ctwV85jLxHcSIFPD/foFM92IqZwOiFiFhmt6rH8dVo
	kFzazyZVsQYGZOk9ay85WLXBFKHREM73u4AWMLAs0VSJEF6mB57tXi4zJtdYXA==
X-Gm-Gg: ATEYQzzHVwwiN8Qi6MvR5LDj3ZBrxeNtYKiUDHW9KiwMGvWdq8nOOEW8k6PeSdoY9L6
	CT+Gs37QX888kQhmp0phDwhdRuKon1zXtSQYbrFGlY29Z2jHJ/MHp3dmfTcaBjmnZwi81QYXHem
	p49jZDGTY7d6DbHP9KwyWKk+xLnaAnhxbboqwcyf7r5WMt9TVa/5eSsfB75eBtxx80C6DN4366+
	/afrQ5n5LVqq/xkBP2iHu5oDwnwq1f7DBSinOyoY5o29xe8jt2bKiWbEyqyXZTnFRo9VE7WZjGQ
	mFQjkRZMJZcCZC0l5KelD7vYuwYK33o9x303Ox4l+7PdopWW9FkK0c7sDyssE/V9hNvl2vnH23F
	WNX4yBYx2YH+6yVYw9Q9h7c+s+FMN7mR+jW6k64WBqJhpul23R5Xto8nuNOV+ffK+7l3eI0pEzx
	wijBArYEzuscBWGnDST+28eW7uGvFCir3JX7APVEDXtzOtpEfp7+RNQQze+dvufA==
X-Received: by 2002:a05:6512:31d2:b0:5a2:874e:8a1e with SMTP id 2adb3069b0e04-5a2ab92104emr4870775e87.26.1774875093200;
        Mon, 30 Mar 2026 05:51:33 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145eff6sm1634333e87.76.2026.03.30.05.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 05:51:32 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:51:32 +0200
From: Linus Probert <linus.probert@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: kernel-janitors@vger.kernel.org
Subject: Re: Status of kernel-janitors?
Message-ID: <acpv7KIJiSnMcfvP@mosquito>
Mail-Followup-To: Dan Carpenter <error27@gmail.com>, 
	kernel-janitors@vger.kernel.org
References: <acpeJQEPtDKQ68uo@mosquito>
 <acprxrESPr1hnXkr@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acprxrESPr1hnXkr@stanley.mountain>

On Mon, Mar 30, 2026 at 03:25:42PM +0300, Dan Carpenter wrote:
> On Mon, Mar 30, 2026 at 02:10:49PM +0200, Linus Probert wrote:
> > Hello,
> > 
> > I've been a long time builder and fiddler of kernel source. Running
> > self-compiled kernels and pulling in patches before official release
> > etc. Bog standard for most of you I assume.
> > 
> > I'd love to dedicate some spare to help the project. Like so many
> > others.
> > 
> > The kernel-janoitors "project" does pop up in various resources such as
> > kernelnewbies and I think it might have been mentioned in one of the
> > Linux Foundations free courses. But links to potential homepages seem to
> > be dead and resources are sometimes dated.
> > 
> > I read somewhere that this has mostly evolved into janitorial work in
> > drivers/staging. TODOs were mentioned.
> > 
> > So the actual question. In my mind janitorial code work is a good place
> > to dip ones toes when starting out. Is this the right mailing list to
> > ask about such things? Any suggestions to find an area where ones
> > assistance would be welcome?
> > 
> 
> Starting in driver/staging is good advice.

I'll start looking around there then. Seems to be a good amount of TODO
files in there. Close to 1-to-1.

> > I'm aware of checkpatch.pl but for many drivers diverging from these
> > rules seem intentional and just blindly fixing checkpatch warnings are
> > not helpful to the maintainer.
> 
> Yeah.  After a while, you're left with only false positives or
> we introduced new rules and the old code is sort of grandfathered
> and the maintainers wouldn't appreciate an update.
> 
> > Open source is a lot of work so the goal would be to be helpful while
> > not stealing too much attention from concerned parties.
> 
> I tried to introduce the concept of, if you have an idea but don't
> have the time to implement it right away, then write KTODO in your
> email so people can search for that and get a list of ideas but it
> hasn't really caught on.

A pity that didn't catch on. Could have served as a good stepping stone
to get some young blood into the project.

> regards,
> dan carpenter
> 

Thank you for the quick reply.
