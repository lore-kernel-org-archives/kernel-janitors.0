From: Randy Dunlap <rdunlap@xenotime.net>
Date: Wed, 06 Jun 2007 04:38:07 +0000
Subject: Re: [KJ] [patch] use DMA_32BIT_MASK where appropriate in
Message-Id: <20070605213807.5a378238.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ab8e556c0706052115uf8e3e13g6a01207eb7b1166a@mail.gmail.com>
In-Reply-To: <ab8e556c0706052115uf8e3e13g6a01207eb7b1166a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 6 Jun 2007 11:15:12 +0700 Kevin Jackson wrote:

> From: Kev Jackson <foamdino@gmail.com>
> 
> -Removes TW_DMA_MASK definition from header/code use DMA_32BIT_MASK
> instead as per kernel janitors TODO list
> 
> Signed-off-by: Kev Jackson <foamdino@gmail.com>
> 
> ---

Preferably include a diffstat summary here.  See SubmittingPatches.


> Hopefully this conforms to the requirements in the SubmittingPatches
> docs :), please point out glaring errors etc (including if this
> meta-comment really is ignored by changelogs as described in the docs)
> 
> --- drivers/scsi/3w-xxxx.c.orig 2007-06-06 10:30:21.000000000 +0700
> +++ drivers/scsi/3w-xxxx.c      2007-06-06 10:31:29.000000000 +0700

The patch should be able to be applied using 'patch -p1' when at the
top of the kernel source tree.  IOW, the file names above should have
one directory level preceding them, such as:

> --- old/drivers/scsi/3w-xxxx.c.orig 2007-06-06 10:30:21.000000000 +0700
> +++ new/drivers/scsi/3w-xxxx.c      2007-06-06 10:31:29.000000000 +0700

Tools such as quilt and git know about this and can do it for you.


> @@ -2338,7 +2338,7 @@ static int __devinit tw_probe(struct pci
> 
>         pci_set_master(pdev);
> 
> -       retval = pci_set_dma_mask(pdev, TW_DMA_MASK);
> +       retval = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
>         if (retval) {
>                 printk(KERN_WARNING "3w-xxxx: Failed to set dma mask.");
>                 goto out_disable_device;
> --- drivers/scsi/3w-xxxx.h.orig 2007-06-06 10:30:29.000000000 +0700
> +++ drivers/scsi/3w-xxxx.h      2007-06-06 10:32:01.000000000 +0700
> @@ -234,7 +234,6 @@ static unsigned char tw_sense_table[][4]
>  #define TW_IOCTL_TIMEOUT                      25 /* 25 seconds */
>  #define TW_IOCTL_CHRDEV_TIMEOUT               60 /* 60 seconds */
>  #define TW_IOCTL_CHRDEV_FREE                  -1
> -#define TW_DMA_MASK                          DMA_32BIT_MASK
>  #define TW_MAX_CDB_LEN                       16
> 
>  /* Bitmask macros to eliminate bitfields */

Otherwise looks good to me.  But then I try to apply the patch and get
this:

1 out of 1 hunk FAILED -- saving rejects to file drivers/scsi/3w-xxxx.c.rej
1 out of 1 hunk FAILED -- saving rejects to file drivers/scsi/3w-xxxx.h.rej

and can see that the tabs have been converted to spaces.  Yes,
gmail does that for you if you use the web interface instead of the
SMTP interface.  Or using copy-paste from a text editor can also
cause it.  You'll need to get that taken care of one way or another.
Please send a patch to yourself and make sure that you can apply it
cleanly...

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
