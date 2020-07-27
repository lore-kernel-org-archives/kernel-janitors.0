From: Colin King <colin.king@canonical.com>
Date: Mon, 27 Jul 2020 17:40:54 +0000
Subject: [PATCH][next] binfmt_elf: fix unsigned regset0_size compared to less than zero
Message-Id: <20200727174054.154765-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable regset0_size is an unsigned int and it is being checked
for an error by checking if it is less than zero, and hence this
check is always going to be false.  Fix this by making the variable
regset0_size signed.

Addresses-Coverity: ("Unsigned compared against 0")
Fixes: 0f17865d8847 ("introduction of regset ->get() wrappers, switching ELF coredumps to those")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/binfmt_elf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 6a171a28bdf7..13d053982dd7 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1821,7 +1821,7 @@ static int fill_thread_core_info(struct elf_thread_core_info *t,
 				 long signr, size_t *total)
 {
 	unsigned int i;
-	unsigned int regset0_size;
+	int regset0_size;
 
 	/*
 	 * NT_PRSTATUS is the one special case, because the regset data
-- 
2.27.0
