From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 08 Jan 2016 07:18:40 +0000
Subject: Re: 390/qeth: Delete an unnecessary variable initialisation in qeth_core_set_online()
Message-Id: <568F62D0.9050806@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5688F13A.70601@users.sourceforge.net>
 <5688F198.4040109@users.sourceforge.net>
 <1452177226.1081.6.camel@BR9GV9YG.de.ibm.com>
In-Reply-To: <1452177226.1081.6.camel@BR9GV9YG.de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ursula Braun <ubraun@linux.vnet.ibm.com>
Cc: linux-s390@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> As Heiko already answered, you could propose a lot of this kind of changes
> with just minor benefit. I do not want to push them in single patches.

Thanks for your clarification.


> Either there is a cleanup patch for explicit initialisation of
> local variables in the whole qeth driver,

Is there any more fine-tuning cooking in the background?


> or we take care about such minor changes, once we touch the code anyway

How often will this really happen?


> due to other reasons.

I am curious which ones will trigger further related software improvements.

Regards,
Markus
