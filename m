From: David Howells <dhowells@redhat.com>
Date: Mon, 20 Jan 2020 11:32:28 +0000
Subject: Re: [PATCH -next] watch_queue: Fix error return code in watch_queue_set_size()
Message-Id: <771479.1579519948@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200120085411.116252-1-weiyongjun1@huawei.com>
In-Reply-To: <20200120085411.116252-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: dhowells@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

>  	pages = kcalloc(sizeof(struct page *), nr_pages, GFP_KERNEL);
> -	if (!pages)
> +	if (!pages) {
> +		ret = -ENOMEM;

I think the preferred method would be to set ret before calling kcalloc as the
attached.

David
---

diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
index 8c625cf451e6..a11724d66834 100644
--- a/kernel/watch_queue.c
+++ b/kernel/watch_queue.c
@@ -249,6 +249,7 @@ long watch_queue_set_size(struct pipe_inode_info *pipe, unsigned int nr_notes)
 	if (ret < 0)
 		goto error;
 
+	ret = -ENOMEM;
 	pages = kcalloc(sizeof(struct page *), nr_pages, GFP_KERNEL);
 	if (!pages)
 		goto error;
