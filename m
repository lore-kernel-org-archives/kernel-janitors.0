From: Biju Das <biju.das@bp.renesas.com>
Date: Tue, 07 May 2019 06:54:10 +0000
Subject: RE: [bug report] phy: renesas: phy-rcar-gen2: Add support for r8a77470
Message-Id: <OSBPR01MB2103C59136CB33ED587BC370B8310@OSBPR01MB2103.jpnprd01.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190503131010.GJ29695@mwanda>
In-Reply-To: <20190503131010.GJ29695@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan Carpenter,

Thanks for the report.   Yes, the hardcoded check  "channel_num > 2" to be replaced with 
some variable check to fix this issue.

How to reproduce this issue? So that I can I provide a fix.

I tried using smatch tool, but I get a different warning.

biju@be1yocto:/data/biju/linux-next$ make -j8 uImage LOADADDR=80008000 CHECK="/data/biju/smatch/smatch -p=kernel" C=1 | tee warns.txt
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CHECK   drivers/phy/renesas/phy-rcar-gen2.c
drivers/phy/renesas/phy-rcar-gen2.c:354 rcar_gen2_phy_probe() warn: passing zero to 'PTR_ERR'
drivers/phy/renesas/phy-rcar-gen2.c:360 rcar_gen2_phy_probe() warn: passing zero to 'PTR_ERR'
drivers/phy/renesas/phy-rcar-gen2.c:409 rcar_gen2_phy_probe() warn: passing zero to 'PTR_ERR'
drivers/phy/renesas/phy-rcar-gen2.c:420 rcar_gen2_phy_probe() warn: passing zero to 'PTR_ERR'
  CC      drivers/phy/renesas/phy-rcar-gen2.o
  AR      drivers/phy/renesas/built-in.a
  AR      drivers/phy/built-in.a
  AR      drivers/built-in.a
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CHECK   init/version.c
  CC      init/version.o
  AR      init/built-in.a
  LD      vmlinux.o
  MODPOST vmlinux.o
  KSYM    .tmp_kallsyms1.o
  KSYM    .tmp_kallsyms2.o
  LD      vmlinux
  SORTEX  vmlinux
  SYSMAP  System.map
  OBJCOPY arch/arm/boot/Image
  Kernel: arch/arm/boot/Image is ready
  GZIP    arch/arm/boot/compressed/piggy_data
  AS      arch/arm/boot/compressed/piggy.o
  LD      arch/arm/boot/compressed/vmlinux
  OBJCOPY arch/arm/boot/zImage
  Kernel: arch/arm/boot/zImage is ready
  UIMAGE  arch/arm/boot/uImage
Image Name:   Linux-5.1.0-rc6-next-20190423-00
Created:      Tue May  7 07:40:23 2019
Image Type:   ARM Linux Kernel Image (uncompressed)
Data Size:    4671240 Bytes = 4561.76 kB = 4.45 MB
Load Address: 80008000
Entry Point:  80008000
  Kernel: arch/arm/boot/uImage is ready
biju@be1yocto:/data/biju/linux-next$ /data/biju/smatch/
c2xml           compat/         ctags           Documentation/  graph           obfuscate       smatch_data/    sparse          sparsei         test-dissect    test-lexing     test-parsing    validation/     
cgcc            compile         cwchash/        example         gvpr/           smatch          smatch_scripts/ sparsec         sparse-llvm     test-inspect    test-linearize  test-unssa      
biju@be1yocto:/data/biju/linux-next$ /data/biju/smatch/smatch_scripts/kchecker drivers/phy/renesas/
  CHECK   scripts/mod/empty.c
  CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
  CHECK   drivers/phy/renesas/phy-rcar-gen2.c
drivers/phy/renesas/phy-rcar-gen2.c:354 rcar_gen2_phy_probe() warn: passing zero to 'PTR_ERR'
drivers/phy/renesas/phy-rcar-gen2.c:360 rcar_gen2_phy_probe() warn: passing zero to 'PTR_ERR'
drivers/phy/renesas/phy-rcar-gen2.c:409 rcar_gen2_phy_probe() warn: passing zero to 'PTR_ERR'
drivers/phy/renesas/phy-rcar-gen2.c:420 rcar_gen2_phy_probe() warn: passing zero to 'PTR_ERR'
  CHECK   drivers/phy/renesas/phy-rcar-gen3-usb2.c
drivers/phy/renesas/phy-rcar-gen3-usb2.c:602 rcar_gen3_phy_usb2_probe() warn: passing zero to 'PTR_ERR'
drivers/phy/renesas/phy-rcar-gen3-usb2.c:670 rcar_gen3_phy_usb2_probe() warn: passing zero to 'PTR_ERR'
biju@be1yocto:/data/biju/linux-next$

regards,
Biju

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: 03 May 2019 14:10
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: kernel-janitors@vger.kernel.org
> Subject: [bug report] phy: renesas: phy-rcar-gen2: Add support for r8a77470
> 
> Hello Biju Das,
> 
> The patch b7187e001a10: "phy: renesas: phy-rcar-gen2: Add support for
> r8a77470" from Apr 10, 2019, leads to the following static checker
> warning:
> 
> 	drivers/phy/renesas/phy-rcar-gen2.c:403 rcar_gen2_phy_probe()
> 	warn: array off by one? 'data->select_value[channel_num]'
> 
> drivers/phy/renesas/phy-rcar-gen2.c
>    262  static const u32 pci_select_value[][PHYS_PER_CHANNEL] = {
>    263          [0]     = { USBHS_UGCTRL2_USB0SEL_PCI,
> USBHS_UGCTRL2_USB0SEL_HS_USB },
>    264          [2]     = { USBHS_UGCTRL2_USB2SEL_PCI,
> USBHS_UGCTRL2_USB2SEL_USB30 },
> 
> This select array has three elements.
> 
>    265  };
>    266
>    267  static const u32 usb20_select_value[][PHYS_PER_CHANNEL] = {
>    268          { USBHS_UGCTRL2_USB0SEL_USB20,
> USBHS_UGCTRL2_USB0SEL_HS_USB20 },
> 
> But this one only has two.
> 
>    269  };
>    270
>    271  static const struct rcar_gen2_phy_data rcar_gen2_usb_phy_data = {
>    272          .gen2_phy_ops = &rcar_gen2_phy_ops,
>    273          .select_value = pci_select_value,
>    274  };
>    275
>    276  static const struct rcar_gen2_phy_data rz_g1c_usb_phy_data = {
>    277          .gen2_phy_ops = &rz_g1c_phy_ops,
>    278          .select_value = usb20_select_value,
>    279  };
> 
> [ snip ]
> 
>    382          for_each_child_of_node(dev->of_node, np) {
>    383                  struct rcar_gen2_channel *channel = drv->channels + i;
>    384                  u32 channel_num;
>    385                  int error, n;
>    386
>    387                  channel->of_node = np;
>    388                  channel->drv = drv;
>    389                  channel->selected_phy = -1;
>    390
>    391                  error = of_property_read_u32(np, "reg", &channel_num);
>    392                  if (error || channel_num > 2) {
>                                      ^^^^^^^^^^^^^^^ The code seems to assume they all
> have 3 elements
> 
>    393                          dev_err(dev, "Invalid \"reg\" property\n");
>    394                          return error;
>    395                  }
>    396                  channel->select_mask = select_mask[channel_num];
>    397
>    398                  for (n = 0; n < PHYS_PER_CHANNEL; n++) {
>    399                          struct rcar_gen2_phy *phy = &channel->phys[n];
>    400
>    401                          phy->channel = channel;
>    402                          phy->number = n;
>    403                          phy->select_value = data->select_value[channel_num][n];
>                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Smatch
> warning.
> 
>    404
>    405                          phy->phy = devm_phy_create(dev, NULL,
>    406                                                     data->gen2_phy_ops);
>    407                          if (IS_ERR(phy->phy)) {
>    408                                  dev_err(dev, "Failed to create PHY\n");
>    409                                  return PTR_ERR(phy->phy);
>    410                          }
>    411                          phy_set_drvdata(phy->phy, phy);
>    412                  }
>    413
>    414                  i++;
>    415          }
> 
> regards,
> dan carpenter
