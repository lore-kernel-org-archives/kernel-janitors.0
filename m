From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 07:06:13 +0000
Subject: Re: [Kernel-janitors] [PATCH 4/5] atm/idt77252: replace
Message-Id: <20040916070613.GB1661@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79733842854861892=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040915181826.GE4363@us.ibm.com>
In-Reply-To: <20040915181826.GE4363@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============79733842854861892==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 16, 2004 at 09:13:30AM +0200, Alexander Nyberg wrote:
> On Wed, 2004-09-15 at 20:20, Nishanth Aravamudan wrote:
> > Sorry, wrong subject line. Any comments would be appreciated.
> > 
> > Description: msleep_interruptible() is used instead of schedule_timeout()
> > to guarantee the task delays as expected. To achieve this, the timeout
> > variable is converted from an int to an unsigned long, and it's values
> > are changed accordingly.
> > 
> > Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> > 
> > 
> > --- 2.6.9-rc2-vanilla/drivers/atm/idt77252.c	2004-09-13 17:16:06.000000000 -0700
> > +++ 2.6.9-rc2/drivers/atm/idt77252.c	2004-09-14 11:34:25.000000000 -0700
> > @@ -2516,7 +2516,7 @@ idt77252_close(struct atm_vcc *vcc)
> >  	struct vc_map *vc = vcc->dev_data;
> >  	unsigned long flags;
> >  	unsigned long addr;
> > -	int timeout;
> > +	unsigned long timeout;
> >  
> >  	down(&card->mutex);
> >  
> > @@ -2566,9 +2566,9 @@ done:
> >  		}
> >  		spin_unlock_irqrestore(&vc->lock, flags);
> >  
> > -		timeout = 5 * HZ;
> > +		timeout = 5 * 1000;
> >  		while (atomic_read(&vc->scq->used) > 0) {
> > -			timeout = schedule_timeout(timeout);
> > +			timeout = msleep_interruptible(timeout);
> >  			if (!timeout)
> >  				break;
> >  		}
> > 
> > ______________________________________________________________________
> Please do not assume that HZ == 1000, it varies for different
> architectures.


No such assumption is being made. The former code:

timeout = 5 * HZ;

translates to "I want to sleep for 5 * HZ jiffies." HZ jiffies is just
the number of jiffies in 1 second, so this is equivalent to "I want to
sleep for 5 seconds."

Similarly, in the new code:

timeout = 5 * 1000;

translates to "I want to sleep for 5 * 1000 msecs." 1000 msecs is
clearly just the number of msecs in 1 second, so this is *also*
equivalent to "I want to sleep for 5 seconds," provided that msleep* is
used instead of schedule_timeout().

-Nish

P.S. Please keep replies on-list.

--===============79733842854861892==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79733842854861892==--
