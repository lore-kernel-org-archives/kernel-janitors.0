From: Vasiliy Kulikov <segoon@openwall.com>
Date: Sun, 21 Nov 2010 17:39:54 +0000
Subject: [PATCH] gpu: vga: fix ZERO_SIZE_PTR dereference
Message-Id: <1290361196-14999-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Tiago Vignatti <tiago.vignatti@nokia.com>, Mike Travis <travis@sgi.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org

count is not checked before kmalloc() call, if it is -1 then
kmalloc() returns ZERO_SIZE_PTR. This pointer is then dereferenced.
Also one may pass too big count to generate OOM condition.
To prevent this limit 'count' maximum value.  PAGE_SIZE looks OK.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested only.

 drivers/gpu/vga/vgaarb.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
index c380c65..09e3090 100644
--- a/drivers/gpu/vga/vgaarb.c
+++ b/drivers/gpu/vga/vgaarb.c
@@ -836,6 +836,8 @@ static ssize_t vga_arb_write(struct file *file, const char __user * buf,
 	int ret_val;
 	int i;
 
+	if (count > PAGE_SIZE)
+		count = PAGE_SIZE;
 
 	kbuf = kmalloc(count + 1, GFP_KERNEL);
 	if (!kbuf)
-- 
1.7.0.4

