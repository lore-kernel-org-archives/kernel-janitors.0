From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Jun 2013 12:26:20 +0000
Subject: [patch] ipw2x00: printing the wrong array in debug code
Message-Id: <20130621122620.GC24059@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stanislav Yakovlev <stas.yakovlev@gmail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that this is a read past the end of the array.  It
turns out we are printing the wrong array here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/ipw2x00/libipw_rx.c b/drivers/net/wireless/ipw2x00/libipw_rx.c
index 95a1ca1..9ffe659 100644
--- a/drivers/net/wireless/ipw2x00/libipw_rx.c
+++ b/drivers/net/wireless/ipw2x00/libipw_rx.c
@@ -1195,7 +1195,7 @@ static int libipw_parse_info_param(struct libipw_info_element
 #ifdef CONFIG_LIBIPW_DEBUG
 				p += snprintf(p, sizeof(rates_str) -
 					      (p - rates_str), "%02X ",
-					      network->rates[i]);
+					      network->rates_ex[i]);
 #endif
 				if (libipw_is_ofdm_rate
 				    (info_element->data[i])) {
