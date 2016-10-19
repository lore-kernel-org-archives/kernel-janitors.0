From: "=?utf-8?B?RGF2aWQgSMOkcmRlbWFu?=" <david@hardeman.nu>
Date: Wed, 19 Oct 2016 13:47:43 +0000
Subject: Re: [media] winbond-cir: Move assignments for three variables in wbcir_shutdown()
Message-Id: <10715e71c46bda76f6c8654675062f61@hardeman.nu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3c96d0bf-62fa-6b02-2a2d-2a097709271a@users.sourceforge.net>
 <285954ec-280f-8a5a-5189-eb2471b4339c@users.sourceforge.net>
 <566ABCD9.1060404@users.sourceforge.net>
 <1d7d6a2c-0f1e-3434-9023-9eab25bb913f@users.sourceforge.net>
 <327f6034db9ce0c0a72947e47daf344a@hardeman.nu>
In-Reply-To: <3c96d0bf-62fa-6b02-2a2d-2a097709271a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

October 19, 2016 3:38 PM, "SF Markus Elfring" <elfring@users.sourceforge.net> wrote:
>>> Move the setting for the local variables "mask", "match" and "rc6_csl"
>>> behind the source code for a condition check by this function
>>> at the beginning.
>> 
>> Again, I can't see what the point is?
> 
> * How do you think about to set these variables only after the initial
> check succeded?

I prefer setting variables early so that no thinking about whether they're initialized or not is necessary later. 

> * Do you care for data access locality?

Not unless you can show measurable performance improvements?
