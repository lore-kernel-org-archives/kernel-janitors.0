From: Daniel Dickman <didickman@yahoo.com>
Date: Tue, 22 Mar 2005 00:57:03 +0000
Subject: [KJ] [PATCH 2.6.12-rc1-bk1 1/1] correctly name the Shell sort
Message-Id: <423F6D5F.5080503@yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

As per http://www.nist.gov/dads/HTML/shellsort.html, this should be referred to
as a Shell sort. Shell-Metzner is a misnomer.

Signed-off-by: Daniel Dickman <didickman@yahoo.com>

--- linux-2.6.12-rc1-bk1/kernel/sys.c	2005-03-21 01:53:02.296875000 -0500
+++ linux/kernel/sys.c	2005-03-21 03:24:09.156250000 -0500
@@ -1194,7 +1194,7 @@
  	return 0;
  }

-/* a simple shell-metzner sort */
+/* a simple Shell sort */
  static void groups_sort(struct group_info *group_info)
  {
  	int base, max, stride;

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
