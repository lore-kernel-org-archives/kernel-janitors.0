From: Michael Veeck <michael.veeck@gmx.net>
Date: Thu, 26 Feb 2004 21:17:21 +0000
Subject: [Kernel-janitors] [PATCH] fs/reiserfs MIN/MAX removal
Message-Id: <403E6261.7060709@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070606020702080902010100"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------070606020702080902010100
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.3) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Best Regards
Michael



--------------070606020702080902010100
Content-Type: text/plain;
 name="minmax_fs_reiserfs.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_fs_reiserfs.patch"

--- linux-2.6.3.org/include/linux/reiserfs_fs.h	2004-02-18 04:59:23.000000000 +0100
+++ linux-2.6.3.test/include/linux/reiserfs_fs.h	2004-02-20 15:25:19.000000000 +0100
@@ -1943,11 +1943,10 @@
 
 #define PROC_EXP( e )   e
 
-#define MAX( a, b ) ( ( ( a ) > ( b ) ) ? ( a ) : ( b ) )
 #define __PINFO( sb ) REISERFS_SB(sb) -> s_proc_info_data
 #define PROC_INFO_MAX( sb, field, value )								\
     __PINFO( sb ).field =												\
-        MAX( REISERFS_SB( sb ) -> s_proc_info_data.field, value )
+        max( REISERFS_SB( sb ) -> s_proc_info_data.field, value )
 #define PROC_INFO_INC( sb, field ) ( ++ ( __PINFO( sb ).field ) )
 #define PROC_INFO_ADD( sb, field, val ) ( __PINFO( sb ).field += ( val ) )
 #define PROC_INFO_BH_STAT( sb, bh, level )							\

--------------070606020702080902010100
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------070606020702080902010100--
