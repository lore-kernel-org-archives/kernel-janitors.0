From: Dan Carpenter <error27@gmail.com>
Date: Thu, 16 Sep 2010 18:12:55 +0000
Subject: [patch] net/llc: storing negative error codes in unsigned short
Message-Id: <20100916181155.GB7867@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

If the alloc_skb() fails then we return 65431 instead of -ENOBUFS
(-105). 

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/llc/llc_station.c b/net/llc/llc_station.c
index e4dae02..cf4aea3 100644
--- a/net/llc/llc_station.c
+++ b/net/llc/llc_station.c
@@ -689,7 +689,7 @@ static void llc_station_rcv(struct sk_buff *skb)
 
 int __init llc_station_init(void)
 {
-	u16 rc = -ENOBUFS;
+	int rc = -ENOBUFS;
 	struct sk_buff *skb;
 	struct llc_station_state_ev *ev;
 
