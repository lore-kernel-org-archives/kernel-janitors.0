From: Michael Still <mikal@stillhq.com>
Date: Fri, 12 Mar 2004 23:42:48 +0000
Subject: [Kernel-janitors] [2.6 Patch] mandocs-008: Fix breakage in SGML
Message-Id: <40524AF8.7000308@stillhq.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Heya,

this patch is needed to get any of the SGML documentation to build with
2.6.4. I originally mailled it to LKML the other day, but no one over 
there has picked it up. I'm hoping people here might be more interested.

Thanks,
Mikal

--

diff -Nur
linux-2.6.4-rc2-cset-20040306_1807/Documentation/DocBook/parportbook.tmpl
linux-2.6.4-rc2-cset-20040306_1807-mandocs/Documentation/DocBook/parportbook.tmpl
---
linux-2.6.4-rc2-cset-20040306_1807/Documentation/DocBook/parportbook.tmpl
2004-03-07 11:24:14.000000000 +1100
+++
linux-2.6.4-rc2-cset-20040306_1807-mandocs/Documentation/DocBook/parportbook.tmpl 

2004-03-07 17:39:05.000000000 +1100
@@ -2730,7 +2730,7 @@

  </book>
  <!-- Additional function to be documented:
-!Ddrivers/parport/init.c
+--!Ddrivers/parport/init.c (this file doesn't exist any more)
  -->
  <!-- Local Variables: -->
  <!-- sgml-indent-step: 1 -->

-- 

Michael Still (mikal@stillhq.com) | "All my life I've had one dream,
http://www.stillhq.com            |  to achieve my many goals"
UTC + 11                          |    -- Homer Simpson


-- 

Michael Still (mikal@stillhq.com) | "All my life I've had one dream,
http://www.stillhq.com            |  to achieve my many goals"
UTC + 11                          |    -- Homer Simpson
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
