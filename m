From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Mar 2017 10:50:04 +0000
Subject: [PATCH 1/2] switchtec: off by one in ioctl_event_ctl()
Message-Id: <20170313105004.GA24989@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kurt Schwemmer <kurt.schwemmer@microsemi.com>, Logan Gunthorpe <logang@deltatee.com>
Cc: Stephen Bates <stephen.bates@microsemi.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

The > should be >= SWITCHTEC_IOCTL_MAX_EVENTS.  Otherwise we probably
read one space beyond the end of the loop, hit a sanity check and return
-EINVAL.  This bug doesn't look super serious.

Fixes: 61c2e02154a9 ("switchtec: Add IOCTLs to the Switchtec driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pci/switch/switchtec.c b/drivers/pci/switch/switchtec.c
index 1f045c95dec6..82ae08956457 100644
--- a/drivers/pci/switch/switchtec.c
+++ b/drivers/pci/switch/switchtec.c
@@ -1049,7 +1049,7 @@ static int ioctl_event_ctl(struct switchtec_dev *stdev,
 	if (copy_from_user(&ctl, uctl, sizeof(ctl)))
 		return -EFAULT;
 
-	if (ctl.event_id > SWITCHTEC_IOCTL_MAX_EVENTS)
+	if (ctl.event_id >= SWITCHTEC_IOCTL_MAX_EVENTS)
 		return -EINVAL;
 
 	if (ctl.flags & SWITCHTEC_IOCTL_EVENT_FLAG_UNUSED)
