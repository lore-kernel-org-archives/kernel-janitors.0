From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 20 May 2017 09:49:46 +0000
Subject: [PATCH] fs/affs: fix an error code in affs_write_end_ofs()
Message-Id: <20170520094946.o6l7rmizlvwq7mjg@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabian Frederick <fabf@skynet.be>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

"prev_bh" is a valid pointer.  "bh" is an error pointer.  "written" is
either an error pointer, or a the number of bytes we have written.  If
we haven't written any bytes then we want to return the error code
stored in "bh".  So we need to that before resetting "bh" to a valid
pointer.

This bug is older than git.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/affs/file.c b/fs/affs/file.c
index 196ee7f6fdc4..99610050199c 100644
--- a/fs/affs/file.c
+++ b/fs/affs/file.c
@@ -800,9 +800,9 @@ static int affs_write_end_ofs(struct file *file, struct address_space *mapping,
 	return written;
 
 err_bh:
-	bh = prev_bh;
 	if (!written)
 		written = PTR_ERR(bh);
+	bh = prev_bh;
 	goto done;
 }
 
