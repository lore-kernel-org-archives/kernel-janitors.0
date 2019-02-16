From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 16 Feb 2019 08:32:24 +0000
Subject: Re: [v5] Coccinelle: semantic code search for missing put_device()
Message-Id: <alpine.DEB.2.21.1902160931540.3212@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1848019999-1550305945=:3212"
List-Id: <kernel-janitors.vger.kernel.org>
References: <201902161529041506841@zte.com.cn>
 <alpine.DEB.2.21.1902160908150.3212@hadrien>
 <6a07c337-533c-61c2-d033-575539309738@web.de>
In-Reply-To: <6a07c337-533c-61c2-d033-575539309738@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr, Cheng Shengyu <cheng.shengyu@zte.com.cn>, Wen Yang <wen.yang99@zte.com.cn>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1848019999-1550305945=:3212
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Sat, 16 Feb 2019, Markus Elfring wrote:

> >> We will modify the the if in the when code like this:
> >>
> >> @@ -22,7 +22,7 @@ if (id == NULL || ...) { ... return ...; }
> >>  ... when != put_device(&id->dev)
> …
> >> -    when != if (id) { ... put_device(&id->dev) ... }
> >> +    when != if (...) { ... put_device(&id->dev) ... }
> >
> > This looks ok.
>
> I have got another different software development opinion also for
> such SmPL code in the adjusted line.
> I find this specific source code search variant irrelevant
> because the shown reference release function should be found
> by the first SmPL when specification already.
> Would you like to determine generally if the desired function call
> is present at all?
>
> Thus I do not see a need (or requirement) for a duplicate search attempt.

Why don't you actually try it and see what the difference is rather than
repeatedly giving false information?

julia
--8323329-1848019999-1550305945=:3212--
