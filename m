From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 22 Jan 2020 07:48:07 +0000
Subject: [PATCH -next v2] watch_queue: fix error return code in watch_queue_set_size()
Message-Id: <20200122074807.10849-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200120085411.116252-1-weiyongjun1@huawei.com>
In-Reply-To: <20200120085411.116252-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return negative error code -ENOMEM from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: 009b0aa00c5a ("pipe: Add general notification queue support")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 kernel/watch_queue.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
index f195cbbbb3d3..f1028761cb9c 100644
--- a/kernel/watch_queue.c
+++ b/kernel/watch_queue.c
@@ -251,6 +251,7 @@ long watch_queue_set_size(struct pipe_inode_info *pipe, unsigned int nr_notes)
 	if (ret < 0)
 		goto error;
 
+	ret = -ENOMEM;
 	pages = kcalloc(sizeof(struct page *), nr_pages, GFP_KERNEL);
 	if (!pages)
 		goto error;
