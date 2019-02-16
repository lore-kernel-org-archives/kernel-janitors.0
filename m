From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 16 Feb 2019 08:36:48 +0000
Subject: Re: [v5] coccinelle: semantic code search for missingput_device()
Message-Id: <alpine.DEB.2.21.1902160934400.3212@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1482400413-1550306209=:3212"
List-Id: <kernel-janitors.vger.kernel.org>
References: 201902161504357846572@zte.com.cn,
 10281c5d-8b32-0a02-17ae-20bf86f8dc65@web.de
 <201902161633004137519@zte.com.cn>
In-Reply-To: <201902161633004137519@zte.com.cn>
To: wen.yang99@zte.com.cn
Cc: wang.yi59@zte.com.cn, kernel-janitors@vger.kernel.org, michal.lkml@markovi.net, yellowriver2010@hotmail.com, nicolas.palix@imag.fr, linux-kernel@vger.kernel.org, cheng.shengyu@zte.com.cn, cocci@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1482400413-1550306209=:3212
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Sat, 16 Feb 2019, wen.yang99@zte.com.cn wrote:

> > > Thanks, We will change it to something like this:
> > > In a function, for a local variable obtained by of_find_device_by_node()
> >
> > How do you think about another wording approach?
> >
> > 1. Precondition:
> > It will be checked where the return value is stored from
> > a call of the function “of_find_device_by_node”.
> >
> > 2. The source code search will be continued with …
>
> Thanks.
> This is more rigorous, we will follow your advice
>
> > > Thank you, but a local variable is necessary.
> >
> > Would you like to take additional storage possibilities for a safer
> > analysis approach into account?
> >
> > Is the restriction “local” really sufficient when such a pointer
> > could be copied to other variables?
>
> We may be able to handle this situation:
> +id = of_find_device_by_node@p1(x)
> ...
> +    when != e1 = (T)id
> +    when != e1 = &id->dev
> +    when != e1 = get_device(&id->dev)

This looks good.  To be double sure, you can put (T)(&id->dev) in the
second case.

When you have a chance please send the revised version.  As long as I
don't see that it is giving many false positives, I will accept it.  We
don't need perfection.  We need more to eliminate the memory leaks.

julia

>
> > > But it's over 80 characters.
> >
> > Long string literals can be accepted because of error message search concerns
> > around a tool like “grep”.
>
> Thanks.
> We will follow your advice
>
> >> Will any more advanced error diagnostics be eventually developed?
> > >
> > > Hello, we are just doing the practical work in this field.
> >
> > Are you aware of additional software design options from computer science
> > and existing analysis tools?
>
> We also use the commercial software klockwork, which will also find errors in the code,
> but a lot of false positives.
>
> Regards,
> Wen
--8323329-1482400413-1550306209=:3212--
