From: Greg KH <greg@kroah.com>
Date: Tue, 09 Nov 2004 22:29:01 +0000
Subject: Re: [KJ] [PATCH] convert airo wireless driver to module_param
Message-Id: <20041109222901.GA7416@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74134756924929646=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041109212957.GA9496@dice.seeling33.de>
In-Reply-To: <20041109212957.GA9496@dice.seeling33.de>
To: kernel-janitors@vger.kernel.org

--===============74134756924929646==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 09, 2004 at 11:21:06PM +0100, Stefan Sperling wrote:
> On Tue, Nov 09, 2004 at 01:38:18PM -0800, Randy.Dunlap wrote:
> > Stefan Sperling wrote:
>  
> > Rusty's first set of module_param() conversion patches, which
> > I mostly followed, use permission (last parameter) of 0
> > (not visible in sysfs) except for fields that can be modified.
> > Often this is a "debug" or "verbose" flag or bitmask.
> 
> Not in this one:
> 
> http://marc.theaimsgroup.com/?l=linux-kernel&m=109826168201622&w=2
> 
> This is the reference link from the janitors TODO file.
> Everything 0444, except a debug flag, which is 0644.
> 
> Can someone please clarify the "official guidelines" for
> module parameter permissions in sysfs?

"When it makes sense to have it exposed to userspace"

Yeah, it's vague, sorry, but it all depends.

For things that can be changed on the fly, expose it.
For things that don't really matter, and no one will ever look them up,
don't.  I think the irq stuff is in the "don't" category, as almost no
one messes with them anymore.

Does this help?

thanks,

greg k-h

--===============74134756924929646==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74134756924929646==--
