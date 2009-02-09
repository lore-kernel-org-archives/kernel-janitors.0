From: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 09 Feb 2009 21:01:08 +0000
Subject: [PATCH] drivers/char/bsr.c: Storage class should be before const
Message-Id: <20090209210108.GA7044@xenon.distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The C99 specification states in section 6.11.5:

The placement of a storage-class specifier other than at the
beginning of the declaration specifiers in a declaration is an
obsolescent feature.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/char/bsr.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/char/bsr.c b/drivers/char/bsr.c
index f6094ae..140ea10 100644
--- a/drivers/char/bsr.c
+++ b/drivers/char/bsr.c
@@ -140,7 +140,7 @@ static int bsr_open(struct inode * inode, struct file * filp)
 	return 0;
 }
 
-const static struct file_operations bsr_fops = {
+static const struct file_operations bsr_fops = {
 	.owner = THIS_MODULE,
 	.mmap  = bsr_mmap,
 	.open  = bsr_open,
-- 
1.5.6.5

