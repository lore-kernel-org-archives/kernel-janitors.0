From: Colin King <colin.king@canonical.com>
Date: Sun, 24 Jun 2018 11:22:06 +0000
Subject: [PATCH] lib: make struct pointer foo static
Message-Id: <20180624112206.5722-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Florian Fainelli <f.fainelli@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer foo is local to the source and does not need to be
in global scope, so make it static.

Cleans up sparse warning:
symbol 'foo' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 lib/test_debug_virtual.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_debug_virtual.c b/lib/test_debug_virtual.c
index b9cdeecc19dc..d5a06addeb27 100644
--- a/lib/test_debug_virtual.c
+++ b/lib/test_debug_virtual.c
@@ -15,7 +15,7 @@ struct foo {
 	unsigned int bar;
 };
 
-struct foo *foo;
+static struct foo *foo;
 
 static int __init test_debug_virtual_init(void)
 {
-- 
2.17.0

