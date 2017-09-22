From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 22 Sep 2017 20:06:50 +0000
Subject: [PATCH] staging: rtl8192u: Fix some error handling path
Message-Id: <20170922200650.18103-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, singhalsimran0@gmail.com, baoyou.xie@linaro.org, davem@davemloft.net, jarod@redhat.com, szekelyszilv@gmail.com, elia.f.geretto@gmail.com, gs051095@gmail.com, shreeya.patel23498@gmail.com, robsonde@gmail.com, colin.king@canonical.com
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'rtl8192_usb_initendpoints()' fails, it may have allocated some
resources that need to be freed. The corresponding is propagated up to
'rtl8192_usb_prob()'. So, in this function if an error
code is returned by 'rtl8192_init()' we should call
'rtl8192_usb_deleteendpoints()'.

Some error handling code is also duplicated in 'rtl8192_init()' and in
'rtl8192_usb_prob()'. This looks harmless because the freed pointers are
set to NULL but it looks confusing.

Fix all that by just moving the 'fail' label and removing duplicated
error handling code from 'rtl8192_ini()'. All this resources freeing will
be handled by 'rtl8192_usb_prob()' directly.

The calling graph is:
rtl8192_usb_probe
  --> rtl8192_init
    --> rtl8192_usb_initendpoints

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is compile tested and the corresponding looks a bit tricky.
So, review carefully :)
---
 drivers/staging/rtl8192u/r8192U_core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 48b7fd071900..8701ce25abe4 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -2694,9 +2694,6 @@ static short rtl8192_init(struct net_device *dev)
 	err = rtl8192_read_eeprom_info(dev);
 	if (err) {
 		DMESG("Reading EEPROM info failed");
-		kfree(priv->pFirmware);
-		priv->pFirmware = NULL;
-		free_ieee80211(dev);
 		return err;
 	}
 	rtl8192_get_channel_map(dev);
@@ -4998,11 +4995,11 @@ static int rtl8192_usb_probe(struct usb_interface *intf,
 
 fail2:
 	rtl8192_down(dev);
+fail:
 	kfree(priv->pFirmware);
 	priv->pFirmware = NULL;
 	rtl8192_usb_deleteendpoints(dev);
 	mdelay(10);
-fail:
 	free_ieee80211(dev);
 
 	RT_TRACE(COMP_ERR, "wlan driver load failed\n");
-- 
2.11.0

