From: Joe Perches <joe@perches.com>
Date: Wed, 10 Oct 2012 13:00:07 +0000
Subject: Re: [patch] isdn: fix a wrapping bug in isdn_ppp_ioctl()
Message-Id: <1349874007.2386.42.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121010093816.GA3669@elgon.mountain>
	 <1349864358.2386.27.camel@joe-AO722> <m21uh67csy.fsf@igel.home>
In-Reply-To: <m21uh67csy.fsf@igel.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Karsten Keil <isdn@linux-pingi.de>, "David S. Miller" <davem@davemloft.net>, Masanari Iida <standby24x7@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2012-10-10 at 14:05 +0200, Andreas Schwab wrote:
> Joe Perches <joe@perches.com> writes:
> 
> > @@ -589,16 +589,15 @@ isdn_ppp_ioctl(int min, struct file *file, unsigned int cmd, unsigned long arg)
> >  		break;
> >  	case PPPIOCGCOMPRESSORS:
> >  	{
> > -		unsigned long protos[8] = {0,};
> > +		DECLARE_BITMAP(protos, BITS_PER_LONG * 8) = { 0, };
> >  		struct isdn_ppp_compressor *ipc = ipc_head;
> > +
> >  		while (ipc) {
> > -			j = ipc->num / (sizeof(long) * 8);
> > -			i = ipc->num % (sizeof(long) * 8);
> > -			if (j < 8)
> > -				protos[j] |= (0x1 << i);
> > +			if (ipc->num < BITS_PER_LONG * 8)
> > +				set_bit(ipc->num, protos);
> >  			ipc = ipc->next;
> >  		}
> > -		if ((r = set_arg(argp, protos, 8 * sizeof(long))))
> > +		if ((r = set_arg(argp, protos, sizeof(protos))))
> 
> This changes the bit endianess.

How does it do that?

include/linux/bitops.h:#define BIT_MASK(nr)		(1UL << ((nr) % BITS_PER_LONG))
include/linux/bitops.h:#define BIT_WORD(nr)		((nr) / BITS_PER_LONG)

include/asm-generic/bitops/atomic.h:static inline void set_bit(int nr, volatile unsigned long *addr)
include/asm-generic/bitops/atomic.h-{
include/asm-generic/bitops/atomic.h-	unsigned long mask = BIT_MASK(nr);
include/asm-generic/bitops/atomic.h-	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
include/asm-generic/bitops/atomic.h-	unsigned long flags;
include/asm-generic/bitops/atomic.h-
include/asm-generic/bitops/atomic.h-	_atomic_spin_lock_irqsave(p, flags);
include/asm-generic/bitops/atomic.h-	*p  |= mask;
include/asm-generic/bitops/atomic.h-	_atomic_spin_unlock_irqrestore(p, flags);
include/asm-generic/bitops/atomic.h-}


