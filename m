From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 17 Sep 2017 09:43:13 +0000
Subject: [PATCH] dlm: Reuse existing error handling path
Message-Id: <20170917094313.30592-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ccaulfie@redhat.com, teigland@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The error handling path at label 'accept_err' already performs these
'sock_release()' and 'mutex_unlock()' calls. The order is reversed, but
it is not important.
So avoid code duplication and 'goto accept_err'.

While at it, add some missing spaces around a '='.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Instead of returning the magic number -1, we could also propagate the
return value of 'addr_to_nodeid()', that is to say -EEXIST
---
 fs/dlm/lowcomms.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 4813d0e0cd9b..cd9305b17ad5 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -758,13 +758,12 @@ static int tcp_accept_from_sock(struct connection *con)
 	/* Get the new node's NODEID */
 	make_sockaddr(&peeraddr, 0, &len);
 	if (addr_to_nodeid(&peeraddr, &nodeid)) {
-		unsigned char *b=(unsigned char *)&peeraddr;
+		unsigned char *b = (unsigned char *)&peeraddr;
 		log_print("connect from non cluster node");
 		print_hex_dump_bytes("ss: ", DUMP_PREFIX_NONE, 
 				     b, sizeof(struct sockaddr_storage));
-		sock_release(newsock);
-		mutex_unlock(&con->sock_mutex);
-		return -1;
+		result = -1;
+		goto accept_err;
 	}
 
 	log_print("got connection from %d", nodeid);
-- 
2.11.0

