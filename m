From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 09 Sep 2016 16:50:17 +0000
Subject: Re: s390/debug: Fine-tuning for several function implementations
Message-Id: <294ddc61-8bd8-2116-fb4f-c1083148bbab@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <e4359dc9-9e20-e33b-9743-9ebade853268@users.sourceforge.net>
 <20160905123103.2c587d60@mschwide>
In-Reply-To: <20160905123103.2c587d60@mschwide>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: linux-s390@vger.kernel.org, David Hildenbrand <dahi@linux.vnet.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Joe Perches <joe@perches.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

> While I agree that the old code in arch/s390/kernel/debug.c does not abide to
> the current coding style standards,

Thanks for this kind of acknowledgement.

Is such an information worth for further development considerations?


> I doubt there is much value in these patches.

I assume that your doubts could be adjusted, couldn't they?

Are there any other concerns involved in the background?


> To be honest I got annoyed after the third patch

Which of the proposed changes did trigger such a reaction?


I find this response also a bit surprising because of the aspect
that I offered you some results from my work as a free software developer.


> and stopped reading after the forth.

I imagine that you could have aborted the review of my update suggestions
a bit too early for your debug software module.

I agree that the value is varying for the presented 17 update steps.
But I hope that their value is potentially bigger overall
than you categorise them at first glance.

Now I would like to try to get a bit of your software development attention
once more for two of them at least. I hope that it can be easier to clarify
their value.

* Do the implementations of the functions "debug_areas_alloc"
  and "debug_get_user_string" need another look together with a more detailed
  source code review?

* How do you think about to use functions like "kmalloc_array"
  and "memdup_user" there instead?

Regards,
Markus
