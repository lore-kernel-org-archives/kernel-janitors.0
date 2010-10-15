From: Julia Lawall <julia@diku.dk>
Date: Fri, 15 Oct 2010 12:56:39 +0000
Subject: [PATCH 3/7] drivers/net/wireless/p54/eeprom.c: Return -ENOMEM on memory allocation failure
Message-Id: <1287147610-8041-3-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: kernel-janitors@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In this code, 0 is returned on memory allocation failure, even though other
failures return -ENOMEM or other similar values.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression ret;
expression x,e1,e2,e3;
@@

ret = 0
... when != ret = e1
*x = \(kmalloc\|kcalloc\|kzalloc\)(...)
... when != ret = e2
if (x = NULL) { ... when != ret = e3
  return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/wireless/p54/eeprom.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff -u -p a/drivers/net/wireless/p54/eeprom.c b/drivers/net/wireless/p54/eeprom.c
--- a/drivers/net/wireless/p54/eeprom.c
+++ b/drivers/net/wireless/p54/eeprom.c
@@ -261,8 +261,10 @@ static int p54_generate_channel_lists(st
 	list->max_entries = max_channel_num;
 	list->channels = kzalloc(sizeof(struct p54_channel_entry) *
 				 max_channel_num, GFP_KERNEL);
-	if (!list->channels)
+	if (!list->channels) {
+		ret = -ENOMEM;
 		goto free;
+	}
 
 	for (i = 0; i < max_channel_num; i++) {
 		if (i < priv->iq_autocal_len) {

