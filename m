From: Julia Lawall <julia@diku.dk>
Date: Tue, 26 Oct 2010 10:25:33 +0000
Subject: [PATCH 4/14] drivers/staging/brcm80211/brcmfmac/dhd_linux.c: delete double assignment
Message-Id: <1288088743-3725-5-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288088743-3725-1-git-send-email-julia@diku.dk>
In-Reply-To: <1288088743-3725-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brett Rudley <brudley@broadcom.com>
Cc: kernel-janitors@vger.kernel.org, Henry Ptasinski <henryp@broadcom.com>, Nohee Ko <noheek@broadcom.com>, Greg Kroah-Hartman <gregkh@suse.de>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Delete successive assignments to the same location.  dhd_ops_virt contains
a subset of the definitions of dhd_ops_pri.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression i;
@@

*i = ...;
 i = ...;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/brcm80211/brcmfmac/dhd_linux.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/brcm80211/brcmfmac/dhd_linux.c b/drivers/staging/brcm80211/brcmfmac/dhd_linux.c
index e535787..30b8e9b 100644
--- a/drivers/staging/brcm80211/brcmfmac/dhd_linux.c
+++ b/drivers/staging/brcm80211/brcmfmac/dhd_linux.c
@@ -2222,8 +2222,6 @@ int dhd_net_attach(dhd_pub_t *dhdp, int ifidx)
 	ASSERT(net);
 
 	ASSERT(!net->netdev_ops);
-	net->netdev_ops = &dhd_ops_virt;
-
 	net->netdev_ops = &dhd_ops_pri;
 
 	/*

