From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 17 Feb 2019 12:52:28 +0000
Subject: Re: [v6] coccinelle: semantic code search for missing put_device()
Message-Id: <alpine.DEB.2.21.1902171350500.2444@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-712726055-1550407948=:2444"
List-Id: <kernel-janitors.vger.kernel.org>
References: <HK0PR02MB36344E2B29CEB195892F6420B2610@HK0PR02MB3634.apcprd02.prod.outlook.com>
 <8e7ba7c0-b7fe-a1f0-d28b-0c716ecbcfdb@web.de>
 <alpine.DEB.2.21.1902171235570.2444@hadrien>
 <1c152067-0135-79d7-1285-4bb9925054c8@web.de>
 <alpine.DEB.2.21.1902171246560.2444@hadrien>
 <782fd1c3-80ff-a296-b3a2-351257bb13b3@web.de>
 <alpine.DEB.2.21.1902171304520.2444@hadrien>
 <10836645-5b19-a748-56d7-c0572a76ab4d@web.de>
In-Reply-To: <10836645-5b19-a748-56d7-c0572a76ab4d@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Coccinelle <cocci@systeme.lip6.fr>, Cheng Shengyu <cheng.shengyu@zte.com.cn>, Wen Yang <wen.yang99@zte.com.cn>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-712726055-1550407948=:2444
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Sun, 17 Feb 2019, Markus Elfring wrote:

> >> If you would insist on the specification of such an assignment exclusion
> >> for a SmPL ellipsis:
> >> Can we agree on a correct order?
> >
> > I don't get your point.
>
> I propose to take another closer look at a bit of SmPL code.
>
>
> > There is no correct order.
>
> I have got an other software development view here.
>
>
> > Each order expresses something different.
>
> I agree to this information.
>
>
> > The order that is currently in the semantic patch is the one
> > that is more likely in practice.
>
> Please check once more.
>
> …
> +@search exists@
> +local idexpression id;
> +expression x,e,e1;
> +position p1,p2;
> …
> +@@
> +
> +id = of_find_device_by_node@p1(x)
> +... when != e = id
> …
>
> Or:
>
> …
> + ... when != id = e
> …
>
>
> Which SmPL specification will achieve the desired software behaviour?

The desired behavior is to check whether the allocated value is saved in
some other variable (typically a structure field) and thus it doesn't need
to be freed just because the original local variable goes out of scope at
the end of the function.  when != e = id achieves this behavior.

julia
--8323329-712726055-1550407948=:2444--
