From: Domen Puncer <domen@coderock.org>
Date: Wed, 17 Nov 2004 13:24:38 +0000
Subject: [KJ] [patch] kernel/sysctl.c: docbook comments update
Message-Id: <20041117132438.GE8698@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58146399844826391=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============58146399844826391==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add comments about ppos, which was added some months ago.

Compile tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/kernel/sysctl.c	2004-11-15 13:42:20.000000000 +0100
+++ a/kernel/sysctl.c	2004-11-17 14:01:05.000000000 +0100
@@ -1355,6 +1355,7 @@ static ssize_t proc_writesys(struct file
  * @filp: the file structure
  * @buffer: the user buffer
  * @lenp: the size of the user buffer
+ * @ppos: file position
  *
  * Reads/writes a string from/to the user buffer. If the kernel
  * buffer provided is not large enough to hold the string, the
@@ -1571,6 +1572,7 @@ static int do_proc_dointvec(ctl_table *t
  * @filp: the file structure
  * @buffer: the user buffer
  * @lenp: the size of the user buffer
+ * @ppos: file position
  *
  * Reads/writes up to table->maxlen/sizeof(unsigned int) integer
  * values from/to the user buffer, treated as an ASCII string. 
@@ -1675,6 +1677,7 @@ static int do_proc_dointvec_minmax_conv(
  * @filp: the file structure
  * @buffer: the user buffer
  * @lenp: the size of the user buffer
+ * @ppos: file position
  *
  * Reads/writes up to table->maxlen/sizeof(unsigned int) integer
  * values from/to the user buffer, treated as an ASCII string.
@@ -1807,6 +1810,7 @@ static int do_proc_doulongvec_minmax(ctl
  * @filp: the file structure
  * @buffer: the user buffer
  * @lenp: the size of the user buffer
+ * @ppos: file position
  *
  * Reads/writes up to table->maxlen/sizeof(unsigned long) unsigned long
  * values from/to the user buffer, treated as an ASCII string.
@@ -1829,6 +1833,7 @@ int proc_doulongvec_minmax(ctl_table *ta
  * @filp: the file structure
  * @buffer: the user buffer
  * @lenp: the size of the user buffer
+ * @ppos: file position
  *
  * Reads/writes up to table->maxlen/sizeof(unsigned long) unsigned long
  * values from/to the user buffer, treated as an ASCII string. The values
@@ -1898,6 +1903,7 @@ static int do_proc_dointvec_userhz_jiffi
  * @filp: the file structure
  * @buffer: the user buffer
  * @lenp: the size of the user buffer
+ * @ppos: file position
  *
  * Reads/writes up to table->maxlen/sizeof(unsigned int) integer
  * values from/to the user buffer, treated as an ASCII string. 
@@ -1920,6 +1926,7 @@ int proc_dointvec_jiffies(ctl_table *tab
  * @filp: the file structure
  * @buffer: the user buffer
  * @lenp: the size of the user buffer
+ * @ppos: file position
  *
  * Reads/writes up to table->maxlen/sizeof(unsigned int) integer
  * values from/to the user buffer, treated as an ASCII string. 

--===============58146399844826391==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58146399844826391==--
