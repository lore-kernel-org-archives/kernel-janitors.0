From: Colin King <colin.king@canonical.com>
Date: Tue, 21 Jul 2020 10:02:17 +0000
Subject: [PATCH][next] x86/ioperm: initialize pointer bitmap with NULL rather than 0
Message-Id: <20200721100217.407975-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer bitmap is being initialized with a plain integer 0,
fix this by initializing it with a NULL instead.

Cleans up sparse warning:
arch/x86/xen/enlighten_pv.c:876:27: warning: Using plain integer
as NULL pointer

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/xen/enlighten_pv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index c46b9f2e732f..2aab43a13a8c 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -873,7 +873,7 @@ static void xen_load_sp0(unsigned long sp0)
 static void xen_invalidate_io_bitmap(void)
 {
 	struct physdev_set_iobitmap iobitmap = {
-		.bitmap = 0,
+		.bitmap = NULL,
 		.nr_ports = 0,
 	};
 
-- 
2.27.0
