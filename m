From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Dec 2018 19:19:25 +0000
Subject: [PATCH] mm, memory_hotplug: update a comment in unregister_memory()
Message-Id: <20181219191925.GA8971@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The remove_memory_block() function was renamed to in commit
cc292b0b4302 ("drivers/base/memory.c: rename remove_memory_block() to
remove_memory_section()").

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/base/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index c9c1ee564edb..8c0d1162fba0 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -732,7 +732,7 @@ unregister_memory(struct memory_block *memory)
 {
 	BUG_ON(memory->dev.bus != &memory_subsys);
 
-	/* drop the ref. we got in remove_memory_block() */
+	/* drop the ref. we got in remove_memory_section() */
 	put_device(&memory->dev);
 	device_unregister(&memory->dev);
 }
-- 
2.17.1
