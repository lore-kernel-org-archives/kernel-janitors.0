From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Tue, 24 Jun 2014 17:27:29 +0000
Subject: [PATCH 0/6] Remove various orphaned header files
Message-Id: <1403630855-29186-1-git-send-email-linux@rasmusvillemoes.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>

AFAICT, these headers are not used anywhere, and are just accidental
leftovers from past cleanups.

Rasmus Villemoes (6):
  include/linux/cycx_x25.h: Remove unused header
  include/linux/i82593.h: Remove unused header
  include/linux/mfd/ti_ssp.h: Remove unused header
  include/linux/phonedev.h: Remove unused header
  include/linux/platform_data/tegra_emc.h: Remove unused header
  include/rxrpc/types.h: Remove unused header

 include/linux/cycx_x25.h                | 125 -----------------
 include/linux/i82593.h                  | 229 --------------------------------
 include/linux/mfd/ti_ssp.h              |  93 -------------
 include/linux/phonedev.h                |  25 ----
 include/linux/platform_data/tegra_emc.h |  34 -----
 include/rxrpc/types.h                   |  41 ------
 6 files changed, 547 deletions(-)
 delete mode 100644 include/linux/cycx_x25.h
 delete mode 100644 include/linux/i82593.h
 delete mode 100644 include/linux/mfd/ti_ssp.h
 delete mode 100644 include/linux/phonedev.h
 delete mode 100644 include/linux/platform_data/tegra_emc.h
 delete mode 100644 include/rxrpc/types.h

-- 
1.9.2

