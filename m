From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 02 Aug 2017 08:35:14 +0000
Subject: [PATCH] orangefs: constify xattr_handler structure
Message-Id: <1501662914-26665-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marshall <hubcap@omnibond.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The xattr_handler structure is only stored in an array of const
structures.  Thus the xattr_handler structure itself can be
const.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/orangefs/xattr.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/orangefs/xattr.c b/fs/orangefs/xattr.c
index 237c9c0..5f86bf9 100644
--- a/fs/orangefs/xattr.c
+++ b/fs/orangefs/xattr.c
@@ -442,7 +442,7 @@ static int orangefs_xattr_get_default(const struct xattr_handler *handler,
 
 }
 
-static struct xattr_handler orangefs_xattr_default_handler = {
+static const struct xattr_handler orangefs_xattr_default_handler = {
 	.prefix = "",  /* match any name => handlers called with full name */
 	.get = orangefs_xattr_get_default,
 	.set = orangefs_xattr_set_default,

