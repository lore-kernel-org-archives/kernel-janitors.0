From: Julia Lawall <julia.lawall@inria.fr>
Date: Wed, 28 Oct 2020 06:50:22 +0000
Subject: =?UTF-8?Q?Re=3A_Coccinelle=3A_Checking_the_influence_of_=E2?= =?UTF-8?Q?=80=9CGrep_query=E2=80=9D?=
Message-Id: <alpine.DEB.2.22.394.2010280748440.2766@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-2051016452-1603867822=:2766"
List-Id: <kernel-janitors.vger.kernel.org>
References: <78f8b08754dde286adf7e11e1eeb3bb8ad500d8b.camel@web.de>
 <acaed49b9195d47e252a0b67551f87e96324d004.camel@web.de>
 <alpine.DEB.2.22.394.2010221434210.5113@hadrien>
 <6fe4c63d-1b7e-b947-139c-423edc519d2f@web.de>
In-Reply-To: <6fe4c63d-1b7e-b947-139c-423edc519d2f@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2051016452-1603867822=:2766
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Tue, 27 Oct 2020, Markus Elfring wrote:

> > It doesn't matter.  The purpose is just to select files that are relevent
> > for consideration.  If a file is selected for two reasons instead of one
> > reason, it doesn't matter; it's still selected.
>
> The software “git grep” probably supports also short-circuit evaluation
> for the discussed use case (because command parameters were selected in the way
> that this special functionality would not be excluded).
> https://github.com/git/git/blob/e8ab941b671da6890181aea5b5755d1d9eea24ec/grep.c#L1294
>
> Under which circumstances would potentially measurable effects become more interesting
> so that the reordering of the mentioned identifiers would be reconsidered?
>
>
> elfring@Sonne:~/Projekte/Linux/next-patched> /usr/bin/time git grep --threads 4 -l -w -e 'for_each_node_by_type' -e 'for_each_matching_node_and_match' -e 'for_each_compatible_node' -e 'for_each_available_child_of_node' -e 'for_each_child_of_node' -e 'for_each_matching_node' -e 'for_each_node_by_name' -e 'for_each_node_with_property' -- '*.[ch]' > /dev/null
> 1.55user 0.74system 0:01.24elapsed 183%CPU (0avgtext+0avgdata 78760maxresident)k
> 216inputs+0outputs (3major+30006minor)pagefaults 0swaps
> elfring@Sonne:~/Projekte/Linux/next-patched> /usr/bin/time git grep --threads 4 -l -w -e 'for_each_child_of_node' -e 'for_each_available_child_of_node' -e 'for_each_compatible_node' -e 'for_each_node_by_name' -e 'for_each_node_by_type' -e 'for_each_matching_node' -e 'for_each_matching_node_and_match' -e 'for_each_node_with_property' -- '*.[ch]' > /dev/null
> 1.55user 0.72system 0:01.24elapsed 183%CPU (0avgtext+0avgdata 74380maxresident)k
> 0inputs+0outputs (0major+31030minor)pagefaults 0swaps

As far as I can see, you are showing that the times are the same.  Why are
you wasting your time on this?

Although I didn't know that git grep was parallelizable, although since
the used time and the elapsed time are almost the same, maybe it doesn't
help much.

julia
--8323329-2051016452-1603867822=:2766--
