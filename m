From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 15 Feb 2019 09:10:12 +0000
Subject: Re: [PATCH v5] coccinelle: semantic code search for missing put_device()
Message-Id: <c096c774-bb52-de01-7608-286b4d416cda@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550217319-40418-1-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1550217319-40418-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>, Julia Lawall <julia.lawall@lip6.fr>
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Cheng Shengyu <cheng.shengyu@zte.com.cn>, cocci@systeme.lip6.fr

> In a function, for a local variable returned by calling
> of_find_device_by_node(),

I suggest to reconsider this information once more.

1. Will an other wording be more appropriate for the storage of
   a function return value?

2. Can the restriction “local” be omitted?

3. Will any macros be involved eventually?


> c, for the rest of the situation, the current function should release the
>    reference by calling put_device,

Can it happen that on other function will perform the desired reference release?


>                                     this code search will report the
>    corresponding error message.

Rewording?
A code search can report an error with a specific confidence.


> v5->v4:

Such version information would be sufficient also without arrows, wouldn't it?


> - add a SPDX identifierfix

Would you like to fix a typo at the end?


> +@script:python depends on report@
> +p1 << search.p1;
> +p2 << search.p2;
> +@@
> +
> +coccilib.report.print_report(p2[0], "ERROR: missing put_device; "
> +			      + "call of_find_device_by_node on line "
> +			      + p1[0].line
> +			      + ", but without a corresponding object release "
> +			      + "within this function.")

I find your interpretation of my reminder for the preferred avoidance
of split string literals interesting somehow.

Can the following source code variant be more appropriate?

+coccilib.report.print_report(p2[0],
+			      "WARNING: missing put_device - of_find_device_by_node() call on line "
+			      + p1[0].line
+			      + ", but without a corresponding object release within this function.")


Will any more advanced error diagnostics be eventually developed?

Regards,
Markus
