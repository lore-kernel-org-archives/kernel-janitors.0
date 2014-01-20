From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Jan 2014 10:30:47 +0000
Subject: [patch] x86, microcode: remove an unneeded NULL check
Message-Id: <20140120103046.GC14233@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"uci" is an element of the ucode_cpu_info[] array, it can't be NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index 15c987698b0f..05db44e4198c 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -382,7 +382,7 @@ static enum ucode_state microcode_init_cpu(int cpu, bool refresh_fw)
 	enum ucode_state ustate;
 	struct ucode_cpu_info *uci = ucode_cpu_info + cpu;
 
-	if (uci && uci->valid)
+	if (uci->valid)
 		return UCODE_OK;
 
 	if (collect_cpu_info(cpu))
