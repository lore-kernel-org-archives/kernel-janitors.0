From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Jan 2016 18:50:18 +0000
Subject: Re: [PATCH] staging-slicoss: Replace variable initialisations by assignments in slic_if_init()
Message-Id: <56896D6A.6020309@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <56894D2D.1010801@users.sourceforge.net>
 <alpine.DEB.2.02.1601031741080.2074@localhost6.localdomain6>
 <56895EE1.7080808@users.sourceforge.net> <20160103175816.GA21611@kroah.com>
 <56896591.2030208@users.sourceforge.net> <20160103182640.GA30692@kroah.com>
In-Reply-To: <20160103182640.GA30692@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Julia Lawall <julia.lawall@lip6.fr>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Lior Dotan <liodot@gmail.com>, Christopher Harrer <charrer@alacritech.com>

>> I am a bit surprised that you do not like such source code fine-tuning.
> 
> It's moving stuff around for no real reason, why would I like it?

Can such fine-tuning result in positive effects for the run-time behaviour?


> Reading and reviewing and applying this type of stuff takes away from
> the time I have to spend reviewing and applying actual code fixes from
> other developers who are doing real and useful work.

I am aware that a lot of open issues are competing for your precious
software development attention.


> Remember maintainer's time is our most limited resource right now.

That is mostly usual.


> You are abusing that by wasting their time for no valid reason.

I find a couple of my update suggestions still valid. I agree that
the importance of proposed changes is varying.


>> Will related software improvements get another chance later (eventually together
>> with other changes)?
> 
> Define "improvements".  Did you fix an obvious bug?

Maybe. - It depends on the error classes you are interested in at the moment.


> Did you speed up the code in a measurable way?

My suggestions can result in measurable differences.


> Did you make the code easier to understand somehow?
> For this patch you did none of these things.

Thanks for your view on my approach.

Will it become acceptable to reduce the scope for any more variable
definitions in further function implementations?


> Code in staging needs to be moved out of staging, and this patch does
> nothing toward achieving that goal and it wastes people's time reviewing
> it to see if it is correct or not.

I am curious on the ways the discussed software can evolve further.

Regards,
Markus
