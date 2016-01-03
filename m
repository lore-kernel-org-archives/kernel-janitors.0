From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Jan 2016 18:16:49 +0000
Subject: Re: [PATCH] staging-slicoss: Replace variable initialisations by assignments in slic_if_init()
Message-Id: <56896591.2030208@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <56894D2D.1010801@users.sourceforge.net>
 <alpine.DEB.2.02.1601031741080.2074@localhost6.localdomain6>
 <56895EE1.7080808@users.sourceforge.net> <20160103175816.GA21611@kroah.com>
In-Reply-To: <20160103175816.GA21611@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Julia Lawall <julia.lawall@lip6.fr>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Lior Dotan <liodot@gmail.com>, Christopher Harrer <charrer@alacritech.com>

>> I prefer that assignments for variables like "card" and "slic_regs"
>> will only be performed immediately before the corresponding content will be
>> read again (after a few condition checks were executed).
>>
>> Another description could be this view:
>> I suggest to move the variable initialisation a bit.
> 
> And like David Miller and others just said, please don't bother us with
> pointless patches such as this, if you keep it up, I'll have to add you
> to my killfile as patches like this are a waste of everyone's valuable time.

I am a bit surprised that you do not like such source code fine-tuning.
Will related software improvements get another chance later (eventually together
with other changes)?

Regards,
Markus
