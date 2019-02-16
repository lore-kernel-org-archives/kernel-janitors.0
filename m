From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 16 Feb 2019 08:44:04 +0000
Subject: Re: [v5] Coccinelle: semantic code search for missing put_device()
Message-Id: <6c114d10-0d17-6f43-4c33-0f57c230306f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201902161529041506841@zte.com.cn>
 <alpine.DEB.2.21.1902160908150.3212@hadrien>
 <6a07c337-533c-61c2-d033-575539309738@web.de>
 <alpine.DEB.2.21.1902160931540.3212@hadrien>
In-Reply-To: <alpine.DEB.2.21.1902160931540.3212@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, Wen Yang <wen.yang99@zte.com.cn>
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Cheng Shengyu <cheng.shengyu@zte.com.cn>, cocci@systeme.lip6.fr

>> Thus I do not see a need (or requirement) for a duplicate search attempt.
>
> Why don't you actually try it and see what the difference is rather than
> repeatedly giving false information?

I suggest to clarify this software development disagreement by the following
SmPL code.


 ... when != put_stuff(my_pointer)
     when != if (...) { ... put_stuff(my_pointer) ... }


Is this a specification for a bit of duplicate code?


Or:
Do you insist to find such a function call only within a branch of an if statement?

Regards,
Markus
