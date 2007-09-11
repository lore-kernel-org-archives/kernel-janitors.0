From: Leonardo Chiquitto <leonardo@iken.com.br>
Date: Tue, 11 Sep 2007 01:40:44 +0000
Subject: [PATCH] Documentation: Add new /proc/stat field into proc.txt
Message-Id: <20070911014043.GB12623@libre.l.ngdn.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello,

  The following patch updates the "cat /proc/stat" output found
in Documentation/filesystems/proc.txt, adding the new field "steal".

Leonardo

diff --git a/Documentation/filesystems/proc.txt b/Documentation/filesystems/proc.txt
index 4a37e25..ae795fe 100644
--- a/Documentation/filesystems/proc.txt
+++ b/Documentation/filesystems/proc.txt
@@ -785,9 +785,9 @@ Various pieces   of  information about  kernel activity  are  available in the
 since the system first booted.  For a quick look, simply cat the file:
 
   > cat /proc/stat
-  cpu  2255 34 2290 22625563 6290 127 456
-  cpu0 1132 34 1441 11311718 3675 127 438
-  cpu1 1123 0 849 11313845 2614 0 18
+  cpu  2255 34 2290 22625563 6290 127 456 0
+  cpu0 1132 34 1441 11311718 3675 127 438 0
+  cpu1 1123 0 849 11313845 2614 0 18 0
   intr 114930548 113199788 3 0 5 263 0 4 [... lots more numbers ...]
   ctxt 1990473
   btime 1062191376
@@ -807,6 +807,7 @@ second).  The meanings of the columns are as follows, from left to right:
 - iowait: waiting for I/O to complete
 - irq: servicing interrupts
 - softirq: servicing softirqs
+- steal: involuntary wait
 
 The "intr" line gives counts of interrupts  serviced since boot time, for each
 of the  possible system interrupts.   The first  column  is the  total of  all
