From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 23:58:24 +0000
Subject: [Kernel-janitors] [PATCH] net/e1000_ethtool: replace
Message-Id: <20040726235824.GJ1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86219031287603798=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============86219031287603798==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. This is one (of
many) cases where I made a decision about replacing

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(some_time);

with

msleep(jiffies_to_msecs(some_time));

msleep() is not exactly the same as the previous code, but I only did
this replacement where I thought long delays were *desired*. If this is
not the case here, then just disregard this patch. 

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time.


--- linux-vanilla/drivers/net/e1000/e1000_ethtool.c	2004-06-16 05:19:22.000000000 +0000
+++ linux-dev/drivers/net/e1000/e1000_ethtool.c	2004-07-12 18:59:58.000000000 +0000
@@ -1532,9 +1532,7 @@ e1000_phys_id(struct net_device *netdev,
 	e1000_setup_led(&adapter->hw);
 	mod_timer(&adapter->blink_timer, jiffies);
 
-	set_current_state(TASK_INTERRUPTIBLE);
-
-	schedule_timeout(data * HZ);
+	msleep(data * 1000);
 	del_timer_sync(&adapter->blink_timer);
 	e1000_led_off(&adapter->hw);
 	clear_bit(E1000_LED_ON, &adapter->led_status);

--===============86219031287603798==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86219031287603798==--
