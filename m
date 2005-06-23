From: Carlo Perassi <carlo@linux.it>
Date: Thu, 23 Jun 2005 19:33:38 +0000
Subject: [KJ] [PATCH] (1/2) - trailing, 80th and similar things
Message-Id: <20050623193338.GA4790@voyager>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83430053017261407=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============83430053017261407==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reading this driver I noticed some trailing whitespaces and tabs so I
removed them with some 80th column fitting and a few more similar
things.

Signed-off-by: Carlo Perassi <carlo@linux.it>
---
 drivers/net/wireless/atmel.c |   48 ++++++++++++++++++++++++-------------------
 1 files changed, 27 insertions(+), 21 deletions(-)

Index: linux-2.6.12/drivers/net/wireless/atmel.c
===================================================================
--- linux-2.6.12.orig/drivers/net/wireless/atmel.c
+++ linux-2.6.12/drivers/net/wireless/atmel.c
@@ -917,23 +917,24 @@
 	tx_update_descriptor(priv, header->addr1[0] & 0x01, len, buff, TX_PACKET_TYPE_MGMT);
 }
 	
-static void fast_rx_path(struct atmel_private *priv, struct ieee802_11_hdr *header, 
-			 u16 msdu_size, u16 rx_packet_loc, u32 crc)
+static void fast_rx_path(struct atmel_private *priv,
+		struct ieee802_11_hdr *header, u16 msdu_size,
+		u16 rx_packet_loc, u32 crc)
 {
 	/* fast path: unfragmented packet copy directly into skbuf */
-	u8 mac4[6]; 
-	struct sk_buff 	*skb;
+	u8 mac4[6];
+	struct sk_buff *skb;
 	unsigned char *skbp;
-	
+
 	/* get the final, mac 4 header field, this tells us encapsulation */
 	atmel_copy_to_host(priv->dev, mac4, rx_packet_loc + 24, 6);
 	msdu_size -= 6;
-	
+
 	if (priv->do_rx_crc) {
 		crc = crc32_le(crc, mac4, 6);
 		msdu_size -= 4;
 	}
-	
+
 	if (!(skb = dev_alloc_skb(msdu_size + 14))) {
 		priv->stats.rx_dropped++;
 		return;
@@ -941,29 +942,31 @@
 
 	skb_reserve(skb, 2);
 	skbp = skb_put(skb, msdu_size + 12);
-	atmel_copy_to_host(priv->dev, skbp + 12, rx_packet_loc + 30, msdu_size);
-	
+	atmel_copy_to_host(priv->dev, skbp + 12, rx_packet_loc + 30,
+			msdu_size);
+
 	if (priv->do_rx_crc) {
 		u32 netcrc;
 		crc = crc32_le(crc, skbp + 12, msdu_size);
-		atmel_copy_to_host(priv->dev, (void *)&netcrc, rx_packet_loc + 30 + msdu_size, 4);
+		atmel_copy_to_host(priv->dev, (void *)&netcrc,
+				rx_packet_loc + 30 + msdu_size, 4);
 		if ((crc ^ 0xffffffff) != netcrc) {
 			priv->stats.rx_crc_errors++;
 			dev_kfree_skb(skb);
 			return;
 		}
 	}
-	
+
 	memcpy(skbp, header->addr1, 6); /* destination address */
-	if (le16_to_cpu(header->frame_ctl) & IEEE802_11_FCTL_FROMDS) 
+	if (le16_to_cpu(header->frame_ctl) & IEEE802_11_FCTL_FROMDS)
 		memcpy(&skbp[6], header->addr3, 6);
 	else
 		memcpy(&skbp[6], header->addr2, 6); /* source address */
-	
+
 	priv->dev->last_rx=jiffies;
 	skb->dev = priv->dev;
 	skb->protocol = eth_type_trans(skb, priv->dev);
-	skb->ip_summed = CHECKSUM_NONE;	
+	skb->ip_summed = CHECKSUM_NONE;
 	netif_rx(skb);
 	priv->stats.rx_bytes += 12 + msdu_size;
 	priv->stats.rx_packets++;
@@ -1682,10 +1685,10 @@
 		
 		/* Check the size of the string */
 		if (dwrq->length > MAX_SSID_LENGTH + 1)
-			 return -E2BIG ;
+			return -E2BIG;
 		if (index != 0)
 			return -EINVAL;
-		
+
 		memcpy(priv->new_SSID, extra, dwrq->length - 1);
 		priv->new_SSID_size = dwrq->length - 1;
 	}
@@ -2271,7 +2274,7 @@
 	
 	range->we_version_source = WIRELESS_EXT;
 	range->we_version_compiled = WIRELESS_EXT;
-	range->retry_capa = IW_RETRY_LIMIT ;
+	range->retry_capa = IW_RETRY_LIMIT;
 	range->retry_flags = IW_RETRY_LIMIT;
 	range->r_time_flags = 0;
 	range->min_retry = 1;
@@ -3145,10 +3148,13 @@
 				}
 			}
 			
-			if (priv->station_state == STATION_STATE_SCANNING ) 
-				store_bss_info(priv, header, capability, beacon_interval, channel,
-					       rssi, ssid_length, &beacon->rates_el_id,
-					       subtype == C80211_SUBTYPE_MGMT_BEACON) ;
+			if (priv->station_state == STATION_STATE_SCANNING )
+				store_bss_info(priv, header, capability,
+						beacon_interval, channel,
+						rssi, ssid_length,
+						&beacon->rates_el_id,
+						subtype ==
+						C80211_SUBTYPE_MGMT_BEACON);
 		}
 		break;
 		


--===============83430053017261407==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83430053017261407==--
