From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 06 Apr 2017 20:33:00 +0000
Subject: Re: IB/qib: Adjust two size determinations in qib_init_pportdata()
Message-Id: <8991d27a-0b8d-70f5-81d2-c830c3dd6f78@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c16b18ac-287f-5faf-b79a-c86e2adfa22c@users.sourceforge.net>
 <b5bc4160-aace-b919-7fe2-a4742d03c4ba@users.sourceforge.net>
 <20170405143242.GB5006@yuval-lap>
 <523b0864-e655-ed1f-8fe5-5995e0b0bde1@users.sourceforge.net>
 <20170405151525.GA5519@yuval-lap>
 <c3885f83-8239-e21d-74fc-bf4fe03dd5dc@users.sourceforge.net>
 <20170406194823.GA28301@yuval-lap>
In-Reply-To: <20170406194823.GA28301@yuval-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yuval Shaia <yuval.shaia-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Marciniszyn <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

>> How do you think about to take another look at remaining update candidates
>> at other source code places for this Linux module?
> 
> You mean the other patches in this patch-set?

Partly, yes. - Do you care for adjustments around numbered jump labels
(and suggestions from the script "checkpatch.pl") for example?

Will it be more important to check return values from all calls of a function
like "kmalloc" in related source files?

Regards,
Markus
