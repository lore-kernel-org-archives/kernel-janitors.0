From: Matthew Wilcox <willy@infradead.org>
Date: Wed, 06 Jan 2021 14:34:01 +0000
Subject: Re: [PATCH] io_uring: fix an IS_ERR() vs NULL check
Message-Id: <20210106143401.GD175893@casper.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X/WCTxIRT4SHLemV@mwanda>
 <c88d8500-681d-7503-77ca-ae10d230a11b@gmail.com>
In-Reply-To: <c88d8500-681d-7503-77ca-ae10d230a11b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Jens Axboe <axboe@kernel.dk>, Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 06, 2021 at 12:32:45PM +0000, Pavel Begunkov wrote:
> On 06/01/2021 09:26, Dan Carpenter wrote:
> > The alloc_fixed_file_ref_node() function never returns NULL, it returns
> > error pointers on error.
> > 
> > Fixes: 1ffc54220c44 ("io_uring: fix io_sqe_files_unregister() hangs")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> thanks Dan,
> 
> Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>
> Cc: stable@vger.kernel.org # 5.6+

But the only error that alloc_fixed_file_ref_node() can return is
-ENOMEM, so I think it'd be better to actually return NULL for errors.
It makes the other callers simpler:

+++ b/fs/io_uring.c
@@ -7684,12 +7684,12 @@ static struct fixed_file_ref_node *alloc_fixed_file_ref_node(
 
        ref_node = kzalloc(sizeof(*ref_node), GFP_KERNEL);
        if (!ref_node)
-               return ERR_PTR(-ENOMEM);
+               return NULL;
 
        if (percpu_ref_init(&ref_node->refs, io_file_data_ref_zero,
                            0, GFP_KERNEL)) {
                kfree(ref_node);
-               return ERR_PTR(-ENOMEM);
+               return NULL;
        }
        INIT_LIST_HEAD(&ref_node->node);
        INIT_LIST_HEAD(&ref_node->file_list);
@@ -7783,9 +7783,9 @@ static int io_sqe_files_register(struct io_ring_ctx *ctx, 
void __user *arg,
        }
 
        ref_node = alloc_fixed_file_ref_node(ctx);
-       if (IS_ERR(ref_node)) {
+       if (!ref_node) {
                io_sqe_files_unregister(ctx);
-               return PTR_ERR(ref_node);
+               return -ENOMEM;
        }
 
        io_sqe_files_set_node(file_data, ref_node);
@@ -7885,8 +7885,8 @@ static int __io_sqe_files_update(struct io_ring_ctx *ctx,
                return -EINVAL;
 
        ref_node = alloc_fixed_file_ref_node(ctx);
-       if (IS_ERR(ref_node))
-               return PTR_ERR(ref_node);
+       if (!ref_node)
+               return -ENOMEM;
 
        done = 0;
        fds = u64_to_user_ptr(up->fds);

(not even compile tested)
