From: John Stultz <john.stultz@linaro.org>
Date: Wed, 30 Oct 2019 16:30:40 +0000
Subject: [PATCH] dma-buf: heaps: Fix redundant assignment to variable ret in system_heap.c
Message-Id: <20191030163040.70055-1-john.stultz@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Colin King <colin.king@canonical.com>, Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>, Brian Starkey <brian.starkey@arm.com>, "Andrew F . Davis" <afd@ti.com>, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org

Colin King reported a coverity error:
 The variable ret is being assigned with a value that is never
 read, it is being re-assigned the same value on the err0 exit
 path. The assignment is redundant and hence can be removed.

He had a fix, but Andrew Davis suggested a better solution
(actually returning ret), so this patch implements that fix.

Cc: Colin King <colin.king@canonical.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Laura Abbott <labbott@redhat.com>
Cc: Brian Starkey <brian.starkey@arm.com>
Cc: Andrew F. Davis <afd@ti.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: kernel-janitors@vger.kernel.org
Addresses-Coverity: ("Unused value")
Fixes: 47a32f9c1226 ("dma-buf: heaps: Add system heap to dmabuf heaps")
Reported-by: Colin Ian King <colin.king@canonical.com>
Suggested-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/system_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 455782efbb32..9a56393e40b4 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -98,7 +98,7 @@ static int system_heap_allocate(struct dma_heap *heap,
 err0:
 	kfree(helper_buffer);
 
-	return -ENOMEM;
+	return ret;
 }
 
 static const struct dma_heap_ops system_heap_ops = {
-- 
2.17.1
