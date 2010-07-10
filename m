From: Dan Carpenter <error27@gmail.com>
Date: Sat, 10 Jul 2010 09:51:54 +0000
Subject: [patch] 9p: strlen() doesn't count the terminator
Message-Id: <20100710095154.GU19184@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Van Hensbergen <ericvh@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Abhishek Kulkarni <adkulkar@umail.iu.edu>, Venkateswararao Jujjuri <jvrao@us.ibm.com>, linux-kernel@vger.kernel.org, Tilman Sauerbeck <tilman@code-monkey.de>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This is an off by one bug because strlen() doesn't count the NULL
terminator.  We strcpy() addr into a fixed length array of size
UNIX_PATH_MAX later on.

The addr variable is the name of the device being mounted.

CC: stable@kernel.org
Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/9p/trans_fd.c b/net/9p/trans_fd.c
index 98ce9bc..c85109d 100644
--- a/net/9p/trans_fd.c
+++ b/net/9p/trans_fd.c
@@ -948,7 +948,7 @@ p9_fd_create_unix(struct p9_client *client, const char *addr, char *args)
 
 	csocket = NULL;
 
-	if (strlen(addr) > UNIX_PATH_MAX) {
+	if (strlen(addr) >= UNIX_PATH_MAX) {
 		P9_EPRINTK(KERN_ERR, "p9_trans_unix: address too long: %s\n",
 			addr);
 		return -ENAMETOOLONG;
