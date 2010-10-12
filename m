From: Tony Lindgren <tony@atomide.com>
Date: Tue, 12 Oct 2010 20:21:05 +0000
Subject: Re: [PATCH] serial: omap-serial: fix signess error
Message-Id: <20101012202105.GW25462@atomide.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286731715-17908-1-git-send-email-segooon@gmail.com>
 <8739sb1cif.fsf@deeprootsystems.com>
In-Reply-To: <8739sb1cif.fsf@deeprootsystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Hilman <khilman@deeprootsystems.com>
Cc: Vasiliy Kulikov <segooon@gmail.com>, kernel-janitors@vger.kernel.org, "Govindraj.R" <govindraj.raja@ti.com>, Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org

* Kevin Hilman <khilman@deeprootsystems.com> [101012 11:30]:
> [adding linux-omap list]
> 
> Vasiliy Kulikov <segooon@gmail.com> writes:
> 
> > "ret" is unsigned, so check for (ret < 0) made no sense.
> > Made it signed.
> >
> > Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> > ---
> >  I cannot compile this driver, so it is not tested.
> 
> Acked-by: Kevin Hilman <khilman@deeprootsystems.com>
> 
> Since the original driver is being queued via the omap tree, we can
> queue this one as well.
> 
> Tony, can you add this one to the 2.6.37 queue?

Thanks, adding into omap-for-linus.

Regards,

Tony
