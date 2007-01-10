From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 10 Jan 2007 08:44:33 +0000
Subject: [KJ] what's the deal with using real "boolean" variables?
Message-Id: <Pine.LNX.4.64.0701100337460.11933@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  is there a consensus on how to use actual C99 boolean variables in
the kernel source? C99 defines the unsigned integer type "_Bool" and,
from that point on, it's all downhill:

$ grep -ri "typedef.*bool" .
./drivers/scsi/BusLogic.h:typedef bool boolean;
./drivers/scsi/pci2000.h:typedef        BOOL    *PBOOL;
./drivers/telephony/ixj.h:typedef __u8 BOOL;
./drivers/block/DAC960.h:typedef bool boolean;
./drivers/video/riva/riva_hw.h:typedef int Bool;
./drivers/video/sis/vgatypes.h:typedef unsigned int BOOLEAN;
./arch/parisc/math-emu/float.h:typedef int boolean;
./include/acpi/actypes.h:typedef unsigned char BOOLEAN;
./include/linux/types.h:typedef _Bool                   bool;
./include/linux/efi.h:typedef u8 efi_bool_t;
... snip ...
./fs/xfs/xfs_types.h:typedef enum { B_FALSE,B_TRUE }    boolean_t;

  it seems like everyone has their own idea of what constitutes a
"boolean" variable.  is there a "coding style" suggestion for this?

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
