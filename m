From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 19 Oct 2019 08:54:51 +0000
Subject: [bug report] usb: hso: obey DMA rules in tiocmget
Message-Id: <20191019085451.GA13915@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Oliver Neukum,

The patch af0de1303c4e: "usb: hso: obey DMA rules in tiocmget" from
Oct 17, 2019, leads to the following static checker warning:

	drivers/net/usb/hso.c:2626 hso_create_bulk_serial_device()
	warn: variable dereferenced before check 'serial->tiocmget' (see line 2620)

drivers/net/usb/hso.c
  2615  
  2616          if ((port & HSO_PORT_MASK) = HSO_PORT_MODEM) {
  2617                  num_urbs = 2;
  2618                  serial->tiocmget = kzalloc(sizeof(struct hso_tiocmget),
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^
Allocation

  2619                                             GFP_KERNEL);
  2620                  serial->tiocmget->serial_state_notification
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Dereference

  2621                          = kzalloc(sizeof(struct hso_serial_state_notification),
  2622                                             GFP_KERNEL);
  2623                  /* it isn't going to break our heart if serial->tiocmget
  2624                   *  allocation fails don't bother checking this.
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Comment says not to check for failure.

  2625                   */
  2626                  if (serial->tiocmget && serial->tiocmget->serial_state_notification) {
                            ^^^^^^^^^^^^^^^^
Check too late.

  2627                          tiocmget = serial->tiocmget;
  2628                          tiocmget->endp = hso_get_ep(interface,
  2629                                                      USB_ENDPOINT_XFER_INT,
  2630                                                      USB_DIR_IN);
  2631                          if (!tiocmget->endp) {
  2632                                  dev_err(&interface->dev, "Failed to find INT IN ep\n");
  2633                                  goto exit;
  2634                          }
  2635  
  2636                          tiocmget->urb = usb_alloc_urb(0, GFP_KERNEL);
  2637                          if (tiocmget->urb) {
  2638                                  mutex_init(&tiocmget->mutex);
  2639                                  init_waitqueue_head(&tiocmget->waitq);
  2640                          } else
  2641                                  hso_free_tiomget(serial);
  2642                  }
  2643          }
  2644          else
  2645                  num_urbs = 1;


regards,
dan carpenter
