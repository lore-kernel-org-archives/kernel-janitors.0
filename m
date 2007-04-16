From: Jaco Kroon <jaco@kroon.co.za>
Date: Mon, 16 Apr 2007 14:12:34 +0000
Subject: [KJ] possible power of two cleanup?
Message-Id: <46238452.2050205@kroon.co.za>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi guys,

Just stumbled upon this in include/linux/blockgroup_lock.h

It looks like it essentially does a round up to the nearest power of two 
of NR_CPUS * 4?  Is this a potential cleanup?  Prevent breakage when we 
start having more than 64 CPUs in a machine?

/*
  * We want a power-of-two.  Is there a better way than this?
  */

#if NR_CPUS >= 32
#define NR_BG_LOCKS 128
#elif NR_CPUS >= 16
#define NR_BG_LOCKS 64
#elif NR_CPUS >= 8
#define NR_BG_LOCKS 32
#elif NR_CPUS >= 4
#define NR_BG_LOCKS 16
#elif NR_CPUS >= 2
#define NR_BG_LOCKS 8
#else
#define NR_BG_LOCKS 4
#endif

Jaco
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
