From: Julia Lawall <julia.lawall@inria.fr>
Date: Tue, 04 Aug 2020 07:49:52 +0000
Subject: Re: [PATCH v3] coccinelle: api: add kvmalloc script
Message-Id: <alpine.DEB.2.22.394.2008040949360.2575@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <12b09b8f-7c73-1827-8bf3-63e6041b63fd@web.de>
In-Reply-To: <12b09b8f-7c73-1827-8bf3-63e6041b63fd@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>



On Tue, 4 Aug 2020, Markus Elfring wrote:

> > Changes in v3:
> > - kvfree rules added
>
> I find it interesting to you found such an addition needed for this SmPL script.
> I imagine that it can be helpful to support such a source code search by
> a separate script for the semantic patch language.
>
> I am curious if my patch review comments for the second version got also a bit
> of your software development attention.
>
> Another implementation detail is relevant for further clarification.
> The SmPL rules for patch generation differ in search functionality
> which is provided for other operation modes.
> Can these deviations influence the confidence level?

I see no useful information in this review, nor in the v2 review.

julia
