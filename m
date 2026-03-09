Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07253A4F20;
	Mon,  9 Mar 2026 12:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773058887; cv=none; b=mpxnn7Va9zBdYWHn4wsXwg/Cvt7GYZEZHbvtmyISC7TmhSUS8q9WULdZFMMJcXoYu39zYGJ4K055OkgaSXMWY8+AHlzeoG7IvaiJP0/2xhAUBRlGqJ2Tm9+Foha+vdCi+ujO57XmDz46YfCtWq+L4RgcFbjXTKdfvLmnmoDRxlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773058887; c=relaxed/simple;
	bh=izmjmFkld2DG9bv7Sa35BlGXHFZWeMUMKrUoRrn9k/I=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qDtj42eHUx43bsZ7Q7UacyIJlW1avQTgWHq0N8OeWvE0FA40q+aWm7VUYcnex6BwLTUiqMiLls55WmQ8sD8flcddqn+v0z+iG+Hm+YNw0UuL9scxr60dw5edtOY6RkUsgaV4tSMb1KPsoHxHfRlWSXdwf4sD/f3mTmIdtAzQzj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=r/+a33I8; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="r/+a33I8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=AWIGNcIzvb7iNDxlrolA7O0lOcBu+LNYktCT3HNi/44=;
  b=r/+a33I8EdfsUdMQ1GfB7lG8pFDVG/67q3Z9wYS/NGhQKACucebHnQdn
   p0XY67LYAXhvYOy7I3x3dDhDPQ6QUGvubOwusDIXJCTX59v3y7tBCutBn
   zSPcA6wKQUd7RcV9zwyNA+izxDyuPf5TAgslK3XuZ7d6w7YbnHzJAVZgk
   o=;
X-CSE-ConnectionGUID: gNfqHJ8vSqOJgtBr0CW+2w==
X-CSE-MsgGUID: 3+Ykd1VWT1yVaC694jRg4A==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.23,109,1770591600"; 
   d="scan'208";a="266881645"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 13:21:23 +0100
Date: Mon, 9 Mar 2026 13:21:23 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Alejandro Colomar <alx@kernel.org>
cc: Markus Elfring <Markus.Elfring@web.de>, cocci@inria.fr, 
    Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, 
    kernel-janitors@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: [cocci] [PATCH] scripts/coccinelle: Add script for using
 ARRAY_END()
In-Reply-To: <aa6vSvsp4J6InmiB@devuan>
Message-ID: <f950c541-1c21-7d5-b7d7-1a14bb6e8a4@inria.fr>
References: <cover.1772752564.git.alx@kernel.org> <f1c9dff525752dc5a839760269a1c96d6e0870b4.1772752564.git.alx@kernel.org> <cab3d2a8-4c3f-45e6-9e7f-8bdca48a6209@web.de> <aa6vSvsp4J6InmiB@devuan>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1865276325-1773058883=:9033"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1865276325-1773058883=:9033
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Mon, 9 Mar 2026, Alejandro Colomar wrote:

> Hi Markus,
>
> On 2026-03-09T12:17:00+0100, Markus Elfring wrote:
> > …
> > > This script makes it easy to find more places where that macro should be
> > > used.
> >
> > See also:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v7.0-rc3#n94
>
> Thanks!
>
> > …
> > > +++ b/scripts/coccinelle/misc/array_end.cocci
> > > @@ -0,0 +1,93 @@
> > …
> >
> >
> > > +// Confidence: ???
> >
> > I hope that a more reasonable value can be determined for this information.
>
> I don't know how the scale works.  I know the script has a few false
> negatives, and AFAIK there are no false positives.  To what level of
> confidence would that belong?

Probably high would be fine.  The goal is mostly to indiacte whether the
results are most likely correct or whether they will require a lot of
study to know if everything is ok.

>
> Is that field a keyword, or may I be explicit such as with this?:
>
> // Confidence: no false positives, but a few false negatives
>
> Or maybe I should write that in Comments...
>
> > …
> > > +// Comments:
> >
> > Please omit such an empty field.
>
> Ok; thanks!
>
> $ grep -rh '^// Comments:' scripts/coccinelle/ | sort | uniq -c
>      34 // Comments:
>       2 // Comments: -
>       1 // Comments: -I ... -all_includes can give more complete results
>       1 // Comments: Comments on code can be deleted if near code that is removed.
>       1 // Comments: Some false positives on empty default cases in switch statements.
>       1 // Comments: requires at least Coccinelle 0.2.4, lex or parse error otherwise
> $ find scripts/coccinelle/ -type f | wc -l
> 76
>
>
> It seems around half of the existing scripts have that.  You may want to
> remove those empty comments.  I added it because the scripts I looked at
> do have it.

I don't require taht an empty comments field be removed.

> > …
> > > +@i@
> > > +@@
> > > +
> > > +#include <linux/kernel.h>
> >
> > I doubt that such an SmPL rule would be required.
>
> Okay, I'll remove it.  Thanks!

I'm lacking context.  You maye need this if the file doesn't already have
it.  But it is hard to know if it could be include indirectly...

julia


>
> > > +
> > > +//----------------------------------------------------------
> > > +//  For context mode
> > > +//----------------------------------------------------------
> > > +
> >
> > Please omit such extra comment lines.
>
> Agree.  BTW, you may want to remove such lines from existing scripts:
>
> $ grep -r '^//.*For context mode' scripts/coccinelle/
> scripts/coccinelle/null/deref_null.cocci:// For context mode
> scripts/coccinelle/misc/boolconv.cocci://  For context mode
> scripts/coccinelle/misc/array_size.cocci://  For context mode
> scripts/coccinelle/misc/struct_size.cocci://  For context mode
> scripts/coccinelle/misc/newline_in_nl_msg.cocci://  For context mode
> scripts/coccinelle/misc/badty.cocci://  For context mode
> scripts/coccinelle/api/alloc/pool_zalloc-simple.cocci://  For context mode
> scripts/coccinelle/api/alloc/zalloc-simple.cocci://  For context mode
> scripts/coccinelle/api/alloc/alloc_cast.cocci://  For context mode
> scripts/coccinelle/api/pm_runtime.cocci://  For context mode
> scripts/coccinelle/api/resource_size.cocci://  For context mode
> scripts/coccinelle/api/vma_pages.cocci://  For context mode
>
> > > +@depends on i&&context@
> > > +type T;
> > > +T[] a;
> > > +expression b;
> > > +@@
> > > +(
> > > +* (a + ARRAY_SIZE(a))
> > > +|
> > > +* (&a[0] + ARRAY_SIZE(a))
> > > +|
> > > +* (&a[ARRAY_SIZE(a)])
> > > +|
> > > +* (&a[ARRAY_SIZE(a) - b])
> > > +)
> >
> > Extra space characters may be omitted directly after SmPL asterisks.
>
> Good to know; thanks!
>
> Although most scripts seem to be using white space (space (164) or
> tab (26)) after the asterisk.  Please confirm if you prefer it removed
> in new scripts.  Only 39 scripts don't have white space after it.
>
> $ grep -rh '^\*' scripts/coccinelle/ | grep -o '^..' | sort | uniq -c
>      26 *
>     164 *
>       4 *(
>       1 *;
>       1 *E
>       1 *I
>       1 *P
>       2 *W
>       1 *\
>       1 *b
>       1 *c
>       3 *d
>       1 *e
>       4 *f
>       1 *g
>       2 *i
>       1 *l
>       4 *r
>       2 *s
>       1 *u
>       2 *w
>       5 *x
> $ grep -rh '^\*' scripts/coccinelle/ | grep -o '^.\s' | sort | uniq -c | hd
> 00000000  20 20 20 20 20 32 36 20  2a 09 0a 20 20 20 20 31  |     26 *..    1|
> 00000010  36 34 20 2a 20 0a                                 |64 * .|
> 00000016
> $ grep -rh '^\*' scripts/coccinelle/ | grep -o '^.\S' | wc -l
> 39
>
>
> > …
> > > +@r depends on (org || report)@
> >
> > You may omit parentheses here.
>
> Ok.
>
> > …
> > > +@script:python depends on report@
> > > +p << r.p;
> > > +@@
> > > +
> > > +msg="WARNING: Use ARRAY_END"
> > > +coccilib.report.print_report(p[0], msg)
> >
> > Would the following command variant be a bit nicer?
> >
> > coccilib.report.print_report(p[0], "WARNING: opportunity for ARRAY_END()")
>
> Sounds good.
>
> > By the way:
> > How do you think about to omit a cover letter for a single patch?
>
> Sounds reasonable.  I like the cover letter as it holds the range-diff,
> which may become a bit confusing when it's in the same email as the
> patch, but maybe that's just me.
>
> I'll send v2 in a single email.
>
> >
> > Regards,
> > Markus
>
> Have a lovely day!
> Alex
>
> --
> <https://www.alejandro-colomar.es>
>
--8323329-1865276325-1773058883=:9033--
