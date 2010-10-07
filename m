From: Dan Carpenter <error27@gmail.com>
Date: Thu, 07 Oct 2010 07:16:10 +0000
Subject: [patch] infiniband: uverbs: limit the number of entries
Message-Id: <20101007071610.GC11681@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

If we don't limit cmd.ne then the multiplications can overflow.  This
will allocate a small amount of RAM successfully for the "resp" and
"wc" buffers.  The heap will get corrupted when we call ib_poll_cq().

Documentation/infiniband/user_verbs.txt suggests this function is meant
for unprivileged access.

I chose to limit the number of entries to 1000.  That limits the
allocations to 52kb of RAM at the most.  I didn't want to choose a
lower number and break userspace for someone.

Also we don't necessarily fill the "resp" buffer so I changed the
kmalloc() to a kzalloc() to avoid an information leak.

CC: stable@kernel.org
Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/infiniband/core/uverbs.h b/drivers/infiniband/core/uverbs.h
--- a/drivers/infiniband/core/uverbs.h
+++ b/drivers/infiniband/core/uverbs.h
@@ -162,6 +162,7 @@ void ib_uverbs_srq_event_handler(struct ib_event *event, void *context_ptr);
 void ib_uverbs_event_handler(struct ib_event_handler *handler,
 			     struct ib_event *event);
 
+#define UVERBS_MAX_NUM_ENTRIES 1000
 #define IB_UVERBS_DECLARE_CMD(name)					\
 	ssize_t ib_uverbs_##name(struct ib_uverbs_file *file,		\
 				 const char __user *buf, int in_len,	\
diff --git a/drivers/infiniband/core/uverbs_cmd.c b/drivers/infiniband/core/uverbs_cmd.c
--- a/drivers/infiniband/core/uverbs_cmd.c
+++ b/drivers/infiniband/core/uverbs_cmd.c
@@ -906,12 +906,15 @@ ssize_t ib_uverbs_poll_cq(struct ib_uverbs_file *file,
 	if (copy_from_user(&cmd, buf, sizeof cmd))
 		return -EFAULT;
 
+	if (cmd.ne > UVERBS_MAX_NUM_ENTRIES)
+		return -EINVAL;
+
 	wc = kmalloc(cmd.ne * sizeof *wc, GFP_KERNEL);
 	if (!wc)
 		return -ENOMEM;
 
 	rsize = sizeof *resp + cmd.ne * sizeof(struct ib_uverbs_wc);
-	resp = kmalloc(rsize, GFP_KERNEL);
+	resp = kzalloc(rsize, GFP_KERNEL);
 	if (!resp) {
 		ret = -ENOMEM;
 		goto out_wc;
