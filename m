From: Vasiliy Kulikov <segooon@gmail.com>
Date: Wed, 10 Nov 2010 20:38:02 +0000
Subject: [PATCH] fs: select: fix information leak to userspace
Message-Id: <1289421483-23907-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

On some architectures __kernel_suseconds_t is int.  On these archs
struct timeval has padding bytes at the end.  This struct is copied to
userspace with these padding bytes uninitialized.  This leads to leaking
of contents of kernel stack memory.

This bug was added with v2.6.27-rc5-286-gb773ad4.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 fs/select.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/select.c b/fs/select.c
index b7b10aa..32cf018 100644
--- a/fs/select.c
+++ b/fs/select.c
@@ -306,6 +306,7 @@ static int poll_select_copy_remaining(struct timespec *end_time, void __user *p,
 		rts.tv_sec = rts.tv_nsec = 0;
 
 	if (timeval) {
+		memset(&rtv, 0, sizeof(rtv));
 		rtv.tv_sec = rts.tv_sec;
 		rtv.tv_usec = rts.tv_nsec / NSEC_PER_USEC;
 
-- 
1.7.0.4

