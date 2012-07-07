From: Emil Goode <emilgoode@gmail.com>
Date: Sat, 07 Jul 2012 18:47:51 +0000
Subject: [PATCH] net: fix non-ANSI function declaration warning
Message-Id: <1341686871-21822-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: edumazet@google.com, mirq-linux@rere.qmqm.pl, jpirko@redhat.com, therbert@google.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

Sparse is warning about non-ANSI function declaration.
Add void to the parameterless function.

net/core/dev.c:1804:38: warning:
	non-ANSI function declaration of function
	'netif_get_num_default_rss_queues'

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 net/core/dev.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 07c1251..fc6fbce 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -1801,7 +1801,7 @@ EXPORT_SYMBOL(netif_set_real_num_rx_queues);
  * This routine should set an upper limit on the number of RSS queues
  * used by default by multiqueue devices.
  */
-int netif_get_num_default_rss_queues()
+int netif_get_num_default_rss_queues(void)
 {
 	return min_t(int, DEFAULT_MAX_NUM_RSS_QUEUES, num_online_cpus());
 }
-- 
1.7.10.4

