From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 22 Sep 2004 23:12:08 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 9/38] net/e1000_ethtool: replace
Message-Id: <20040922231208.GI1924@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============004086943241964347=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============004086943241964347==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/net/e1000/e1000_ethtool.c	2004-09-09 23:05:31.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/net/e1000/e1000_ethtool.c	2004-09-10 14:17:48.000000000 -0700
@@ -1549,9 +1549,7 @@ e1000_phys_id(struct net_device *netdev,
 	e1000_setup_led(&adapter->hw);
 	mod_timer(&adapter->blink_timer, jiffies);
 
-	set_current_state(TASK_INTERRUPTIBLE);
-
-	schedule_timeout(data * HZ);
+	msleep_interruptible(data * 1000);
 	del_timer_sync(&adapter->blink_timer);
 	e1000_led_off(&adapter->hw);
 	clear_bit(E1000_LED_ON, &adapter->led_status);

--===============004086943241964347==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============004086943241964347==--
