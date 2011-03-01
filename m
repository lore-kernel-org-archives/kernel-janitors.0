From: Randy Dunlap <rdunlap@xenotime.net>
Date: Tue, 01 Mar 2011 18:22:16 +0000
Subject: Re: minor bug ?
Message-Id: <20110301102216.e075adac.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110301154301.GS18043@bicker>
In-Reply-To: <20110301154301.GS18043@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 1 Mar 2011 18:39:53 +0100 Nicolas Kaiser wrote:

> * Dan Carpenter <error27@gmail.com>:
> > On Tue, Mar 01, 2011 at 09:02:21PM +0530, Prashant Shah wrote:
> > > file : include/linux/blkdev.h
> 
> > > there is duplicate struct request; on line no. 31 and 37
> 
> > Sure.  Send a patch for that.
> 
> While you're at it, I guess many of these are as well:
> 
>  find /usr/src/linux/ -name "*.[ch]"| \
>  xargs egrep "^[[:space:]]*struct [^[:space:])]*;"| \
>  sort|uniq -d
> 
> 
> /usr/src/linux/arch/arm/include/asm/elf.h:struct task_struct;
> /usr/src/linux/arch/microblaze/include/asm/prom.h:struct pci_dev;
> /usr/src/linux/arch/parisc/include/asm/dma-mapping.h:struct parisc_device;
> /usr/src/linux/arch/powerpc/include/asm/prom.h:struct pci_dev;
> /usr/src/linux/arch/s390/include/asm/ccwdev.h:struct ccw1;
> /usr/src/linux/arch/s390/kernel/compat_linux.h:struct old_sigaction32;
> /usr/src/linux/arch/x86/include/asm/io_apic.h:struct io_apic_irq_attr;
> /usr/src/linux/drivers/dma/coh901318_lli.h:struct device;
> /usr/src/linux/drivers/hid/hid-prodikeys.c:struct pcmidi_snd;
> /usr/src/linux/drivers/media/video/cx231xx/cx231xx.h:struct cx231xx;
> /usr/src/linux/drivers/media/video/em28xx/em28xx.h:struct em28xx;
> /usr/src/linux/drivers/net/wireless/libertas_tf/libertas_tf.h:struct lbtf_private;
> /usr/src/linux/drivers/scsi/bfa/bfa_fcs.h:struct bfa_fcs_s;
> /usr/src/linux/drivers/scsi/bfa/bfa_fcs.h:struct bfad_rport_s;
> /usr/src/linux/drivers/scsi/bfa/bfa_fcs.h:struct bfad_vf_s;
> /usr/src/linux/drivers/scsi/scsi_priv.h:struct request;
> /usr/src/linux/drivers/scsi/scsi_priv.h:struct request_queue;
> /usr/src/linux/drivers/staging/brcm80211/sys/wlc_pub.h:struct wlc_if;
> /usr/src/linux/drivers/staging/rtl8712/drv_types.h:struct _adapter;
> /usr/src/linux/fs/xfs/xfs_error.h:struct xfs_mount;
> /usr/src/linux/include/asm-generic/gpio.h:struct device;
> /usr/src/linux/include/linux/aio.h:struct mm_struct;
> /usr/src/linux/include/linux/blkdev.h:struct request;
> /usr/src/linux/include/linux/debug_locks.h:struct task_struct;
> /usr/src/linux/include/linux/memcontrol.h:struct mem_cgroup;
> /usr/src/linux/include/linux/netfilter.h:struct flowi;
> /usr/src/linux/include/linux/proc_fs.h:struct tty_driver;
> /usr/src/linux/include/linux/profile.h:struct pt_regs;
> /usr/src/linux/include/linux/selection.h:struct tty_struct;
> /usr/src/linux/include/linux/stacktrace.h:struct task_struct;
> /usr/src/linux/include/net/net_namespace.h:struct ctl_table_header;
> /usr/src/linux/include/net/net_namespace.h:struct sock;

Are these duplicates?

struct some_struct;

is used as a notice to the compiler that the struct * may be used without knowing
what the struct looks like.  That keeps us from having to #include <struct.h>
every time that only struct * is used (struct->member is not used).


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
