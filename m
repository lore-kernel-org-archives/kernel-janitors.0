From: Colin King <colin.king@canonical.com>
Date: Tue, 11 Feb 2020 16:02:59 +0000
Subject: [PATCH][next] io_uring: fix return of an uninitialized variable ret
Message-Id: <20200211160259.90660-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently variable ret is not initialized and this value is being
returned at the end of the function io_poll_double_wake.  Since
ret is not being used anywhere else remove it and just return 0.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: f6e84af0767f ("io_uring: allow POLL_ADD with double poll_wait() users")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/io_uring.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index 72bc378edebc..5c6a899b51d8 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -3707,7 +3707,6 @@ static int io_poll_double_wake(struct wait_queue_entry *wait, unsigned mode,
 	struct io_poll_iocb *poll = (void *) req->io;
 	__poll_t mask = key_to_poll(key);
 	bool done = true;
-	int ret;
 
 	/* for instances that support it check for an event match first: */
 	if (mask && !(mask & poll->events))
@@ -3725,7 +3724,7 @@ static int io_poll_double_wake(struct wait_queue_entry *wait, unsigned mode,
 	if (!done)
 		__io_poll_wake(req, poll, mask);
 	refcount_dec(&req->refs);
-	return ret;
+	return 0;
 }
 
 struct io_poll_table {
-- 
2.25.0
