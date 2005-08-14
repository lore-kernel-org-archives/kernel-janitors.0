From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 14 Aug 2005 13:31:58 +0000
Subject: [KJ] [PATCH] drivers/net/*: fmt fixes for 64-bit platforms
Message-Id: <20050814133158.GD15052@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92910299684834019=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92910299684834019==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix

drivers/net/e1000/e1000_main.c: In function `e1000_clean_tx_irq':
drivers/net/e1000/e1000_main.c:2764: warning: size_t format, different type arg
(arg 8)
drivers/net/s2io.c: In function `s2io_set_swapper':
drivers/net/s2io.c:2509: warning: long long unsigned int format, u64 arg (arg 2)

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 drivers/net/e1000/e1000_main.c |    4 ++--
 drivers/net/s2io.c             |    3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

--- linux-fmt.orig/drivers/net/e1000/e1000_main.c
+++ linux-fmt/drivers/net/e1000/e1000_main.c
@@ -2767,7 +2767,7 @@ e1000_clean_tx_irq(struct e1000_adapter 
 					"  next_to_use          <%x>\n"
 					"  next_to_clean        <%x>\n"
 					"buffer_info[next_to_clean]\n"
-					"  dma                  <%zx>\n"
+					"  dma                  <%llx>\n"
 					"  time_stamp           <%lx>\n"
 					"  next_to_watch        <%x>\n"
 					"  jiffies              <%lx>\n"
@@ -2776,7 +2776,7 @@ e1000_clean_tx_irq(struct e1000_adapter 
 				E1000_READ_REG(&adapter->hw, TDT),
 				tx_ring->next_to_use,
 				i,
-				tx_ring->buffer_info[i].dma,
+				(unsigned long long)tx_ring->buffer_info[i].dma,
 				tx_ring->buffer_info[i].time_stamp,
 				eop,
 				jiffies,
--- linux-fmt.orig/drivers/net/s2io.c
+++ linux-fmt/drivers/net/s2io.c
@@ -2506,7 +2506,8 @@ static int s2io_set_swapper(nic_t * sp)
 		}
 		if(i == 4) {
 			DBG_PRINT(ERR_DBG, "Write failed, Xmsi_addr ");
-			DBG_PRINT(ERR_DBG, "reads:0x%llx\n",val64);
+			DBG_PRINT(ERR_DBG, "reads:0x%llx\n",
+					(unsigned long long)val64);
 			return FAILURE;
 		}
 	}


--===============92910299684834019==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92910299684834019==--
