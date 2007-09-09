From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 09 Sep 2007 16:07:44 +0000
Subject: [PATCH] Documentation:  Remove reference to non-existent "unwind_debug"
Message-Id: <Pine.LNX.4.64.0709091205530.16190@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0709040622420.740@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0709040622420.740@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

diff --git a/Documentation/kernel-parameters.txt b/Documentation/kernel-parameters.txt
index b41cde3..c9cff33 100644
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@ -1957,10 +1957,6 @@ and is between 256 and 4096 characters. It is defined in the file
 	norandmaps	Don't use address space randomization
 			Equivalent to echo 0 > /proc/sys/kernel/randomize_va_space

- 	unwind_debug=N 	N > 0 will enable dwarf2 unwinder debugging
-			This is useful to get more information why
-			you got a "dwarf2 unwinder stuck"
-
 ______________________________________________________________________

 TODO:

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
