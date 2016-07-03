From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Jul 2016 08:01:47 +0000
Subject: Re: [PATCH 0/2] Input-at32psif: Fine-tuning for OOM handling in psif_probe()
Message-Id: <7748f752-297e-fe5f-0517-eb65e2deec65@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <4471604f-f401-bed9-39be-1aff2a92edf6@users.sourceforge.net>
 <1467492333.1968.5.camel@perches.com>
In-Reply-To: <1467492333.1968.5.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> A few update suggestions were taken into account
>> from static source code analysis.
>>
>> Markus Elfring (2):
>>   Return directly after a failed kzalloc()
>>   Remove two OOM messages
>>
>>  drivers/input/serio/at32psif.c | 10 +++-------
>>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> What possible rationale is there for including this "references" header?
> 566ABCD9.1060404@users.sourceforge.net

Do any more software developers dare to reconsider source code
also around a jump label like "out"?


> This message id is for your message:
> 	"Source code review around jump label usage"
> sent December 11, 2015!

Can such an association with a bit of background information
be occasionally useful for clarification of corresponding
implementation details?

Regards,
Markus
