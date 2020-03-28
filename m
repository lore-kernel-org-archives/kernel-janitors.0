From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 28 Mar 2020 09:53:09 +0000
Subject: [PATCH] net: dsa: Simplify 'dsa_tag_protocol_to_str()'
Message-Id: <20200328095309.27389-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrew@lunn.ch, vivien.didelot@gmail.com, davem@davemloft.net, kuba@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is no point in preparing the module name in a buffer. The format
string can be passed diectly to 'request_module()'.

This axes a few lines of code and cleans a few things:
   - max len for a driver name is MODULE_NAME_LEN wich is ~ 60 chars,
     not 128. It would be down-sized in 'request_module()'
   - we should pass the total size of the buffer to 'snprintf()', not the
     size minus 1

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This was introduced in 367561753144 ("dsa: Make use of the list of tag drivers")
---
 net/dsa/dsa.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/net/dsa/dsa.c b/net/dsa/dsa.c
index 17281fec710c..ee2610c4d46a 100644
--- a/net/dsa/dsa.c
+++ b/net/dsa/dsa.c
@@ -88,13 +88,9 @@ const struct dsa_device_ops *dsa_tag_driver_get(int tag_protocol)
 {
 	struct dsa_tag_driver *dsa_tag_driver;
 	const struct dsa_device_ops *ops;
-	char module_name[128];
 	bool found = false;
 
-	snprintf(module_name, 127, "%s%d", DSA_TAG_DRIVER_ALIAS,
-		 tag_protocol);
-
-	request_module(module_name);
+	request_module("%s%d", DSA_TAG_DRIVER_ALIAS, tag_protocol);
 
 	mutex_lock(&dsa_tag_drivers_lock);
 	list_for_each_entry(dsa_tag_driver, &dsa_tag_drivers_list, list) {
-- 
2.20.1
