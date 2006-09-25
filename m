From: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 25 Sep 2006 09:24:40 +0000
Subject: Re: [KJ] [PATCH] Handcrafted MIN/MAX removal
Message-Id: <20060925092440.GK10725@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1159176031.25016.44.camel@amol.verismonetworks.com>
In-Reply-To: <1159176031.25016.44.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amol Lad <amol@verismonetworks.com>
Cc: kernel Janitors <kernel-janitors@lists.osdl.org>, linux kernel <linux-kernel@vger.kernel.org>

On 2006-09-25 at 11:20:31 +0200, Amol Lad <amol@verismonetworks.com> wrote:
> Sending to lkml also
> 
> Cleanups done to use min/max macros from kernel.h. Handcrafted MIN/MAX
> macros are changed to use macros in kernel.h
> 
> Tested for allmodconfig
> 
> Signed-off-by: Amol Lad <amol@verismonetworks.com>
> ---
>  drivers/isdn/hardware/eicon/debug.c    |    4 +--
>  drivers/isdn/hardware/eicon/di.c       |    8 +++----
>  drivers/isdn/hardware/eicon/io.c       |    2 -
>  drivers/isdn/hardware/eicon/istream.c  |    4 +--
>  drivers/isdn/hardware/eicon/platform.h |    8 -------
>  drivers/scsi/aic7xxx/aic79xx.h         |    8 -------
>  drivers/scsi/aic7xxx/aic79xx_core.c    |   22 ++++++++++-----------
>  drivers/scsi/aic7xxx/aic79xx_osm.c     |    6 ++---
>  drivers/scsi/aic7xxx/aic7xxx.h         |    8 -------
>  drivers/scsi/aic7xxx/aic7xxx_core.c    |   18 ++++++++---------
>  drivers/scsi/aic7xxx/aic7xxx_osm.c     |    4 +--
>  fs/xfs/xfs_btree.h                     |   34 +++++++++------------------------
>  fs/xfs/xfs_rtalloc.c                   |   20 +++++++++----------
>  fs/xfs/xfs_rtalloc.h                   |    3 --

Split up by driver/subsystem, please.

Cheers, Tobias
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
