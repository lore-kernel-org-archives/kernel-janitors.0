From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 20 Jul 2004 18:20:05 +0000
Subject: [Kernel-janitors] [PATCH] bluetooth: replace schedule_timeout()
Message-Id: <20040720182005.GG2320@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86013318891806545=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720181806.GF2320@us.ibm.com>
In-Reply-To: <20040720181806.GF2320@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============86013318891806545==
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

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays at least the desired time amount.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/bluetooth/bt3c_cs.c	2004-06-16 05:20:26.000000000 +0000
+++ linux-dev/drivers/bluetooth/bt3c_cs.c	2004-07-10 18:23:11.000000000 +0000
@@ -633,8 +633,7 @@ int bt3c_open(bt3c_info_t *info)
 	}
 
 	/* Timeout before it is safe to send the first HCI packet */
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ);
+	msleep(1000);
 
 	/* Register HCI device */
 	err = hci_register_dev(hdev);

--===============86013318891806545==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86013318891806545==--
