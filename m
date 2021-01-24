From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 24 Jan 2021 11:32:52 +0000
Subject: [PATCH] ACPICA: Common: Fix a typo
Message-Id: <20210124113252.733716-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robert.moore@intel.com, erik.kaneda@intel.com, rafael.j.wysocki@intel.com, lenb@kernel.org
Cc: linux-acpi@vger.kernel.org, devel@acpica.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This module is 'cmfsize', not 'cfsize'.
Fix it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 tools/power/acpi/common/cmfsize.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/power/acpi/common/cmfsize.c b/tools/power/acpi/common/cmfsize.c
index 9ea2c0aeb86c..185b8c588e1d 100644
--- a/tools/power/acpi/common/cmfsize.c
+++ b/tools/power/acpi/common/cmfsize.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
 /******************************************************************************
  *
- * Module Name: cfsize - Common get file size function
+ * Module Name: cmfsize - Common get file size function
  *
  * Copyright (C) 2000 - 2021, Intel Corp.
  *
-- 
2.27.0
