From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 May 2013 06:57:36 +0000
Subject: [patch 2/2] Staging: rtl8192e: printing the wrong array
Message-Id: <20130529065736.GB25133@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch complained that there is an array overflow here.  It looks
like we are supposed to be printing the ->rates_ex[] array which is
slightly larger than the ->rates[] array.  This is a cut and paste
error.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 8b8a5c6..e75364e 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1822,7 +1822,7 @@ int rtllib_parse_info_param(struct rtllib_device *ieee,
 				network->rates_ex[i] = info_element->data[i];
 				p += snprintf(p, sizeof(rates_str) -
 					      (p - rates_str), "%02X ",
-					      network->rates[i]);
+					      network->rates_ex[i]);
 				if (rtllib_is_ofdm_rate
 				    (info_element->data[i])) {
 					network->flags |= NETWORK_HAS_OFDM;
