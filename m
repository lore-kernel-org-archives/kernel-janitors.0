From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 18:39:40 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 1/16] scsi/53c700: replace
Message-Id: <20040927183940.GF1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45608069761891179=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0409161253580.14212@server.home>
In-Reply-To: <Pine.LNX.4.58.0409161253580.14212@server.home>
To: kernel-janitors@vger.kernel.org

--===============45608069761891179==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 27, 2004 at 02:21:31PM -0400, James Bottomley wrote:
> On Mon, 2004-09-27 at 14:11, Nishanth Aravamudan wrote:
> > --- 2.6.9-rc2-vanilla/drivers/scsi/53c700.c	2004-09-13 17:15:58.000000000 -0700
> > +++ 2.6.9-rc2/drivers/scsi/53c700.c	2004-09-14 09:10:24.000000000 -0700
> > @@ -1961,7 +1961,7 @@ NCR_700_bus_reset(struct scsi_cmnd * SCp
> >  	 * reset via sg or something */
> >  	while(hostdata->eh_complete != NULL) {
> >  		spin_unlock_irq(SCp->device->host->host_lock);
> > -		schedule_timeout(HZ/10);
> > +		msleep_interruptible(100);
> >  		spin_lock_irq(SCp->device->host->host_lock);
> >  	}
> >  	hostdata->eh_complete = &complete;
> 
> Firstly, could you copy linux-scsi@vger.kernel.org on these, and

Sorry, I had already sent out all 16 patches when I saw your mail. I can
go back through and forward them on to linux-scsi, if you would like,
though.

> secondly there isn't really much point in replacing this, is there?  The
> only thing msleep_interruptible() would add is making sure that we slept
> for the full time.  However, the code really doesn't care.  All it's
> doing is relinquishing the processor for a short period while it waits
> for the host eh_complete semaphore to become available.

Well, in this case, msleep_interruptible() makes sure you sleep at all.
In the original code, schedule_timeout() will return immediately because
current->state is not being set beforehand. That fact, combined with the
clarity resulting from using msecs makes these changes useful, I think.

-Nish

--===============45608069761891179==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45608069761891179==--
