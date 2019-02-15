From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 15 Feb 2019 12:52:39 +0000
Subject: Re: [PATCH v5] Coccinelle: semantic code search for missing put_device()
Message-Id: <94e4b3e6-87a4-aea2-dfef-44d308f0fb4f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550217319-40418-1-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1550217319-40418-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>, Julia Lawall <julia.lawall@lip6.fr>
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Cheng Shengyu <cheng.shengyu@zte.com.cn>, cocci@systeme.lip6.fr

> +@search exists@
> +local idexpression id;
> +expression x,e,e1;
> +position p1,p2;
> +type T,T1,T2,T3;
> +@@
> +
> +id = of_find_device_by_node@p1(x)
> +... when != e = id
> +if (id == NULL || ...) { ... return ...; }
> +... when != put_device(&id->dev)
…
> +    when != if (id) { ... put_device(&id->dev) ... }
…

I would interpret this SmPL code in the way that the if statement
for the pointer check is “optional” in this line.
Is it an extra and redundant SmPL specification when the reference
release function could eventually be found just anywhere within
an implementation?


Will a need evolve to develop a similar source code search approach
for safer resource management with other function combinations?

Regards,
Markus
