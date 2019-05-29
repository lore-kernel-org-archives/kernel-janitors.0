From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 May 2019 11:10:41 +0000
Subject: [PATCH] agp: Re-order a condition to please static checkers
Message-Id: <20190529111041.GE19119@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

It's nicer to check for integer overflow first and then check for if
the "page_count" is within bounds, otherwise static checkers complain.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/char/agp/generic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/agp/generic.c b/drivers/char/agp/generic.c
index 658664a5a5aa..89901e5710bf 100644
--- a/drivers/char/agp/generic.c
+++ b/drivers/char/agp/generic.c
@@ -227,8 +227,8 @@ struct agp_memory *agp_allocate_memory(struct agp_bridge_data *bridge,
 		return NULL;
 
 	cur_memory = atomic_read(&bridge->current_memory_agp);
-	if ((cur_memory + page_count > bridge->max_memory_agp) ||
-	    (cur_memory + page_count < page_count))
+	if ((cur_memory + page_count < page_count) ||
+	    (cur_memory + page_count > bridge->max_memory_agp))
 		return NULL;
 
 	if (type >= AGP_USER_TYPES) {
-- 
2.20.1
