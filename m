From: =?koi8-r?Q?=22?=Alexey Dobriyan=?koi8-r?Q?=22=20?=<adobriyan@mail.ru>
Date: Fri, 16 Apr 2004 16:27:40 +0000
Subject: [Kernel-janitors] [PATCH] Kill some 'No description found...'
Message-Id: <E1BEWBo-000O1Y-00.adobriyan-mail-ru@f23.mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63515020639007913=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============63515020639007913==
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 8bit

--- a/lib/string.c      2004-04-16 19:30:13.000000000 +0400
+++ b/lib/string.c      2004-04-16 19:30:58.000000000 +0400
@@ -445,8 +445,8 @@
 #ifndef __HAVE_ARCH_BCOPY
 /**
  * bcopy - Copy one area of memory to another
- * @src: Where to copy from
- * @dest: Where to copy to
+ * @srcp: Where to copy from
+ * @destp: Where to copy to
  * @count: The size of the area.
  *
  * Note that this is the same as memcpy(), with the arguments reversed.
--- a/include/linux/skbuff.h    2004-04-16 19:35:46.000000000 +0400
+++ b/include/linux/skbuff.h    2004-04-16 19:37:13.000000000 +0400
@@ -268,10 +268,10 @@
        /* These elements must be at the end, see alloc_skb() for details.  */
        unsigned int            truesize;
        atomic_t                users;
-       unsigned char           *head,
-                               *data,
-                               *tail,
-                               *end;
+       unsigned char           *head;
+       unsigned char           *data;
+       unsigned char           *tail;
+       unsigned char           *end;
 };

 #ifdef __KERNEL__
--- a/net/core/dev.c    2004-04-16 19:42:16.000000000 +0400
+++ b/net/core/dev.c    2004-04-16 19:43:15.000000000 +0400
@@ -777,7 +777,7 @@
 /**
  *     dev_change_name - change name of a device
  *     @dev: device
- *     @name: name (or format string) must be at least IFNAMSIZ
+ *     @newname: name (or format string) must be at least IFNAMSIZ
  *
  *     Change name of a device, can pass format strings "eth%d".
  *     for wildcarding.
--- a/drivers/block/ll_rw_blk.c 2004-04-16 19:50:36.000000000 +0400
+++ b/drivers/block/ll_rw_blk.c 2004-04-16 19:53:39.000000000 +0400
@@ -1142,7 +1142,7 @@

 /**
  * generic_unplug_device - fire a request queue
- * @data:    The &request_queue_t in question
+ * @q:    The &request_queue_t in question
  *
  * Description:
  *   Linux uses plugging to build bigger requests queues before letting


--===============63515020639007913==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63515020639007913==--
