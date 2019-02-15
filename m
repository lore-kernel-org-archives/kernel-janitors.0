From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 15 Feb 2019 06:25:31 +0000
Subject: Re: [PATCH v4] coccinelle: semantic patch for missing put_device()
Message-Id: <alpine.DEB.2.21.1902150723110.2896@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1724339360-1550211931=:2896"
List-Id: <kernel-janitors.vger.kernel.org>
References: 1550126293-27839-1-git-send-email-wen.yang99@zte.com.cn,
 7c4e26a4-32b9-e1f8-beeb-bfa4fc9e6128@web.de
 <201902151422261425412@zte.com.cn>
In-Reply-To: <201902151422261425412@zte.com.cn>
To: wen.yang99@zte.com.cn
Cc: wang.yi59@zte.com.cn, kernel-janitors@vger.kernel.org, michal.lkml@markovi.net, yellowriver2010@hotmail.com, nicolas.palix@imag.fr, linux-kernel@vger.kernel.org, cheng.shengyu@zte.com.cn, cocci@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1724339360-1550211931=:2896
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Fri, 15 Feb 2019, wen.yang99@zte.com.cn wrote:

> > How do you think about to exchange the word “patch” by “code search”
> > at affected places (and in the subject) then?
>
> Thanks, we‘ll fix it.
>
> >> In a function, for variables returned by calling of_find_device_by_node(),
> > Do variables really get returned?
> > The provided pointer should usually be stored somewhere.
>
> Thank you very much, we will consider this situation and  submit a next version to fix it.

I don't know what Markus is talking about here, so I'm not sure that a
change is needed.

>
> > * Would you like to pick any software development challenges up around
> > inter-procedural data flow (or even escape) analysis for the shown use case?
>
> We are very interested in doing this work, but currently coccinelle may
> not support data flow analysis, and we hope to contribute a little.
>
> > Would you like to add a SPDX identifier?
>
> OK, we will add a SPDX identifierfix soon.
>
> >> + "ERROR: missing put_device;"
> >Will change confidence considerations result in another fine-tuning for this message?
>
> Thank you, we will change "ERROR" to "WARNING".

I think ERROR is fine.  If it is a real positive than it is a real
problem.  Warning is for things that look ugly, but don't have any impact
on the execution.

julia

> >> + + " call of_find_device_by_node on line "
> >I find that such a split string literal can be unwanted.
>
> Thank you, we will fix it soon.
>
> >> + + " and return without releasing.")
> >Possible rewording?
> >+ + " but without a corresponding object release within this function.")
>
> Thanks, we will modify it according to your suggestion.
>
> Regards,
> Wen
--8323329-1724339360-1550211931=:2896--
