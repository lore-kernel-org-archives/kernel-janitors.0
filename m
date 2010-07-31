From: Dan Carpenter <error27@gmail.com>
Date: Sat, 31 Jul 2010 20:25:53 +0000
Subject: [patch] afs: destroy work queue on init failure
Message-Id: <20100731202553.GG26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We can clean up the work queue on this error path.  This function is
called from afs_init().

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
index 67cf810..654d8fd 100644
--- a/fs/afs/rxrpc.c
+++ b/fs/afs/rxrpc.c
@@ -100,6 +100,7 @@ int afs_open_socket(void)
 	ret = kernel_bind(socket, (struct sockaddr *) &srx, sizeof(srx));
 	if (ret < 0) {
 		sock_release(socket);
+		destroy_workqueue(afs_async_calls);
 		_leave(" = %d [bind]", ret);
 		return ret;
 	}
