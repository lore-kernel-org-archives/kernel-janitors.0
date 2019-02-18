From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 18 Feb 2019 06:43:26 +0000
Subject: Re: [v6] coccinelle: semantic code search for missing put_device()
Message-Id: <alpine.DEB.2.21.1902180740550.3111@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-2117660207-1550472207=:3111"
List-Id: <kernel-janitors.vger.kernel.org>
References: HK0PR02MB36344E2B29CEB195892F6420B2610@HK0PR02MB3634.apcprd02.prod.outlook.com,
 52c07e7c-eec7-792b-0b03-b5cb46ddeab3@web.de <201902181122502228026@zte.com.cn>
In-Reply-To: <201902181122502228026@zte.com.cn>
To: wen.yang99@zte.com.cn
Cc: kernel-janitors@vger.kernel.org, michal.lkml@markovi.net, yellowriver2010@hotmail.com, nicolas.palix@imag.fr, linux-kernel@vger.kernel.org, Markus.Elfring@web.de, cheng.shengyu@zte.com.cn, cocci@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2117660207-1550472207=:3111
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Mon, 18 Feb 2019, wen.yang99@zte.com.cn wrote:

> > > when != e = id achieves this behavior.
> >
> > I can not agree to this view completely because of the meaning that is connected
> > with these variable identifiers.
> >
> > Both metavariables share the kind “expression”. So I can imagine
> > that there is an intersection for the source code match possibility.
> > But one was intentionally restricted to the kind “local idexpression” so far.
> >
> > Which data element should not get reassigned here (before a corresponding
> > null pointer check)?
> >
>
> Thank you for your comments.
> We did some experiments:
> +id = of_find_device_by_node@p1(x)
> +... when != e = id
> ...
> Or:
> ...
> + ... when != id = e
>
> The number of issuses found by these two methods is the same.
> When != e = id achieves this behavior.

They are the same because neither issue arises.  I would have a hard time
saying which one is more reasonable to test, since both are extremely
unlikely.

julia


>
> In addition, we feel that we should probably accept this patch first, use it to find more memory leaks, and solve the actual problems in the kernel code.
> As for the patch itself, we can continue to pursue perfect in the process of using it to solve practical problems.
>
> Regards,
> Wen
--8323329-2117660207-1550472207=:3111--
