From: Colin King <colin.king@canonical.com>
Date: Tue, 23 Jul 2019 15:09:19 +0000
Subject: [PATCH] fs: cifs: cifsssmb: remove redundant assignment to variable ret
Message-Id: <20190723150919.15929-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized however this is never read
and later it is being reassigned to a new value. The initialization
is redundant and hence can be removed.

Addresses-Coverity: ("Unused Value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/cifs/cifssmb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/cifssmb.c b/fs/cifs/cifssmb.c
index e2f95965065d..4bc21e7fd6b4 100644
--- a/fs/cifs/cifssmb.c
+++ b/fs/cifs/cifssmb.c
@@ -1405,7 +1405,7 @@ int
 CIFS_open(const unsigned int xid, struct cifs_open_parms *oparms, int *oplock,
 	  FILE_ALL_INFO *buf)
 {
-	int rc = -EACCES;
+	int rc;
 	OPEN_REQ *req = NULL;
 	OPEN_RSP *rsp = NULL;
 	int bytes_returned;
-- 
2.20.1
