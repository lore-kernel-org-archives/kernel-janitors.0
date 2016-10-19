From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Oct 2016 13:38:44 +0000
Subject: Re: [media] winbond-cir: Move assignments for three variables in wbcir_shutdown()
Message-Id: <3c96d0bf-62fa-6b02-2a2d-2a097709271a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <285954ec-280f-8a5a-5189-eb2471b4339c@users.sourceforge.net>
 <566ABCD9.1060404@users.sourceforge.net>
 <1d7d6a2c-0f1e-3434-9023-9eab25bb913f@users.sourceforge.net>
 <327f6034db9ce0c0a72947e47daf344a@hardeman.nu>
In-Reply-To: <327f6034db9ce0c0a72947e47daf344a@hardeman.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?Q?David_H=c3=a4rdeman?= <david@hardeman.nu>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> Move the setting for the local variables "mask", "match" and "rc6_csl"
>> behind the source code for a condition check by this function
>> at the beginning.
>  
> Again, I can't see what the point is?

* How do you think about to set these variables only after the initial
  check succeded?

* Do you care for data access locality?

Regards,
Markus
