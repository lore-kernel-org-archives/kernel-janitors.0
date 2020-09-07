From: Julia Lawall <julia.lawall@inria.fr>
Date: Mon, 07 Sep 2020 14:18:56 +0000
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_Coccinelle=3A_api=3A_Add_SmPL_scr?= =?UTF-8?Q?ipt_=E2=80=9Cuse=5Fdevm=5F
Message-Id: <alpine.DEB.2.22.394.2009071618200.2476@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-540454265-1599488337=:2476"
List-Id: <kernel-janitors.vger.kernel.org>
References: <25b804fd-0d04-475d-f614-26c03c9fd544@web.de>
 <5f9fdd59-4b0b-1cb5-c3a2-92efc5bb3841@web.de>
 <alpine.DEB.2.22.394.2009071357140.2476@hadrien>
 <477abcea-e008-e509-d03f-f2753ebdfb20@web.de>
 <alpine.DEB.2.22.394.2009071506350.2476@hadrien>
 <46d314d5-822e-3d73-2d70-015794556e56@web.de>
 <alpine.DEB.2.22.394.2009071544460.2476@hadrien>
 <8aaa799f-0ec4-cfd0-854a-e1006d0d200a@web.de>
In-Reply-To: <8aaa799f-0ec4-cfd0-854a-e1006d0d200a@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Dejin Zheng <zhengdejin5@gmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-540454265-1599488337=:2476
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Mon, 7 Sep 2020, Markus Elfring wrote:

> >>>>>> +@replacement depends on patch@
> >>>>>> +expression base, device1, device2, index, private, resource;
> >>>>>> +@@
> >>>>>> +(
> >>>>>> +-resource = platform_get_resource(device1, IORESOURCE_MEM, index);
> >>>>>> + base =
> >>>>>> +-       devm_ioremap_resource
> >>>>>> ++       devm_platform_get_and_ioremap_resource
> >>>>>> +                             (
> >>>>>> +-                             &
> >>>>>> +                               device1
> >>>>>> +-                                     ->dev
> >>>>>> +                              ,
> >>>>>> +-                             resource
> >>>>>> ++                             index, &resource
> >>>>>> +                             );
> >>>>>> +|
> >>>>>> +-private->res = platform_get_resource(device1, IORESOURCE_MEM, index);
> >>>>>> + base =
> >>>>>> +-       devm_ioremap_resource
> >>>>>> ++       devm_platform_get_and_ioremap_resource
> >>>>>> +                             (device2,
> …
> >> Both source code change patterns from these branches of a SmPL disjunction
> >> work as I would expect it by the current Coccinelle software.
> >> Would you like to clarify any remaining related open issues?
> >
> > In one case the first argument of devm_ioremap_resource has to be changed
> > to produce the first argument of devm_platform_get_and_ioremap_resource
> > and in the other case there is no such change.  "work as I would expect"
> > is not a proper explanation of why this is correct.
>
> Would like to achieve that a SmPL script (like the one which I present here)
> can help to adjust the implementation of the functions “mvebu_sei_probe”
> and “hi655x_pmic_probe” (for example) for the desired reuse of the wrapper
> function “devm_platform_get_and_ioremap_resource”?
>
>
> > Maybe you can point to some previous commits that have made the change in this way.

I looked at some of the provided examples, but none of them leaves the
first argument of devm_ioremap_resource unchanged.

julia

>
> Not yet for these source code examples.
>
> Some patches were contributed.
> https://lore.kernel.org/patchwork/project/lkml/list/?q=devm_platform_get_and_ioremap_resource&archive=both&state=*
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/?qt=grep&q=devm_platform_get_and_ioremap_resource
>
> Regards,
> Markus
>
--8323329-540454265-1599488337=:2476--
