From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 04 Feb 2021 07:56:24 +0000
Subject: [PATCH] fscache: rectify minor kernel-doc issues
Message-Id: <20210204075624.27915-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com, linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

The command './scripts/kernel-doc -none include/linux/fscache.h' reports
some minor mismatches of the kernel-doc and function signature, which are
easily resolved.

Rectify the kernel-doc, such that no issues remain for fscache.h.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20210202

David, please pick the quick kernel-doc fix.

 include/linux/fscache.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 3f177faa0ac2..7e1f12e52baf 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -418,7 +418,7 @@ int fscache_pin_cookie(struct fscache_cookie *cookie)
 }
 
 /**
- * fscache_pin_cookie - Unpin a data-storage cache object in its cache
+ * fscache_unpin_cookie - Unpin a data-storage cache object in its cache
  * @cookie: The cookie representing the cache object
  *
  * Permit data-storage cache objects to be unpinned from the cache.
@@ -490,7 +490,7 @@ void fscache_wait_on_invalidate(struct fscache_cookie *cookie)
 /**
  * fscache_reserve_space - Reserve data space for a cached object
  * @cookie: The cookie representing the cache object
- * @i_size: The amount of space to be reserved
+ * @size: The amount of space to be reserved
  *
  * Reserve an amount of space in the cache for the cache object attached to a
  * cookie so that a write to that object within the space can always be
-- 
2.17.1
