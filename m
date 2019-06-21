From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 21 Jun 2019 09:37:22 +0000
Subject: Re: Coccinelle: Add a SmPL script for the reconsideration of redundant dev_err() calls
Message-Id: <15ca8d4b-e2d0-f021-de6e-c929cf3e1039@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <05d85182-7ec3-8fc1-4bcd-fd2528de3a40@web.de>
 <alpine.DEB.2.21.1906202046550.3087@hadrien>
 <34d528db-5582-5fe2-caeb-89bcb07a1d30@web.de>
 <alpine.DEB.2.21.1906202110310.3087@hadrien>
 <13890878-9e5f-f297-7f7c-bcc1212d83b7@web.de>
 <alpine.DEB.2.20.1906211119430.3740@hadrien>
In-Reply-To: <alpine.DEB.2.20.1906211119430.3740@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Ding Xiang <dingxiang@cmss.chinamobile.com>, Coccinelle <cocci@systeme.lip6.fr>

> I still don't see the point of specifying return.  Why not just S, where S
> is a statement metavariable?

Do you find the following SmPL change specification more appropriate?

@deletion depends on patch@
expression e;
statement s;
@@
 e = devm_ioremap_resource(...);
 if (IS_ERR(e))
(
-{
-   dev_err(...);
    s
-}
|
 {
 <+...
-   dev_err(...);
 ...+>
 }
)


Will any additional constraints become relevant?


>> Would this approach need a version check for the Coccinelle software?
>
> Why would that be necessary?

I guess that the application of SmPL disjunctions for if statements
can trigger development concerns.

Regards,
Markus
