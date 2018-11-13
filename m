From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 13 Nov 2018 13:56:56 +0000
Subject: [PATCH -next] powerpc64/ftrace: Drop pointless static qualifier in is_b_op()
Message-Id: <1542117416-52357-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Kate Stewart <kstewart@linuxfoundation.org>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org

There is no need to have the 'intoffset' variable static since new value
always be assigned before use it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/powerpc/kernel/trace/ftrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 4bf051d..65248d4 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -107,7 +107,7 @@ static int is_b_op(unsigned int op)
 
 static unsigned long find_bl_target(unsigned long ip, unsigned int op)
 {
-	static int offset;
+	int offset;
 
 	offset = (op & 0x03fffffc);
 	/* make it signed */
