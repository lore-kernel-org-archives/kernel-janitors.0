From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Fri, 12 Mar 2004 23:49:44 +0000
Subject: Re: [Kernel-janitors] [2.6 Patch] mandocs-008: Fix breakage in SGML
Message-Id: <20040312154944.10c21ad3.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <40524AF8.7000308@stillhq.com>
In-Reply-To: <40524AF8.7000308@stillhq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 13 Mar 2004 10:42:48 +1100 Michael Still wrote:

| 
| Heya,
| 
| this patch is needed to get any of the SGML documentation to build with
| 2.6.4. I originally mailled it to LKML the other day, but no one over 
| there has picked it up. I'm hoping people here might be more interested.
| 
| Thanks,
| Mikal
| 
| --
| 
| diff -Nur
| linux-2.6.4-rc2-cset-20040306_1807/Documentation/DocBook/parportbook.tmpl
| linux-2.6.4-rc2-cset-20040306_1807-mandocs/Documentation/DocBook/parportbook.tmpl
| ---
| linux-2.6.4-rc2-cset-20040306_1807/Documentation/DocBook/parportbook.tmpl
| 2004-03-07 11:24:14.000000000 +1100
| +++
| linux-2.6.4-rc2-cset-20040306_1807-mandocs/Documentation/DocBook/parportbook.tmpl 
| 
| 2004-03-07 17:39:05.000000000 +1100
| @@ -2730,7 +2730,7 @@
| 
|   </book>
|   <!-- Additional function to be documented:
| -!Ddrivers/parport/init.c
| +--!Ddrivers/parport/init.c (this file doesn't exist any more)
|   -->
|   <!-- Local Variables: -->
|   <!-- sgml-indent-step: 1 -->
| 
| -- 

Yes, I saw it, but at that time it applied to -mm since the parport
patch was in -mm, so I was just waiting.... :)

I'll push it along to Andrew.

Thanks,
--
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
