From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 Aug 2016 20:15:32 +0000
Subject: Re: IB/core: Fine-tuning for ib_is_udata_cleared()
Message-Id: <5e87f691-edb9-0a12-ff7a-59854c2ca2f8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <f7bb3caf-81cd-fba9-afc8-5fac72b8a4b3@users.sourceforge.net>
 <1471802623.3746.1.camel@perches.com>
 <683187e0-2e6a-88c0-f87a-9c5f0489370a@users.sourceforge.net>
 <1471809188.3746.18.camel@perches.com>
In-Reply-To: <1471809188.3746.18.camel-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>

>>> Don't introduce a defect in patch 1 and correct
>>> that introduced defect in patch 2.
>> Which detail do you not like here?
> 
> See above.

This feedback is not clearer.

I find that the two update steps should work in principle,
shouldn't they?

I guess that we have got different preferences for the shown
patch granularity. Another update variant can follow a bit later
with the changes squashed together.

Regards,
Markus
