From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 15 Feb 2019 06:55:14 +0000
Subject: Re: [PATCH v4] coccinelle: semantic patch for missing put_device()
Message-Id: <alpine.DEB.2.21.1902150754380.2896@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: 1550126293-27839-1-git-send-email-wen.yang99@zte.com.cn,
 201902151422261425412@zte.com.cn,
 alpine.DEB.2.21.1902150723110.2896@hadrien <201902151452197117145@zte.com.cn>
In-Reply-To: <201902151452197117145@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wen.yang99@zte.com.cn
Cc: wang.yi59@zte.com.cn, kernel-janitors@vger.kernel.org, michal.lkml@markovi.net, yellowriver2010@hotmail.com, nicolas.palix@imag.fr, linux-kernel@vger.kernel.org, cheng.shengyu@zte.com.cn, cocci@systeme.lip6.fr



On Fri, 15 Feb 2019, wen.yang99@zte.com.cn wrote:

> Hi Julia, thank you very much.
>
> > > >> In a function, for variables returned by calling of_find_device_by_node(),
> > > > Do variables really get returned?
> > > > The provided pointer should usually be stored somewhere.
> > >
> > > Thank you very much, we will consider this situation and submit a next version to fix it.
> >
> > I don't know what Markus is talking about here, so I'm not sure that a
> > change is needed.
>
> I think Markus means that we need to deal with two situations:
> 1,  The return value of of_find_device_by_node () is assigned to a variable, such as:
> pdev = of_find_device_by_node(np);
> 2,  The return value of of_find_device_by_node() is assigned to a variable in a structure, such as:
> dev->pdev = of_find_device_by_node(args.np);
>
> So I plan to modify the following to capture both cases:
> -local idexpression id;
> +expression id;

I'm not sure that this is a good idea.  There is likely no need for a put
in the latter case.

julia

> ...
> id = of_find_device_by_node@p1(x)
>
> > > >> + "ERROR: missing put_device;"
> > > >Will change confidence considerations result in another fine-tuning for this message?
> > >
> > > Thank you, we will change "ERROR" to "WARNING".
> >
> > I think ERROR is fine. If it is a real positive than it is a real
> > problem. Warning is for things that look ugly, but don't have any impact
> > on the execution.
>
> OK, I will keep it.
> Thanks.
>
> Regards,
> Wen
