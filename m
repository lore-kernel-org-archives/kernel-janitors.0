From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 12 Sep 2007 07:33:54 +0000
Subject: [PATCH] Documentation:  Remove unreferenced "blkmtd_*" parms.
Message-Id: <Pine.LNX.4.64.0709120332010.25833@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

  i see no reference to any of these things, which i suspect were
obsoleted by the newer module params mechanism.  but that's just a
guess.


diff --git a/Documentation/kernel-parameters.txt
b/Documentation/kernel-parameters.txt
index b41cde3..ad91507 100644
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@ -341,12 +341,6 @@ and is between 256 and 4096 characters. It is defined in the file
 			Format: <io>,<irq>,<mode>
 			See header of drivers/net/hamradio/baycom_ser_hdx.c.

-	blkmtd_device=	[HW,MTD]
-	blkmtd_erasesz-	blkmtd_ro-	blkmtd_bs-	blkmtd_count-
 	bttv.card=	[HW,V4L] bttv (bt848 + bt878 based grabber cards)
 	bttv.radio=	Most important insmod options are available as
 			kernel args too.

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
