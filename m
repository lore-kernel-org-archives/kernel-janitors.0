From: matt mooney <mfm@muteddisk.com>
Date: Tue, 28 Sep 2010 02:04:17 +0000
Subject: [PATCH 0/3] remove cast from void*
Message-Id: <cover.1285638395.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi guys,

This is a resend to see if anyone wants to pick these up. They are now
being sent to the trivial mailing list.

Thanks,
mfm

matt mooney (3):
  arm: remove cast from void*
  powerpc: remove cast from void*
  trace: remove cast from void*

 arch/arm/mach-omap2/mailbox.c                |    8 ++++----
 arch/powerpc/platforms/pseries/hvCall_inst.c |    2 +-
 kernel/trace/ftrace.c                        |    4 ++--
 kernel/trace/trace.c                         |    2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
1.7.2.1

