From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 22 Feb 2009 00:04:51 +0000
Subject: [PATCH 10/16] viafb: fix sparse warning: Using plain integer as NULL
Message-Id: <20090222000441.17557.22989.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warning:
  drivers/video/via/hw.c:2020:46: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
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

