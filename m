From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 05 Mar 2009 19:16:50 +0000
Subject: [PATCH v2 11/15] NULL noise: drivers/video/via/hw.c
Message-Id: <20090305191646.30062.6857.stgit@f10box.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
In-Reply-To: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: Krzysztof Helt <krzysztof.h1@poczta.fm>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev-devel@lists.sourceforge.net

Fix this sparse warning:
  drivers/video/via/hw.c:2020:46: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
v2: other subject, as suggested by Al Viro

 drivers/video/via/hw.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/video/via/hw.c b/drivers/video/via/hw.c
index fcd53ce..70d6b6c 100644
--- a/drivers/video/via/hw.c
+++ b/drivers/video/via/hw.c
@@ -2017,7 +2017,7 @@ static void init_gfx_chip_info(void)
 	/* Indentify GFX Chip Name */
 	for (i = 0; pciidlist[i].vendor != 0; i++) {
 		pdev = pci_get_device(pciidlist[i].vendor,
-			pciidlist[i].device, 0);
+			pciidlist[i].device, NULL);
 		if (pdev)
 			break;
 	}

