From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Dec 2017 14:39:36 +0000
Subject: [PATCH] afs: Potential uninitialized variable in afs_extract_data()
Message-Id: <20171205143936.sniv5hwd7bbu2gfy@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch warns that:

    fs/afs/rxrpc.c:922 afs_extract_data()
    error: uninitialized symbol 'remote_abort'.

Smatch is right that "remote_abort" might be uninitialized when we pass
it to afs_set_call_complete().  I don't know if that function uses the
uninitialized variable.  Anyway, the comment for rxrpc_kernel_recv_data(),
says that "*_abort should also be initialised to 0." and this patch does
that.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
index ea1460b9b71a..e1126659f043 100644
--- a/fs/afs/rxrpc.c
+++ b/fs/afs/rxrpc.c
@@ -885,7 +885,7 @@ int afs_extract_data(struct afs_call *call, void *buf, size_t count,
 {
 	struct afs_net *net = call->net;
 	enum afs_call_state state;
-	u32 remote_abort;
+	u32 remote_abort = 0;
 	int ret;
 
 	_enter("{%s,%zu},,%zu,%d",
