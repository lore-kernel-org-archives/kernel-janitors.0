From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 16 Feb 2019 08:09:14 +0000
Subject: Re: [v5] Coccinelle: semantic code search for missing put_device()
Message-Id: <alpine.DEB.2.21.1902160908150.3212@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-938833334-1550304555=:3212"
List-Id: <kernel-janitors.vger.kernel.org>
References: 1550217319-40418-1-git-send-email-wen.yang99@zte.com.cn,
 b2f195e8-c3a3-f876-a075-317bb33496c6@web.de
 <201902161529041506841@zte.com.cn>
In-Reply-To: <201902161529041506841@zte.com.cn>
To: wen.yang99@zte.com.cn
Cc: wang.yi59@zte.com.cn, kernel-janitors@vger.kernel.org, michal.lkml@markovi.net, yellowriver2010@hotmail.com, nicolas.palix@imag.fr, linux-kernel@vger.kernel.org, cheng.shengyu@zte.com.cn, cocci@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-938833334-1550304555=:3212
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Sat, 16 Feb 2019, wen.yang99@zte.com.cn wrote:

> >>> Does the first SmPL when specification include the case that a call
> >>> of the function “put_device” can occur within a branch of an if statement?
> >>
> >> It does include that,
> >
> >Thanks for this acknowledgement.
> >
> >So it seems that you find my interpretation of this bit of SmPL code appropriate.
> >
> >> but there is another execution path where the put device is not present.
> >
> >It is tried to find such cases.
> >
> >> But given the test in the if in the when code,
> >> on that execution path id is NULL, an so there is no need to put it.
> >
> >I would like to point out that the function “put_device” belongs also to
> >the category of functions which tolerate the passing of null pointers.
> >https://elixir.bootlin.com/linux/v5.0-rc6/source/drivers/base/core.c#L2053
> >https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/core.c?id=cb5b020a8d38f77209d0472a0fea755299a8ec78#n2053
> >
> >Have we got still different software development opinions about the need
> >for an extra pointer check in the “second” SmPL when specification?
>
> Thanks to Julia and Markus.
> We will modify the the if in the when code like this:
>
> @@ -22,7 +22,7 @@ if (id == NULL || ...) { ... return ...; }
>  ... when != put_device(&id->dev)
>      when != platform_device_put(id)
>      when != of_dev_put(id)
> -    when != if (id) { ... put_device(&id->dev) ... }
> +    when != if (...) { ... put_device(&id->dev) ... }

This looks ok.  You can check the old version and the new version and see
if there is any differencein the set of reports.

julia
--8323329-938833334-1550304555=:3212--
