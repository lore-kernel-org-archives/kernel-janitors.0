From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 14 Feb 2019 10:01:09 +0000
Subject: Re: [PATCH v4] coccinelle: semantic patch for missing put_device()
Message-Id: <7c4e26a4-32b9-e1f8-beeb-bfa4fc9e6128@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550126293-27839-1-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1550126293-27839-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Cheng Shengyu <cheng.shengyu@zte.com.cn>, cocci@systeme.lip6.fr

> The implementation of this semantic patch is:

Thanks for your extension of such a commit message.


I would interpret the provided SmPL code in the way that it will not generate
adjusted (patched) C code so far.
Source code search results will be presented by the operation mode “report” or “org”.

How do you think about to exchange the word “patch” by “code search”
at affected places (and in the subject) then?


> In a function, for variables returned by calling of_find_device_by_node(),

Do variables really get returned?

The provided pointer should usually be stored somewhere.


> c, for the rest of the situation, the current function should release the
>    reference by calling put_device, this patch will report the
>    corresponding error message.

* Do you expect that the desired object release should be performed only in
  the same function implementation?

* Would you like to pick any software development challenges up around
  inter-procedural data flow (or even escape) analysis for the shown use case?


> Further, for the case of b, the object returned to other functions may also
> have a reference leak, we will continue to develop other cocci scripts to
> further check the reference leak.

I am curious on how these approaches will evolve further.


> +// Copyright: (C) 2018-2019 Wen Yang, ZTE.  GPLv2.

Would you like to add a SPDX identifier?


> +coccilib.report.print_report(p2[0],

Thanks for a nicer indentation here.


> +			     "ERROR: missing put_device;"

Will change confidence considerations result in another fine-tuning for this message?


> +			      + " call of_find_device_by_node on line "

I find that such a split string literal can be unwanted.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=1f947a7a011fcceb14cb912f5481a53b18f1879a#n94


> +			      + " and return without releasing.")

Possible rewording?

+			      + " but without a corresponding object release within this function.")


Regards,
Markus
