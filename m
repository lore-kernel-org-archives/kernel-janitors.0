Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EF22E738F;
	Sun, 26 Jul 2026 11:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785066952; cv=none; b=gTxA9Bblfv47tvG37oh++1xhm9tedwTxS6UrHaWPtOohEH0ZLQc5/DTbtqjc7JaSDFz78FviZAhrA3ja1cXdE6au4KT9VeBNQH+UInDypCw/0OfB5dM/XLygpubZHw1FqF/HrB1Lt12K0zjBG21/1sVQyqza0z3Euj+4QMkD3E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785066952; c=relaxed/simple;
	bh=R4HPshraM/uA5yESSzvZoefC8rKw6mvB9YVWHFhG1lk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sDdmN6H8Rp+GVTfTmNPG3w+/a2YK6L8eHYLX16f/NZgj6hpV07b/MnkjNv/Q6O9lx6a3ydV6fLG0carAYiBm1dJ5CU+Dh57LXvc9RngIjY2pH++gpsCwHyixOO3LyRDl+CRgan1Gl4DIR23KrlWzla1bYcIbg8JTzgv5YU8Vmcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=dAvyv4lE; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="dAvyv4lE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Iw6a9POFq4oLT+s9rMP0lNZc6Yx+SECwpjT/XmBv66M=;
  b=dAvyv4lE9qSTZiQcLRXEeK1jziggY+8wMdPC3ElK7W+NylMxDgNoSNRL
   B96/AQipvkbVZ7vVQ3Wm3v3YASrFQ0xBSOS9HbNRJtV3kSKqIq9xwjOyR
   2Mv+7l1SwYo7Ox4zyjhevPZa4H79qV8RbWR8CepMG9QeoW/tg6vkY4GJo
   o=;
X-CSE-ConnectionGUID: lsKbkF7BTxSjxP5t6bHM3w==
X-CSE-MsgGUID: SoiMi7c2SNGdfviQITj8fA==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,186,1779141600"; 
   d="scan'208";a="152967579"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 13:54:35 +0200
Date: Sun, 26 Jul 2026 13:54:34 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Markus Elfring <Markus.Elfring@web.de>
cc: cocci@inria.fr, Sang-Heon Jeon <ekffu200098@gmail.com>, 
    Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, 
    kernel-janitors@vger.kernel.org
Subject: Re: [cocci] [1/36] coccinelle: misc: add
 cond_return_no_effect.cocci
In-Reply-To: <077ae2e1-c471-4e87-9d40-caddd3a8a358@web.de>
Message-ID: <6a456a1a-3c5f-5514-486a-9e3f9d1361a4@inria.fr>
References: <20260723184538.3888637-1-ekffu200098@gmail.com> <20260723184538.3888637-2-ekffu200098@gmail.com> <CABFDxMEuccFb2zPoA_Fdc6jswhqzMN62At9kEFqGBL5DZOj3DQ@mail.gmail.com> <514fd536-291a-bfad-fac8-15e0d0611689@inria.fr>
 <077ae2e1-c471-4e87-9d40-caddd3a8a358@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1081996736-1785066874=:181691"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1081996736-1785066874=:181691
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sun, 26 Jul 2026, Markus Elfring wrote:

> >>> +@depends on patch@
> >>> +type T;
> >>> +identifier collect.ret;
> >>> +constant C;
> >>> +@@
> >>> +-      T ret = C;
> >>> +       ... when != ret
> >>> +           when strict
> >>> +
> >>
> >> While testing the script, I found that this rule can unexpectedly
> >> remove the declaration of a global or static variable in the same
> >> file, even when it is still used elsewhere. There is no such case in
> >> this series, but I will fix it in v2 by matching the declaration
> >> inside a function.
> >
> > I think you could avoid matching the path from the top of the function to
> > the declaration by doing the following:
> >
> > declaration D;
> > statement S;
> >
> > (
> > - T ret = C
> > (
> >   D
> > |
> >   S
> > )
> > &
> >   T ret = C;
> >   ... when != ret
> >       when strict
> > )
>
> I would appreciate to clarify such an approach for a bit of dead-code elimination
> in more detail.

I have no idea what you are talking about.  What dead code are you
referring to?

>
> I got the impression that some versions of the C programming language do
> not handle variable declarations also as “statements”.
> https://en.cppreference.com/c/language/statements
>
> See also:
> https://en.cppreference.com/cpp/language/statements#Declaration_statements

And the conclusion would be what?  First, Coccinelle has it's own parser.
It decides what is a statement, not some wikipedia page.

Second, Coccinelle does not consider declarations to be statements.
That's what the D is there for.

>
>
> > The first part ensures that it is not a top-level declaration and the
> > second part does the check you had previously.
>
> I do not see so far that the intended source code restriction would be explicitly
> expressed here.

No idea what this means.  What intended code restriction are you referring
to?

julia

> Will further software extensions become more helpful accordingly?
>
> Regards,
> Markus
>
--8323329-1081996736-1785066874=:181691--
