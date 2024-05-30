Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B5B17276E
	for <kernel-janitors@vger.kernel.org>; Thu, 30 May 2024 11:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717069626; cv=none; b=JzO5VkTXH3QWd7RQ3xsR4MrG8tcNxMvGd8TbyuAR4EjLluFCRokfsb50Riy95eNsm7hszHbfyvOfShfYlS2sYO242JZEE37qeH886pOK2mo/uMRvd/+MxJfUKANEew1gpgvhPka0dmBUNuVBH0tjM3exVxiNjL9YZtUL49eEIPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717069626; c=relaxed/simple;
	bh=H4n5tiajAuLybl32eLwpqqCgT1Th1gLfLoCWVPXN0QI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YeCXXRbSmIf7BKoXsKLqgwIMDNjKwZKT8ewkcHCH2FlhyiWjx4oAKN+faF79M5RhUwY6ZeVaA0GpdNtccQnFHmK+zsuTL1qBJnZtNC6qfgLQ/xLZqyMaKRRuzF5wHCU5cNFsLoQaPU2lQDlFb3RQgeydpB+tXb0WRnlzuD3cNzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=LtTJx2ZD; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="LtTJx2ZD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=73plU5nPl0YP8aLX+ho3SAJc5O3ORK+fUok+bCc6Xvo=; b=LtTJx2ZDJQiFRvK5
	Q4FntvQ/cN0iK0gUxnwJLGsDUwXwksgEw4Jqn5vhlxWtrAOzil0qSe0Y+6DiToYXqup4bBY85HiX5
	GtxR2x95c1jpt032c1CJEU+OySnpZZNrqVHROKuFDcDyIsrG8gi42H8M/r08hek+m3C3gC2h7i6DU
	AYx+FDVv+2mwlmG0A39jOlBR5dcE1Ot8QlUsfuXb57wZY1/WUwWQnEHHWS1hJ+nlNZciDIE4mQy8q
	OW9Pb2FAtJfv8FMa6LfHDCHgbUgEnRxYn4XI1AYReCKG55WAWN1qXOsE7u2euKTiCaXrSkDkjAiFz
	FzXDkggS+hkpo2H0Ag==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1sCeFJ-003M1A-0O;
	Thu, 30 May 2024 11:47:01 +0000
Date: Thu, 30 May 2024 11:47:01 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: cocci@inria.fr, kernel-janitors@vger.kernel.org,
	Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [cocci] Looking at lock scopes (with SmPL)?
Message-ID: <ZlhnNYzYHF59Ke56@gallifrey>
References: <7eb9626c-da7b-414d-bf50-da1eed27be31@web.de>
 <alpine.DEB.2.22.394.2405261847380.16852@hadrien>
 <2dc6a1c7-79bf-42e3-95cc-599a1e154f57@web.de>
 <Zlckg1LH-2TBew85@gallifrey>
 <e6de2b59-c9c5-4714-8a4d-5c5970b9fad4@web.de>
 <ZlfIl39GRcXKFRn6@gallifrey>
 <b9fbac02-a1eb-460e-80f0-07b32e704bb2@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <b9fbac02-a1eb-460e-80f0-07b32e704bb2@web.de>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 11:45:24 up 21 days, 22:59,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Markus Elfring (Markus.Elfring@web.de) wrote:
> >>> Is there a way to look for functions that have a lock, followed by unlocks on
> >>> multiple error paths?
> >>
> >> Probably, yes.
> >> https://cwe.mitre.org/data/definitions/667.html
> >>
> >>
> >>> IMHO the nicest thing with guard is simplifying lots of error paths, and
> >>> innevitably someone forgets to unlock in one of them.
> >>
> >> Would you like to improve the support anyhow for more complete and succinct
> >> resource management in affected software areas?
> >
> > I was just suggesting a perhaps more targeted approach rather than
> > just looking for all cases of lock/unlock.
> 
> How would you like to handle source code analyses if lock scopes
> would occasionally be distributed over different function implementations?

It depends on the aim:
  a) If you want to find some cases to replace with guard, then I'd
    only do the simple case where there is nothing distributed across
    functions.

  b) If you're trying to prove/detect failures then that needs
    to look at the hard cases I guess; but I think there are other
    tools doing that??

> Will development interests grow also for checking combinations according to
> other pairs of actions?

This is only a suggestion from me; I wouldn't drive too much off it.

Dave

> Regards,
> Markus
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
