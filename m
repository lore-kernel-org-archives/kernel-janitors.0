From: Leonardo Chiquitto <leonardo@iken.com.br>
Date: Tue, 20 Nov 2007 16:41:12 +0000
Subject: [PATCH] Documentation: missing proc/$PID/stat field
Message-Id: <20071120164009.GA10909@libre.l.ngdn.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello,

  There's a missing field in the /proc/$PID/stat output documented in
Documentation/filesystems/proc.txt.
  I couldn't find a proper description for the field, but here's a patch
documenting it as an obsolete value.

Leonardo

diff --git a/Documentation/filesystems/proc.txt b/Documentation/filesystems/proc.txt
index e5c1df5..7ecfa23 100644
--- a/Documentation/filesystems/proc.txt
+++ b/Documentation/filesystems/proc.txt
@@ -216,6 +216,7 @@ Table 1-3: Contents of the stat files (as of 2.6.22-rc3)
   priority      priority level
   nice          nice level
   num_threads   number of threads
+  it_real_value	(obsolete, always 0)
   start_time    time the process started after system boot
   vsize         virtual memory size
   rss           resident set memory size
