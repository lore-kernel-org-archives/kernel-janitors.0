From: david.chosrova@libertysurf.fr
Date: Wed, 24 Nov 2010 21:41:43 +0000
Subject: [PATCH] Fix sparse message rtl8192u
Message-Id: <1290634903.4ced8697b0603@webmail.aliceadsl.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Hello,

Fix sparse message:

drivers/staging/rtl8192u/r8192U_core.c:247:1: warning: "eqMacAddr" redefined
In file included from drivers/staging/rtl8192u/:81:81:
drivers/staging/rtl8192u/dot11d.h:35:1: warning: this is the location of the
previous definition


if ENABLE_DOT11D is enabled eqMacAddr is defined twice.

Signed-off-by: David Chosrova <david.chosrova@libertysurf.fr>




diff --git a/drivers/staging/rtl8192u/r8192U_core.c
b/drivers/staging/rtl8192u/r8192U_core.c
index 494f180..4a4a747 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -242,10 +242,12 @@ static void rtl819x_set_channel_map(u8 channel_plan,
struct r8192_priv* priv)
        }
        return;
 }
-#endif
+#else

 #define eqMacAddr(a,b) ( ((a)[0]=(b)[0] && (a)[1]=(b)[1] && (a)[2]=(b)[2] &&
(a)[3]=(b)[3] && (a)[4]=(b)[4] && (a)[5]=(b)[5]) ? 1:0 )

+#endif
+
 #define        rx_hal_is_cck_rate(_pdrvinfo)\
                        (_pdrvinfo->RxRate = DESC90_RATE1M ||\
                        _pdrvinfo->RxRate = DESC90_RATE2M ||\


