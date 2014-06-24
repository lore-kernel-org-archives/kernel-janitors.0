From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Tue, 24 Jun 2014 17:27:34 +0000
Subject: [PATCH 5/6] include/linux/platform_data/tegra_emc.h: Remove unused header
Message-Id: <1403630855-29186-6-git-send-email-linux@rasmusvillemoes.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1403630855-29186-1-git-send-email-linux@rasmusvillemoes.dk>
In-Reply-To: <1403630855-29186-1-git-send-email-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>

The header file include/linux/platform_data/tegra_emc.h does not seem
to be used anywhere. It was orphaned by a7cbe92c "ARM: tegra: remove
tegra EMC scaling driver". Remove it.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 include/linux/platform_data/tegra_emc.h | 34 ---------------------------------
 1 file changed, 34 deletions(-)
 delete mode 100644 include/linux/platform_data/tegra_emc.h

diff --git a/include/linux/platform_data/tegra_emc.h b/include/linux/platform_data/tegra_emc.h
deleted file mode 100644
index df67505..0000000
--- a/include/linux/platform_data/tegra_emc.h
+++ /dev/null
@@ -1,34 +0,0 @@
-/*
- * Copyright (C) 2011 Google, Inc.
- *
- * Author:
- *	Colin Cross <ccross@android.com>
- *	Olof Johansson <olof@lixom.net>
- *
- * This software is licensed under the terms of the GNU General Public
- * License version 2, as published by the Free Software Foundation, and
- * may be copied, distributed, and modified under those terms.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- */
-
-#ifndef __TEGRA_EMC_H_
-#define __TEGRA_EMC_H_
-
-#define TEGRA_EMC_NUM_REGS 46
-
-struct tegra_emc_table {
-	unsigned long rate;
-	u32 regs[TEGRA_EMC_NUM_REGS];
-};
-
-struct tegra_emc_pdata {
-	int num_tables;
-	struct tegra_emc_table *tables;
-};
-
-#endif
-- 
1.9.2

