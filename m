From: "Douglas Landgraf" <dougsland@GMAIL.COM>
Date: Tue, 13 Mar 2007 16:59:19 +0000
Subject: Re: [KJ] anyone interested in removing dead header files?
Message-Id: <68cac7520703130959n433fa725vf6f1ef88d61a3bda@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703100424200.25200@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0703100424200.25200@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Robert,

     I'm working on that.. I think you could create an item at Wiki to
add this sort of tool that you used.

Best Regards,
Douglas Schilling Landgraf

On 3/10/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
>
>   based on a script i wrote, the following header files seem to have
> no value whatsoever in the current source tree:
>
> ./arch/arm/mach-s3c2410/bast.h
> ./arch/m68k/atari/atasound.h
> ./arch/powerpc/platforms/83xx/mpc834x_itx.h
> ./arch/ppc/syslib/cpc710.h
> ./arch/um/kernel/tt/include/mode_kern-tt.h
> ./drivers/char/digi.h
> ./drivers/char/drm/via_mm.h
> ./drivers/isdn/hardware/eicon/dbgioctl.h
> ./drivers/isdn/hardware/eicon/main_if.h
> ./drivers/message/fusion/lsi/mpi_inb.h
> ./drivers/message/fusion/lsi/mpi_log_fc.h
> ./drivers/message/i2o/i2o_lan.h
> ./drivers/net/chelsio/vsc8244_reg.h
> ./drivers/net/skfp/h/lnkstat.h
> ./drivers/net/wan/lmc/lmc_media.h
> ./drivers/scsi/pci2000.h
> ./drivers/serial/crisv10.h
> ./drivers/video/riva/nv4ref.h
> ./include/linux/elfnote.h
> ./sound/pci/au88x0/au88x0_sb.h
> ./sound/pci/cs46xx/imgs/cwcemb80.h
>
>   anyone interested in verifying their uselessness and, one or two at
> a time, submitting patches to delete them?
>
> rday
>
> --
> ====================================
> Robert P. J. Day
> Linux Consulting, Training and Annoying Kernel Pedantry
> Waterloo, Ontario, CANADA
>
> http://fsdev.net/wiki/index.php?title=Main_Page
> ====================================
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
>
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
