From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Dec 2017 06:27:25 +0000
Subject: Re: jsm_tty: Deletion of a null pointer check in two functions?
Message-Id: <817fcf72-cd9d-bf5b-ce83-ce2844e3e901@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5c78db97-88f5-8655-9a47-eeee0a043fba@users.sourceforge.net>
 <1511976187.19952.65.camel@perches.com> <20171129173504.GA20581@kroah.com>
 <1511977896.19952.69.camel@perches.com> <20171129180528.GA24705@kroah.com>
 <089a4b85-64e8-cb4a-c5f8-9abb2556e5e5@users.sourceforge.net>
 <8ae240fa-7f77-8f4c-225c-853cdda73a67@linux.vnet.ibm.com>
In-Reply-To: <8ae240fa-7f77-8f4c-225c-853cdda73a67@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>, linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, Jiri Slaby <jslaby@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Thanks for the fix.

Thanks for your positive feedback.


> I was on vacation - but now seeing all the analysis made here,

I assume that special communication settings could trigger
corresponding consequences for the discussed source code adjustment.


> if "ch" can't be NULL then please go ahead and remove the check =)

Would you dare to convert this request into a concrete patch?

Regards,
Markus
