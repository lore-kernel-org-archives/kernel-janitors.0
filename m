From: Greg KH <greg@kroah.com>
Date: Mon, 17 Jan 2005 22:30:47 +0000
Subject: Re: [KJ] RE: [PATCH 3/22] block/cciss: replace schedule_timeout()
Message-Id: <20050117223047.GA29423@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62573817329667936=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <D4CFB69C345C394284E4B78B876C1CF107DC01A4@cceexc23.americas.cpqcorp.net>
In-Reply-To: <D4CFB69C345C394284E4B78B876C1CF107DC01A4@cceexc23.americas.cpqcorp.net>
To: kernel-janitors@vger.kernel.org

--===============62573817329667936==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 17, 2005 at 04:14:10PM -0600, Miller, Mike (OS Dev) wrote:
> > From: Nishanth Aravamudan [mailto:nacc@us.ibm.com]
> > Hi,
> > 
> > Please consider applying.
> > 
> > I used msleep(10) here under the presumption that the 
> > schedule_timeout(1) was
> > written assuming that HZ=100 (as it used to be), which is
> > equivalent to 10 milliseconds. If the desire is actually for 
> > 1 ms or the minimal
> > sleep interval, then the patch can be changed appropriately. 
> > A similar assumption
> > as to the constant delay value was made in the other 
> > replacement, which can also
> > be appropriately adjusted.
> > 
> > Description: Change the delay logic in pollcomplete() to use 
> > msleep() and
> > time_before(). Instead of assuming schedule_timeout() will 
> > sleep exactly as
> > requested, use msleep(10) to guarantee minimally 10 
> > millisecond increments and
> > time_before() to guarantee stopping the loop as close to 20 
> > seconds as possible.
> > Also changes another occurrence of schedule_timeout() to msleep().
> > TASK_INTERRUPTIBLE is used in this case, but signals are not handled. 
> > 
> > Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> I still fail to see the benefits of this patch.

When HZ changed from 100 to 1000, your code went from sleeping 10ms to 1
ms.  Did you really mean that?  This way, your code always sleeps what
you expect it to sleep, no matter what the value of HZ.

thanks,

greg k-h


--===============62573817329667936==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62573817329667936==--
