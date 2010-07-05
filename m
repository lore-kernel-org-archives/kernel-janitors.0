From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon, 05 Jul 2010 08:01:09 +0000
Subject: [PATCH] cifs: silence compiler warning
Message-Id: <1278316870-29112-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Kernel Janitors <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Jeff Layton <jlayton-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Suresh Jayaraman <sjayaraman-l3A5Bk7waGM@public.gmane.org>, linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

If buf is NULL then ppdata is unitialized after exit from validate_ntransact().
In this case we do not use ppdata, but compiler warns us. Make it happy.

This patch silences a compiler warning:
fs/cifs/cifssmb.c: In function ‘CIFSSMBGetCIFSACL’:
fs/cifs/cifssmb.c:3082: warning: ‘pdata’ may be used uninitialized in this function

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 fs/cifs/cifssmb.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/cifs/cifssmb.c b/fs/cifs/cifssmb.c
index c65c341..22805e2 100644
--- a/fs/cifs/cifssmb.c
+++ b/fs/cifs/cifssmb.c
@@ -2506,6 +2506,7 @@ validate_ntransact(char *buf, char **ppparm, char **ppdata,
 
 	*pdatalen = 0;
 	*pparmlen = 0;
+	*ppdata = 0;
 
 	if (buf = NULL)
 		return -EINVAL;
-- 
1.7.0.4

