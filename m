From: Denis Efremov <efremov@linux.com>
Date: Thu, 18 Jun 2020 12:24:39 +0000
Subject: Re: [PATCH v2] coccinelle: misc: add array_size_dup script to detect missed overflow checks
Message-Id: <759d33d2-25a2-f55f-7e3a-7481ab5dd0fc@linux.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <54ac89f1-5f38-8909-a652-c658a5a1f36b@web.de>
In-Reply-To: <54ac89f1-5f38-8909-a652-c658a5a1f36b@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>

Hi,

On 6/18/20 2:34 PM, Markus Elfring wrote:
> Why did you repeat a typo from the previous patch subject?

Where is the typo? I can't handle your suggestions because your mails constantly
break the threads. I just can't find them after due to missed/wrong In-Reply-To
headers. Again, this mail doesn't contain In-Reply-To header and highly likely I
will miss it when I will prepare next version of the patch.


>> +expression subE1 <= as.E1;
>> +expression subE2 <= as.E2;
>> +expression as.E1, as.E2, E3;
> 
> How do you think about to use the following SmPL code variant?
> 
> expression subE1 <= as.E1, subE2 <= as.E2, as.E1, as.E2, E3;

It's less readable and harder to review.

> 
>> +      when != \(&E1\|&E2\|&subE1\|&subE2\)
> 
> I suggest to move the ampersand before the disjunction in such
> SmPL code exclusion specifications.
> 
> +      when != & \(E1 \| E2 \| subE1 \| subE2\)

Ok, I will fix this if there will be next version.

> 
> 
>> +coccilib.report.print_report(p2[0],
>> +f"WARNING: array_size is already used (line {p1[0].line}) to compute \
>> +the same size")
> 
> I would prefer an other code formatting at such places.
> 
> +coccilib.report.print_report(p2[0],
> +                             f"WARNING: array_size is already used (line {p1[0].line}) to compute the same size.")
> 

No. It's pointless to break the line to save 5 chars this way.

I can use instead:

coccilib.report.print_report(p2[0], f"WARNING: array_size is already used (line {p1[0].line}) to compute the same size")

or

msg = f"WARNING: array_size is already used (line {p1[0].line}) to compute the same size"
coccilib.report.print_report(p2[0], msg)

or

coccilib.report.print_report(p2[0],
f"WARNING: array_size is already used (line {p1[0].line}) to compute the same size")

And I prefer the last one if Julia will allow me to use more than 80 chars in print string.

Thanks,
Denis
