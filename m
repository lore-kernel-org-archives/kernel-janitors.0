From: Dan Carpenter <error27@gmail.com>
Date: Sat, 04 Sep 2010 18:38:59 +0000
Subject: [patch] isdn: potential buffer overflows
Message-Id: <20100904183806.GO5437@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <isdn@linux-pingi.de>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

cs->ics.parm.setup.phone is a 32 character array.  In each of these
cases we're copying from a 35 character array into a 32 character array
so we should use strlcpy() instead of strcpy().

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/isdn/divert/isdn_divert.c b/drivers/isdn/divert/isdn_divert.c
index 70cf6ba..48e6d22 100644
--- a/drivers/isdn/divert/isdn_divert.c
+++ b/drivers/isdn/divert/isdn_divert.c
@@ -77,7 +77,7 @@ static void deflect_timer_expire(ulong arg)
 
      case DEFLECT_ALERT:
        cs->ics.command = ISDN_CMD_REDIR; /* protocol */
-       strcpy(cs->ics.parm.setup.phone,cs->deflect_dest);
+       strlcpy(cs->ics.parm.setup.phone, cs->deflect_dest, sizeof(cs->ics.parm.setup.phone));
        strcpy(cs->ics.parm.setup.eazmsn,"Testtext delayed");
        divert_if.ll_cmd(&cs->ics);
        spin_lock_irqsave(&divert_lock, flags);
@@ -251,7 +251,7 @@ int deflect_extern_action(u_char cmd, ulong callid, char *to_nr)
 
      case 2: /* redir */
        del_timer(&cs->timer); 
-       strcpy(cs->ics.parm.setup.phone, to_nr);
+       strlcpy(cs->ics.parm.setup.phone, to_nr, sizeof(cs->ics.parm.setup.phone));
        strcpy(cs->ics.parm.setup.eazmsn, "Testtext manual");
        ic.command = ISDN_CMD_REDIR;
        if ((i = divert_if.ll_cmd(&ic)))
@@ -480,7 +480,7 @@ static int isdn_divert_icall(isdn_ctrl *ic)
                if (!cs->timer.expires)
 		 { strcpy(ic->parm.setup.eazmsn,"Testtext direct");
                    ic->parm.setup.screen = dv->rule.screen;
-                   strcpy(ic->parm.setup.phone,dv->rule.to_nr);
+                   strlcpy(ic->parm.setup.phone, dv->rule.to_nr, sizeof(ic->parm.setup.phone));
                    cs->akt_state = DEFLECT_AUTODEL; /* delete after timeout */
                    cs->timer.expires = jiffies + (HZ * AUTODEL_TIME);
                    retval = 5; 
