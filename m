From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 16 Aug 2004 20:00:37 +0000
Subject: Re: [Kernel-janitors] Re: Add msleep_interruptible() function to
Message-Id: <20040816200037.GC1942@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50955731237801127=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040815121805.GA15111@stro.at> <1092570891.17605.1.camel@localhost.localdomain> <20040815132548.GF1799@stro.at>
In-Reply-To: <20040815132548.GF1799@stro.at>
To: maximilian attems <janitor@sternwelten.at>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, kj <kernel-janitors@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

--===============50955731237801127==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 15, 2004 at 03:25:48PM +0200, maximilian attems wrote:
> On Sun, 15 Aug 2004, Alan Cox wrote:
> 
> > On Sul, 2004-08-15 at 13:18, maximilian attems wrote:
> > > + * msleep_interruptible - sleep waiting for waitqueue interruptions
> > > + * @msecs: Time in milliseconds to sleep for
> > > + */
> > > +void msleep_interruptible(unsigned int msecs)
> > > +{
> > > +	unsigned long timeout = msecs_to_jiffies(msecs);
> > > +
> > > +	while (timeout) {
> > 
> > You want to have while(timeout && !signal_pending(current))
> > 
> > A signal will wake the timeout which will then loop. It might also
> > be good to add
> > 
> > > +		set_current_state(TASK_INTERRUPTIBLE);
> > > +		timeout = schedule_timeout(timeout);
> > > +	}
> > 
> > return timeout;
> > 
> > so that the caller knows more about how long the timer ran for before
> > the interrupt and if it was interrupted.
> 
> belows patches returns timeout in msecs 
> as the function is also called with that unit, 
> added definition in include/linux/delay.h

<snip>

An entry could be added to the TODO to do what I had done but with
long delays in TASK_INTERRUPTIBLE (which there probably should not be
many of). It would also probably be useful to verify that any drivers 
sleeping for times measurable in msecs while INTERRUPTIBLE actually intend
to do so (as I tried to do in some cases).

-Nish

--===============50955731237801127==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50955731237801127==--
