From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Oct 2012 08:26:04 +0000
Subject: [patch] staging: rtl8192u: fix a macro expansion bug
Message-Id: <20121002082604.GC12398@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Clang detected this macro expansion bug:
drivers/staging/rtl8192u/r8192U_core.c:2384:76: warning: operator '?:'
	has lower precedence than '+'; '+' will be evaluated first
	[-Wparentheses]

The line from the .c file looks like this:
	u1bAIFS = qos_parameters->aifs[i] * ((mode&(IEEE_G|IEEE_N_24G)) ?9:20) + aSifsTime;

We need to put parenthesis around the entire macro to fix the bug.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211.h b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
index 13f45c3..502bfdb 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211.h
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
@@ -235,7 +235,10 @@ enum	_ReasonCode{
 
 
 
-#define aSifsTime	 ((priv->ieee80211->current_network.mode = IEEE_A)||(priv->ieee80211->current_network.mode = IEEE_N_24G)||(priv->ieee80211->current_network.mode = IEEE_N_5G))? 16 : 10
+#define aSifsTime ((priv->ieee80211->current_network.mode = IEEE_A || \
+		    priv->ieee80211->current_network.mode = IEEE_N_24G || \
+		    priv->ieee80211->current_network.mode = IEEE_N_5G) ? \
+		   16 : 10)
 
 #define MGMT_QUEUE_NUM 5
 
