From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Apr 2015 14:30:24 +0000
Subject: [patch] CIFS: remove an unneeded NULL check
Message-Id: <20150430143024.GA22086@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, kernel-janitors@vger.kernel.org

Smatch complains because we dereference "ses->server" without checking
some lines earlier inside the call to get_next_mid(ses->server).

	fs/cifs/cifssmb.c:4921 CIFSGetDFSRefer()
	warn: variable dereferenced before check 'ses->server' (see line 4899)

There is only one caller for this function get_dfs_path() and it always
passes a non-null "ses->server" pointer so this NULL check can be
removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/cifs/cifssmb.c b/fs/cifs/cifssmb.c
index 1091aff..f26ffbf 100644
--- a/fs/cifs/cifssmb.c
+++ b/fs/cifs/cifssmb.c
@@ -4918,7 +4918,7 @@ getDFSRetry:
 		strncpy(pSMB->RequestFileName, search_name, name_len);
 	}
 
-	if (ses->server && ses->server->sign)
+	if (ses->server->sign)
 		pSMB->hdr.Flags2 |= SMBFLG2_SECURITY_SIGNATURE;
 
 	pSMB->hdr.Uid = ses->Suid;
