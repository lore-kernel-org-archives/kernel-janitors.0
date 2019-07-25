From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 25 Jul 2019 13:45:46 +0000
Subject: Re: [PATCH 1/2] string: Add stracpy and stracpy_pad mechanisms
Message-Id: <7e489aa8-95ea-b3b0-9023-ba284212977f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.1907242040490.10108@hadrien>
In-Reply-To: <alpine.DEB.2.21.1907242040490.10108@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Joe Perches <joe@perches.com>, David Laight <David.Laight@ACULAB.COM>, linux-kernel@vger.kernel.org

> @r@
> identifier f,i1,i2;
> struct i1 e1;
> expression e2;
> position p;
> @@
> \(strscpy\|strlcpy\)(e1.f, e2, i2)@p

I have got the impression that the replacement can work also
without an inherited position variable at the end.
How do you think about to omit this SmPL rule then?

Can it be nicer to reduce duplicate SmPL code a bit?

Regards,
Markus
