From: Coywolf Qi Hunt <coywolf@greatcn.org>
Date: Wed, 30 Jun 2004 02:18:17 +0000
Subject: [Kernel-janitors] How about share all PFN_* ?
Message-Id: <40E222E9.2030605@greatcn.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello all,

There's too many macros definitions PFN_UP PFN_DOWN PFN_PHYS PFN_ALIGN 
scattered all over.
How about a patch move them all into one header file(kernel.h or init.h)
and share only one copy of them like what min and max. I'd like to make it.

(I have sent this e-mail to lkml also.)


      coywolf

-- 
Coywolf Qi Hunt
Admin of http://GreatCN.org and http://LoveCN.org

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
