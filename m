From: Corey Minyard <cminyard@mvista.com>
Date: Mon, 17 Jan 2005 21:50:34 +0000
Subject: [KJ] Re: [PATCH 9/21] char/ipmi_si_intf: replace schedule_timeout()
Message-Id: <41EC332A.8020603@mvista.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71076433511427251=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============71076433511427251==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Why?

-Corey

Nishanth Aravamudan wrote:

>Hi,
>
>Sorry, I was off by one in my total.
>
>Please consider applying. 
>
>Description: Use msleep() instead of schedule_timeout(). I have chosen to use
>msleep(10) here, even though the former calls were schedule_timeout(1), as many
>drivers were not updated to consider the new HZ values. Under HZ==100, the
>existing calls were 10ms delays, which I have returned to with this patch. If 1
>ms was actually desired (or 1 scheduler unit) then the patch can be changed
>appropriately.
>
>Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
>
>
>--- 2.6.11-rc1-kj-v/drivers/char/ipmi/ipmi_si_intf.c	2005-01-15 16:55:41.000000000 -0800
>+++ 2.6.11-rc1-kj/drivers/char/ipmi/ipmi_si_intf.c	2005-01-16 23:35:29.000000000 -0800
>@@ -1880,8 +1880,7 @@ static int try_get_dev_id(struct smi_inf
> 	for (;;)
> 	{
> 		if (smi_result == SI_SM_CALL_WITH_DELAY) {
>-			set_current_state(TASK_UNINTERRUPTIBLE);
>-			schedule_timeout(1);
>+			msleep(10);
> 			smi_result = smi_info->handlers->event(
> 				smi_info->si_sm, 100);
> 		}
>@@ -2153,10 +2152,8 @@ static int init_one_smi(int intf_num, st
> 
> 	/* Wait for the timer to stop.  This avoids problems with race
> 	   conditions removing the timer here. */
>-	while (!new_smi->timer_stopped) {
>-		set_current_state(TASK_UNINTERRUPTIBLE);
>-		schedule_timeout(1);
>-	}
>+	while (!new_smi->timer_stopped)
>+		msleep(10);
> 
>  out_err:
> 	if (new_smi->intf)
>@@ -2280,17 +2277,14 @@ static void __exit cleanup_one_si(struct
> 
> 	/* Wait for the timer to stop.  This avoids problems with race
> 	   conditions removing the timer here. */
>-	while (!to_clean->timer_stopped) {
>-		set_current_state(TASK_UNINTERRUPTIBLE);
>-		schedule_timeout(1);
>-	}
>+	while (!to_clean->timer_stopped)
>+		msleep(10);
> 
> 	/* Interrupts and timeouts are stopped, now make sure the
> 	   interface is in a clean state. */
> 	while ((to_clean->curr_msg) || (to_clean->si_state != SI_NORMAL)) {
> 		poll(to_clean);
>-		set_current_state(TASK_UNINTERRUPTIBLE);
>-		schedule_timeout(1);
>+		msleep(10);
> 	}
> 
> 	rv = ipmi_unregister_smi(to_clean->intf);
>  
>


--===============71076433511427251==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71076433511427251==--
