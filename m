From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Fri, 30 Nov 2007 11:18:25 +0000
Subject: [PATCH] Documentation:  Clarify when module debugging actually
Message-Id: <alpine.LFD.0.9999.0711300617320.24547@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/Documentation/debugging-modules.txt b/Documentation/debugging-modules.txt
index 24029f6..17b0fbc 100644
--- a/Documentation/debugging-modules.txt
+++ b/Documentation/debugging-modules.txt
@@ -16,3 +16,7 @@ echo 'echo "$@" >> /tmp/modprobe.log' >> /tmp/modprobe
 echo 'exec /sbin/modprobe "$@"' >> /tmp/modprobe
 chmod a+x /tmp/modprobe
 echo /tmp/modprobe > /proc/sys/kernel/modprobe
+
+Note that the above applies only when the *kernel* is requesting
+that the module be loaded -- it won't have any effect if that module
+is being loaded explicitly using "modprobe" from userspace.
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
