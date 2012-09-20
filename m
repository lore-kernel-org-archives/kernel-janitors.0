From: Adam Buchbinder <adam.buchbinder@gmail.com>
Date: Thu, 20 Sep 2012 01:48:02 +0000
Subject: [PATCH] various: Fix spelling of "asynchronous" in comments.
Message-Id: <1348105682-25196-5-git-send-email-adam.buchbinder@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"Asynchronous" is misspelled in some comments. No code changes.

Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
---
 drivers/char/ipmi/ipmi_msghandler.c     |    2 +-
 drivers/char/ipmi/ipmi_si_intf.c        |    2 +-
 drivers/firewire/init_ohci1394_dma.c    |    4 ++--
 drivers/firewire/ohci.c                 |    2 +-
 drivers/net/ethernet/mellanox/mlx4/eq.c |    2 +-
 drivers/tty/ipwireless/setup_protocol.h |    2 +-
 fs/notify/notification.c                |    2 +-
 include/linux/dlm.h                     |    2 +-
 include/linux/ipmi.h                    |    2 +-
 include/linux/ipmi_smi.h                |    2 +-
 mm/memory_hotplug.c                     |    6 +++---
 sound/pci/sis7019.c                     |    2 +-
 12 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 2c29942..271715c 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -3789,7 +3789,7 @@ static int handle_one_recv_msg(ipmi_smi_t          intf,
 
 	} else if ((msg->rsp[0] = ((IPMI_NETFN_APP_REQUEST|1) << 2))
 		   && (msg->rsp[1] = IPMI_READ_EVENT_MSG_BUFFER_CMD)) {
-		/* It's an asyncronous event. */
+		/* It's an asynchronous event. */
 		requeue = handle_read_event_rsp(intf, msg);
 	} else {
 		/* It's a response from the local BMC. */
diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index 83f85cf..e261178 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -155,7 +155,7 @@ enum si_stat_indexes {
 	/* Number of watchdog pretimeouts. */
 	SI_STAT_watchdog_pretimeouts,
 
-	/* Number of asyncronous messages received. */
+	/* Number of asynchronous messages received. */
 	SI_STAT_incoming_messages,
 
 
diff --git a/drivers/firewire/init_ohci1394_dma.c b/drivers/firewire/init_ohci1394_dma.c
index a9a347a..2cc89ce 100644
--- a/drivers/firewire/init_ohci1394_dma.c
+++ b/drivers/firewire/init_ohci1394_dma.c
@@ -149,10 +149,10 @@ static inline void __init init_ohci1394_initialize(struct ohci *ohci)
 	reg_write(ohci, OHCI1394_IsoXmitIntMaskClear, 0xffffffff);
 	reg_write(ohci, OHCI1394_IsoXmitIntEventClear, 0xffffffff);
 
-	/* Accept asyncronous transfer requests from all nodes for now */
+	/* Accept asynchronous transfer requests from all nodes for now */
 	reg_write(ohci, OHCI1394_AsReqFilterHiSet, 0x80000000);
 
-	/* Specify asyncronous transfer retries */
+	/* Specify asynchronous transfer retries */
 	reg_write(ohci, OHCI1394_ATRetries,
 		  OHCI1394_MAX_AT_REQ_RETRIES |
 		  (OHCI1394_MAX_AT_RESP_RETRIES<<4) |
diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index c788dbd..e9d808f 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -1281,7 +1281,7 @@ static int at_context_queue_packet(struct context *ctx,
 	d[0].res_count = cpu_to_le16(packet->timestamp);
 
 	/*
-	 * The DMA format for asyncronous link packets is different
+	 * The DMA format for asynchronous link packets is different
 	 * from the IEEE1394 layout, so shift the fields around
 	 * accordingly.
 	 */
diff --git a/drivers/net/ethernet/mellanox/mlx4/eq.c b/drivers/net/ethernet/mellanox/mlx4/eq.c
index 99a0464..1bbd406 100644
--- a/drivers/net/ethernet/mellanox/mlx4/eq.c
+++ b/drivers/net/ethernet/mellanox/mlx4/eq.c
@@ -1054,7 +1054,7 @@ int mlx4_test_interrupts(struct mlx4_dev *dev)
 		/* Temporary use polling for command completions */
 		mlx4_cmd_use_polling(dev);
 
-		/* Map the new eq to handle all asyncronous events */
+		/* Map the new eq to handle all asynchronous events */
 		err = mlx4_MAP_EQ(dev, get_async_ev_mask(dev), 0,
 				  priv->eq_table.eq[i].eqn);
 		if (err) {
diff --git a/drivers/tty/ipwireless/setup_protocol.h b/drivers/tty/ipwireless/setup_protocol.h
index 9d6bcc7..002c34e 100644
--- a/drivers/tty/ipwireless/setup_protocol.h
+++ b/drivers/tty/ipwireless/setup_protocol.h
@@ -59,7 +59,7 @@ struct tl_setup_config_done_msg {
 	unsigned char sig_no;		/* TL_SETUP_SIGNO_CONFIG_DONE_MSG */
 } __attribute__ ((__packed__));
 
-/* Asyncronous messages */
+/* Asynchronous messages */
 struct tl_setup_open_msg {
 	unsigned char sig_no;		/* TL_SETUP_SIGNO_OPEN_MSG */
 	unsigned char port_no;
diff --git a/fs/notify/notification.c b/fs/notify/notification.c
index c887b13..48cb994 100644
--- a/fs/notify/notification.c
+++ b/fs/notify/notification.c
@@ -18,7 +18,7 @@
 
 /*
  * Basic idea behind the notification queue: An fsnotify group (like inotify)
- * sends the userspace notification about events asyncronously some time after
+ * sends the userspace notification about events asynchronously some time after
  * the event happened.  When inotify gets an event it will need to add that
  * event to the group notify queue.  Since a single event might need to be on
  * multiple group's notification queues we can't add the event directly to each
diff --git a/include/linux/dlm.h b/include/linux/dlm.h
index 5201524..20d23bc 100644
--- a/include/linux/dlm.h
+++ b/include/linux/dlm.h
@@ -155,7 +155,7 @@ int dlm_release_lockspace(dlm_lockspace_t *lockspace, int force);
 /*
  * dlm_lock
  *
- * Make an asyncronous request to acquire or convert a lock on a named
+ * Make an asynchronous request to acquire or convert a lock on a named
  * resource.
  *
  * lockspace: context for the request
diff --git a/include/linux/ipmi.h b/include/linux/ipmi.h
index 48dcba9..17f2904 100644
--- a/include/linux/ipmi.h
+++ b/include/linux/ipmi.h
@@ -585,7 +585,7 @@ struct ipmi_req_settime {
 /* Messages received from the interface are this format. */
 struct ipmi_recv {
 	int     recv_type; /* Is this a command, response or an
-			      asyncronous event. */
+			      asynchronous event. */
 
 	unsigned char __user *addr;    /* Address the message was from is put
 				   here.  The caller must supply the
diff --git a/include/linux/ipmi_smi.h b/include/linux/ipmi_smi.h
index fcb5d44..8ea3fe0 100644
--- a/include/linux/ipmi_smi.h
+++ b/include/linux/ipmi_smi.h
@@ -216,7 +216,7 @@ int ipmi_unregister_smi(ipmi_smi_t intf);
 
 /*
  * The lower layer reports received messages through this interface.
- * The data_size should be zero if this is an asyncronous message.  If
+ * The data_size should be zero if this is an asynchronous message.  If
  * the lower layer gets an error sending a message, it should format
  * an error response in the message response.
  */
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 6a5b90d..7a33b4b 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -946,10 +946,10 @@ repeat:
 			goto repeat;
 		}
 	}
-	/* drain all zone's lru pagevec, this is asyncronous... */
+	/* drain all zone's lru pagevec, this is asynchronous... */
 	lru_add_drain_all();
 	yield();
-	/* drain pcp pages , this is synchrouns. */
+	/* drain pcp pages, this is synchronous. */
 	drain_all_pages();
 	/* check again */
 	offlined_pages = check_pages_isolated(start_pfn, end_pfn);
@@ -958,7 +958,7 @@ repeat:
 		goto failed_removal;
 	}
 	printk(KERN_INFO "Offlined Pages %ld\n", offlined_pages);
-	/* Ok, all of our target is islaoted.
+	/* Ok, all of our target is isolated.
 	   We cannot do rollback at this point. */
 	offline_isolated_pages(start_pfn, end_pfn);
 	/* reset pagetype flags and makes migrate type to be MOVABLE */
diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
index 805ab6e..d8a5e0e 100644
--- a/sound/pci/sis7019.c
+++ b/sound/pci/sis7019.c
@@ -1171,7 +1171,7 @@ static int sis_chip_init(struct sis7019 *sis)
 	outl(SIS_DMA_CSR_PCI_SETTINGS, io + SIS_DMA_CSR);
 
 	/* Reset the synchronization groups for all of the channels
-	 * to be asyncronous. If we start doing SPDIF or 5.1 sound, etc.
+	 * to be asynchronous. If we start doing SPDIF or 5.1 sound, etc.
 	 * we'll need to change how we handle these. Until then, we just
 	 * assign sub-mixer 0 to all playback channels, and avoid any
 	 * attenuation on the audio.
-- 
1.7.7.3

