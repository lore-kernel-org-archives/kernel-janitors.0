From: walter harms <wharms@bfs.de>
Date: Wed, 17 Jan 2007 13:22:49 +0000
Subject: Re: [KJ] how about cleaning up all the "__attribute__" defines?
Message-Id: <45AE2329.2000401@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701170625150.31856@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701170625150.31856@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Robert P. J. Day wrote:
>   it strikes me that a useful cleanup would be to centralize all of
> the shortcut "__attribute__" definitions in one place.  consider:
> 
> $ grep -r "#define.*attribute.*packed" .
> ./drivers/scsi/u14-34f.c:#define PACKED__attribute__((packed))
> ./drivers/scsi/BusLogic.h:#define PACKED __attribute__((packed))
> ./drivers/scsi/gdth_ioctl.h:#define PACKED  __attribute__((packed))
> ./drivers/scsi/ultrastor.c:#define PACKED __attribute__((packed))
> ./drivers/media/dvb/frontends/bcm3510_priv.h:#define PACKED __attribute__((packed))
> ./include/linux/eventpoll.h:#define EPOLL_PACKED __attribute__((packed))
> ./include/linux/cycx_x25.h:#define PACKED __attribute__((packed))
> ./fs/hfsplus/hfsplus_raw.h:#define __packed __attribute__ ((packed))
> ./fs/befs/befs_fs_types.h:#define PACKED __attribute__ ((__packed__))
> ./fs/hfs/hfs.h:#define __packed __attribute__ ((packed))
> 
>   i mean, seriously, how many different files need to redefine the
> macro "PACKED"?  (or, as it were, "__packed"?)  i think it would be
> handy to have all of those shortcut defines in one file, with a little
> documentation to go along with each so that newbies would know:
> 

It would be useful indeed.
IMHO they should not be used at all except the author knows what he does.
simply let the compiler do its work.
Different architectures have different needs (a real driver problem), so it would
provide a central place to disable these suckers.

re,
 wh



>   1) what they mean, and
>   2) under what circumstances they should be used
> 
> thoughts?
> 
> rday
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
> 
> 
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
