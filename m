From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 15 Jul 2008 16:01:11 +0000
Subject: [PATCH] PROC: Correct "kernal" typo.
Message-Id: <alpine.LFD.1.10.0807151159230.3749@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/fs/proc/nommu.c b/fs/proc/nommu.c
index 79ecd28..64e8036 100644
--- a/fs/proc/nommu.c
+++ b/fs/proc/nommu.c
@@ -76,7 +76,7 @@ int nommu_vma_show(struct seq_file *m, struct vm_area_struct *vma)

 /*
  * display a list of all the VMAs the kernel knows about
- * - nommu kernals have a single flat list
+ * - nommu kernels have a single flat list
  */
 static int nommu_vma_list_show(struct seq_file *m, void *v)
 {

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
