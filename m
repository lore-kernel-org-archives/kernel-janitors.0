From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Dec 2016 21:08:43 +0000
Subject: [bug report] ppdev: fix memory leak
Message-Id: <20161215210843.GA28981@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Sudip Mukherjee,

The patch 2bd362d5f45c: "ppdev: fix memory leak" from Nov 10, 2016,
leads to the following static checker warning:

	drivers/char/ppdev.c:314 register_device()
	warn: passing freed memory 'name'

drivers/char/ppdev.c
   287  static int register_device(int minor, struct pp_struct *pp)
   288  {
   289          struct parport *port;
   290          struct pardevice *pdev = NULL;
   291          char *name;
   292          struct pardev_cb ppdev_cb;
   293  
   294          name = kasprintf(GFP_KERNEL, CHRDEV "%x", minor);
   295          if (name = NULL)
   296                  return -ENOMEM;
   297  
   298          port = parport_find_number(minor);
   299          if (!port) {
   300                  pr_warn("%s: no associated port!\n", name);
   301                  kfree(name);
   302                  return -ENXIO;
   303          }
   304  
   305          memset(&ppdev_cb, 0, sizeof(ppdev_cb));
   306          ppdev_cb.irq_func = pp_irq;
   307          ppdev_cb.flags = (pp->flags & PP_EXCL) ? PARPORT_FLAG_EXCL : 0;
   308          ppdev_cb.private = pp;
   309          pdev = parport_register_dev_model(port, name, &ppdev_cb, minor);
   310          parport_put_port(port);
   311          kfree(name);
                      ^^^^
Free.

   312  
   313          if (!pdev) {
   314                  pr_warn("%s: failed to register device!\n", name);
                                                                    ^^^^
Use after free.

   315                  return -ENXIO;
   316          }
   317  
   318          pp->pdev = pdev;
   319          dev_dbg(&pdev->dev, "registered pardevice\n");
   320          return 0;
   321  }

regards,
dan carpenter
