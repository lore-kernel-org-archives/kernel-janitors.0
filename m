From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Oct 2012 07:18:35 +0000
Subject: [patch] x86/oprofile: fix wrapping bug in op_x86_get_ctrl()
Message-Id: <20121010071835.GA26201@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The "event" variable is a u16 so the shift will always wrap to zero
making the line a no-op.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This was introduced in 2009 in 3370d35856 "x86/oprofile: replace macros
to calculate control register".  I am doing static analysis and I'm not
very familiar with this code.  Please review my changes carefully.

diff --git a/arch/x86/oprofile/nmi_int.c b/arch/x86/oprofile/nmi_int.c
index 26b8a85..48768df 100644
--- a/arch/x86/oprofile/nmi_int.c
+++ b/arch/x86/oprofile/nmi_int.c
@@ -55,7 +55,7 @@ u64 op_x86_get_ctrl(struct op_x86_model_spec const *model,
 	val |= counter_config->extra;
 	event &= model->event_mask ? model->event_mask : 0xFF;
 	val |= event & 0xFF;
-	val |= (event & 0x0F00) << 24;
+	val |= (u64)(event & 0x0F00) << 24;
 
 	return val;
 }
