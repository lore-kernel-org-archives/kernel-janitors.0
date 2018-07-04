From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jul 2018 09:48:53 +0000
Subject: [PATCH] xhci: xhci-mem: off by one in xhci_stream_id_to_ring()
Message-Id: <20180704094852.nylsfxev557iluak@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathias Nyman <mathias.nyman@intel.com>, Sarah Sharp <sarah.a.sharp@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

The > should be >= here so that we don't read one element beyond the end
of the ep->stream_info->stream_rings[] array.

Fixes: e9df17eb1408 ("USB: xhci: Correct assumptions about number of rings per endpoint.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 8a62eee9eee1..ef350c33dc4a 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -595,7 +595,7 @@ struct xhci_ring *xhci_stream_id_to_ring(
 	if (!ep->stream_info)
 		return NULL;
 
-	if (stream_id > ep->stream_info->num_streams)
+	if (stream_id >= ep->stream_info->num_streams)
 		return NULL;
 	return ep->stream_info->stream_rings[stream_id];
 }
