From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 08 Jan 2016 12:00:50 +0000
Subject: Re: 390/qeth: Delete an unnecessary variable initialisation in qeth_core_set_online()
Message-Id: <568FA4F2.1000200@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5688F13A.70601@users.sourceforge.net>
 <5688F198.4040109@users.sourceforge.net>
 <1452177226.1081.6.camel@BR9GV9YG.de.ibm.com>
 <568F62D0.9050806@users.sourceforge.net>
 <1452241551.5327.16.camel@BR9GV9YG.de.ibm.com>
In-Reply-To: <1452241551.5327.16.camel@BR9GV9YG.de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Ursula Braun <ubraun@linux.vnet.ibm.com>
Cc: linux-s390@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> Is there any more fine-tuning cooking in the background?
> Not yet;

I am a bit surprised by this information.


> qeth is an important driver for Linux on System z;

Good to know …


> there are lots of investigation ideas for improvements,
> which we will take care about according to their priorities.

Software development as usual …


> I regard your proposed fine-tuning code change as valid,

Thanks for a bit of positive feedback.


> but prioritize it as one with lowest benefit,

This is fine in principle.


> since it does not really make a difference once compiled.

Would you like to help in the determination if deletion of unnecessary variable
initialisations (besides in the implementation of the function "qeth_core_set_online")
will result in measurable effects?

Regards,
Markus
