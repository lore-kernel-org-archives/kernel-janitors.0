From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 23 Sep 2004 22:13:19 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 19/38] net/ixgb_ethtool: replace
Message-Id: <20040923221319.GE13244@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67667496051290721=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============67667496051290721==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of 
schedule_timeout() to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/ixgb/ixgb_ethtool.c	2004-08-14 03:56:09.000000000 -0700
+++ 2.6.9-rc2/drivers/net/ixgb/ixgb_ethtool.c	2004-09-13 11:41:16.000000000 -0700
@@ -441,11 +441,10 @@ ixgb_ethtool_led_blink(struct ixgb_adapt
 
 	mod_timer(&adapter->blink_timer, jiffies);
 
-	set_current_state(TASK_INTERRUPTIBLE);
 	if (id->data)
-		schedule_timeout(id->data * HZ);
+		msleep_interruptible(id->data * 1000);
 	else
-		schedule_timeout(MAX_SCHEDULE_TIMEOUT);
+		msleep_interruptible(jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
 
 	del_timer_sync(&adapter->blink_timer);
 	ixgb_led_off(&adapter->hw);

--===============67667496051290721==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67667496051290721==--
