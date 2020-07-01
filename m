From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 01 Jul 2020 15:02:25 +0000
Subject: Re: [v2] Documentation: Coccinelle: fix typos and command example
Message-Id: <648d287e-3636-1858-1439-103d317f8571@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0616dd0c-bb86-be2b-3dc6-1c695a92c3ca@infradead.org>
 <c2c1dec0-2bd1-b0e2-1aa4-38d0e954d5ba@web.de>
 <efc8b0c9-db3b-3c9c-d876-897b53a9e278@infradead.org>
 <2a3940de-6a81-1aff-8109-53c1c5a6aa1b@web.de>
 <f2aaa91a-f935-bc2d-26f2-712576c1bbd7@infradead.org>
 <2f80fb10-dc7f-29be-dc3e-2715f8bafc6d@web.de>
 <dfa2ed9f-fe68-58d1-c3d0-ac436f9bee09@infradead.org>
In-Reply-To: <dfa2ed9f-fe68-58d1-c3d0-ac436f9bee09@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jonathan Corbet <corbet@lwn.net>

>>>> How do you think about to use the following command variant
>>>> for the adjustment of the software documentation?
>>>>
>>>> +    make C=1 CHECK='scripts/coccicheck' 'path/to/file.o'
>>>
>>> I don't understand the reason for that change...
>
> IOW, your "patch" needs justification and/or explanation. It was missing that info.

I hope that the clarification of the presented questions can result into
relevant information.


>> Is our understanding still incomplete for the support of source code checking parameters
>> by the make script?
>>
>> * Will software analysis be performed in addition to the desired compilation
>>   of a source file (according to the selected object file)?
>>
>> * How do you think about to trigger only the generation of analysis results
>>   for a single file?
>
> Do I need to remove that line from the patch?

I propose to adjust it another bit.
The desired change agreement might need further communication efforts.


> Feel free to submit patches, not just comments.

Would you like to integrate any more details from the running patch review?

Regards,
Markus
