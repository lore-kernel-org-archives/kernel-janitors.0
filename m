From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 20 Jun 2019 19:34:52 +0000
Subject: Re: Coccinelle: Add a SmPL script for the reconsideration of redundant dev_err() calls
Message-Id: <2cae7d27-c032-20bf-4ecc-66a4a85a77cc@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <05d85182-7ec3-8fc1-4bcd-fd2528de3a40@web.de>
 <alpine.DEB.2.21.1906202046550.3087@hadrien>
 <34d528db-5582-5fe2-caeb-89bcb07a1d30@web.de>
 <alpine.DEB.2.21.1906202110310.3087@hadrien>
In-Reply-To: <alpine.DEB.2.21.1906202110310.3087@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Ding Xiang <dingxiang@cmss.chinamobile.com>, Coccinelle <cocci@systeme.lip6.fr>

>> Would you prefer to clarify a more advanced approach?
>
> I think that something like
>
> if (IS_ERR(e))
> {
> <+...
> *dev_err(...)
> ...+>
> }
>
> would be more appropriate.

This SmPL construct can be more powerful.


> Whether there is a return or not doesn't really matter.

Such an adjustment can be helpful for a few operation modes.

But the number of statements in the if branch will influence the possibility
for the deletion of curly braces together with redundant dev_err() calls
by the SmPL patch mode.


>> Would you like to get the relevant function name dynamically determined?
>
> I have no idea what you consider "the relevant function name" to be.
> If it is always devm_ioremap_resource then it would seem that it does not
> need to be dynamically determined.

Do other functions share the same error reporting strategy so that any more
collateral software evolution can happen?

Regards,
Markus
