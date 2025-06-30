Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BAF3F9FB
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 21:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751318003; cv=none; b=sBrv0Q+IW5HQJtWatO52r9pXzVYH/nUBcTedObfDPv3dys6f7ST/e4jjWTrsO+WkgIe8XYHlAYqRwihkcXrBa+yAbbiPIJAzUlZDbsUwnTTx5+Y4pqGRs84OCgKtNrUwx3Zflt91nMPSRa8i0d2E73kFkOP7DBi5vzT7qg7gDPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751318003; c=relaxed/simple;
	bh=tDa3m5PG/HS+rx3WiH89wEkxlVb6SMlVdkb47xP2mcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qp5bOkDASoM51uxU8ugZdYOrVSrBKSwCy8ETPNQpTDbTeBacIwYrspAzyR1Xrd9GMN9n5ixxF3jK3jGPApoRoyywEaScXzVFW/lffdKNcLfnLxP6qzo1ocaS/3wAPPxiN3FO42BKJTzSVZEQHcOt69iCugk+TRxgDL2uZbgio9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=QfCmG5US; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="QfCmG5US"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=JhmLtPH87R4stSQs8qnRZgGqzsusgVVyqFdITBWpW/Y=; b=QfCmG5US2gwX2Y/E
	+cvHFJFH0an/i43Vs7pXUWOWLi6DEO99QTrJRDbZxCdgVnIbOp40pNNeLOElMAGohyX05JX1B9Kn2
	2H2DJ77T7i4PMl9vLOGg4mqtd5jyQadQZz46pWfcT2zMvdXlKX5W7YPcCboSGlsmcwI7bHPwTaa2O
	+FHDGZJ2Xp7W07dYw1qs+L7kJr2b6Z9c9qa3ZZBLk1SQVP6L2tivERyAc06P1Ljz2lB9drU2y++b+
	flgRCRvbpk1SCvRK2GolsZhaaKkT9i9SPDFcXZPy99sBEpRzHVo4YgXdDiS06Z5v/HOL1L06tn1z3
	nOdyVPCYDS3uGe8gPQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uWLoK-00D8UT-0l;
	Mon, 30 Jun 2025 21:13:08 +0000
Date: Mon, 30 Jun 2025 21:13:08 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Kernel Janitors List <kernel-janitors@vger.kernel.org>,
	Lukas Bulwahn <lbulwahn@redhat.com>
Subject: Re: [CRM114spam]: Re: First pass at janitorial kernel cleanup scripts
Message-ID: <aGL95CqAgl90TLPe@gallifrey>
References: <8c4e5d62-7980-bd16-df17-caf76862d4f5@crashcourse.ca>
 <bc14c7e7-1188-4330-bc0b-cb0a60568cc1@suswa.mountain>
 <be53fc9d-529f-50c3-a3b1-f3caba54aad9@crashcourse.ca>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <be53fc9d-529f-50c3-a3b1-f3caba54aad9@crashcourse.ca>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 21:02:42 up 64 days,  5:16,  1 user,  load average: 0.03, 0.02, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Robert P. J. Day (rpjday@crashcourse.ca) wrote:
> On Mon, 30 Jun 2025, Dan Carpenter wrote:
>=20
> > On Mon, Jun 30, 2025 at 02:02:25PM -0400, Robert P. J. Day wrote:
> > >
> > >   As promised, I have the first small number of kernel cleanup scripts
> > > that should inspire some obvious janitorial work:
> > >
> > >   https://crashcourse.ca/doku/doku.php?id=3Dlinux_kernel_cleanup
> > >
> > > There will be more scripts coming, and a lot of them will address some
> > > rather obvious cleanup that relates to identifying leftover cruft that
> > > was overlooked when something was removed from the kernel -- things
> > > like:
> > >
> > >   - are there things being #defined and never referenced?
> >
> > Quite often people publish these deliberately.  They sort of function
> > as documentation.  At one company every time they expose anything
> > about the hardware interface it has to be approved by the legal dept
> > so they publish every single define that they can possibly think of
> > as early as possible so they don't have to go back and forth with
> > legal later on.
>=20
>   Ewwwwwwww ... I do not like that idea. I don't like stuff being
> "#define"d unless it's actually required by the proprocessor.
> Defining stuff as documentation is just ... ewwwwwwwwww.

It's quite common; a set of #defines for every register/function/etc
in their chip, maybe also for every firmware call with a struct
for the interface layout.   Sometimes these are spat our semi automatically
=66rom their hardware group who designed them.
On the plus side, they don't take up any space in the resulting binary,
unlike the zillions of unused wrapper functions some drivers have for
every firmware call/register, many of which aren't used.

> > >   - are there things defined in Kconfig files that are never used,
> > >     or vice versa?
> >
> > Lukas Bulwahn does a lot of this work already.  It will be interesting
> > to see if there is anything his scripts miss.
>=20
>   Is that the same L. Bulwahn of RISC-V fame? I might need to touch
> base.
> >
> > >   - are there header files that are never included anymore?
> >
> > That's a good idea.
>=20
>   I have a script that tracks down exactly that sort of thing. I'm
> just cleaning that up now. There seems to still be a fair bit of that.
> As a representative example, there is a header file in the kernel
> source tree:

I've got a bunch of very hacky scripts that:
  a) Try and find symbols that are unused - generally functions that re
defined but never called;  it's very hacky, but so far I've removed
hundreds of them (and am currently at the end of 'w's  after about 9
months!).
  b) I was also hunting struct's defined in C files and not used, and also
  things like linked lists that are declared/defined but never used.

Generally the patches to remove stuff have been well received, most devs
want dead code removed; there are some who rather like their API the way it
is, even if some of it's not used.   I also try and do things like avoid
hardware definitions (see above) and don't remove one half of a pair
(e.g. if there's an inc_foo and a dec_foo but the inc isn't used).

Dave

>   ./sound/soc/amd/include/acp_2_2_enum.h
>=20
> Does anything include it? Nope:
>=20
>   $ grep -r acp_2_2_enum.h *
>   $
>=20
> So my scripts still identify plenty of potential cleanup.
>=20
> More later.
>=20
> rday
>=20
--=20
 -----Open up your eyes, open up your mind, open up your code -------  =20
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \=20
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
