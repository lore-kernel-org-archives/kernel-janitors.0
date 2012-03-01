From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 01 Mar 2012 07:06:52 +0000
Subject: [patch] cifs: writing past end of struct in cifs_convert_address()
Message-Id: <20120301070652.GA6959@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>, Jeff Layton <jlayton@redhat.com>
Cc: linux-cifs@vger.kernel.org, kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org

"s6->sin6_scope_id" is an int bits but strict_strtoul() writes a long
so this can corrupt memory on 64 bit systems.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/cifs/netmisc.c b/fs/cifs/netmisc.c
index 73e47e8..cab99b5 100644
--- a/fs/cifs/netmisc.c
+++ b/fs/cifs/netmisc.c
@@ -197,8 +197,7 @@ cifs_convert_address(struct sockaddr *dst, const char *src, int len)
 		memcpy(scope_id, pct + 1, slen);
 		scope_id[slen] = '\0';
 
-		rc = strict_strtoul(scope_id, 0,
-					(unsigned long *)&s6->sin6_scope_id);
+		rc = kstrtouint(scope_id, 0, &s6->sin6_scope_id);
 		rc = (rc = 0) ? 1 : 0;
 	}
 
