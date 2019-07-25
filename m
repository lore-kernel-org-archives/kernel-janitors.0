From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 25 Jul 2019 14:48:04 +0000
Subject: Re: [1/2] string: Add stracpy and stracpy_pad mechanisms
Message-Id: <dc4cae24-ef63-ab04-ac93-23e3c9038827@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.1907242040490.10108@hadrien>
 <7e489aa8-95ea-b3b0-9023-ba284212977f@web.de>
 <alpine.DEB.2.21.1907250847440.2555@hadrien>
In-Reply-To: <alpine.DEB.2.21.1907250847440.2555@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Joe Perches <joe@perches.com>, David Laight <David.Laight@ACULAB.COM>, kernel-janitors@vger.kernel.org, cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org

> Huh?  Rule 2 is important, to ensure that ths size is correct.

I assume that the dependency of the replacement on the data structure check
can become clearer.

Regards,
Markus
