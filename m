From: Julia Lawall <julia@diku.dk>
Date: Fri, 23 Dec 2011 13:02:55 +0000
Subject: [PATCH] drivers/usb/class/cdc-acm.c: clear dangling pointer
Message-Id: <1324645375-3535-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oliver Neukum <oliver@neukum.name>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

On some failures, the country_code field of an acm structure is freed
without freeing the acm structure itself.  Elsewhere, operations including
memcpy and kfree are performed on the country_code field.  The patch sets
the country_code field to NULL when it is freed, and likewise sets the
country_code_size field to 0.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
Only compile tested.  The second goto skip_countries serves no purpose, but
is perhaps useful from a readability point of view.

 drivers/usb/class/cdc-acm.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index f30fbff..9543b19 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1230,6 +1230,8 @@ made_compressed_probe:
 		i = device_create_file(&intf->dev, &dev_attr_wCountryCodes);
 		if (i < 0) {
 			kfree(acm->country_codes);
+			acm->country_codes = NULL;
+			acm->country_code_size = 0;
 			goto skip_countries;
 		}
 
@@ -1238,6 +1240,8 @@ made_compressed_probe:
 		if (i < 0) {
 			device_remove_file(&intf->dev, &dev_attr_wCountryCodes);
 			kfree(acm->country_codes);
+			acm->country_codes = NULL;
+			acm->country_code_size = 0;
 			goto skip_countries;
 		}
 	}

