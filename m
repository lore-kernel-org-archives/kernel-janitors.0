From: Joe Damato <ice799@gmail.com>
Date: Sat, 25 Oct 2008 03:15:20 +0000
Subject: [PATCH 00/12] x86: Cleanup idt, gdt/ldt/tss structs
Message-Id: <1224904532-9586-1-git-send-email-ice799@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <>
In-Reply-To: <>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-x86_64@vger.kernel.org, linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Joe Damato <ice799@gmail.com>

Hi -

This is my first submission to the kernel, so (beware!) please let me know if I can make any improvements on these patches.

I attempted to clean up the x86 structs for 32bit cpus that store IDT/LDT/GDT data by removing the fields labeled "a" and "b" in favor of more descriptive field names. I added some macros and went through the kernel cleaning up the various places where "a" and "b" were used.

I tried building my kernel with my .config and then also did a make allyesconfig build to help ensure I found everything that was using the old structure names. I also tried a few grep patterns. Hopefully I got everyone out.


Thanks,
Joe Damato
