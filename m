From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 15 Mar 2019 16:24:27 +0000
Subject: Re: [PATCH] coccinelle: semantic patch for missing of_node_put
Message-Id: <01690c3e-ffed-7a9a-a900-f2e534fd0c11@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1552616681-17985-1-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1552616681-17985-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>, Julia Lawall <julia.lawall@lip6.fr>
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Coccinelle <cocci@systeme.lip6.fr>

> +/// Find missing of_node_put
> +///
> +// Confidence: Moderate

How much would you like to improve the situation around recurring software
development concerns for such source code analysis approaches?


> +virtual report
> +virtual org

I would interpret the provided SmPL code in the way that it will not generate
adjusted (patched) C code so far.
Source code search results will be presented by these operation modes.

How do you think about to exchange the word “patch” by “code search”
at affected places (and in the subject) then?


> +@r exists@
> +local idexpression struct device_node *x;
> +identifier f;
> +statement S,S1,S2;
> +expression e,e1;
> +position p1,p2;
> +type T,T1;
> +@@
> +
> +(
> +x = f@p1(...);

How do you think about to express any more constraints for this function call?


> +... when != e = (T)x

Will it be safer to add another exclusion for the initial assignment target?


> + when != if (x) { ... of_node_put(x) ... }

I find the specification of this extra condition check questionable.



Should Masahiro Yamada be explicitly notified also for this attempt
to integrate another SmPL script?

Regards,
Markus
