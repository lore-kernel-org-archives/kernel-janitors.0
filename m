From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Dec 2020 14:57:23 +0000
Subject: [bug report] regulator: da9121: Add support for device variants via devicetree
Message-Id: <X8pOUyVj5Q8iQYJI@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Adam Ward,

The patch 46c413d5bb23: "regulator: da9121: Add support for device
variants via devicetree" from Nov 30, 2020, leads to the following
static checker warning:

	drivers/regulator/da9121-regulator.c:383 da9121_of_parse_cb()
	warn: array off by one? 'da9121_matches[pdata->num_buck]'

drivers/regulator/da9121-regulator.c
   348  static int da9121_of_parse_cb(struct device_node *np,
   349                                  const struct regulator_desc *desc,
   350                                  struct regulator_config *config)
   351  {
   352          struct da9121 *chip = config->driver_data;
   353          struct da9121_pdata *pdata;
   354          struct gpio_desc *ena_gpiod;
   355  
   356          if (chip->pdata = NULL) {
   357                  pdata = devm_kzalloc(chip->dev, sizeof(*pdata), GFP_KERNEL);
   358                  if (!pdata)
   359                          return -ENOMEM;
   360          } else {
   361                  pdata = chip->pdata;
   362          }
   363  
   364          pdata->num_buck++;
   365  
   366          if (pdata->num_buck > variant_parameters[chip->variant_id].num_bucks) {
                                    ^^
Smatch is complaining that this sort of looks like it should be >instead of >.  This looks true to me as well, but I'm not positive
enough to actually send a patch.  :P

   367                  dev_err(chip->dev, "Error: excessive regulators for device\n");
   368                  return -ENODEV;
   369          }
   370  
   371          ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), "enable", 0,
   372                                                  GPIOD_OUT_HIGH |
   373                                                  GPIOD_FLAGS_BIT_NONEXCLUSIVE,
   374                                                  "da9121-enable");
   375          if (!IS_ERR(ena_gpiod))
   376                  config->ena_gpiod = ena_gpiod;
   377  
   378          if (variant_parameters[chip->variant_id].num_bucks = 2) {
   379                  uint32_t ripple_cancel;
   380                  uint32_t ripple_reg;
   381                  int ret;
   382  
   383                  if (of_property_read_u32(da9121_matches[pdata->num_buck].of_node,
                                                                ^^^^^^^^^^^^^^^
We know that .num_bucks is 2 here so if ->num_buck is = to that then
this is one element beyond the end of the array.

   384                                  "dlg,ripple-cancel", &ripple_cancel)) {
   385                          if (pdata->num_buck > 1)
   386                                  ripple_reg = DA9xxx_REG_BUCK_BUCK2_7;
   387                          else
   388                                  ripple_reg = DA9121_REG_BUCK_BUCK1_7;
   389  
   390                          ret = regmap_update_bits(chip->regmap, ripple_reg,
   391                                  DA9xxx_MASK_BUCK_BUCKx_7_CHx_RIPPLE_CANCEL,
   392                                  ripple_cancel);
   393                          if (ret < 0)

regards,
dan carpenter
