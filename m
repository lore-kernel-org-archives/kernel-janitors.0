From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 02 Oct 2015 07:47:29 +0000
Subject: [patch] nl802154: Missing return in nl802154_add_llsec_key()
Message-Id: <20151002074729.GA16768@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20151002071958.GA565@omega>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Aring <alex.aring@gmail.com>
Cc: linux-wpan@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, kernel-janitors@vger.kernel.org

There was a missing return here so it meant that often
ieee802154_llsec_parse_key_id() was not called.

Fixes: a26c5fd7622d ('nl802154: add support for security layer')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/ieee802154/nl802154.c b/net/ieee802154/nl802154.c
index 1e9e865..16ef0d9 100644
--- a/net/ieee802154/nl802154.c
+++ b/net/ieee802154/nl802154.c
@@ -1534,6 +1534,7 @@ static int nl802154_add_llsec_key(struct sk_buff *skb, struct genl_info *info)
 
 	if (!attrs[NL802154_KEY_ATTR_USAGE_FRAMES] ||
 	    !attrs[NL802154_KEY_ATTR_BYTES])
+		return -EINVAL;
 
 	if (ieee802154_llsec_parse_key_id(attrs[NL802154_KEY_ATTR_ID], &id) < 0)
 		return -ENOBUFS;
