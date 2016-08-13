From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Aug 2016 19:30:52 +0000
Subject: Re: staging: ks7010: Replace three printk() calls by pr_err()
Message-Id: <3837d167-b920-d36f-3b75-f37d4b92031d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <7fcc8cb1-012a-a66e-6563-6867862f3229@users.sourceforge.net>
 <1471e8af-129d-8a7a-c7d9-1e1fbe0237ec@users.sourceforge.net>
 <1471031030.18251.18.camel@perches.com>
 <a6b96b51-a602-f22d-b853-0ee2f142fb67@users.sourceforge.net>
 <1471109478.3467.33.camel@perches.com>
In-Reply-To: <1471109478.3467.33.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa@the-dreams.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Jean Delvare <jdelvare@suse.de>

> I think pr_<level> is OK if reworking the code
> to support dev_<level> is not easy.

Thanks for this explanation. - It sounds more constructive than the previous short
feedback "Not correct".


>> Would you accept that another update will be appended to the discussed patch series?
> 
> No.  Patches should not knowingly introduce defects
> that are corrected in follow-on patches.

This view is fine in principle.

I am just curious on the preferred sequence to fix the affected implementation details.

1. I imagine that my questionable update suggestion "[PATCH v2 08/10] staging: ks7010:
   Replace three printk() calls by pr_err()" can be skipped and the remaining logging
   calls will be improved somehow a bit later.

Or:

2. Do you want a resend of this whole patch series?


>>> alloc_etherdev already does a dump_stack so the OOM isn't useful.
>> Does this information indicate that this printk() (or pr_err()) call
>> should be deleted?
> 
> Markus, I don't know if it's your lack of English
> comprehension or not, but it's fairly obvious from
> my reply that this line should be deleted,

I was unsure if this view fits to a consensus also by other developers.

It might be that I can occasionally become picky to check if other contributors
insist on the usage of a specific error message.


> either in this patch or a follow-on.

I would prefer another addition (or source code clean-up) later.
Could it happen that so many error messages are update candidates (for deletion)
so that no places remain where a pr_err() call would make sense in this
software module?

Regards,
Markus
