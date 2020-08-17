From: Colin King <colin.king@canonical.com>
Date: Mon, 17 Aug 2020 22:44:25 +0000
Subject: [PATCH] net: ipv4: remove duplicate "the the" phrase in Kconfig text
Message-Id: <20200817224425.5988-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The Kconfig help text contains the phrase "the the" in the help
text. Fix this and reformat the block of help text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/ipv4/Kconfig | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/net/ipv4/Kconfig b/net/ipv4/Kconfig
index 60db5a6487cc..87983e70f03f 100644
--- a/net/ipv4/Kconfig
+++ b/net/ipv4/Kconfig
@@ -661,13 +661,13 @@ config TCP_CONG_BBR
 
 	  BBR (Bottleneck Bandwidth and RTT) TCP congestion control aims to
 	  maximize network utilization and minimize queues. It builds an explicit
-	  model of the the bottleneck delivery rate and path round-trip
-	  propagation delay. It tolerates packet loss and delay unrelated to
-	  congestion. It can operate over LAN, WAN, cellular, wifi, or cable
-	  modem links. It can coexist with flows that use loss-based congestion
-	  control, and can operate with shallow buffers, deep buffers,
-	  bufferbloat, policers, or AQM schemes that do not provide a delay
-	  signal. It requires the fq ("Fair Queue") pacing packet scheduler.
+	  model of the bottleneck delivery rate and path round-trip propagation
+	  delay. It tolerates packet loss and delay unrelated to congestion. It
+	  can operate over LAN, WAN, cellular, wifi, or cable modem links. It can
+	  coexist with flows that use loss-based congestion control, and can
+	  operate with shallow buffers, deep buffers, bufferbloat, policers, or
+	  AQM schemes that do not provide a delay signal. It requires the fq
+	  ("Fair Queue") pacing packet scheduler.
 
 choice
 	prompt "Default TCP congestion control"
-- 
2.27.0
