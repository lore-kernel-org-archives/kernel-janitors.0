From: Dan Carpenter <error27@gmail.com>
Date: Mon, 07 Jun 2010 21:11:03 +0000
Subject: [patch 7/7] selinux: fix error codes in symtab_init()
Message-Id: <20100607211103.GW5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hashtab_create() only returns NULL on allocation failures to -ENOMEM is
appropriate here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/security/selinux/ss/symtab.c b/security/selinux/ss/symtab.c
index bcf9f62..160326e 100644
--- a/security/selinux/ss/symtab.c
+++ b/security/selinux/ss/symtab.c
@@ -36,7 +36,7 @@ int symtab_init(struct symtab *s, unsigned int size)
 {
 	s->table = hashtab_create(symhash, symcmp, size);
 	if (!s->table)
-		return -1;
+		return -ENOMEM;
 	s->nprim = 0;
 	return 0;
 }
