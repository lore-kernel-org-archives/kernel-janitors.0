From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 25 Jul 2019 13:48:30 +0000
Subject: Re: [PATCH 1/2] string: Add stracpy and stracpy_pad mechanisms
Message-Id: <alpine.DEB.2.21.1907250847440.2555@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.1907242040490.10108@hadrien>
 <7e489aa8-95ea-b3b0-9023-ba284212977f@web.de>
In-Reply-To: <7e489aa8-95ea-b3b0-9023-ba284212977f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Joe Perches <joe@perches.com>, David Laight <David.Laight@ACULAB.COM>, kernel-janitors@vger.kernel.org, cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org



On Thu, 25 Jul 2019, Markus Elfring wrote:

> > @r@
> > identifier f,i1,i2;
> > struct i1 e1;
> > expression e2;
> > position p;
> > @@
> > \(strscpy\|strlcpy\)(e1.f, e2, i2)@p
>
> I have got the impression that the replacement can work also
> without an inherited position variable at the end.
> How do you think about to omit this SmPL rule then?
>
> Can it be nicer to reduce duplicate SmPL code a bit?

Huh?  Rule 2 is important, to ensure that ths size is correct.  Without
rule 1, how can rule 2 be checked?

julia
