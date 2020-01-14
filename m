From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Jan 2020 05:10:05 +0000
Subject: [PATCH] media: c8sectpfe: clean up some indenting
Message-Id: <20200114051005.njxf5d6s6ycyxhfi@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Patrice Chotard <patrice.chotard@st.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The "seg_num," line wasn't indented.  All the arguments can fit nicely
on two lines.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
index 5baada4f65e5..d1518a6770fa 100644
--- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
@@ -1034,9 +1034,8 @@ static void load_imem_segment(struct c8sectpfei *fei, Elf32_Phdr *phdr,
 
 	dev_dbg(fei->dev,
 		"Loading IMEM segment %d 0x%08x\n\t (0x%x bytes) -> 0x%p (0x%x bytes)\n",
-seg_num,
-		phdr->p_paddr, phdr->p_filesz,
-		dest, phdr->p_memsz + phdr->p_memsz / 3);
+		seg_num, phdr->p_paddr, phdr->p_filesz, dest,
+		phdr->p_memsz + phdr->p_memsz / 3);
 
 	for (i = 0; i < phdr->p_filesz; i++) {
 
-- 
2.11.0
