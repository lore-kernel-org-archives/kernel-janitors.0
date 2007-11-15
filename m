From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 15 Nov 2007 15:04:17 +0000
Subject: [PATCH] ARM:  Delete unmatched comment end in arch/arm/lib/sha1.S.
Message-Id: <alpine.LFD.0.9999.0711151001340.8753@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


That unmatched comment end causes "sloccount" to generate the warning:

  Warning: file .../arch/arm/lib/sha1.S line 32 has unmatched comment end

so might as well clean it up.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/arch/arm/lib/sha1.S b/arch/arm/lib/sha1.S
index ff6ece4..67c2bf4 100644
--- a/arch/arm/lib/sha1.S
+++ b/arch/arm/lib/sha1.S
@@ -29,7 +29,7 @@ ENTRY(sha_transform)
 	stmfd	sp!, {r4 - r8, lr}

 	@ for (i = 0; i < 16; i++)
-	@         W[i] = be32_to_cpu(in[i]); */
+	@         W[i] = be32_to_cpu(in[i]);

 #ifdef __ARMEB__
 	mov	r4, r0

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
