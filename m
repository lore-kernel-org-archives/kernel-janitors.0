From: Dan Carpenter <error27@gmail.com>
Date: Sat, 09 Oct 2010 11:54:06 +0000
Subject: [patch] Staging: brcm80211: make interface name buffer smaller
Message-Id: <20101009115406.GR11681@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brett Rudley <brudley@broadcom.com>
Cc: Henry Ptasinski <henryp@broadcom.com>, Nohee Ko <noheek@broadcom.com>, Greg Kroah-Hartman <gregkh@suse.de>, Jason Cooper <jason@lakedaemon.net>, Grant Grundler <grundler@chromium.org>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

In the original code the interface name was IFNAMSIZ + 1, but that
caused problems in dhd_ifname2idx() which does:
	strncmp(dhd->iflist[i]->name, name, IFNAMSIZ)

The wl_event_msg_t struct can only store 16 character names as well.

And thirdly there is a potential buffer overflow in dhd_op_if() because
if->net->name is IFNAMSIZ and we do:
	strcpy(ifp->net->name, ifp->name);

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/brcm80211/brcmfmac/dhd_linux.c b/drivers/staging/brcm80211/brcmfmac/dhd_linux.c
index 72eed5b..d513069 100644
--- a/drivers/staging/brcm80211/brcmfmac/dhd_linux.c
+++ b/drivers/staging/brcm80211/brcmfmac/dhd_linux.c
@@ -217,7 +217,7 @@ typedef struct dhd_if {
 	u8 mac_addr[ETHER_ADDR_LEN];	/* assigned MAC address */
 	bool attached;		/* Delayed attachment when unset */
 	bool txflowcontrol;	/* Per interface flow control indicator */
-	char name[IFNAMSIZ + 1];	/* linux interface name */
+	char name[IFNAMSIZ];	/* linux interface name */
 } dhd_if_t;
 
 /* Local private structure (extension of pub) */
@@ -1871,8 +1871,7 @@ dhd_add_if(dhd_info_t *dhd, int ifidx, void *handle, char *name,
 	memset(ifp, 0, sizeof(dhd_if_t));
 	ifp->info = dhd;
 	dhd->iflist[ifidx] = ifp;
-	strncpy(ifp->name, name, IFNAMSIZ);
-	ifp->name[IFNAMSIZ] = '\0';
+	strlcpy(ifp->name, name, IFNAMSIZ);
 	if (mac_addr != NULL)
 		memcpy(&ifp->mac_addr, mac_addr, ETHER_ADDR_LEN);
 
