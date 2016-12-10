From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Dec 2016 20:50:03 +0000
Subject: [PATCH 2/4] [media] bt8xx: Delete two error messages for a failed memory allocation
Message-Id: <e14ec555-7299-75e7-5fd0-9b38448aab84@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d9a0777b-8ea7-3f7d-4fa2-b16468c4a1a4@users.sourceforge.net>
In-Reply-To: <d9a0777b-8ea7-3f7d-4fa2-b16468c4a1a4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Alexey Khoroshilov <khoroshilov@ispras.ru>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Dec 2016 20:50:58 +0100

Omit extra messages for a memory allocation failure in two functions.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/pci/bt8xx/dst_ca.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/bt8xx/dst_ca.c b/drivers/media/pci/bt8xx/dst_ca.c
index 8681b9143a35..54e656ddd588 100644
--- a/drivers/media/pci/bt8xx/dst_ca.c
+++ b/drivers/media/pci/bt8xx/dst_ca.c
@@ -481,10 +481,9 @@ static int ca_send_message(struct dst_state *state, struct ca_msg *p_ca_message,
 	struct ca_msg *hw_buffer;
 	int result = 0;
 
-	if ((hw_buffer = kmalloc(sizeof (struct ca_msg), GFP_KERNEL)) = NULL) {
-		dprintk(verbose, DST_CA_ERROR, 1, " Memory allocation failure");
+	hw_buffer = kmalloc(sizeof(*hw_buffer), GFP_KERNEL);
+	if (!hw_buffer)
 		return -ENOMEM;
-	}
 	dprintk(verbose, DST_CA_DEBUG, 1, " ");
 
 	if (copy_from_user(p_ca_message, arg, sizeof (struct ca_msg))) {
@@ -567,7 +566,6 @@ static long dst_ca_ioctl(struct file *file, unsigned int cmd, unsigned long ioct
 	p_ca_slot_info = kmalloc(sizeof (struct ca_slot_info), GFP_KERNEL);
 	p_ca_caps = kmalloc(sizeof (struct ca_caps), GFP_KERNEL);
 	if (!p_ca_message || !p_ca_slot_info || !p_ca_caps) {
-		dprintk(verbose, DST_CA_ERROR, 1, " Memory allocation failure");
 		result = -ENOMEM;
 		goto free_mem_and_exit;
 	}
-- 
2.11.0

