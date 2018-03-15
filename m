From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Mar 2018 09:03:46 +0000
Subject: [bug report] perf/x86/intel: Add INST_RETIRED.ALL workarounds
Message-Id: <20180315090346.GA23080@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Andi Kleen,

The patch 294fe0f52a44: "perf/x86/intel: Add INST_RETIRED.ALL
workarounds" from Feb 17, 2015, leads to the following static checker
warning:

	arch/x86/events/intel/core.c:3213 bdw_limit_period()
	warn: was expecting a 64 bit value instead of '63'

arch/x86/events/intel/core.c
  3207  static u64 bdw_limit_period(struct perf_event *event, u64 left)
                                                              ^^^^^^^^
  3208  {
  3209          if ((event->hw.config & INTEL_ARCH_EVENT_MASK) =
  3210                          X86_CONFIG(.event=0xc0, .umask=0x01)) {
  3211                  if (left < 128)
  3212                          left = 128;
  3213                  left &= ~0x3fu;
                        ^^^^^^^^^^^^^^
You're clearing the high 32 bits as well as the low 6.  It should be
~0x3full.

  3214          }
  3215          return left;
  3216  }

regards,
dan carpenter
