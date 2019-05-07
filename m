From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 May 2019 08:36:34 +0000
Subject: [PATCH] genwqe: Prevent an integer overflow in the ioctl
Message-Id: <20190507083634.GA13046@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Haverkamp <haver@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There are a couple potential integer overflows here.

	round_up(m->size + (m->addr & ~PAGE_MASK), PAGE_SIZE);

The first thing is that the "m->size + (...)" addition could overflow,
and the second is that round_up() overflows to zero if the result is
within PAGE_SIZE of the type max.

In this code, the "m->size" variable is an u64 but we're saving the
result in "map_size" which is an unsigned long and genwqe_user_vmap()
takes an unsigned long as well.  So I have used ULONG_MAX as the upper
bound.  From a practical perspective unsigned long is fine/better than
trying to change all the types to u64.

Fixes: eaf4722d4645 ("GenWQE Character device and DDCB queue")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/misc/genwqe/card_dev.c   | 2 ++
 drivers/misc/genwqe/card_utils.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/misc/genwqe/card_dev.c b/drivers/misc/genwqe/card_dev.c
index 8c1b63a4337b..d2098b4d2945 100644
--- a/drivers/misc/genwqe/card_dev.c
+++ b/drivers/misc/genwqe/card_dev.c
@@ -780,6 +780,8 @@ static int genwqe_pin_mem(struct genwqe_file *cfile, struct genwqe_mem *m)
 
 	if ((m->addr = 0x0) || (m->size = 0))
 		return -EINVAL;
+	if (m->size > ULONG_MAX - PAGE_SIZE - (m->addr & ~PAGE_MASK))
+		return -EINVAL;
 
 	map_addr = (m->addr & PAGE_MASK);
 	map_size = round_up(m->size + (m->addr & ~PAGE_MASK), PAGE_SIZE);
diff --git a/drivers/misc/genwqe/card_utils.c b/drivers/misc/genwqe/card_utils.c
index 89cff9d1012b..7571700abc6e 100644
--- a/drivers/misc/genwqe/card_utils.c
+++ b/drivers/misc/genwqe/card_utils.c
@@ -586,6 +586,10 @@ int genwqe_user_vmap(struct genwqe_dev *cd, struct dma_mapping *m, void *uaddr,
 	/* determine space needed for page_list. */
 	data = (unsigned long)uaddr;
 	offs = offset_in_page(data);
+	if (size > ULONG_MAX - PAGE_SIZE - offs) {
+		m->size = 0;	/* mark unused and not added */
+		return -EINVAL;
+	}
 	m->nr_pages = DIV_ROUND_UP(offs + size, PAGE_SIZE);
 
 	m->page_list = kcalloc(m->nr_pages,
-- 
2.18.0
