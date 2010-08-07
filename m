From: Dan Carpenter <error27@gmail.com>
Date: Sat, 07 Aug 2010 22:17:51 +0000
Subject: [patch] tomoyo: cleanup.  don't store bogus pointer
Message-Id: <20100807221751.GD9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If domain is NULL then &domain->list is a bogus address.  Let's leave
head->r.domain NULL instead of saving an unusable pointer.

This is just a cleanup.  The current code always checks head->r.eof
before dereferencing head->r.domain.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/security/tomoyo/common.c b/security/tomoyo/common.c
index ef43995..a4dc2d5 100644
--- a/security/tomoyo/common.c
+++ b/security/tomoyo/common.c
@@ -768,8 +768,10 @@ static bool tomoyo_select_one(struct tomoyo_io_buffer *head, const char *data)
 		return true; /* Do nothing if open(O_WRONLY). */
 	memset(&head->r, 0, sizeof(head->r));
 	head->r.print_this_domain_only = true;
-	head->r.eof = !domain;
-	head->r.domain = &domain->list;
+	if (domain)
+		head->r.domain = &domain->list;
+	else
+		head->r.eof = 1;
 	tomoyo_io_printf(head, "# select %s\n", data);
 	if (domain && domain->is_deleted)
 		tomoyo_io_printf(head, "# This is a deleted domain.\n");
