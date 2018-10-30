From: Colin King <colin.king@canonical.com>
Date: Tue, 30 Oct 2018 11:46:52 +0000
Subject: [PATCH] ipmi: clean an indentation issue, remove extraneous space
Message-Id: <20181030114652.17167-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openipmi-developer@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to clean up an indentation issue, remove space

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/ipmi/ipmi_ssif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
index d06e00e95891..a7701af8fcf2 100644
--- a/drivers/char/ipmi/ipmi_ssif.c
+++ b/drivers/char/ipmi/ipmi_ssif.c
@@ -1792,7 +1792,7 @@ static int ssif_probe(struct i2c_client *client, const struct i2c_device_id *id)
 			       ssif_info,
 			       &ssif_info->client->dev,
 			       slave_addr);
-	 if (rv) {
+	if (rv) {
 		pr_err("Unable to register device: error %d\n", rv);
 		goto out_remove_attr;
 	}
-- 
2.19.1
