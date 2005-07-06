From: Jesse Millan <jessem@cs.pdx.edu>
Date: Wed, 06 Jul 2005 17:48:46 +0000
Subject: [KJ] stumped... implicitly truncated warning mystery
Message-Id: <42CC197E.2030207@cs.pdx.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hey all,

GCC4.0.0 is giving me a warning that I cant seem to get rid of. In the
file drivers/net/wireless/wavelan_cs.c on lines 3607 and 3608 is the
following assignment:

cfblk.ifrm_spc = 0x20;
cfblk.slottim_low = 0x20;

where ifrm_spc and slottim_low are both of type unsigned char.

Compiling on a X86_64 emits the warning: large integer implicitly
truncated to unsigned type.

Explicitly casting 0x20 to unsigned char or u_char does not get rid of
the warning. Also, the warning starts at values 0x10 and above.

Any ideas/leads would be greatly appreciated.

-- 
Jesse Millan
CNS Unix Team
Portland State University
Phone: (503) 725-9151
Mobile: (503) 453-0748
GPG key: www.system-calls.com/gpg.php

grep --recursive --ignore-case 'SHOULD WORK' /usr/src/linux/* | wc
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
