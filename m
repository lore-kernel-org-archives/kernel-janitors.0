From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Jun 2018 12:25:30 +0000
Subject: [PATCH] cifs: Silence uninitialized variable warning
Message-Id: <20180619122530.a7b5ic6jdsl65ez5@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is not really a runtime issue but Smatch complains that:

    fs/cifs/smb2ops.c:1740 smb2_query_symlink()
    error: uninitialized symbol 'resp_buftype'.

The warning is right that it can be uninitialized...  Also "err_buf"
would be NULL at this point and we're not supposed to pass NULLs to
free_rsp_buf() or it might trigger some extra output if we turn on
debugging.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index 0356b5559c71..5649cd3f377d 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -1697,7 +1697,7 @@ smb2_query_symlink(const unsigned int xid, struct cifs_tcon *tcon,
 		       &resp_buftype);
 	if (!rc || !err_iov.iov_base) {
 		rc = -ENOENT;
-		goto querty_exit;
+		goto free_path;
 	}
 
 	err_buf = err_iov.iov_base;
@@ -1738,6 +1738,7 @@ smb2_query_symlink(const unsigned int xid, struct cifs_tcon *tcon,
 
  querty_exit:
 	free_rsp_buf(resp_buftype, err_buf);
+ free_path:
 	kfree(utf16_path);
 	return rc;
 }
