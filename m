From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:49:26 +0000
Subject: [PATCH 39/43] drivers/net/wireless: fix sparse warnings: fix
Message-Id: <20090214214917.24377.97223.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warnings:
  drivers/net/wireless/airo.c:2102:21: warning: incorrect type in initializer (different signedness)
  drivers/net/wireless/airo.c:2126:21: warning: incorrect type in initializer (different signedness)
  drivers/net/wireless/airo.c:2167:21: warning: incorrect type in initializer (different signedness)
  drivers/net/wireless/airo.c:2191:21: warning: incorrect type in initializer (different signedness)

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/wireless/airo.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/wireless/airo.c b/drivers/net/wireless/airo.c
index 220f00b..e64eab4 100644
--- a/drivers/net/wireless/airo.c
+++ b/drivers/net/wireless/airo.c
@@ -1161,7 +1161,7 @@ struct airo_info {
 	   use the high bit to mark whether it is in use. */
 #define MAX_FIDS 6
 #define MPI_MAX_FIDS 1
-	int                           fids[MAX_FIDS];
+	u32                           fids[MAX_FIDS];
 	ConfigRid config;
 	char keyindex; // Used with auto wep
 	char defindex; // Used with auto wep

