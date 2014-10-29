From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Oct 2014 15:47:41 +0000
Subject: [patch] media: dvb_core: fix an error message
Message-Id: <20141029154741.GB5290@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: "David S. Miller" <davem@davemloft.net>, dingtianhong <dingtianhong@huawei.com>, Yang Yingliang <yangyingliang@huawei.com>, Tom Gundersen <teg@jklm.no>, David Herrmann <dh.herrmann@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The right shift has higher precedence than the mask so the warning
doesn't match what the test was checking.  Also it's better to use TS_SC
instead of magic number 0xC0.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index 059e611..360ef2b 100644
--- a/drivers/media/dvb-core/dvb_net.c
+++ b/drivers/media/dvb-core/dvb_net.c
@@ -379,7 +379,7 @@ static void dvb_net_ule( struct net_device *dev, const u8 *buf, size_t buf_len )
 			/* Check TS error conditions: sync_byte, transport_error_indicator, scrambling_control . */
 			if ((ts[0] != TS_SYNC) || (ts[1] & TS_TEI) || ((ts[3] & TS_SC) != 0)) {
 				printk(KERN_WARNING "%lu: Invalid TS cell: SYNC %#x, TEI %u, SC %#x.\n",
-				       priv->ts_count, ts[0], ts[1] & TS_TEI >> 7, ts[3] & 0xC0 >> 6);
+				       priv->ts_count, ts[0], (ts[1] & TS_TEI) >> 7, (ts[3] & TS_SC) >> 6);
 
 				/* Drop partly decoded SNDU, reset state, resync on PUSI. */
 				if (priv->ule_skb) {
