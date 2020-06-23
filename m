From: Julia Lawall <julia.lawall@inria.fr>
Date: Tue, 23 Jun 2020 07:02:31 +0000
Subject: Re: [PATCH v4] coccinelle: misc: add array_size_dup script to detect missed overflow checks
Message-Id: <alpine.DEB.2.22.394.2006230902210.2367@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1108794673-1592895751=:2367"
List-Id: <kernel-janitors.vger.kernel.org>
References: <4014118b-90a6-68c5-048f-32485fa3e852@web.de>
In-Reply-To: <4014118b-90a6-68c5-048f-32485fa3e852@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1108794673-1592895751=:2367
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

I don't agree with any of these comments.

julia

On Tue, 23 Jun 2020, Markus Elfring wrote:

> > Changes in v2:
> …
> > - assignment operator used
>
> I prefer the distinction for the application of corresponding metavariables.
>
>
> > Changes in v3:
> …
> >  - \(&E1\|&E2\) changed to &\(E1\|E2\)
>
> Would it be more helpful to mention the movement of the ampersand
> before SmPL disjunctions?
>
>
> …
> >+/// Three types of patterns for these functions:
>
> Will another adjustment be needed according to your information “duplicates warning removed”?
>
>
> …
> > +virtual context
> > +virtual report
> > +virtual org
>
> Can the following SmPL code variant ever become more attractive?
>
> +virtual context, report, org
>
>
> …
> > +expression subE1 <= as.E1;
> > +expression subE2 <= as.E2;
> > +expression as.E1, as.E2, E3;
>
> How do you think about the following SmPL code variant?
>
> +expression subE1 <= as.E1,
> +           subE2 <= as.E2,
> +           as.E1, as.E2, E3;
>
>
> …
> > +msg = "WARNING: array_size is used later (line %s) to compute the same size" % (p2[0].line)
> > +coccilib.report.print_report(p1[0], msg)
>
> Please omit the extra Python variable “msg” for the passing of such simple message objects.
>
> What does hinder you to take the proposed script variants better into account?
>
> Regards,
> Markus
>
--8323329-1108794673-1592895751=:2367--
