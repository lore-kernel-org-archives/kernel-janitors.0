From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Jan 2016 17:48:17 +0000
Subject: Re: [PATCH] staging-slicoss: Replace variable initialisations by assignments in slic_if_init()
Message-Id: <56895EE1.7080808@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <56894D2D.1010801@users.sourceforge.net>
 <alpine.DEB.2.02.1601031741080.2074@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1601031741080.2074@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: devel@driverdev.osuosl.org, Christopher Harrer <charrer@alacritech.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lior Dotan <liodot@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Replace explicit initialisation for two local variables at the beginning
>> by assignments.
> 
> Why?

I prefer that assignments for variables like "card" and "slic_regs"
will only be performed immediately before the corresponding content will be
read again (after a few condition checks were executed).

Another description could be this view:
I suggest to move the variable initialisation a bit.

Regards,
Markus
