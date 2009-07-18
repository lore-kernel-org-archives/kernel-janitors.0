From: Robin Holt <holt@sgi.com>
Date: Sat, 18 Jul 2009 23:20:00 +0000
Subject: Re: [PATCH 3/6] drivers/misc/sgi-xp: convert nested
Message-Id: <20090718232000.GB7426@sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907181723360.26792@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907181723360.26792@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: holt@sgi.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jul 18, 2009 at 05:23:57PM +0200, Julia Lawall wrote:
> -			spin_lock_irqsave(&part_uv->flags_lock, irq_flags);
> +			spin_lock(&part_uv->flags_lock);
>  			part_uv->flags &= ~XPC_P_CACHED_ACTIVATE_GRU_MQ_DESC_UV;

Please do not change this.

I think this is a false positive to a automated script.  We are not
comparing against the processors irq flags, but rather against the
partitions flags.  Note above the difference between irq_flags and
part_uv->flags.

Maybe I misunderstand your point in this patch.

Robin
