From: Paul Jimenez <pj@place.org>
Date: Thu, 16 Aug 2007 07:07:19 +0000
Subject: debug printk's
Message-Id: <20070816070719.550CB179C7E@place.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  Is there stated kernel plicy on debug printk's?  The source shows
a lot of different versions of dprintk defined, some very small scripts
came up with:

# symbol
1 ASD_DPRINTK
1 bay_dprintk
1 dprintk1
1 dprintk2
1 dprintk_core
1 dprintkl
1 i2cdprintk
1 ir_dprintk
1 PDprintk
2 cmdprintk
2 ddprintk
2 DDPRINTK
2 dprintkdbg
2 fs_dprintk
2 gs_dprintk
2 P9_DPRINTK
2 PDPRINTK
2 rio_dprintk
2 SAS_DPRINTK
2 sx_dprintk
2 TOSHIBA_RBTX4927_IRQ_DPRINTK
2 TOSHIBA_RBTX4927_SETUP_DPRINTK
2 TX4927_IRQ_DPRINTK
10 Dprintk
130 DPRINTK
187 dprintk

So: 187 definitions of dprintk and 130 definitions of DPRINTK.  Plus
10 mixed-case fans and various and sundry miscellaneous versions.  Note
this is not *uses*, it's the number of *definitions*.

So, to clarify my original question a bit: is there policy we can refer
to to justify cleaning this up?

  --pj

