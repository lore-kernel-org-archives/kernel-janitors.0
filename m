From: Randy Dunlap <rdunlap@infradead.org>
Date: Wed, 01 Jul 2020 14:52:58 +0000
Subject: Re: [v2] Documentation: Coccinelle: fix typos and command example
Message-Id: <dfa2ed9f-fe68-58d1-c3d0-ac436f9bee09@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0616dd0c-bb86-be2b-3dc6-1c695a92c3ca@infradead.org>
 <c2c1dec0-2bd1-b0e2-1aa4-38d0e954d5ba@web.de>
 <efc8b0c9-db3b-3c9c-d876-897b53a9e278@infradead.org>
 <2a3940de-6a81-1aff-8109-53c1c5a6aa1b@web.de>
 <f2aaa91a-f935-bc2d-26f2-712576c1bbd7@infradead.org>
 <2f80fb10-dc7f-29be-dc3e-2715f8bafc6d@web.de>
In-Reply-To: <2f80fb10-dc7f-29be-dc3e-2715f8bafc6d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-doc@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

On 7/1/20 6:32 AM, Markus Elfring wrote:
>>>>> We might stumble on different interpretations according to the wording “file basis”.
>>>>> Do you find a message like “make: Nothing to be done for 'path/to/file.c'.” interesting then?
>>>>>
>>>>> * Would you like to add any links for information around the support for
>>>>>   source code checkers?
>>>>>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Makefile?id|30b859a947535f2213277e827d7ac7dcff9c84#n198
>>> …
>>>> Feel free to submit patches.
>>>
>>> How do you think about to use the following command variant
>>> for the adjustment of the software documentation?
>>>
>>> +    make C=1 CHECK='scripts/coccicheck' 'path/to/file.o'
>>
>> I don't understand the reason for that change...

IOW, your "patch" needs justification and/or explanation. It was missing that info.

> Is our understanding still incomplete for the support of source code checking parameters
> by the make script?
> 
> * Will software analysis be performed in addition to the desired compilation
>   of a source file (according to the selected object file)?
> 
> * How do you think about to trigger only the generation of analysis results
>   for a single file?

Do I need to remove that line from the patch?

Feel free to submit patches, not just comments.

-- 
~Randy
