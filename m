From: Colin King <colin.king@canonical.com>
Date: Fri, 29 Sep 2017 13:26:48 +0000
Subject: [PATCH] seccomp: make function __get_seccomp_filter static
Message-Id: <20170929132648.7589-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function __get_seccomp_filter is local to the source and does
not need to be in global scope, so make it static.

Cleans up sparse warning:
symbol '__get_seccomp_filter' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/seccomp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index bb3a38005b9c..0ae832e13b97 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -473,7 +473,7 @@ static long seccomp_attach_filter(unsigned int flags,
 	return 0;
 }
 
-void __get_seccomp_filter(struct seccomp_filter *filter)
+static void __get_seccomp_filter(struct seccomp_filter *filter)
 {
 	/* Reference count is bounded by the number of total processes. */
 	refcount_inc(&filter->usage);
-- 
2.14.1

