From: Shyam Prasad <Shyam.Prasad@microsoft.com>
Date: Mon, 14 Dec 2020 12:06:15 +0000
Subject: RE: [EXTERNAL] [PATCH] cifs: Fix uninitialized variable in set_chmod_dacl()
Message-Id: <KL1P15301MB0401F166D77AD883E07367F094C79@KL1P15301MB0401.APCP153.PROD.OUTLOOK.COM>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9dS1EllbQhuX7/C@mwanda>
In-Reply-To: <X9dS1EllbQhuX7/C@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Steve French <sfrench@samba.org>
Cc: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>, "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan,

Thanks for the catch. This patch is already in for-next branch here:
https://git.samba.org/sfrench/cifs-2.6.git

Can you please pull the latest and verify?

Regards,
Shyam

-----Original Message-----
From: Dan Carpenter <dan.carpenter@oracle.com> 
Sent: Monday, December 14, 2020 5:26 PM
To: Steve French <sfrench@samba.org>; Shyam Prasad <Shyam.Prasad@microsoft.com>
Cc: linux-cifs@vger.kernel.org; samba-technical@lists.samba.org; kernel-janitors@vger.kernel.org
Subject: [EXTERNAL] [PATCH] cifs: Fix uninitialized variable in set_chmod_dacl()

Initialize the "nmode" variable earlier to prevent an uninitialized variable bug when we do "size += setup_special_mode_ACE(pntace, nmode);"

Fixes: 253374f7557e ("cifs: Fix unix perm bits to cifsacl conversion for "other" bits.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/cifsacl.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/fs/cifs/cifsacl.c b/fs/cifs/cifsacl.c index d7a6d0f533bf..8410db328e5e 100644
--- a/fs/cifs/cifsacl.c
+++ b/fs/cifs/cifsacl.c
@@ -920,6 +920,13 @@ static int set_chmod_dacl(struct cifs_acl *pndacl, struct cifs_sid *pownersid,
 	__u64 deny_group_mode = 0;
 	bool sticky_set = false;
 
+	/*
+	 * We'll try to keep the mode as requested by the user.
+	 * But in cases where we cannot meaningfully convert that
+	 * into ACL, return back the updated mode, so that it is
+	 * updated in the inode.
+	 */
+	nmode = *pnmode;
 	pnndacl = (struct cifs_acl *)((char *)pndacl + sizeof(struct cifs_acl));
 
 	if (modefromsid) {
@@ -931,14 +938,6 @@ static int set_chmod_dacl(struct cifs_acl *pndacl, struct cifs_sid *pownersid,
 		goto set_size;
 	}
 
-	/*
-	 * We'll try to keep the mode as requested by the user.
-	 * But in cases where we cannot meaningfully convert that
-	 * into ACL, return back the updated mode, so that it is
-	 * updated in the inode.
-	 */
-	nmode = *pnmode;
-
 	if (!memcmp(pownersid, pgrpsid, sizeof(struct cifs_sid))) {
 		/*
 		 * Case when owner and group SIDs are the same.
--
2.29.2
