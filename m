From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Jun 2020 13:18:58 +0000
Subject: [bug report] tty: cyclades, cache HW version
Message-Id: <20200624131858.GA9972@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[ Kees recently removed the uninitialized_var() variable so ancient
  code has started to print warnings.  GCC doesn't warn about
  uninitialized variables these days either.  It's been buggy for
  10 years so it's probably not an emergency.  -dan ]

Hello Jiri Slaby,

The patch 101b81590d8d: "tty: cyclades, cache HW version" from Jun
11, 2009, leads to the following static checker warning:

	drivers/tty/cyclades.c:3805 cy_pci_probe()
	error: uninitialized symbol 'mailbox'.

drivers/tty/cyclades.c
  3640  static int cy_pci_probe(struct pci_dev *pdev,
  3641                  const struct pci_device_id *ent)
  3642  {
  3643          struct cyclades_card *card;
  3644          void __iomem *addr0 = NULL, *addr2 = NULL;
  3645          char *card_name = NULL;
  3646          u32 mailbox;
                ^^^^^^^^^^^^

  3647          unsigned int device_id, nchan = 0, card_no, i, j;
  3648          unsigned char plx_ver;
  3649          int retval, irq;
  3650  
  3651          retval = pci_enable_device(pdev);
  3652          if (retval) {
  3653                  dev_err(&pdev->dev, "cannot enable device\n");
  3654                  goto err;
  3655          }
  3656  
  3657          /* read PCI configuration area */
  3658          irq = pdev->irq;
  3659          device_id = pdev->device & ~PCI_DEVICE_ID_MASK;
  3660  
  3661  #if defined(__alpha__)
  3662          if (device_id = PCI_DEVICE_ID_CYCLOM_Y_Lo) {   /* below 1M? */
  3663                  dev_err(&pdev->dev, "Cyclom-Y/PCI not supported for low "
  3664                          "addresses on Alpha systems.\n");
  3665                  retval = -EIO;
  3666                  goto err_dis;
  3667          }
  3668  #endif
  3669          if (device_id = PCI_DEVICE_ID_CYCLOM_Z_Lo) {
  3670                  dev_err(&pdev->dev, "Cyclades-Z/PCI not supported for low "
  3671                          "addresses\n");
  3672                  retval = -EIO;
  3673                  goto err_dis;
  3674          }
  3675  
  3676          if (pci_resource_flags(pdev, 2) & IORESOURCE_IO) {
  3677                  dev_warn(&pdev->dev, "PCI I/O bit incorrectly set. Ignoring "
  3678                                  "it...\n");
  3679                  pdev->resource[2].flags &= ~IORESOURCE_IO;
  3680          }
  3681  
  3682          retval = pci_request_regions(pdev, "cyclades");
  3683          if (retval) {
  3684                  dev_err(&pdev->dev, "failed to reserve resources\n");
  3685                  goto err_dis;
  3686          }
  3687  
  3688          retval = -EIO;
  3689          if (device_id = PCI_DEVICE_ID_CYCLOM_Y_Lo ||
  3690                          device_id = PCI_DEVICE_ID_CYCLOM_Y_Hi) {
  3691                  card_name = "Cyclom-Y";
  3692  
  3693                  addr0 = ioremap(pci_resource_start(pdev, 0),
  3694                                  CyPCI_Yctl);
  3695                  if (addr0 = NULL) {
  3696                          dev_err(&pdev->dev, "can't remap ctl region\n");
  3697                          goto err_reg;
  3698                  }
  3699                  addr2 = ioremap(pci_resource_start(pdev, 2),
  3700                                  CyPCI_Ywin);
  3701                  if (addr2 = NULL) {
  3702                          dev_err(&pdev->dev, "can't remap base region\n");
  3703                          goto err_unmap;
  3704                  }
  3705  
  3706                  nchan = CyPORTS_PER_CHIP * cyy_init_card(addr2, 1);
  3707                  if (nchan = 0) {
  3708                          dev_err(&pdev->dev, "Cyclom-Y PCI host card with no "
  3709                                          "Serial-Modules\n");
  3710                          goto err_unmap;
  3711                  }
  3712          } else if (device_id = PCI_DEVICE_ID_CYCLOM_Z_Hi) {
                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  3713                  struct RUNTIME_9060 __iomem *ctl_addr;
  3714  
  3715                  ctl_addr = addr0 = ioremap(pci_resource_start(pdev, 0),
  3716                                  CyPCI_Zctl);
  3717                  if (addr0 = NULL) {
  3718                          dev_err(&pdev->dev, "can't remap ctl region\n");
  3719                          goto err_reg;
  3720                  }
  3721  
  3722                  /* Disable interrupts on the PLX before resetting it */
  3723                  cy_writew(&ctl_addr->intr_ctrl_stat,
  3724                                  readw(&ctl_addr->intr_ctrl_stat) & ~0x0900);
  3725  
  3726                  plx_init(pdev, irq, addr0);
  3727  
  3728                  mailbox = readl(&ctl_addr->mail_box_0);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Only initialized for PCI_DEVICE_ID_CYCLOM_Z_Hi.

  3729  
  3730                  addr2 = ioremap(pci_resource_start(pdev, 2),
  3731                                  mailbox = ZE_V1 ? CyPCI_Ze_win : CyPCI_Zwin);
  3732                  if (addr2 = NULL) {
  3733                          dev_err(&pdev->dev, "can't remap base region\n");
  3734                          goto err_unmap;
  3735                  }
  3736  
  3737                  if (mailbox = ZE_V1) {
  3738                          card_name = "Cyclades-Ze";
  3739                  } else {
  3740                          card_name = "Cyclades-8Zo";
  3741  #ifdef CY_PCI_DEBUG
  3742                          if (mailbox = ZO_V1) {
  3743                                  cy_writel(&ctl_addr->loc_addr_base, WIN_CREG);
  3744                                  dev_info(&pdev->dev, "Cyclades-8Zo/PCI: FPGA "
  3745                                          "id %lx, ver %lx\n", (ulong)(0xff &
  3746                                          readl(&((struct CUSTOM_REG *)addr2)->
  3747                                                  fpga_id)), (ulong)(0xff &
  3748                                          readl(&((struct CUSTOM_REG *)addr2)->
  3749                                                  fpga_version)));
  3750                                  cy_writel(&ctl_addr->loc_addr_base, WIN_RAM);
  3751                          } else {
  3752                                  dev_info(&pdev->dev, "Cyclades-Z/PCI: New "
  3753                                          "Cyclades-Z board.  FPGA not loaded\n");
  3754                          }
  3755  #endif
  3756                          /* The following clears the firmware id word.  This
  3757                             ensures that the driver will not attempt to talk to
  3758                             the board until it has been properly initialized.
  3759                           */
  3760                          if ((mailbox = ZO_V1) || (mailbox = ZO_V2))
  3761                                  cy_writel(addr2 + ID_ADDRESS, 0L);
  3762                  }
  3763  
  3764                  retval = cyz_load_fw(pdev, addr2, addr0, irq);
  3765                  if (retval <= 0)
  3766                          goto err_unmap;
  3767                  nchan = retval;
  3768          }
  3769  
  3770          if ((cy_next_channel + nchan) > NR_PORTS) {
  3771                  dev_err(&pdev->dev, "Cyclades-8Zo/PCI found, but no "
  3772                          "channels are available. Change NR_PORTS in "
  3773                          "cyclades.c and recompile kernel.\n");
  3774                  goto err_unmap;
  3775          }
  3776          /* fill the next cy_card structure available */
  3777          for (card_no = 0; card_no < NR_CARDS; card_no++) {
  3778                  card = &cy_card[card_no];
  3779                  if (card->base_addr = NULL)
  3780                          break;
  3781          }
  3782          if (card_no = NR_CARDS) {      /* no more cy_cards available */
  3783                  dev_err(&pdev->dev, "Cyclades-8Zo/PCI found, but no "
  3784                          "more cards can be used. Change NR_CARDS in "
  3785                          "cyclades.c and recompile kernel.\n");
  3786                  goto err_unmap;
  3787          }
  3788  
  3789          if (device_id = PCI_DEVICE_ID_CYCLOM_Y_Lo ||
  3790                          device_id = PCI_DEVICE_ID_CYCLOM_Y_Hi) {
  3791                  /* allocate IRQ */
  3792                  retval = request_irq(irq, cyy_interrupt,
  3793                                  IRQF_SHARED, "Cyclom-Y", card);
  3794                  if (retval) {
  3795                          dev_err(&pdev->dev, "could not allocate IRQ\n");
  3796                          goto err_unmap;
  3797                  }
  3798                  card->num_chips = nchan / CyPORTS_PER_CHIP;
  3799          } else {

There are several other PCI devices besides PCI_DEVICE_ID_CYCLOM_Z_Hi.

  3800                  struct FIRM_ID __iomem *firm_id = addr2 + ID_ADDRESS;
  3801                  struct ZFW_CTRL __iomem *zfw_ctrl;
  3802  
  3803                  zfw_ctrl = addr2 + (readl(&firm_id->zfwctrl_addr) & 0xfffff);
  3804  
  3805                  card->hw_ver = mailbox;
                                       ^^^^^^^
Uninitialized.

  3806                  card->num_chips = (unsigned int)-1;
  3807                  card->board_ctrl = &zfw_ctrl->board_ctrl;
  3808  #ifdef CONFIG_CYZ_INTR
  3809                  /* allocate IRQ only if board has an IRQ */
  3810                  if (irq != 0 && irq != 255) {
  3811                          retval = request_irq(irq, cyz_interrupt,
  3812                                          IRQF_SHARED, "Cyclades-Z", card);
  3813                          if (retval) {
  3814                                  dev_err(&pdev->dev, "could not allocate IRQ\n");
  3815                                  goto err_unmap;
  3816                          }
  3817                  }
  3818  #endif                          /* CONFIG_CYZ_INTR */
  3819          }
  3820  
  3821          /* set cy_card */
  3822          card->base_addr = addr2;
  3823          card->ctl_addr.p9050 = addr0;
  3824          card->irq = irq;
  3825          card->bus_index = 1;
  3826          card->first_line = cy_next_channel;
  3827          card->nports = nchan;

regards,
dan carpenter
