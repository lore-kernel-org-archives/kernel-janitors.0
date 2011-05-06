From: matt mooney <mfm@muteddisk.com>
Date: Fri, 06 May 2011 10:47:54 +0000
Subject: [PATCH 14/16] staging: usbip: add break to default case in switch statements
Message-Id: <06c01137af0f06f5bbb08efe65d78ecaaad8f484.1304676742.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1304676742.git.mfm@muteddisk.com>
In-Reply-To: <cover.1304676742.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

For consistency, a break statement is added to all default cases that
do not jump to a label.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/staging/usbip/stub_rx.c      |    2 +-
 drivers/staging/usbip/stub_tx.c      |    1 +
 drivers/staging/usbip/usbip_common.c |   13 ++++++++++---
 drivers/staging/usbip/vhci_hcd.c     |    2 ++
 drivers/staging/usbip/vhci_rx.c      |    3 ++-
 5 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/usbip/stub_rx.c b/drivers/staging/usbip/stub_rx.c
index ac4dd4d..e11ac2a 100644
--- a/drivers/staging/usbip/stub_rx.c
+++ b/drivers/staging/usbip/stub_rx.c
@@ -594,7 +594,7 @@ static void stub_rx_pdu(struct usbip_device *ud)
 		/* NOTREACHED */
 		dev_err(dev, "unknown pdu\n");
 		usbip_event_add(ud, SDEV_EVENT_ERROR_TCP);
-		return;
+		break;
 	}
 }
 
diff --git a/drivers/staging/usbip/stub_tx.c b/drivers/staging/usbip/stub_tx.c
index bbf207d..76d82b2 100644
--- a/drivers/staging/usbip/stub_tx.c
+++ b/drivers/staging/usbip/stub_tx.c
@@ -91,6 +91,7 @@ void stub_complete(struct urb *urb)
 	default:
 		usbip_uinfo("urb completion with non-zero status %d\n",
 			    urb->status);
+		break;
 	}
 
 	/* link a urb to the queue of tx. */
diff --git a/drivers/staging/usbip/usbip_common.c b/drivers/staging/usbip/usbip_common.c
index cd66d56..a6ae67c 100644
--- a/drivers/staging/usbip/usbip_common.c
+++ b/drivers/staging/usbip/usbip_common.c
@@ -91,6 +91,7 @@ static void usbip_dump_pipe(unsigned int p)
 		break;
 	default:
 		printk(KERN_DEBUG "ERR");
+		break;
 	}
 
 	printk(KERN_DEBUG "\n");
@@ -120,6 +121,7 @@ static void usbip_dump_usb_device(struct usb_device *udev)
 		break;
 	default:
 		printk(KERN_DEBUG " SPD_ERROR");
+		break;
 	}
 
 	printk(KERN_DEBUG " tt %p, ttport %d", udev->tt, udev->ttport);
@@ -187,6 +189,7 @@ static void usbip_dump_request_type(__u8 rt)
 		break;
 	default:
 		printk(KERN_DEBUG "------");
+		break;
 	}
 }
 
@@ -244,6 +247,7 @@ static void usbip_dump_usb_ctrlrequest(struct usb_ctrlrequest *cmd)
 			break;
 		default:
 			printk(KERN_DEBUG "REQ(%02X) ", cmd->bRequest);
+			break;
 		}
 
 		printk(KERN_DEBUG " ");
@@ -342,7 +346,8 @@ void usbip_dump_header(struct usbip_header *pdu)
 		break;
 	default:
 		/* NOT REACHED */
-		usbip_udbg("UNKNOWN\n");
+		usbip_udbg("unknown command\n");
+		break;
 	}
 }
 EXPORT_SYMBOL_GPL(usbip_dump_header);
@@ -537,9 +542,10 @@ void usbip_pack_pdu(struct usbip_header *pdu, struct urb *urb, int cmd,
 		usbip_pack_ret_submit(pdu, urb, pack);
 		break;
 	default:
+		/* NOT REACHED */
 		err("unknown command");
-		/* NOTREACHED */
 		/* BUG(); */
+		break;
 	}
 }
 EXPORT_SYMBOL_GPL(usbip_pack_pdu);
@@ -643,9 +649,10 @@ void usbip_header_correct_endian(struct usbip_header *pdu, int send)
 		correct_endian_ret_unlink(&pdu->u.ret_unlink, send);
 		break;
 	default:
-		/* NOTREACHED */
+		/* NOT REACHED */
 		err("unknown command in pdu header: %d", cmd);
 		/* BUG(); */
+		break;
 	}
 }
 EXPORT_SYMBOL_GPL(usbip_header_correct_endian);
diff --git a/drivers/staging/usbip/vhci_hcd.c b/drivers/staging/usbip/vhci_hcd.c
index 86d85cc..47884d1 100644
--- a/drivers/staging/usbip/vhci_hcd.c
+++ b/drivers/staging/usbip/vhci_hcd.c
@@ -320,6 +320,7 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			usbip_dbg_vhci_rh(" ClearPortFeature: default %x\n",
 					  wValue);
 			dum->port_status[rhport] &= ~(1 << wValue);
+			break;
 		}
 		break;
 	case GetHubDescriptor:
@@ -451,6 +452,7 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			usbip_dbg_vhci_rh(" SetPortFeature: default %d\n",
 					  wValue);
 			dum->port_status[rhport] |= (1 << wValue);
+			break;
 		}
 		break;
 
diff --git a/drivers/staging/usbip/vhci_rx.c b/drivers/staging/usbip/vhci_rx.c
index 61b9fc7..46f2ee5 100644
--- a/drivers/staging/usbip/vhci_rx.c
+++ b/drivers/staging/usbip/vhci_rx.c
@@ -247,10 +247,11 @@ static void vhci_rx_pdu(struct usbip_device *ud)
 		vhci_recv_ret_unlink(vdev, &pdu);
 		break;
 	default:
-		/* NOTREACHED */
+		/* NOT REACHED */
 		usbip_uerr("unknown pdu %u\n", pdu.base.command);
 		usbip_dump_header(&pdu);
 		usbip_event_add(ud, VDEV_EVENT_ERROR_TCP);
+		break;
 	}
 }
 
-- 
1.7.5.1

