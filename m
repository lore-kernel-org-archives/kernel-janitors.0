From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Date: Wed, 01 Feb 2006 10:14:48 +0000
Subject: [KJ] Re: [Patch] BUG_ON() Conversion in drivers/ide/
Message-Id: <58cb370e0602010214q57f52ca9ja14bc5bea683408f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

On 2/1/06, Eric Sesterhenn / snakebyte <snakebyte@gmx.de> wrote:
> hi,
>
> this changes if() BUG(); constructs to BUG_ON() which is
> cleaner, contains unlikely() and can better optimized away.

Patch looks fine but maybe we can try to fix few
underlying problems while at it?

> Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>
>
> --- linux-2.6.16-rc1-git4/drivers/ide/ide.c.orig        2006-01-31 21:09:17.000000000 +0100
> +++ linux-2.6.16-rc1-git4/drivers/ide/ide.c     2006-01-31 21:10:49.000000000 +0100
> @@ -1367,8 +1367,7 @@ int generic_ide_ioctl(ide_drive_t *drive
>
>                         ide_abort(drive, "drive reset");
>
> -                       if(HWGROUP(drive)->handler)
> -                               BUG();
> +                       BUG_ON(HWGROUP(drive)->handler);

minor: please use drive->hwif->hwgroup instead of HWGROUP() macro

>                         /* Ensure nothing gets queued after we
>                            drop the lock. Reset will clear the busy */
> --- linux-2.6.16-rc1-git4/drivers/ide/ide-cd.c.orig     2006-01-31 21:13:27.000000000 +0100
> +++ linux-2.6.16-rc1-git4/drivers/ide/ide-cd.c  2006-01-31 21:13:39.000000000 +0100
> @@ -1721,8 +1721,7 @@ static ide_startstop_t cdrom_newpc_intr(
>                 }
>         }
>
> -       if (HWGROUP(drive)->handler != NULL)
> -               BUG();
> +       BUG_ON(HWGROUP(drive)->handler != NULL);
>
>         ide_set_handler(drive, cdrom_newpc_intr, rq->timeout, NULL);

__ide_set_handler() which is called internally by ide_set_handler()
warns about ->handler != NULL.

We should add BUG_ON() to __ide_set_handler() and remove all BUG()
checks which are done before calling ide_set_handler() (so this one and
the ones from ide-floppy.c, ide-iops.c, ide-taskfile.c and pci/trm290.c).

Care to make a separate patch for this change?

>         return ide_started;
> --- linux-2.6.16-rc1-git4/drivers/ide/ide-dma.c.orig    2006-01-31 21:11:13.000000000 +0100
> +++ linux-2.6.16-rc1-git4/drivers/ide/ide-dma.c 2006-01-31 21:11:35.000000000 +0100
> @@ -206,8 +206,7 @@ int ide_build_sglist(ide_drive_t *drive,
>         ide_hwif_t *hwif = HWIF(drive);
>         struct scatterlist *sg = hwif->sg_table;
>
> -       if ((rq->flags & REQ_DRIVE_TASKFILE) && rq->nr_sectors > 256)
> -               BUG();
> +       BUG_ON((rq->flags & REQ_DRIVE_TASKFILE) && rq->nr_sectors > 256);
>
>         ide_map_sg(drive, rq);
>
> @@ -947,8 +946,7 @@ void ide_setup_dma (ide_hwif_t *hwif, un
>         }
>         printk("\n");
>
> -       if (!(hwif->dma_master))
> -               BUG();
> +       BUG_ON(!(hwif->dma_master));

We should just remove this BUG().

This check doesn't make much sense nowadays
and is done too late in the initialisation sequence.

Care to make a separate patch?

Thanks,
Bartlomiej

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
