From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 14 Aug 2005 13:19:24 +0000
Subject: [KJ] [PATCH] ntfs: fmt warning fix for 64-bit platforms
Message-Id: <20050814131924.GA15052@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92218823603938893=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92218823603938893==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix

fs/ntfs/super.c: In function `load_and_init_usnjrnl':
fs/ntfs/super.c:1439: warning: unsigned int format, different type arg (arg 5)

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 fs/ntfs/super.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

--- linux-fmt.orig/fs/ntfs/super.c
+++ linux-fmt/fs/ntfs/super.c
@@ -1438,7 +1438,7 @@ not_enabled:
 	if (unlikely(i_size_read(tmp_ino) < sizeof(USN_HEADER))) {
 		ntfs_error(vol->sb, "Found corrupt $UsnJrnl/$DATA/$Max "
 				"attribute (size is 0x%llx but should be at "
-				"least 0x%x bytes).", i_size_read(tmp_ino),
+				"least 0x%zx bytes).", i_size_read(tmp_ino),
 				sizeof(USN_HEADER));
 		return FALSE;
 	}


--===============92218823603938893==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92218823603938893==--
