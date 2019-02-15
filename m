From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 15 Feb 2019 13:54:27 +0000
Subject: Re: [v5] Coccinelle: semantic code search for missing put_device()
Message-Id: <b2f195e8-c3a3-f876-a075-317bb33496c6@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550217319-40418-1-git-send-email-wen.yang99@zte.com.cn>
 <94e4b3e6-87a4-aea2-dfef-44d308f0fb4f@web.de>
 <alpine.DEB.2.20.1902151400440.3617@hadrien>
 <a35e9d4a-1166-c794-732e-3e7ec0063c77@web.de>
 <alpine.DEB.2.20.1902151423370.3617@hadrien>
In-Reply-To: <alpine.DEB.2.20.1902151423370.3617@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr, Cheng Shengyu <cheng.shengyu@zte.com.cn>, Wen Yang <wen.yang99@zte.com.cn>

>> Does the first SmPL when specification include the case that a call
>> of the function “put_device” can occur within a branch of an if statement?
>
> It does include that,

Thanks for this acknowledgement.

So it seems that you find my interpretation of this bit of SmPL code appropriate.


> but there is another execution path where the put device is not present.

It is tried to find such cases.


> But given the test in the if in the when code,
> on that execution path id is NULL, an so there is no need to put it.

I would like to point out that the function “put_device” belongs also to
the category of functions which tolerate the passing of null pointers.
https://elixir.bootlin.com/linux/v5.0-rc6/source/drivers/base/core.c#L2053
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/core.c?id=cb5b020a8d38f77209d0472a0fea755299a8ec78#n2053

Have we got still different software development opinions about the need
for an extra pointer check in the “second” SmPL when specification?

Regards,
Markus
