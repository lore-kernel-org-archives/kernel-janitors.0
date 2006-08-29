From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 29 Aug 2006 17:00:08 +0000
Subject: Re: [KJ] Fwd: [Patch] Add HZ values and time_after() macros in
Message-Id: <20060829170008.GQ5195@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <82faac5b0608290944o2452a904x4826da8bbd944daa@mail.gmail.com>
In-Reply-To: <82faac5b0608290944o2452a904x4826da8bbd944daa@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 30.08.2006 [02:44:02 +1000], Darren Jenkins wrote:
> Forgot to reply to all!
> 
> ---------- Forwarded message ----------
> From: Darren Jenkins <darrenrjenkins@gmail.com>
> Date: Aug 30, 2006 2:42 AM
> Subject: Re: [KJ] [Patch] Add HZ values and time_after() macros in iphase.c
> To: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> 
> G'day Nish

<snip>

> > BTW, it's not a bug, per se, to only want to sleep for a fixed number of
> > jiffies, even if I don't completely approve of it, either.
> 
> No not a bug per se. However if we arn't using a single jiffie(for a
> min timeout), not making the call HZ relative will cause a bug with a
> large enough change in HZ.

Yes, that is true. I support your changes in general, but given that
HZ00 in original 2.6, I would suggest that 50 jiffies is not the same
as HZ/2. It should either be HZ/20 or, preferably, msecs_to_jiffies(50).
If the maintainer then replies saying they had never changed the code
from 2.4's HZ to 2.6, then we can proceed accordingly and your current
change is more appropriate, but I wouldn't assume that to be the case.

> That is if the delay really was needed in the first place. :)

Always tough to tell :)

<snip>

> > > -     else if (((jiffies - iadev->rx_tmp_jif) > 50) &&
> > > +     else if (time_after(jiffies, ((unsigned long)iadev->rx_tmp_jif + HZ/2)) &&
> > >                 ((iadev->rx_pkt_cnt - iadev->rx_tmp_cnt) = 0)) {
> >
> > Changes functionality.
> 
> Just wondering, do you mean it is changed because it is HZ/2 and not HZ/20 ?
> (just remembered HZ in 2.6 is/was 1000 not 100 anymore)

Yes, exactly. You went from 50 jiffies (50 ms with the previous default
HZ) to 500 jiffies (500 ms with the previous default HZ), which is a
significant difference in time and may even introduce undesired behavior.

> or do you mean the adding of time_after() code change ?

No, that is fine. Direct subtraction from jiffies for comparision is
frowned upon.

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
