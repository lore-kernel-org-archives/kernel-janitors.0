From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 16 Feb 2019 08:34:08 +0000
Subject: Re: [v5] coccinelle: semantic code search for missingput_device()
Message-Id: <alpine.DEB.2.21.1902160933350.3212@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1058747191-1550306049=:3212"
List-Id: <kernel-janitors.vger.kernel.org>
References: <201902161504357846572@zte.com.cn>
 <10281c5d-8b32-0a02-17ae-20bf86f8dc65@web.de>
In-Reply-To: <10281c5d-8b32-0a02-17ae-20bf86f8dc65@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr, Cheng Shengyu <cheng.shengyu@zte.com.cn>, Wen Yang <wen.yang99@zte.com.cn>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1058747191-1550306049=:3212
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Sat, 16 Feb 2019, Markus Elfring wrote:

> > Thanks, We will change it to something like this:
> > In a function, for a local variable obtained by of_find_device_by_node()
>
> How do you think about another wording approach?
>
> 1. Precondition:
>    It will be checked where the return value is stored from
>    a call of the function “of_find_device_by_node”.
>
> 2. The source code search will be continued with …
>
>
> > Thank you, but a local variable is necessary.
>
> Would you like to take additional storage possibilities for a safer
> analysis approach into account?
>
> Is the restriction “local” really sufficient when such a pointer
> could be copied to other variables?

I've lost track of the original semantic patch, but perhaps it needs a

when != e1 = e

julia

>
>
> >> Can it happen that on other function will perform the desired reference release?
> >
> > Thanks.
> > Because the information of this local variable is not passed to the external function,
> > this situation does not exist.
>
> Will copied pointers matter here?
>
>
> > But it's over 80 characters.
>
> Long string literals can be accepted because of error message search concerns
> around a tool like “grep”.
>
>
> >> Will any more advanced error diagnostics be eventually developed?
> >
> > Hello, we are just doing the practical work in this field.
>
> Are you aware of additional software design options from computer science
> and existing analysis tools?
>
>
> > We also hope that it can support cross-function/cross-file/data stream analysis
> > and other functions.
>
> This functionality will need further clarification.
>
>
> > We are also analyzing the principle and code implementation of coccinelle,
> > hoping to contribute a little.
>
> I am curious on how this situation will evolve further.
>
> Regards,
> Markus
>
--8323329-1058747191-1550306049=:3212--
