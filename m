From: Pavel Machek <pavel@suse.cz>
Date: Tue, 20 Jul 2004 16:37:57 +0000
Subject: Re: [Kernel-janitors] Re: [PATCH] nbd: replace schedule_timeout()
Message-Id: <20040720163757.GG10921@atrey.karlin.mff.cuni.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38234518570349096=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
In-Reply-To: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
To: kernel-janitors@vger.kernel.org

--===============38234518570349096==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

> > But I believe replacing schedule-timeout() with mdelay is not good
> > idea as it is okay to sleep shorter time at this particular place.
> 
> First, just to make sure we are on the same page, the replacement is
> with msleep(), not mdelay(). The difference between the two is that
> msleep() uses schedule_timeout() to give up the CPU while mdelay() busy
> waits.

Ahha, I did not notice that. msleep() is okay.
								Pavel

-- 
Horseback riding is like software...
...vgf orggre jura vgf serr.

--===============38234518570349096==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38234518570349096==--
