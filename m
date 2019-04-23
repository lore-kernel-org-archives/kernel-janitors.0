From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 23 Apr 2019 10:40:20 +0000
Subject: [PATCH] i3c: Fix a shift wrap bug in i3c_bus_set_addr_slot_status()
Message-Id: <20190423104020.GA3133@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-i3c@lists.infradead.org, kernel-janitors@vger.kernel.org

The problem here is that addr can be I3C_BROADCAST_ADDR (126).  That
means we're shifting by (126 * 2) % 64 which is 60.  The
I3C_ADDR_SLOT_STATUS_MASK is an enum which is an unsigned int in GCC
so shifts greater than 31 are undefined.

Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This patch is from static analysis.  I really know what *ptr is used for
and I haven't tested the code.  The other question is would be testing
this code on 32 bit systems.  Please review carefully.

 drivers/i3c/master.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 1412abcff010..5f4bd52121fe 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -385,8 +385,9 @@ static void i3c_bus_set_addr_slot_status(struct i3c_bus *bus, u16 addr,
 		return;
 
 	ptr = bus->addrslots + (bitpos / BITS_PER_LONG);
-	*ptr &= ~(I3C_ADDR_SLOT_STATUS_MASK << (bitpos % BITS_PER_LONG));
-	*ptr |= status << (bitpos % BITS_PER_LONG);
+	*ptr &= ~((unsigned long)I3C_ADDR_SLOT_STATUS_MASK <<
+						(bitpos % BITS_PER_LONG));
+	*ptr |= (unsigned long)status << (bitpos % BITS_PER_LONG);
 }
 
 static bool i3c_bus_dev_addr_is_avail(struct i3c_bus *bus, u8 addr)
-- 
2.18.0
