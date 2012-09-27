From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 27 Sep 2012 20:49:08 +0000
Subject: [patch] cifs: proper fix for integer overflow in parse_dacl()
Message-Id: <20120927204908.GA13222@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>
Cc: linux-cifs@vger.kernel.org, kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org

I tried to fix this before by adding the ULONG_MAX check, but num_aces
is an unsigned int so it should have been UINT_MAX.  Sorry for that.
These days we can just call kmalloc_array() which has the overflow check
built in.

Reported-by: pipacs
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/cifs/cifsacl.c b/fs/cifs/cifsacl.c
index 2ee5c54..bc9fcfb 100644
--- a/fs/cifs/cifsacl.c
+++ b/fs/cifs/cifsacl.c
@@ -910,9 +910,7 @@ static void parse_dacl(struct cifs_acl *pdacl, char *end_of_acl,
 		umode_t group_mask = S_IRWXG;
 		umode_t other_mask = S_IRWXU | S_IRWXG | S_IRWXO;
 
-		if (num_aces > ULONG_MAX / sizeof(struct cifs_ace *))
-			return;
-		ppace = kmalloc(num_aces * sizeof(struct cifs_ace *),
+		ppace = kmalloc_array(num_aces, sizeof(struct cifs_ace *),
 				GFP_KERNEL);
 		if (!ppace) {
 			cERROR(1, "DACL memory allocation error");
