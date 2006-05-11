From: Matthew Martin <lihnucks@gmail.com>
Date: Thu, 11 May 2006 02:54:12 +0000
Subject: [KJ] [PATCH] Make function static in drivers/telephony/ixj.c
Message-Id: <4462A754.5090107@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hello,
    This makes a function in drivers/telephony/ixj.c static. The 
function that was
made static is int ixj_set_tone_off.

Signed-off-by: Matthew Martin <lihnucks@gmail.com>

---

--- vanilla-linux-2.6.16/drivers/telephony/ixj.c    2006-03-19 
23:53:29.000000000 -0600
+++ linux-2.6.16/drivers/telephony/ixj.c    2006-05-10 
10:08:38.000000000 -0500
@@ -5712,7 +5712,7 @@ static int ixj_daa_write(IXJ *j)
     return 1;
 }
 
-int ixj_set_tone_off(unsigned short arg, IXJ *j)
+static int ixj_set_tone_off(unsigned short arg, IXJ *j)
 {
     j->tone_off_time = arg;
     if (ixj_WriteDSPCommand(0x6E05, j))        /* Set Tone Off Period */


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
