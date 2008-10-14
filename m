From: tsbogend@alpha.franken.de (Thomas Bogendoerfer)
Date: Tue, 14 Oct 2008 16:30:07 +0000
Subject: Re: [PATCH 2/2] drivers/scsi/sun3x_esp.c: Convert && to ||
Message-Id: <20081014163007.GA9015@alpha.franken.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0810141759520.20451@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0810141759520.20451@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: James.Bottomley@HansenPartnership.com, linux-scsi@vger.kernel.org, sammy@sammy.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Oct 14, 2008 at 06:00:19PM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The pattern !E && !E->fld is nonsensical.  The patch below updates this
> according to the assumption that && should be ||.  But perhaps another
> solution was intended.

Acked-By: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Thanks for fixing this.
Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                                [ RFC1925, 2.3 ]
