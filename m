From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 15 Feb 2019 13:24:40 +0000
Subject: Re: [v5] Coccinelle: semantic code search for missing put_device()
Message-Id: <alpine.DEB.2.20.1902151423370.3617@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-453697585-1550237080=:3617"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550217319-40418-1-git-send-email-wen.yang99@zte.com.cn>
 <94e4b3e6-87a4-aea2-dfef-44d308f0fb4f@web.de>
 <alpine.DEB.2.20.1902151400440.3617@hadrien>
 <a35e9d4a-1166-c794-732e-3e7ec0063c77@web.de>
In-Reply-To: <a35e9d4a-1166-c794-732e-3e7ec0063c77@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr, Cheng Shengyu <cheng.shengyu@zte.com.cn>, Wen Yang <wen.yang99@zte.com.cn>

--8323329-453697585-1550237080=:3617
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Fri, 15 Feb 2019, Markus Elfring wrote:

> >>> +id = of_find_device_by_node@p1(x)
> …
> >>> +if (id == NULL || ...) { ... return ...; }
> >>> +... when != put_device(&id->dev)
> >> …
> >>> +    when != if (id) { ... put_device(&id->dev) ... }
> >> …
> >>
> >> I would interpret this SmPL code in the way that the if statement
> >> for the pointer check is “optional” in this line.
> >> Is it an extra and redundant SmPL specification when the reference
> >> release function could eventually be found just anywhere within
> >> an implementation?
> >
> > The proposed when code is correct.
>
> I agree that this SmPL code can work in the way it was designed.
>
>
> > It is not redundant, because it checks for a particular control-flow pattern.
>
> It took another moment until I dared to express a different software
> development opinion also on this implementation detail.
>
> Does the first SmPL when specification include the case that a call
> of the function “put_device” can occur within a branch of an if statement?

It does include that, but there is another execution path where the
put device is not present.  But given the test in the if in the when code,
on that execution path id is NULL, an so there is no need to put it.

julia
--8323329-453697585-1550237080=:3617--
