From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 01 Dec 2020 15:15:12 +0000
Subject: [PATCH net v2] net/x25: prevent a couple of overflows
Message-Id: <X8ZeAKm8FnFpN//B@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

The .x25_addr[] address comes from the user and is not necessarily
NUL terminated.  This leads to a couple problems.  The first problem is
that the strlen() in x25_bind() can read beyond the end of the buffer.

The second problem is more subtle and could result in memory corruption.
The call tree is:
  x25_connect()
  --> x25_write_internal()
      --> x25_addr_aton()

The .x25_addr[] buffers are copied to the "addresses" buffer from
x25_write_internal() so it will lead to stack corruption.

Verify that the strings are NUL terminated and return -EINVAL if they
are not.

Reported-by: "kiyin(尹亮)" <kiyin@tencent.com>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
The first patch put a NUL terminator on the end of the string and this
patch returns an error instead.  I don't have a strong preference, which
patch to go with.

 net/x25/af_x25.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/x25/af_x25.c b/net/x25/af_x25.c
index 9232cdb42ad9..d41fffb2507b 100644
--- a/net/x25/af_x25.c
+++ b/net/x25/af_x25.c
@@ -675,7 +675,8 @@ static int x25_bind(struct socket *sock, struct sockaddr *uaddr, int addr_len)
 	int len, i, rc = 0;
 
 	if (addr_len != sizeof(struct sockaddr_x25) ||
-	    addr->sx25_family != AF_X25) {
+	    addr->sx25_family != AF_X25 ||
+	    strnlen(addr->sx25_addr.x25_addr, X25_ADDR_LEN) = X25_ADDR_LEN) {
 		rc = -EINVAL;
 		goto out;
 	}
@@ -769,7 +770,8 @@ static int x25_connect(struct socket *sock, struct sockaddr *uaddr,
 
 	rc = -EINVAL;
 	if (addr_len != sizeof(struct sockaddr_x25) ||
-	    addr->sx25_family != AF_X25)
+	    addr->sx25_family != AF_X25 ||
+	    strnlen(addr->sx25_addr.x25_addr, X25_ADDR_LEN) = X25_ADDR_LEN)
 		goto out;
 
 	rc = -ENETUNREACH;
-- 
2.29.2
