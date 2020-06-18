From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 18 Jun 2020 15:01:51 +0000
Subject: Re: [PATCH v2] coccinelle: misc: add array_size_dup script to detect missed overflow checks
Message-Id: <4e6083cc-01ed-caa2-a9fb-5f4645eb9503@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <54ac89f1-5f38-8909-a652-c658a5a1f36b@web.de>
 <759d33d2-25a2-f55f-7e3a-7481ab5dd0fc@linux.com>
In-Reply-To: <759d33d2-25a2-f55f-7e3a-7481ab5dd0fc@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>
Cc: Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Kees Cook <keescook@chromium.org>

> Where is the typo?

I tried to point a possible replacement out for the word “overlow” by “overflow”.


> I can't handle your suggestions

I hope that you got chances to take also my patch review comments into account.


> because your mails constantly break the threads. I just can't find them
> after due to missed/wrong In-Reply-To headers.

There are some factors involved for this undesirable effect.

* My software selection contains open issues in the handling of mail links
  according to the communication interface “public inbox”.

* Mailing list settings hinder more direct participation (for me).

* If you would specify more mail addresses for reviewers (like me) explicitly
  as recipients, the impression can hopefully become more positive again.


>>> +expression subE1 <= as.E1;
>>> +expression subE2 <= as.E2;
>>> +expression as.E1, as.E2, E3;
>>
>> How do you think about to use the following SmPL code variant?
>>
>> expression subE1 <= as.E1, subE2 <= as.E2, as.E1, as.E2, E3;
>
> It's less readable and harder to review.

Can a different code formatting help then?

expression subE1 <= as.E1, subE2 <= as.E2,
           as.E1, as.E2, E3;


>> I suggest to move the ampersand before the disjunction in such
>> SmPL code exclusion specifications.
>>
>> +      when != & \(E1 \| E2 \| subE1 \| subE2\)
>
> Ok, I will fix this if there will be next version.

Other software extensions which you proposed recently were similarly affected
at a few places.


>> I would prefer an other code formatting at such places.
>>
>> +coccilib.report.print_report(p2[0],
>> +                             f"WARNING: array_size is already used (line {p1[0].line}) to compute the same size.")
>
> No. It's pointless to break the line to save 5 chars this way.

Did we get used to function parameter alignment?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=1b5044021070efa3259f3e9548dc35d1eb6aa844#n93

I suggest to reconsider potential concerns for line length limitations
according to such message strings.

Regards,
Markus
