From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Fri, 07 Sep 2012 15:24:44 +0000
Subject: [PATCH 8/10] drivers/media/dvb-core/dvb_demux.c: removes unnecessary semicolon
Message-Id: <1347031488-26598-6-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, Julia.Lawall@lip6.fr, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

removes unnecessary semicolon

Found by Coccinelle: http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/media/dvb-core/dvb_demux.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff -u -p a/drivers/media/dvb-core/dvb_demux.c b/drivers/media/dvb-core/dvb_demux.c
--- a/drivers/media/dvb-core/dvb_demux.c
+++ b/drivers/media/dvb-core/dvb_demux.c
@@ -424,12 +424,12 @@ static void dvb_dmx_swfilter_packet(stru
 				printk(KERN_INFO "TS speed %llu Kbits/sec \n",
 						div64_u64(speed_bytes,
 							speed_timedelta));
-			};
+			}
 
 			demux->speed_last_time = cur_time;
 			demux->speed_pkts_cnt = 0;
-		};
-	};
+		}
+	}
 
 	if (buf[1] & 0x80) {
 		dprintk_tscheck("TEI detected. "
@@ -451,9 +451,9 @@ static void dvb_dmx_swfilter_packet(stru
 						buf[3] & 0xf);
 
 			demux->cnt_storage[pid] = ((buf[3] & 0xf) + 1)&0xf;
-		};
+		}
 		/* end check */
-	};
+	}
 
 	list_for_each_entry(feed, &demux->feed_list, list_head) {
 		if ((feed->pid != pid) && (feed->pid != 0x2000))

