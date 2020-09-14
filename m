From: Julia Lawall <julia.lawall@inria.fr>
Date: Mon, 14 Sep 2020 07:26:41 +0000
Subject: Re: [Cocci] [RFC PATCH] scripts: coccicheck: Improve error feedback when coccicheck fails
Message-Id: <alpine.DEB.2.22.394.2009140926030.2357@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1699748661-1600068402=:2357"
List-Id: <kernel-janitors.vger.kernel.org>
References: <44ab7442-1473-f267-4487-af98631a9338@web.de>
 <alpine.DEB.2.22.394.2009140821041.2357@hadrien>
 <287a8c82-6359-9a7e-c2ca-d26aa5be9650@web.de>
 <alpine.DEB.2.22.394.2009140913480.2357@hadrien>
 <e5d90bca-c264-c154-25ad-5046ac00b3e8@web.de>
In-Reply-To: <e5d90bca-c264-c154-25ad-5046ac00b3e8@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1699748661-1600068402=:2357
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Mon, 14 Sep 2020, Markus Elfring wrote:

> >>>> How do you think about to use the following check variant?
> >>>>
> >>>> +	if [ "${DEBUG_FILE}" != '/dev/null' -a "${DEBUG_FILE}" != '' ]; then
> …
> > I have no idea.  Why can't they be nclosed by double quotes as well?
>
> Both script variants can work.
> Such coding style variations can trigger different run time characteristics
> (besides expressing specific intentions), can't they?

Again, I have no idea.  But the runtime cost of these tests must be
microscopic as compared to the overall cost of make coccicheck.

julia
--8323329-1699748661-1600068402=:2357--
