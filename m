From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 28 Oct 2016 08:33:41 +0000
Subject: [PATCH 03/10] scripts/basic/fixdep: Use the symbol "MAP_FAILED" in print_deps()
Message-Id: <682bce8d-61cb-0e50-1a7e-93328e3d8c08@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
In-Reply-To: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 27 Oct 2016 18:18:54 +0200

Check the return value from a call of the function "mmap" by using
the preprocessor symbol "MAP_FAILED".

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/basic/fixdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index c9ce3e3..0dcec29 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -417,7 +417,7 @@ static void print_deps(void)
 		goto close_fd;
 	}
 	map = mmap(NULL, st.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
-	if ((long) map = -1) {
+	if (map = MAP_FAILED) {
 		perror("fixdep: mmap");
 		goto close_fd;
 	}
-- 
2.10.1

