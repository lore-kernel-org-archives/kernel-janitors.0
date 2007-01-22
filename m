From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Mon, 22 Jan 2007 09:03:39 +0000
Subject: Re: [KJ] standardizing on boolean variables?
Message-Id: <45B47DEB.5070007@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701210324380.13751@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701210324380.13751@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Robert P. J. Day wrote:
>   by the way, part of my style script looks for code that insists on
> redefining booleans in one way or another.  at the moment, it looks
> like this:
>
> $ grep -ri "^typedef.*bool" .
>   
Is the script also checking for booleans defined by "#define" or "enum" 
(without typedef)?
> ./drivers/scsi/BusLogic.h:typedef bool boolean;
>   
Sent a patch on this one yesterday to LKML.
> ./drivers/scsi/pci2000.h:typedef        BOOL    *PBOOL;
> ./drivers/telephony/ixj.h:typedef __u8 BOOL;
> ./drivers/block/DAC960.h:typedef bool boolean;
>   
How did I miss this one?
> ./drivers/video/riva/riva_hw.h:typedef int Bool;
> ./drivers/video/sis/vgatypes.h:typedef unsigned int BOOLEAN;
> ./arch/parisc/math-emu/float.h:typedef int boolean;
> ./include/acpi/actypes.h:typedef unsigned char BOOLEAN;
> ./include/linux/types.h:typedef _Bool                   bool;
>   
The "generic" one.
> ./include/linux/efi.h:typedef u8 efi_bool_t;
> ./include/linux/efi.h:typedef efi_status_t efi_get_wakeup_time_t (efi_bool_t *enabled, efi_bool_t *pending,
> ./include/linux/efi.h:typedef efi_status_t efi_set_wakeup_time_t (efi_bool_t enabled, efi_time_t *tm);
> ./fs/xfs/xfs_types.h:typedef enum { B_FALSE,B_TRUE }    boolean_t;
>   
Have sent them a patch before but they seemed not too interested for the 
moment. Will come back when most of the cleanup is done.
>  did you want to submit a patch to clean up any of that, if it can be
> done at the moment?
>   
Should get DAC960.h out today. But the rest should be checked, to see if 
it is used when declaring in struct's and that struct is 
mem(cmp|cpy|move|...) (or something that may be size-sensitive).

Any help appreciated ;)
Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
