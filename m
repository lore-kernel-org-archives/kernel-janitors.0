From: Andrew Morton <akpm@linux-foundation.org>
Date: Thu, 16 Oct 2014 20:01:02 +0000
Subject: Re: [patch -mm] rtc: pm8xxx: unlock on error in pm8xxx_rtc_set_time()
Message-Id: <20141016130102.71a1ec4f51f5fc4d1e0f7f7f@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141016075520.GA29096@mwanda>
In-Reply-To: <20141016075520.GA29096@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 16 Oct 2014 16:57:07 +0300 Stanimir Varbanov <svarbanov@mm-sol.com> wrote:

> I'm wondering for a better fix to this. Isn't better to avoid this
> conditional call to spin_unlock_irqrestore() and lock regmap writes
> every time without care is the alarm is enabled or not.

That's what I was thinking.  This?

--- a/drivers/rtc/rtc-pm8xxx.c~rtc-pm8xxx-rework-to-support-pm8941-rtc-fix
+++ a/drivers/rtc/rtc-pm8xxx.c
@@ -113,8 +113,6 @@ static int pm8xxx_rtc_set_time(struct de
 			dev_err(dev, "Write to RTC control register failed\n");
 			goto rtc_rw_fail;
 		}
-	} else {
-		spin_unlock_irqrestore(&rtc_dd->ctrl_reg_lock, irq_flags);
 	}
 
 	/* Write 0 to Byte[0] */
@@ -149,8 +147,7 @@ static int pm8xxx_rtc_set_time(struct de
 	}
 
 rtc_rw_fail:
-	if (alarm_enabled)
-		spin_unlock_irqrestore(&rtc_dd->ctrl_reg_lock, irq_flags);
+	spin_unlock_irqrestore(&rtc_dd->ctrl_reg_lock, irq_flags);
 
 	return rc;
 }
_

