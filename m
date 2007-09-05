From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 05 Sep 2007 15:01:37 +0000
Subject: [PATCH] Documentation:  Remove references to dead "eda" and "edb"
Message-Id: <Pine.LNX.4.64.0709051100430.18455@localhost.localdomain>
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
index b41cde3..cfe2583 100644
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@ -577,10 +577,6 @@ and is between 256 and 4096 characters. It is defined in the file
 			0: polling mode
 			non-0: interrupt mode (default)

-	eda=		[HW,PS2]
-
-	edb=		[HW,PS2]
-
 	edd=		[EDD]
 			Format: {"of[f]" | "sk[ipmbr]"}
 			See comment in arch/i386/boot/edd.S

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
