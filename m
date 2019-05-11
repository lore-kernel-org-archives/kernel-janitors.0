From: Colin King <colin.king@canonical.com>
Date: Sat, 11 May 2019 12:36:03 +0000
Subject: [PATCH] afs: remove redundant assignment to variable ret
Message-Id: <20190511123603.3265-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171120135820.32596-1-colin.king@canonical.com>
In-Reply-To: <20171120135820.32596-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being assigned a value however this is never
read and later it is being reassigned to a new value. The assignment
is redundant and hence can be removed.

Addresses-Coverity: ("Unused Value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/afs/xattr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
index c81f85003fc7..25cb7ad4fca3 100644
--- a/fs/afs/xattr.c
+++ b/fs/afs/xattr.c
@@ -71,7 +71,6 @@ static int afs_xattr_get_acl(const struct xattr_handler *handler,
 	if (ret = 0) {
 		ret = acl->size;
 		if (size > 0) {
-			ret = -ERANGE;
 			if (acl->size > size)
 				return -ERANGE;
 			memcpy(buffer, acl->data, acl->size);
-- 
2.20.1
