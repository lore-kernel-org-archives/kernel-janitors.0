From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Oct 2016 14:05:59 +0000
Subject: Re: [media] winbond-cir: Move a variable assignment in wbcir_tx()
Message-Id: <71669997-fda1-6b97-9599-4b8118a20fb7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1a68a0e8-6d56-d9c1-058b-cf9cd8122acb@users.sourceforge.net>
 <26ee4adb-2637-52c3-ac83-ae121bed5eff@users.sourceforge.net>
 <566ABCD9.1060404@users.sourceforge.net>
 <1d7d6a2c-0f1e-3434-9023-9eab25bb913f@users.sourceforge.net>
 <78ddb54d61d871ad4b81c986dd9a32d4@hardeman.nu>
 <db564db599ac11c5b191d6ec3eec32ff@hardeman.nu>
In-Reply-To: <db564db599ac11c5b191d6ec3eec32ff@hardeman.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?Q?David_H=c3=a4rdeman?= <david@hardeman.nu>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> * How do you think about to avoid a variable assignment in case
>> that this memory allocation failed anyhow?
> 
> There is no memory allocation that can fail at this point.

Do you really know the failure probability for a call of the
function "kmalloc" (within the function "wbcir_tx") under all
possible run time situations?


>> * Do you care for data access locality?
> 
> Not unless you can show measurable performance improvements?

Did any software developer (before me) dare anything in this direction?

Regards,
Markus
