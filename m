From: Julia Lawall <julia.lawall@inria.fr>
Date: Wed, 09 Sep 2020 09:01:18 +0000
Subject: Re: [Cocci] [PATCH v2] scripts: coccicheck: Do not use shift command when rule is specified
Message-Id: <alpine.DEB.2.22.394.2009091059311.2651@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-688164862-1599642079=:2651"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1a2ddefa-59dc-460c-59d5-5c6c1754d20b@web.de>
In-Reply-To: <1a2ddefa-59dc-460c-59d5-5c6c1754d20b@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-688164862-1599642079=:2651
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Wed, 9 Sep 2020, Markus Elfring wrote:

> > Modify coccicheck to use the shift command only when
> > number of shell arguments is not zero.
>
> I suggest to add the tag “Fixes” to the commit message.

I don't think there is any need for that.  This is not a patch that should
be backported.  The previous situation did not cause any problem with the
execution of make coccicheck, only a tiresome warning message.

julia

>
>
> > Changes in V2:
> > 	- Fix spelling errors as suggested by Markus Elfring
>
> Would you like to adjust the last word in the previous patch subject accordingly?
>
> Regards,
> Markus
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
--8323329-688164862-1599642079=:2651--
