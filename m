From: Benoit Taine <benoit.taine@lip6.fr>
Date: Mon, 26 May 2014 15:21:23 +0000
Subject: [PATCH 14/18] r8152: Use kmemdup instead of kmalloc + memcpy
Message-Id: <1401117687-28911-15-git-send-email-benoit.taine@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401117687-28911-1-git-send-email-benoit.taine@lip6.fr>
In-Reply-To: <1401117687-28911-1-git-send-email-benoit.taine@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org
Cc: benoit.taine@lip6.fr, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This issue was reported by coccicheck using the semantic patch 
at scripts/coccinelle/api/memdup.cocci

Signed-off-by: Benoit Taine <benoit.taine@lip6.fr>
---
Tested by compilation without errors.

 drivers/net/usb/r8152.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 9f91c7a..2543196 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -630,12 +630,10 @@ int set_registers(struct r8152 *tp, u16 value, u16 index, u16 size, void *data)
 	int ret;
 	void *tmp;
 
-	tmp = kmalloc(size, GFP_KERNEL);
+	tmp = kmemdup(data, size, GFP_KERNEL);
 	if (!tmp)
 		return -ENOMEM;
 
-	memcpy(tmp, data, size);
-
 	ret = usb_control_msg(tp->udev, usb_sndctrlpipe(tp->udev, 0),
 			       RTL8152_REQ_SET_REGS, RTL8152_REQT_WRITE,
 			       value, index, tmp, size, 500);

