From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 21:46:11 +0000
Subject: [Kernel-janitors] [PATCH] hotplug/ibmphp_core: replace long_delay()
Message-Id: <20040727214611.GT3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============59111733793449872=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727213901.GR3471@us.ibm.com>
In-Reply-To: <20040727213901.GR3471@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============59111733793449872==
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

Description: Replace long_delay() with msleep() to guarantee the task
delays as desired.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- linux-vanilla/drivers/pci/hotplug/ibmphp_core.c	2004-06-16 05:20:26.000000000 +0000
+++ linux-dev/drivers/pci/hotplug/ibmphp_core.c	2004-07-09 00:05:25.000000000 +0000
@@ -190,7 +190,7 @@ static inline int power_on (struct slot 
 		err ("command not completed successfully in power_on\n");
 		return -EIO;
 	}
-	long_delay (3 * HZ); /* For ServeRAID cards, and some 66 PCI */
+	msleep(3000);
 	return 0;
 }
 
@@ -913,7 +913,7 @@ static int set_bus (struct slot * slot_c
 	}
 	/* This is for x440, once Brandon fixes the firmware, 
 	will not need this delay */
-	long_delay (1 * HZ);
+	msleep(1000);
 	debug ("%s -Exit\n", __FUNCTION__);
 	return 0;
 }

--===============59111733793449872==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============59111733793449872==--
