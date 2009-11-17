From: Meenakshi Khorana <khurana.meenakshi@gmail.com>
Date: Tue, 17 Nov 2009 11:44:20 +0000
Subject: Patch for fixing compilation warning
Message-Id: <9e8c6460911170332j1e1704bbtdbd681ab78ffc6ba@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I am hereby submitting my first patch for removing the following
compile time warning

kernel/marker.c: In function `remove_marker':
kernel/marker.c:435: warning: `e' might be used uninitialized in this function

Please provide the feedback on same.

Signed-off-by: Meenakshi <khurana.meenakshi@gmail.com>

--- kernel/marker.c.orig        2009-11-17 16:41:29.000000000 +0530
+++ kernel/marker.c     2009-11-17 16:41:41.000000000 +0530
@@ -432,7 +432,7 @@ static int remove_marker(const char *nam
 {
        struct hlist_head *head;
        struct hlist_node *node;
-       struct marker_entry *e;
+       struct marker_entry *e = NULL;
        int found = 0;
        size_t len = strlen(name) + 1;
        u32 hash = jhash(name, len-1, 0);


Thanks & Regards
