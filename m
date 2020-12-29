From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 29 Dec 2020 08:51:03 +0000
Subject: [PATCH] ASoC: Intel: common: Fix some typos
Message-Id: <20201229085103.192715-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

s/apci/acpi/

Turn an ICL into a TGL because it is likely a cut'n'paste error

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/intel/common/soc-acpi-intel-ehl-match.c | 2 +-
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ehl-match.c b/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
index badafc1d54d2..5c7a1214403d 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * soc-apci-intel-ehl-match.c - tables and support for EHL ACPI enumeration.
+ * soc-acpi-intel-ehl-match.c - tables and support for EHL ACPI enumeration.
  *
  * Copyright (c) 2019, Intel Corporation.
  *
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 98196e9fad62..4933184df5f5 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * soc-apci-intel-tgl-match.c - tables and support for ICL ACPI enumeration.
+ * soc-acpi-intel-tgl-match.c - tables and support for TGL ACPI enumeration.
  *
  * Copyright (c) 2019, Intel Corporation.
  *
-- 
2.27.0
