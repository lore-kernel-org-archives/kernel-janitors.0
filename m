From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 20 Nov 2012 04:28:56 +0000
Subject: Re: [patch] x86, UV: integer wrap bug in uv_hub_ipi_value()
Message-Id: <20121120042855.GE6186@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121117151611.GB16900@elgon.mountain>
 <20121120004834.GE5060@sgi.com>
In-Reply-To: <20121120004834.GE5060@sgi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russ Anderson <rja@sgi.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jack Steiner <steiner@sgi.com>, Dimitri Sivanich <sivanich@sgi.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, rja@americas.sgi.com

On Mon, Nov 19, 2012 at 06:48:34PM -0600, Russ Anderson wrote:
> On Sat, Nov 17, 2012 at 06:16:11PM +0300, Dan Carpenter wrote:
> > This is a static checker fix.  The problem is that we store the bits
> > from "uv_apicid_hibits" into "apicid" (the high 16 bits) but then we
> > shift it 16 bit to the left.  "apicid" is an int so it wraps and we lose
> > them.
> 
> Is this the complete patch?  phys_apicid is an int, but gets
> cast as unsigned long.  Doesn't phys_apicid also have to be
> changed to unsigned long?  And why ulong instead of uint (on x86_64)?

Uint is 32bit across all arches in linux and unix, according to
wikipedia.  The wakeup_secondary_cpu() function pointer takes an int
so I couldn't change the parameter.

> 
> I agree with changing signed to unsigned where appropriate, but
> this looks like a partial fix.  Am I missing something?
> 

I do feel a little embarrassed that I didn't use "unsigned long"
consistently.  I just used ulong to make the line a bit shorter, but
I could redo it with "unsigned long" if you want.

regards,
dan carpenter


