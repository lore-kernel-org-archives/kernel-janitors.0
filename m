Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9327B1A294
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Apr 2026 12:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775133599; cv=none; b=GlhcQVdraEpE4nKB9fPpQh75+saYXGbSFhoC22ytFE2idvGKH/rG3rUmN+y8i+lNGwgvTdwg2+aDQZIHYLo3uBeCg5sGL4GIHFf57ryVFkpw0NAfj8HInjCugxz+FmJngfnxOeVpO9Xi1xWoIbzDiXAyH9k4foR0kupgmi2MTbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775133599; c=relaxed/simple;
	bh=z7epecj8meh+cekc2wfLJ3WaiyktzFaE0RpBV5whmf0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lIoIvi7qL3Wn046Y0CPv7/6gZXlpWGRKgQD4EpecGk6ynjk7tb1pfWS26LVR4/8UGWL3EN+r9B2niFghmXZKvuuzAygkB9aqgFYO8mzEgO+brWXO6wgVl9063tiUaVtFQCXvFNI5Wr1NlRtZpxBaxuplsynAQYRUC6koQ01iBaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=T8GqHLCs; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="T8GqHLCs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p1fVkyEOhGlYf6ULLY/7Z3uhj5xqf/FMMtGZB4ctlgA=; b=T8GqHLCscPor+9q5shDi6PbyrI
	NdW8HAPktSPUWYRyTTBxRHhzr1VJM10n8TNq7iFOtmGe+yqukib3f4k597utCx3UIkH40pzPa6X+K
	l+wxb+50ukE0e541IOti9OLx84yiOVUX3RlPfujTaUEAZ6iVNjaICHBo6mKF82Cbw5q/0bnQ0R2S2
	mLfOjtIT1HoygNG3JiyNVRrTxLv4FHj/ul532NiXvSJGjE3l/AhoC66atHM5kqqtHeAN2b+K4uC8b
	5iQsXMocjwcypSaa/NCze5oEir7+15GemASHA4LTy+Wna+KUCknxjXdKV0GtZSCIC1HOmbuOolPAQ
	Rg/qPCCw==;
Received: from [147.129.179.166] (port=52140 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1w8HKk-0000000CLzI-0TAZ;
	Thu, 02 Apr 2026 08:39:38 -0400
Date: Thu, 2 Apr 2026 08:40:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Linus Probert <linus.probert@gmail.com>
cc: Julia Lawall <julia.lawall@inria.fr>, 
    Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: Re: more potential janitor work: simplifying test for power of 2
In-Reply-To: <DHINFSQNG4ZT.JNZO5ZPRUMW5@gmail.com>
Message-ID: <bcd30f78-7cbb-4284-dc18-302b549a00e2@crashcourse.ca>
References: <888a08d7-1d0b-f114-dd3d-e840f16c8803@crashcourse.ca> <DHHT7K60IORC.2DG3PT7PB2OSO@gmail.com> <DHIKQUBU2MZS.IOSIJB5DJYJ0@gmail.com> <d048659a-e668-98f8-46e7-ae870c8c917@inria.fr> <DHINFSQNG4ZT.JNZO5ZPRUMW5@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 

On Thu, 2 Apr 2026, Linus Probert wrote:

> On Thu Apr 2, 2026 at 12:07 PM CEST, Julia Lawall wrote:
> >
> >
> > On Thu, 2 Apr 2026, Linus Probert wrote:
> >
> >> I took a closer look at this. Many of the occurences here are actually
> >> used to check if a binary flag has more then one bit set. This is quite
> >> a common pattern.
> >>
> >> Eg. 'if (a & (a - 1))' would pass if a = 0b100, not if a = 0b110. Since:
> >> 	0b100 - 0b001 = 0b011 -> (0b100 & 0b011) => false
> >> 	0b110 - 0b001 = 0b101 -> (0b100 & 0b101) => true
> >
> > If it's common, maybe there should be a function for it that properly
> > reflects the intended behavior.
> >
>
> Not my decision but I would guess that the general consensus is that we
> don't want to obscure bit manipulation in helper functions.
>
> These patterns are often considered base knowledge and since it doesn't take
> up any space a "helper" function only obscures what's happening. In
> particular from a review perspective.
>
> So unless there exists a function for this pattern already I don't think
> it's something that merits replacing.
>
> That's my 2c on that subject.
>
> That said, there are certainly places where swapping in the
> is_power_of_2() function is applicable. It uses a fancy bit trick which
> wasn't as obvious to me. Generally the right side of the expression
> below is the one I would use and no helper function existed.
>
> 	(n - 1 < (n ^ (n - 1))) == (n && !(n & (n - 1)))
>
> So if you are looking into doing some janitor work in this area you
> should keep in mind that, without that zero guard 'n &&' swapping the
> function might be altering the logic.
>
> So, a heads up is all.

  Not to toot my own horn but if you go back through history, I was
the one who kicked off the introduction of the first "is power of 2"
helper function many, many years ago:


  commit 63c2f782e8f6aafbc11b14b2cb291b3dc9fc217d
  Author: Robert P. J. Day <rpjday@mindspring.com>
  Date:   Tue Jan 30 06:06:00 2007 -0500

    [POWERPC] Add "is_power_of_2" checking to log2.h.

    Add the inline function "is_power_of_2()" to log2.h, where the value
    zero is *not* considered to be a power of two.

    Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>
    Acked-by: Kumar Gala <galak@kernel.crashing.org>
    Signed-off-by: Paul Mackerras <paulus@samba.org>


  And, no, a lot of that content was not immediately obvious as a
candidate for simplification; when I wrote my regex searching scripts,
I deliberately made them overly general *knowing* I would get false
positives, then I manually checked whether they should be simplified.
It never occurred to me that some of those checks were actually asking
whether more than one bit flag was set, which semantically is asking a
different question.

  Anyway, people were asking about janitorial work so I threw out a
couple of ideas. Whether they're worth pursing ... not my call.

rday
