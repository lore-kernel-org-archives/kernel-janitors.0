From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Dec 2020 15:04:30 +0000
Subject: [bug report] regulator: da9121: Add device variant regmaps
Message-Id: <X8pP/pZAj6W7/YfP@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Adam Ward,

The patch c860476b9e3a: "regulator: da9121: Add device variant
regmaps" from Nov 30, 2020, leads to the following static checker
warning:

	drivers/regulator/da9121-regulator.c:869 da9121_check_device_type()
	error: uninitialized symbol 'name'.

drivers/regulator/da9121-regulator.c
   811  static int da9121_check_device_type(struct i2c_client *i2c, struct da9121 *chip)
   812  {
   813          u32 device_id;
   814          u8 chip_id = chip->variant_id;
   815          u32 variant_id;
   816          u8 variant_mrc, variant_vrc;
   817          char *type;
   818          const char *name;
                ^^^^^^^^^^^^^^^^

   819          bool config_match = false;
   820          int ret = 0;
   821  
   822          ret = regmap_read(chip->regmap, DA9121_REG_OTP_DEVICE_ID, &device_id);
   823          if (ret < 0) {
   824                  dev_err(chip->dev, "Cannot read device ID: %d\n", ret);
   825                  goto error;
   826          }
   827  
   828          ret = regmap_read(chip->regmap, DA9121_REG_OTP_VARIANT_ID, &variant_id);
   829          if (ret < 0) {
   830                  dev_err(chip->dev, "Cannot read variant ID: %d\n", ret);
   831                  goto error;
   832          }
   833  
   834          if (device_id != DA9121_DEVICE_ID) {
   835                  dev_err(chip->dev, "Invalid device ID: 0x%02x\n", device_id);
   836                  ret = -ENODEV;
   837                  goto error;
   838          }
   839  
   840          variant_vrc = variant_id & DA9121_MASK_OTP_VARIANT_ID_VRC;
   841  
   842          switch (variant_vrc) {
   843          case DA9121_VARIANT_VRC:
   844                  type = "DA9121/DA9130";
   845                  config_match = (chip_id = DA9121_TYPE_DA9121_DA9130);
   846                  break;
   847          case DA9220_VARIANT_VRC:
   848                  type = "DA9220/DA9132";
   849                  config_match = (chip_id = DA9121_TYPE_DA9220_DA9132);
   850                  break;
   851          case DA9122_VARIANT_VRC:
   852                  type = "DA9122/DA9131";
   853                  config_match = (chip_id = DA9121_TYPE_DA9122_DA9131);
   854                  break;
   855          case DA9217_VARIANT_VRC:
   856                  type = "DA9217";
   857                  config_match = (chip_id = DA9121_TYPE_DA9217);
   858                  break;
   859          default:
   860                  type = "Unknown";
   861                  break;
   862          }
   863  
   864          dev_info(chip->dev,
   865                   "Device detected (device-ID: 0x%02X, var-ID: 0x%02X, %s)\n",
   866                   device_id, variant_id, type);
   867  
   868          if (!config_match) {
   869                  dev_err(chip->dev, "Device tree configuration '%s' does not match detected device.\n", name);
                                                                                                               ^^^^
"name" is never set.  What did you want it to be?

   870                  ret = -EINVAL;
   871                  goto error;
   872          }
   873  
   874          variant_mrc = (variant_id & DA9121_MASK_OTP_VARIANT_ID_MRC)
   875                          >> DA9121_SHIFT_OTP_VARIANT_ID_MRC;
   876  
   877          if ((device_id = DA9121_DEVICE_ID) &&
   878              (variant_mrc < DA9121_VARIANT_MRC_BASE)) {
   879                  dev_err(chip->dev,
   880                          "Cannot support variant MRC: 0x%02X\n", variant_mrc);
   881                  ret = -EINVAL;
   882          }
   883  error:
   884          return ret;
   885  }

regards,
dan carpenter
