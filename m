From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 29 Sep 2019 18:05:32 +0000
Subject: Re: [Cocci] [RFC PATCH] scripts: Fix coccicheck failed
Message-Id: <alpine.DEB.2.21.1909292004460.4485@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-964066602-1569780332=:4485"
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.1909291810300.3346@hadrien>
 <90cea5d2-b586-6f82-34dd-d7a812f57396@web.de>
In-Reply-To: <90cea5d2-b586-6f82-34dd-d7a812f57396@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Yue Haibing <yuehaibing@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, Matthias Maennich <maennich@google.com>, linux-kernel@vger.kernel.org, Jessica Yu <jeyu@kernel.org>, Martijn Coenen <maco@android.com>, cocci@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-964066602-1569780332=:4485
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Sun, 29 Sep 2019, Markus Elfring wrote:

> > Maybe the problem would be solved by putting virtual report at the top of the rule.
>
> I assume that support for the operation mode “patch” can eventually be considered.
>

Coccicheck requires that all rules support the report mode.

julia

>
> > But it might still fail because nothing can happen without a value
> > for the virtual metavariable ns.
>
> I imagine that the safe handling of this command line input parameter
> will trigger further software development concerns.
>
>
> > Should the coccinelle directory be only for things that work with make coccicheck,
>
> I hope not.
>
> But it seems that a filter command expressed such a restriction so far.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccicheck?id=02dc96ef6c25f990452c114c59d75c368a1f4c8f#n257
>
> Is this place an update candidate now?
>
>
> > or for all Coccinelle scripts?
>
> I would prefer file storage selections in this direction.
> How do you think about to improve the software taxonomy accordingly?
>
> Regards,
> Markus
>
--8323329-964066602-1569780332=:4485--
