From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 06 Jun 2020 06:00:26 +0000
Subject: Re: coccinelle: api: add kzfree script
Message-Id: <e10d3917-da30-94d6-9f41-b0343daf3e23@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e814fbbe-37a9-a059-fcbb-64cebba4c8e2@web.de>
In-Reply-To: <e814fbbe-37a9-a059-fcbb-64cebba4c8e2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@inria.fr>, Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>
Cc: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> Is avoiding transforming the case where E is not verified to be a pointer a concern?

I imagine that answers to this question have got consequences also on
the confidence level for such SmPL scripts.
The desire and requirement to specify data type restrictions (for expressions)
can influence data processing efforts in significant ways.

* If it would be accepted to choose a simpler source code search approach,
  there are corresponding risks to consider.

* If you would like to reduce the general possibility for false positives
  according to advanced software analysis, the amount of data processing
  will increase because information from header files will probably be needed.
  The run time characteristics will become more interesting then.
  Additional program execution parameters will be relevant for this use case.

Regards,
Markus
