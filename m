From: Alan Stern <stern@rowland.harvard.edu>
Date: Thu, 21 Sep 2017 15:33:21 +0000
Subject: Re: [PATCH] USB: devio: Prevent integer overflow in proc_do_submiturb()
Message-Id: <Pine.LNX.4.44L0.1709211126570.1423-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170921071622.ue2oqayfivloxk7w@mwanda>
In-Reply-To: <20170921071622.ue2oqayfivloxk7w@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 21 Sep 2017, Dan Carpenter wrote:

> On Thu, Sep 21, 2017 at 10:17:03AM -0400, Alan Stern wrote:
> > On Thu, 21 Sep 2017, Dan Carpenter wrote:
> > 
> > > There used to be an integer overflow check in proc_do_submiturb() but
> > > it accidentally got removed.  We need to put it back.  The
> > 
> > The removal was deliberate, not accidental.  :-)
> > 
> > > uurb->buffer_length variable is a signed integer and it's controlled by
> > > the user.  It can lead to an integer overflow when we do:
> > > 
> > > 	num_sgs = DIV_ROUND_UP(uurb->buffer_length, USB_SG_SIZE);
> > 
> > Sorry, I don't understand.  How can division by 16384 lead to an
> > integer overflow?
> > 
> > Now, I agree that uurb->buffer_length can cause problems.  We don't
> > check for meaningless negative values on all the execution paths (the
> > field should have been unsigned from the beginning).
> 
> Checking against USBFS_XFER_MAX prevents negative values but I'll add
> another check for readability.

The fact that USBFS_XFER_MAX generates an unsigned comparison is
awfully subtle.  However, if you explicitly cast uurb->buffer_length to
unsigned int in the test, then it should be clear that the test also
catches negative values.  Maybe adding a comment would be good, but I
think with the cast, no additional check is needed.

> >  And in the
> > USBDEVFS_URB_TYPE_ISO case, we overwrite uurb->buffer_length without
> > checking that the new value is <= the old value, which could lead to a 
> > userspace buffer overflow.
> 
> Hm...  Yeah.  I'm not sure what's the right thing, should I print a
> warning if we truncate the output or would users figure it out on their
> own?
> 	if (totlen <= uurb->buffer_length)
> 		uurb->buffer_length = totlen;
> 	else
> 		WARN_ONCE(1, "uurb->buffer_length is too short %d vs %d",
> 			  totlen, uurb->buffer_length);

I like the WARN_ONCE.

Alan Stern

