From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 26 Jul 2019 06:15:50 +0000
Subject: Re: [1/2] string: Add stracpy and stracpy_pad mechanisms
Message-Id: <7a0c4d94-5d35-589f-18b0-f872e74aeb45@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.1907251747560.2494@hadrien>
In-Reply-To: <alpine.DEB.2.21.1907251747560.2494@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Joe Perches <joe@perches.com>, David Laight <David.Laight@ACULAB.COM>, kernel-janitors@vger.kernel.org, cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org

> The rule now properly checks that the third argument is the size of the
> first argument.  This made a small reduction in the number of results.

Thanks for your SmPL script adjustments.
Will deviations from this restriction become more interesting?


> \(strscpy\|strlcpy\)(e1.f, e2, i2)@p

Would you like to take the function “strscpy_pad” also into account for
source code transformations with the macro “stracpy_pad”?

Regards,
Markus
