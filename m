From: "Gabriel A. Devenyi" <ace@staticwave.ca>
Date: Tue, 08 Nov 2005 12:39:29 +0000
Subject: [KJ] [RESEND] [PATCH] drivers/net/wireless/airo.c unsigned
Message-Id: <43709C81.9060408@staticwave.ca>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@lists.osdl.org

fid is declared as a u32 (unsigned int), and then a few lines later, it is checked for a value < 0, which is clearly useless.
In the two locations this function is used, in one it is *explicitly* given a negative number, which would be ignored with the
current definition.

Thanks to LinuxICC (http://linuxicc.sf.net).

This patch applies to linus' git tree as of 03.11.2005

Signed-off-by: Gabriel A. Devenyi <ace@staticwave.ca>

diff --git a/drivers/net/wireless/airo.c b/drivers/net/wireless/airo.c
index 750c016..849ac88 100644
--- a/drivers/net/wireless/airo.c
+++ b/drivers/net/wireless/airo.c
@@ -2040,7 +2040,7 @@ static int mpi_send_packet (struct net_d
  	return 1;
  }

-static void get_tx_error(struct airo_info *ai, u32 fid)
+static void get_tx_error(struct airo_info *ai, s32 fid)
  {
  	u16 status;


-- 
Gabriel A. Devenyi
ace@staticwave.ca
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
