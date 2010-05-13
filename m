From: Julia Lawall <julia@diku.dk>
Date: Thu, 13 May 2010 20:06:40 +0000
Subject: [PATCH 17/20] arch/x86/kernel: Use kcalloc
Message-Id: <Pine.LNX.4.64.1005132206210.6282@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kcalloc rather than the combination of kmalloc and memset.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,y,flags;
statement S;
type T;
@@

x = 
-   kmalloc
+   kcalloc
           (
-           y * sizeof(T),
+           y, sizeof(T),
                flags);
 if (x = NULL) S
-memset(x, 0, y * sizeof(T));
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/x86/kernel/uv_time.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/arch/x86/kernel/uv_time.c b/arch/x86/kernel/uv_time.c
--- a/arch/x86/kernel/uv_time.c
+++ b/arch/x86/kernel/uv_time.c
@@ -149,10 +149,9 @@ static __init int uv_rtc_allocate_timers
 {
 	int cpu;
 
-	blade_info = kmalloc(uv_possible_blades * sizeof(void *), GFP_KERNEL);
+	blade_info = kcalloc(uv_possible_blades, sizeof(void *), GFP_KERNEL);
 	if (!blade_info)
 		return -ENOMEM;
-	memset(blade_info, 0, uv_possible_blades * sizeof(void *));
 
 	for_each_present_cpu(cpu) {
 		int nid = cpu_to_node(cpu);
