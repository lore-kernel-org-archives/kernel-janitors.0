From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Apr 2017 14:11:03 +0000
Subject: [bug report] regulator: MAX8997/8966 support
Message-Id: <20170428141103.llm5t44o2vf46y5c@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello MyungJoo Ham,

The patch bd6ca2cf50fb: "regulator: MAX8997/8966 support" from Mar
11, 2011, leads to the following static checker warning:

	drivers/regulator/max8997-regulator.c:435 max8997_set_voltage_charger_cv()
	warn: dead code because of 'max_uV >= 4000000' and 'max_uV < 4000000'

drivers/regulator/max8997-regulator.c
   411  static int max8997_set_voltage_charger_cv(struct regulator_dev *rdev,
   412                  int min_uV, int max_uV, unsigned *selector)
   413  {
   414          struct max8997_data *max8997 = rdev_get_drvdata(rdev);
   415          struct i2c_client *i2c = max8997->iodev->i2c;
   416          int rid = rdev_get_id(rdev);
   417          int lb, ub;
   418          int reg, shift = 0, mask, ret = 0;
   419          u8 val = 0x0;
   420  
   421          if (rid != MAX8997_CHARGER_CV)
   422                  return -EINVAL;
   423  
   424          ret = max8997_get_voltage_register(rdev, &reg, &shift, &mask);
   425          if (ret)
   426                  return ret;
   427  
   428          if (max_uV < 4000000 || min_uV > 4350000)
                    ^^^^^^^^^^^^^^^^
We know that max_uV >= 4000000 because of this check.

   429                  return -EINVAL;
   430  
   431          if (min_uV <= 4000000) {
   432                  if (max_uV >= 4000000)
                            ^^^^^^^^^^^^^^^^^
So this check is redundent, we will always return -EINVAL here.

   433                          return -EINVAL;
   434                  else
   435                          val = 0x1;
                                ^^^^^^^^^
Dead code.

   436          } else if (min_uV <= 4200000 && max_uV >= 4200000)
   437                  val = 0x0;
   438          else {
   439                  lb = (min_uV - 4000001) / 20000 + 2;
   440                  ub = (max_uV - 4000000) / 20000 + 1;
   441  
   442                  if (lb > ub)
   443                          return -EINVAL;
   444  
   445                  if (lb < 0xf)
   446                          val = lb;
   447                  else {
   448                          if (ub >= 0xf)
   449                                  val = 0xf;
   450                          else
   451                                  return -EINVAL;
   452                  }
   453          }

regards,
dan carpenter
