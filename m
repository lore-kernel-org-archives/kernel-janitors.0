From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Mar 2014 11:26:50 +0000
Subject: [patch] staging: rtl8712: fix some confusing indenting
Message-Id: <20140305112650.GE16926@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

These set off a static checker warning about "warn: add curly braces?",
but actually the code it correct, it's just the indenting which is
wrong.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8712/ieee80211.c b/drivers/staging/rtl8712/ieee80211.c
index cc68d9748edb..57fef70ad984 100644
--- a/drivers/staging/rtl8712/ieee80211.c
+++ b/drivers/staging/rtl8712/ieee80211.c
@@ -78,9 +78,9 @@ uint r8712_is_cckrates_included(u8 *rate)
 		if ((((rate[i]) & 0x7f) = 2) || (((rate[i]) & 0x7f) = 4) ||
 		    (((rate[i]) & 0x7f) = 11) || (((rate[i]) & 0x7f) = 22))
 			return true;
-			i++;
-		}
-		return false;
+		i++;
+	}
+	return false;
 }
 
 uint r8712_is_cckratesonly_included(u8 *rate)
diff --git a/drivers/staging/rtl8712/rtl871x_security.c b/drivers/staging/rtl8712/rtl871x_security.c
index aae5125a2e7e..5ffc489e9501 100644
--- a/drivers/staging/rtl8712/rtl871x_security.c
+++ b/drivers/staging/rtl8712/rtl871x_security.c
@@ -1244,17 +1244,18 @@ static sint aes_decipher(u8 *key, uint	hdrlen,
 	    (frtype = WIFI_DATA_CFPOLL) ||
 	    (frtype = WIFI_DATA_CFACKPOLL)) {
 		qc_exists = 1;
-		if (hdrlen !=  WLAN_HDR_A3_QOS_LEN)
+		if (hdrlen != WLAN_HDR_A3_QOS_LEN)
 			hdrlen += 2;
-		}  else if ((frsubtype = 0x08) ||
+	} else if ((frsubtype = 0x08) ||
 		   (frsubtype = 0x09) ||
 		   (frsubtype = 0x0a) ||
 		   (frsubtype = 0x0b)) {
-			if (hdrlen !=  WLAN_HDR_A3_QOS_LEN)
-				hdrlen += 2;
-			qc_exists = 1;
-	} else
+		if (hdrlen != WLAN_HDR_A3_QOS_LEN)
+			hdrlen += 2;
+		qc_exists = 1;
+	} else {
 		qc_exists = 0;
+	}
 	/* now, decrypt pframe with hdrlen offset and plen long */
 	payload_index = hdrlen + 8; /* 8 is for extiv */
 	for (i = 0; i < num_blocks; i++) {
