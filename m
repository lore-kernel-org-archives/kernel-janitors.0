From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 17 Feb 2019 09:50:05 +0000
Subject: Re: [PATCH v6] coccinelle: semantic code search for missing put_device()
Message-Id: <8e7ba7c0-b7fe-a1f0-d28b-0c716ecbcfdb@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <HK0PR02MB36344E2B29CEB195892F6420B2610@HK0PR02MB3634.apcprd02.prod.outlook.com>
In-Reply-To: <HK0PR02MB36344E2B29CEB195892F6420B2610@HK0PR02MB3634.apcprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wen Yang <yellowriver2010@hotmail.com>, Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Coccinelle <cocci@systeme.lip6.fr>, Cheng Shengyu <cheng.shengyu@zte.com.cn>, Wen Yang <wen.yang99@zte.com.cn>

> +@search exists@
> +local idexpression id;
> +expression x,e,e1;
> +position p1,p2;
> +type T,T1,T2;
> +@@
> +
> +id = of_find_device_by_node@p1(x)
> +... when != e = id

I suggest to increase your software development attention also for
another implementation detail.
Source code analysis triggers challenges for safe data flow handling.
the semantic patch language supports search specifications for
the exclusion of specific assignments.

Does this SmPL code contain a questionable order for the source
and target metavariables?
Can the following variant be more appropriate?

+ ... when != id = e


> +if (id = NULL || ...) { ... return ...; }
> +... when != put_device(&id->dev)
> +    when != platform_device_put(id)
> +    when != of_dev_put(id)
> +    when != if (id) { ... put_device(&id->dev) ... }
> +    when != e1 = (T)id

Would you like to avoid that the return value from the shown function call
gets overwritten in the variable before it was used once at least
(when a bit of extra C code is tolerated before a null pointer check)?

Regards,
Markus
