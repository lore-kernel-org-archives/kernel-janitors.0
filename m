From: Cyril Roelandt <tipecaml@gmail.com>
Date: Thu, 03 Apr 2014 22:05:21 +0000
Subject: [PATCH] fs: cifs: remove unused variable.
Message-Id: <1396562721-28354-1-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org, linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyril Roelandt <tipecaml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

In SMB2_set_compression(), the "res_key" variable is only initialized to NULL
and later kfreed. It is therefore useless and should be removed.

Found with the following semantic patch:

<smpl>
@@
identifier foo;
identifier f;
type T;
@@
* f(...) {
...
* T *foo = NULL;
... when forall
    when != foo
* kfree(foo);
...
}
</smpl>

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 fs/cifs/smb2pdu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
index 8603447..3802f8c 100644
--- a/fs/cifs/smb2pdu.c
+++ b/fs/cifs/smb2pdu.c
@@ -1352,7 +1352,6 @@ SMB2_set_compression(const unsigned int xid, struct cifs_tcon *tcon,
 		     u64 persistent_fid, u64 volatile_fid)
 {
 	int rc;
-	char *res_key = NULL;
 	struct  compress_ioctl fsctl_input;
 	char *ret_data = NULL;
 
@@ -1365,7 +1364,6 @@ SMB2_set_compression(const unsigned int xid, struct cifs_tcon *tcon,
 			2 /* in data len */, &ret_data /* out data */, NULL);
 
 	cifs_dbg(FYI, "set compression rc %d\n", rc);
-	kfree(res_key);
 
 	return rc;
 }
-- 
1.9.1

