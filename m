From: Mahesh Kalappattil <mahesh.lkml@gmail.com>
Date: Fri, 05 Mar 2010 06:10:57 +0000
Subject: [patch linux-next] ipmi: remove voidp casts
Message-Id: <fc8156581003042210p25fcd11v4616b42fbcf87699@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This trivial patch removes the (void *) conversion as per the kernel
janitor TODO list.

Signed-off-by: Mahesh Kalappattil <mahesh.lkml@gmail.com>

--- linux-2.6.33/drivers/char/ipmi/ipmi_si_intf.c
+++ linux-2.6.33/drivers/char/ipmi/ipmi_si_intf.c
@@ -2483,11 +2483,11 @@ static int __devexit ipmi_of_remove(stru
 static struct of_device_id ipmi_match[]  {
        { .type = "ipmi", .compatible = "ipmi-kcs",
-         .data = (void *)(unsigned long) SI_KCS },
+         .data = (unsigned long) SI_KCS },
        { .type = "ipmi", .compatible = "ipmi-smic",
-         .data = (void *)(unsigned long) SI_SMIC },
+         .data = (unsigned long) SI_SMIC },
        { .type = "ipmi", .compatible = "ipmi-bt",
-         .data = (void *)(unsigned long) SI_BT },
+         .data = (unsigned long) SI_BT },
        {},
 };
