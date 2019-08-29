From: Colin King <colin.king@canonical.com>
Date: Thu, 29 Aug 2019 00:00:06 +0000
Subject: [PATCH][cifs-next] cifs: ensure variable rc is initialized at the after_open label
Message-Id: <20190829000006.24187-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A previous fix added a jump to after_open which now leaves variable
rc in a uninitialized state. A couple of the cases in the following
switch statement do not set variable rc, hence the error check on rc
at the end of the switch statement is reading a garbage value in rc
for those specific cases. Fix this by initializing rc to zero before
the switch statement.

Fixes: 955a9c5b39379 ("cifs: create a helper to find a writeable handle by path name")
Addresses-Coverity: ("Uninitialized scalar variable")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/cifs/smb2inode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/cifs/smb2inode.c b/fs/cifs/smb2inode.c
index 70342bcd89b4..939fc7b2234c 100644
--- a/fs/cifs/smb2inode.c
+++ b/fs/cifs/smb2inode.c
@@ -116,6 +116,7 @@ smb2_compound_op(const unsigned int xid, struct cifs_tcon *tcon,
 	smb2_set_next_command(tcon, &rqst[num_rqst]);
  after_open:
 	num_rqst++;
+	rc = 0;
 
 	/* Operation */
 	switch (command) {
-- 
2.20.1
