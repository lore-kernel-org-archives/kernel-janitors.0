From: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 25 Oct 2020 18:56:54 +0000
Subject: =?UTF-8?Q?Re=3A_=5BCocci=5D_Coccinelle=3A_null=3A_Optimise_disj?= =?UTF-8?Q?unctions_in_SmPL_script_
Message-Id: <alpine.DEB.2.22.394.2010251955280.2714@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0d1575b0-ab37-663e-2464-278fd76280b5@web.de>
 <alpine.DEB.2.22.394.2010251924290.2714@hadrien>
 <8f58a94e-b093-a587-c56a-a0ea0fc1f3ea@web.de>
In-Reply-To: <8f58a94e-b093-a587-c56a-a0ea0fc1f3ea@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>



On Sun, 25 Oct 2020, Markus Elfring wrote:

> >> This analysis result indicates a clear ranking for such function calls.
> >> Thus reorder the SmPL disjunction items according to their usage incidence.
> >
> > Did you actually test this before and after the change and see a
> > difference in performance?
>
> Would you become interested to configure a representative test environment
> for safe comparisons of corresponding run time characteristics
> of the affected software?

In what sense could the comparison possibly be unsafe?

Just use time and run spatch on whatever machine you want.  It's not that
complicated.

> > On my laptop, I see absolutely no difference,
> > for the patch mode and for the context mode.
>
> Does such information trigger a desire to clarify involved aspects in more detail?

Intel(R) Core(TM) i5-6200U CPU @ 2.30GHz

julia
