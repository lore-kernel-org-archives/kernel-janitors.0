From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Jul 2013 16:46:22 +0000
Subject: [patch] [media] bt8xx: info leak in ca_get_slot_info()
Message-Id: <20130725164621.GA6945@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: Antti Palosaari <crope@iki.fi>, Nickolai Zeldovich <nickolai@csail.mit.edu>, Peter Senna Tschudin <peter.senna@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

p_ca_slot_info was allocated with kmalloc() so we need to clear it
before passing it to the user.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/pci/bt8xx/dst_ca.c b/drivers/media/pci/bt8xx/dst_ca.c
index 0e788fc..6b9dc3f 100644
--- a/drivers/media/pci/bt8xx/dst_ca.c
+++ b/drivers/media/pci/bt8xx/dst_ca.c
@@ -302,8 +302,11 @@ static int ca_get_slot_info(struct dst_state *state, struct ca_slot_info *p_ca_s
 		p_ca_slot_info->flags = CA_CI_MODULE_READY;
 		p_ca_slot_info->num = 1;
 		p_ca_slot_info->type = CA_CI;
-	} else
+	} else {
 		p_ca_slot_info->flags = 0;
+		p_ca_slot_info->num = 0;
+		p_ca_slot_info->type = 0;
+	}
 
 	if (copy_to_user(arg, p_ca_slot_info, sizeof (struct ca_slot_info)))
 		return -EFAULT;
