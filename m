From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Jul 2017 13:07:19 +0000
Subject: [PATCH v2] platform/x86: peaq-wmi: silence a static checker warning
Message-Id: <20170719130718.gcskf2ofko5wv6rw@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAHp75VdSD0zVFtnwF8oWt24P8DM6vZQNO93F_38yaCYBzCCBRw@mail.gmail.com>
In-Reply-To: <CAHp75VdSD0zVFtnwF8oWt24P8DM6vZQNO93F_38yaCYBzCCBRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Darren Hart <dvhart@infradead.org>, Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a harmless static checker warning here that unsigned values are
always >= 0.  The code looks like:

	if (peaq_ignore_events_counter && --peaq_ignore_events_counter >= 0)

The first part of the condition ensures that we never wrap around so the
code works as intended.  I've tweaked it slightly to avoid the warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Andy Shevchenko's approach is cleaner

diff --git a/drivers/platform/x86/peaq-wmi.c b/drivers/platform/x86/peaq-wmi.c
index 77d1f90b0794..c68bd76954fd 100644
--- a/drivers/platform/x86/peaq-wmi.c
+++ b/drivers/platform/x86/peaq-wmi.c
@@ -51,7 +51,7 @@ static void peaq_wmi_poll(struct input_polled_dev *dev)
 		return;
 	}
 
-	if (peaq_ignore_events_counter && --peaq_ignore_events_counter >= 0)
+	if (peaq_ignore_events_counter && peaq_ignore_events_counter--)
 		return;
 
 	if (obj.integer.value) {
