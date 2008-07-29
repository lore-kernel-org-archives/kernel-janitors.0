From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Tue, 29 Jul 2008 00:03:33 +0000
Subject: [PATCH] fs/fat/dir.c fix resource leak
Message-Id: <1217289813.9367.9.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel Janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, hirofumi@mail.parknet.co.jp

G'day people,

Coverity CID 2332 & 2333 RESOURCE_LEAK


In fat_search_long() if fat_parse_long() returns a -ve value we return
without first freeing unicode and bufname.
This patch free's them on this error path.

Patch against linux-next commit 99be8ca04aa13c0ff10bbb3ba5f90676b050fcc6
Only compile tested

﻿﻿﻿﻿Signed-off-by: Darren Jenkins <darrenrjenkins@gmailcom>

diff --git a/fs/fat/dir.c b/fs/fat/dir.c
index 34541d0..8a9d7fa 100644
--- a/fs/fat/dir.c
+++ b/fs/fat/dir.c
@@ -346,14 +346,16 @@ parse_record:
 		if (de->attr = ATTR_EXT) {
 			int status = fat_parse_long(inode, &cpos, &bh, &de,
 						    &unicode, &nr_slots);
-			if (status < 0)
-				return status;
-			else if (status = PARSE_INVALID)
+			if (status < 0) {
+				err = status;
+				goto EODir;
+			} else if (status = PARSE_INVALID) {
 				continue;
-			else if (status = PARSE_NOT_LONGNAME)
+			} else if (status = PARSE_NOT_LONGNAME) {
 				goto parse_record;
-			else if (status = PARSE_EOF)
+			} else if (status = PARSE_EOF) {
 				goto EODir;
+			}
 		}
 
 		memcpy(work, de->name, sizeof(de->name));


