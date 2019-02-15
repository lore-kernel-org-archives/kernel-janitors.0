From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 15 Feb 2019 13:02:05 +0000
Subject: Re: [PATCH v5] Coccinelle: semantic code search for missing put_device()
Message-Id: <alpine.DEB.2.20.1902151400440.3617@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-662799820-1550235726=:3617"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550217319-40418-1-git-send-email-wen.yang99@zte.com.cn>
 <94e4b3e6-87a4-aea2-dfef-44d308f0fb4f@web.de>
In-Reply-To: <94e4b3e6-87a4-aea2-dfef-44d308f0fb4f@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr, Cheng Shengyu <cheng.shengyu@zte.com.cn>, Wen Yang <wen.yang99@zte.com.cn>

--8323329-662799820-1550235726=:3617
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Fri, 15 Feb 2019, Markus Elfring wrote:

> > +@search exists@
> > +local idexpression id;
> > +expression x,e,e1;
> > +position p1,p2;
> > +type T,T1,T2,T3;
> > +@@
> > +
> > +id = of_find_device_by_node@p1(x)
> > +... when != e = id
> > +if (id == NULL || ...) { ... return ...; }
> > +... when != put_device(&id->dev)
> …
> > +    when != if (id) { ... put_device(&id->dev) ... }
> …
>
> I would interpret this SmPL code in the way that the if statement
> for the pointer check is “optional” in this line.
> Is it an extra and redundant SmPL specification when the reference
> release function could eventually be found just anywhere within
> an implementation?

The proposed when code is correct.  It is not redundant, because it checks
for a particular control-flow pattern.

julia

>
>
> Will a need evolve to develop a similar source code search approach
> for safer resource management with other function combinations?
>
> Regards,
> Markus
>
--8323329-662799820-1550235726=:3617--
