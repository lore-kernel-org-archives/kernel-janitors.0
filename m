From: Domen Puncer <domen@coderock.org>
Date: Sat, 17 Jan 2004 14:20:15 +0000
Subject: [Kernel-janitors] [patch 2.6.1] net/core/dev.c -comparison
Message-Id: <200401171520.15308.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi.

Get rid of one comparison, improve readability.


--- linux-2.6.0-test11-small/net/core/dev.c	2003-11-29 21:47:03.000000000 +0100
+++ linux-2.6.0-test11-athlon/net/core/dev.c	2003-12-13 17:27:37.000000000 +0100
@@ -1872,9 +1872,9 @@ void dev_seq_stop(struct seq_file *seq, 
 
 static void dev_seq_printf_stats(struct seq_file *seq, struct net_device *dev)
 {
-	struct net_device_stats *stats = dev->get_stats ? dev->get_stats(dev) :
-							  NULL;
-	if (stats)
+	if (dev->get_stats) {
+		struct net_device_stats *stats = dev->get_stats(dev);
+
 		seq_printf(seq, "%6s:%8lu %7lu %4lu %4lu %4lu %5lu %10lu %9lu "
 				"%8lu %7lu %4lu %4lu %4lu %5lu %7lu %10lu\n",
 			   dev->name, stats->rx_bytes, stats->rx_packets,
@@ -1892,6 +1892,7 @@ static void dev_seq_printf_stats(struct 
 			     stats->tx_window_errors +
 			     stats->tx_heartbeat_errors,
 			   stats->tx_compressed);
+	}
 	else
 		seq_printf(seq, "%6s: No statistics available.\n", dev->name);
 }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
