From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 27 Sep 2016 05:10:23 +0000
Subject: Re: ISDN-Gigaset: Fine-tuning for three function implementations
Message-Id: <fa9deafb-9ff4-f419-333b-5af70cab72b2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <6d4bbb77-914f-19b8-a1a9-2731d1158612@users.sourceforge.net>
 <1474922316.8546.1.camel@tiscali.nl>
In-Reply-To: <1474922316.8546.1.camel@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Bolle <pebolle@tiscali.nl>
Cc: gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>>   Use kmalloc_array() in two functions
>>   Improve another size determination in gigaset_initcs()
>>   Delete an error message for a failed memory allocation
>>   Release memory in gigaset_initcs() after an allocation failure
> 
> Which "static source code analysis" was used for that discovery?

Are you eventually asking more for the development tools which were involved here?

* Coccinelle software

* Script "checkpatch.pl"

* My own eyes with help of a current text editor and its programming support

Regards,
Markus
