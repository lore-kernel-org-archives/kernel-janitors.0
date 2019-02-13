From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 13 Feb 2019 15:40:53 +0000
Subject: Re: [PATCH v3] coccinelle: semantic patch for missing put_device()
Message-Id: <63ed130e-7764-3fc6-88b5-5965bf12c790@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550039015-5587-1-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1550039015-5587-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Xue Zhihong <xue.zhihong@zte.com.cn>, Wen Yang <yellowriver2010@hotmail.com>, Coccinelle <cocci@systeme.lip6.fr>

> Reviewed-by: Markus Elfring <Markus.Elfring@web.de>

I have got doubts that my code review comments qualify already
for this tag.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=1f947a7a011fcceb14cb912f5481a53b18f1879a#n565


> Cc: cocci@systeme.lip6.fr

I assume that Masahiro Yamada will also need to get explicitly informed
for a possible patch integration.


> v3->v2:
> - reduction of a bit of redundant C code within SmPL search specifications.
> - consider the message construction without using the extra Python variable “msg”

I find it nice that you would like to take this information into account.


> +    when != e4 = (T1)platform_get_drvdata(id)
> +(
> +

Should a blank line be omitted at such a source code place?


> +  return
> +(    id
> +|    (T2)dev_get_drvdata(&id->dev)
> +|    (T3)platform_get_drvdata(id)
> +);

It seems that you would like to express a different coding style.
Would anybody like to reconsider the position once more for semicolons
in nested disjunctions for such a SmPL search specification?


> +coccilib.report.print_report(p2[0], "ERROR: missing put_device; of_find_device_by_node on line " + p1[0].line + " and return without releasing.")

Your willingness for such a rearrangement is interesting.
How do you think about to move the long message parameter to a subsequent line?

Regards,
Markus
