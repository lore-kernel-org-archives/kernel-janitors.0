From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jan 2012 07:46:27 +0000
Subject: [patch] cifs: integer overflow in parse_dacl()
Message-Id: <20120111074627.GA4519@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 32 bit systems num_aces * sizeof(struct cifs_ace *) could overflow
leading to a smaller ppace buffer than we expected.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/cifs/cifsacl.c b/fs/cifs/cifsacl.c
index 72ddf23..c1b2544 100644
--- a/fs/cifs/cifsacl.c
+++ b/fs/cifs/cifsacl.c
@@ -909,6 +909,8 @@ static void parse_dacl(struct cifs_acl *pdacl, char *end_of_acl,
 		umode_t group_mask = S_IRWXG;
 		umode_t other_mask = S_IRWXU | S_IRWXG | S_IRWXO;
 
+		if (num_aces > ULONG_MAX / sizeof(struct cifs_ace *))
+			return;
 		ppace = kmalloc(num_aces * sizeof(struct cifs_ace *),
 				GFP_KERNEL);
 		if (!ppace) {
