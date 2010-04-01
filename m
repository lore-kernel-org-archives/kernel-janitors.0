From: Dan Carpenter <error27@gmail.com>
Date: Thu, 01 Apr 2010 15:54:38 +0000
Subject: [patch] ir-keytable: avoid double lock
Message-Id: <20100401155438.GE5265@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Dmitry Torokhov <dtor@mail.ru>, =?iso-8859-1?Q?M=E1rton_N=E9meth?= <nm127@freemail.hu>, Alexander Beregalov <a.beregalov@gmail.com>, Matthew Garrett <mjg@redhat.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

It's possible that we wanted to resize to a smaller size but we didn't
have enough memory to create the new table.  We need to test for that
here so we don't try to lock twice and dead lock.  Also we free the
"oldkeymap" on that path and that would be bad.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
I don't know this code very well.  Maybe we should  just take the lock
earlier in the function for the resize case and the non resize case.
Can we add new keys while the resize is taking place?

diff --git a/drivers/media/IR/ir-keytable.c b/drivers/media/IR/ir-keytable.c
index 0a3b4ed..51cd0f3 100644
--- a/drivers/media/IR/ir-keytable.c
+++ b/drivers/media/IR/ir-keytable.c
@@ -216,7 +216,7 @@ static void ir_delete_key(struct ir_scancode_table *rc_tab, int elem)
 		memcpy(&newkeymap[elem], &oldkeymap[elem + 1],
 		       (newsize - elem) * sizeof(*newkeymap));
 
-	if (resize) {
+	if (resize && newkeymap != oldkeymap) {
 		/*
 		 * As the copy happened to a temporary table, only here
 		 * it needs to lock while replacing the table pointers
