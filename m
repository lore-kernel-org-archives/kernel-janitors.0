From: Jiri Olsa <olsajiri@gmail.com>
Date: Mon, 05 Nov 2007 20:14:01 +0000
Subject: [PATCH] net: Removing duplicit #includes
Message-Id: <472F7989.9090300@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removing duplicit #includes for net/
Signed-off-by: Jiri Olsa <olsajiri@gmail.com>
---
net/core/dst.c                       |    1 -
net/ieee80211/ieee80211_crypt_tkip.c |    1 -
net/ieee80211/ieee80211_crypt_wep.c  |    1 -
3 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/net/core/dst.c b/net/core/dst.c
index 16958e6..03daead 100644
--- a/net/core/dst.c
+++ b/net/core/dst.c
@@ -18,7 +18,6 @@
#include <linux/types.h>
#include <net/net_namespace.h>

-#include <net/net_namespace.h>
#include <net/dst.h>

/*
diff --git a/net/ieee80211/ieee80211_crypt_tkip.c
b/net/ieee80211/ieee80211_crypt_tkip.c
index 4cce353..58b2261 100644
--- a/net/ieee80211/ieee80211_crypt_tkip.c
+++ b/net/ieee80211/ieee80211_crypt_tkip.c
@@ -25,7 +25,6 @@
#include <net/ieee80211.h>

#include <linux/crypto.h>
-#include <linux/scatterlist.h>
#include <linux/crc32.h>

MODULE_AUTHOR("Jouni Malinen");
diff --git a/net/ieee80211/ieee80211_crypt_wep.c
b/net/ieee80211/ieee80211_crypt_wep.c
index 866fc04..3fa30c4 100644
--- a/net/ieee80211/ieee80211_crypt_wep.c
+++ b/net/ieee80211/ieee80211_crypt_wep.c
@@ -22,7 +22,6 @@
#include <net/ieee80211.h>

#include <linux/crypto.h>
-#include <linux/scatterlist.h>
#include <linux/crc32.h>

MODULE_AUTHOR("Jouni Malinen");


