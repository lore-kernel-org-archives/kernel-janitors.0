From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 22 Sep 2004 23:15:51 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 11/38] net/e100: replace
Message-Id: <20040922231551.GK1924@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73052387078688419=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============73052387078688419==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep()/msleep_interruptible() [as appropriate]
instead of schedule_timeout() to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/e100.c	2004-09-13 17:15:46.000000000 -0700
+++ 2.6.9-rc2/drivers/net/e100.c	2004-09-14 17:13:44.000000000 -0700
@@ -623,8 +623,7 @@ static int e100_self_test(struct nic *ni
 	writel(selftest | dma_addr, &nic->csr->port);
 	e100_write_flush(nic);
 	/* Wait 10 msec for self-test to complete */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ / 100 + 1);
+	msleep(10);
 
 	/* Interrupts are enabled after self-test */
 	e100_disable_irq(nic);
@@ -672,8 +671,7 @@ static void e100_eeprom_write(struct nic
 			e100_write_flush(nic); udelay(4);
 		}
 		/* Wait 10 msec for cmd to complete */
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ / 100 + 1);
+		msleep(10);
 
 		/* Chip deselect */
 		writeb(0, &nic->csr->eeprom_ctrl_lo);
@@ -1758,8 +1756,7 @@ static int e100_loopback_test(struct nic
 	memset(skb->data, 0xFF, ETH_DATA_LEN);
 	e100_xmit_frame(skb, nic->netdev);
 
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ / 100 + 1);
+	msleep(10);
 
 	if(memcmp(nic->rx_to_clean->skb->data + sizeof(struct rfd),
 	   skb->data, ETH_DATA_LEN))
@@ -1845,8 +1842,7 @@ static void e100_get_regs(struct net_dev
 			mdio_read(netdev, nic->mii.phy_id, i);
 	memset(nic->mem->dump_buf, 0, sizeof(nic->mem->dump_buf));
 	e100_exec_cb(nic, NULL, e100_dump);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ / 100 + 1);
+	msleep(10);
 	memcpy(&buff[2 + E100_PHY_REGS], nic->mem->dump_buf,
 		sizeof(nic->mem->dump_buf));
 }
@@ -2020,8 +2016,7 @@ static int e100_phys_id(struct net_devic
 	if(!data || data > (u32)(MAX_SCHEDULE_TIMEOUT / HZ))
 		data = (u32)(MAX_SCHEDULE_TIMEOUT / HZ);
 	mod_timer(&nic->blink_timer, jiffies);
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(data * HZ);
+	msleep_interruptible(data * 1000);
 	del_timer_sync(&nic->blink_timer);
 	mdio_write(netdev, nic->mii.phy_id, MII_LED_CONTROL, 0);
 

--===============73052387078688419==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73052387078688419==--
