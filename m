From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 19 Feb 2019 07:04:31 +0000
Subject: Re: [v6] coccinelle: semantic code search for missing put_device()
Message-Id: <alpine.DEB.2.21.1902190804150.2570@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-483052161-1550559872=:2570"
List-Id: <kernel-janitors.vger.kernel.org>
References: 201902181122502228026@zte.com.cn,
 ab463e94-287a-6188-6795-06eeb832e861@web.de
 <201902191014156680299@zte.com.cn>
In-Reply-To: <201902191014156680299@zte.com.cn>
To: wen.yang99@zte.com.cn
Cc: kernel-janitors@vger.kernel.org, michal.lkml@markovi.net, yellowriver2010@hotmail.com, nicolas.palix@imag.fr, linux-kernel@vger.kernel.org, Markus.Elfring@web.de, cheng.shengyu@zte.com.cn, cocci@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-483052161-1550559872=:2570
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Tue, 19 Feb 2019, wen.yang99@zte.com.cn wrote:

> > > I would have a hard time saying which one is more reasonable to test,
> > I suggest to reconsider the interpretation of this software situation once more.
> > > since both are extremely unlikely.
> > I disagree to this view because two ellipses were intentionally specified
> > in published SmPL scripts.
> > So some software developers found these “special use cases” important enough.
> > >> In addition, we feel that we should probably accept this patch first,
> > I disagree to this imagination because I would prefer to integrate a source code variant
> > without a bug (which was copied from a version on 2013-05-08 by Petr Strnad).
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccinelle/free/pci_free_consistent.cocci?id=f7b167113753e95ae61383e234f8d10142782ace#n12
> > I hope that nicer run time behaviour can become also relevant here.
>
> Both cases are extremely unlikely.
> Although we have tested these two methods in the existing kernel code,
> considering the evolution of the kernel code, these special cases may occur, so we are willing to take them into account.
> We plan to modify the code like this:
>
>  id = of_find_device_by_node@p1(x)
> -... when != e = id
> +... when != e = (T)id
> +    when != id = (T)e

This change is fine with me.

julia

>
> Do you have any other questions?
> Thanks.
>
> Regards,
> Wen
--8323329-483052161-1550559872=:2570--
