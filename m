From: Greg KH <gregkh@linuxfoundation.org>
Date: Mon, 14 Jul 2014 12:58:36 +0000
Subject: Re: [PATCH V2 1/4] staging: vt6556: Cleanup coding style issues
Message-Id: <20140714125836.GA6966@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405278681-3348-1-git-send-email-peter.senna@gmail.com>
 <20140713193647.GA31010@kroah.com>
 <20140714085932.GA2958@hp-peter.rsr.lip6.fr>
In-Reply-To: <20140714085932.GA2958@hp-peter.rsr.lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: devel@driverdev.osuosl.org, tvboxspy@gmail.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, forest@alittletooquiet.net

On Mon, Jul 14, 2014 at 10:59:32AM +0200, Peter Senna Tschudin wrote:
> On Sun, Jul 13, 2014 at 12:36:47PM -0700, Greg KH wrote:
> > On Sun, Jul 13, 2014 at 09:11:18PM +0200, Peter Senna Tschudin wrote:
> > > This patch cleanup coding style issues reported by checkpatch.
> > > 
> > > Tested by compilation only.
> > > 
> > > Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> > > ---
> > > Cahnges from V1:
> > >  - Sent all patches in a series
> > 
> > Why did you forget the other thing that I asked you to change?
> > 
> > I can't take these as-is, sorry, please go back and re-read what I
> > wrote...
> 
> Actually I was trying to do what you asked me on this E-mail:
> 
> -- // --
> You just sent me 4 patches, all with the same subject (but at least 2 of
> them had the order in which to apply them in, which is nice.)
> 
> Please redo these such that they have a unique subject, and I can tell
> which order to apply them in, as I really have no idea about the second
> two.
> -- // --
> 
> I'm sending V3 as a single patch.

That's going to get rejected as well :(

You did put them in a nice order, but you had the same subject text for
each patch, which I told you not to do, right?

{sigh}

greg k-h
