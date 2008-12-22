From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 22 Dec 2008 19:18:04 +0000
Subject: [PATCH 21/27] drivers/net/wan: fix sparse warning: make symbol static
Message-Id: <20081222191804.11807.55143.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warning:

  drivers/net/wan/x25_asy.c:623:5: warning: symbol 'x25_asy_esc' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/wan/x25_asy.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/wan/x25_asy.c b/drivers/net/wan/x25_asy.c
index 472bd0e..e6e2ce3 100644
--- a/drivers/net/wan/x25_asy.c
+++ b/drivers/net/wan/x25_asy.c
@@ -620,7 +620,7 @@ static struct net_device_stats *x25_asy_get_stats(struct net_device *dev)
   *			STANDARD X.25 ENCAPSULATION		  	 *
   ************************************************************************/
 
-int x25_asy_esc(unsigned char *s, unsigned char *d, int len)
+static int x25_asy_esc(unsigned char *s, unsigned char *d, int len)
 {
 	unsigned char *ptr = d;
 	unsigned char c;

