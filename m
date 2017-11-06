From: Colin King <colin.king@canonical.com>
Date: Mon, 06 Nov 2017 10:42:09 +0000
Subject: [PATCH] metag: fix spelling mistake: "segement" -> "segment"
Message-Id: <20171106104209.25369-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Hogan <jhogan@kernel.org>, Ingo Molnar <mingo@kernel.org>, linux-metag@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in pr_info message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/metag/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/metag/kernel/process.c b/arch/metag/kernel/process.c
index bde9c938bd4a..aaa7a9467ed6 100644
--- a/arch/metag/kernel/process.c
+++ b/arch/metag/kernel/process.c
@@ -394,7 +394,7 @@ static unsigned long elf_vm_mmap(struct file *filep, unsigned long addr,
 		return map_addr;
 
 	if ((type & MAP_FIXED) && map_addr != addr) {
-		pr_info("Uhuuh, elf segement at %p requested but the memory is mapped already\n",
+		pr_info("Uhuuh, elf segment at %p requested but the memory is mapped already\n",
 				(void*)addr);
 		return -EAGAIN;
 	}
-- 
2.14.1

