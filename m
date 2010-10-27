From: Dan Carpenter <error27@gmail.com>
Date: Wed, 27 Oct 2010 21:19:32 +0000
Subject: [patch 1/2] cifs: add kfree() on error path
Message-Id: <20101027211932.GK6062@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We leak 256 bytes here on this error path. 

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index 45af003..06a006b 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -1353,6 +1353,7 @@ static int cifs_writepages(struct address_space *mapping,
 	if (!experimEnabled && tcon->ses->server->secMode &
 			(SECMODE_SIGN_REQUIRED | SECMODE_SIGN_ENABLED)) {
 		cifsFileInfo_put(open_file);
+		kfree(iov);
 		return generic_writepages(mapping, wbc);
 	}
 	cifsFileInfo_put(open_file);
