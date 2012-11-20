From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Tue, 20 Nov 2012 11:10:55 +0000
Subject: Re: [patch] x86, UV: integer wrap bug in uv_hub_ipi_value()
Message-Id: <20121120111055.64845785@pyramind.ukuu.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121117151611.GB16900@elgon.mountain>
	<20121120004834.GE5060@sgi.com>
	<20121120042855.GE6186@mwanda>
In-Reply-To: <20121120042855.GE6186@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Russ Anderson <rja@sgi.com>, Thomas Gleixner <tglx@linutronix.de>, Jack Steiner <steiner@sgi.com>, Dimitri Sivanich <sivanich@sgi.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, rja@americas.sgi.com

On Tue, 20 Nov 2012 07:28:56 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Mon, Nov 19, 2012 at 06:48:34PM -0600, Russ Anderson wrote:
> > On Sat, Nov 17, 2012 at 06:16:11PM +0300, Dan Carpenter wrote:
> > > This is a static checker fix.  The problem is that we store the bits
> > > from "uv_apicid_hibits" into "apicid" (the high 16 bits) but then we
> > > shift it 16 bit to the left.  "apicid" is an int so it wraps and we lose
> > > them.
> > 
> > Is this the complete patch?  phys_apicid is an int, but gets
> > cast as unsigned long.  Doesn't phys_apicid also have to be
> > changed to unsigned long?  And why ulong instead of uint (on x86_64)?
> 
> Uint is 32bit across all arches in linux and unix, according to
> wikipedia. 

For Linux yes, if Wackypedia claims it for "unix" it's wrong 8) and varies
between 16 and 36bits that I can think of.

If you specifically want 32bits use "u32", it's not going to make any
actual difference to unsigned int but it makes the requirement explicit.

Alan
