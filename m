From: Colin King <colin.king@canonical.com>
Date: Tue, 17 Oct 2017 14:38:37 +0000
Subject: [PATCH] mm/hmm: remove redundant variable align_end
Message-Id: <20171017143837.23207-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable align_end is assigned a value but it is never read, so
the variable is redundant and can be removed. Cleans up the clang
warning: Value stored to 'align_end' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 mm/hmm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index a88a847bccba..ea19742a5d60 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -803,11 +803,10 @@ static RADIX_TREE(hmm_devmem_radix, GFP_KERNEL);
 
 static void hmm_devmem_radix_release(struct resource *resource)
 {
-	resource_size_t key, align_start, align_size, align_end;
+	resource_size_t key, align_start, align_size;
 
 	align_start = resource->start & ~(PA_SECTION_SIZE - 1);
 	align_size = ALIGN(resource_size(resource), PA_SECTION_SIZE);
-	align_end = align_start + align_size - 1;
 
 	mutex_lock(&hmm_devmem_lock);
 	for (key = resource->start;
-- 
2.14.1

