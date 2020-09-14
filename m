From: Julia Lawall <julia.lawall@inria.fr>
Date: Mon, 14 Sep 2020 07:14:09 +0000
Subject: Re: [Cocci] [RFC PATCH] scripts: coccicheck: Improve error feedback when coccicheck fails
Message-Id: <alpine.DEB.2.22.394.2009140913480.2357@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44ab7442-1473-f267-4487-af98631a9338@web.de>
 <alpine.DEB.2.22.394.2009140821041.2357@hadrien>
 <287a8c82-6359-9a7e-c2ca-d26aa5be9650@web.de>
In-Reply-To: <287a8c82-6359-9a7e-c2ca-d26aa5be9650@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>



On Mon, 14 Sep 2020, Markus Elfring wrote:

> >> How do you think about to use the following check variant?
> >>
> >> +	if [ "${DEBUG_FILE}" != '/dev/null' -a "${DEBUG_FILE}" != '' ]; then
> >
> > What difference does it make?
>
> I propose two implementation details for further development considerations.
>
> 1. Do you care if any variable names should be enclosed by curly brackets
>    in such script code?
>
> 2. A changeable value should be compared to two string literals here.
>    Varying contents should be enclosed by double quotes.
>    Constant values can be enclosed by single quotes, can't they?

I have no idea.  Why can't they be nclosed by double quotes as well?

julia
