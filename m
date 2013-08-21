From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Aug 2013 20:08:01 +0000
Subject: Re: [patch] staging: comedi: comedi_bond: silence a shift wrapping warning
Message-Id: <20130821200800.GN22811@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130821082727.GB5240@elgon.mountain>
In-Reply-To: <20130821082727.GB5240@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Aug 21, 2013 at 05:44:34PM +0100, Ian Abbott wrote:
> On 2013-08-21 13:45, Dan Carpenter wrote:
> >On Wed, Aug 21, 2013 at 11:50:22AM +0100, Ian Abbott wrote:
> >>On 2013-08-21 09:27, Dan Carpenter wrote:
> >>>We set this using:
> >>>
> >>>	devs_closed |= (0x1 << bdev->minor)
> >>>
> >>>Since 0x1 is an int then only the lower 32 bits are usable before we hit
> >>>a shift wrapping bug.  There are some static checkers which complain
> >>>about this.  I've silenced the warning by making devs_closed a 32 bit
> >>>number.
> >>>
> >>>32 bits should be enough for anybody.
> >>
> >>Not really, as bdev->minor will be in the range 0 to 47 inclusive (0
> >>to COMEDI_NUM_BOARD_MINORS-1).  Of course, an unsigned long is
> >>insufficient too on a 32-bit system.
> >
> >Ok.  I'll make it a u64 in a v2 patch.
> 
> If you want, we could drop that, and I could rework it to use
> DECLARE_BITMAP() and the functions in <linux/bitmap.h> to avoid
> assuming COMEDI_NUM_BOARD_MINORS is <= 64.  The devs_opened[] in
> doDevConfig() could also be replaced by a bitmap (it's currently an
> array of pointers!).
> 

Sure.  Let's drop it then.

regards,
dan carpenter

