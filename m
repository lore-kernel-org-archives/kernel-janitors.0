From: Andre Haupt <andre@bitwigglers.org>
Date: Fri, 20 Jun 2008 12:51:45 +0000
Subject: [PATCH 2/2] parport: make parport_cs_release static.
Message-Id: <554789e3ddac9c52e5d843b9c6bc5aeb1191f2d2.1213965527.git.andre@bitwigglers.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1213965527.git.andre@bitwigglers.org>
 <15ef717cf17bfbbcdd49599ed9c99cc655b610fa.1213965527.git.andre@bitwigglers.org>
In-Reply-To: <15ef717cf17bfbbcdd49599ed9c99cc655b610fa.1213965527.git.andre@bitwigglers.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andre Haupt <andre@bitwigglers.org>

Signed-off-by: Andre Haupt <andre@bitwigglers.org>
---
 drivers/parport/parport_cs.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/parport/parport_cs.c b/drivers/parport/parport_cs.c
index 802a81d..00e1d96 100644
--- a/drivers/parport/parport_cs.c
+++ b/drivers/parport/parport_cs.c
@@ -235,7 +235,7 @@ failed:
     
 ===================================*/
 
-void parport_cs_release(struct pcmcia_device *link)
+static void parport_cs_release(struct pcmcia_device *link)
 {
 	parport_info_t *info = link->priv;
 
-- 
1.5.5.GIT

