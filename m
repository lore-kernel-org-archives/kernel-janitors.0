From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 20 Jul 2013 18:58:58 +0000
Subject: build regressions 2013-07-20
Message-Id: <51eaddf2.JP/DG1I0lTJesVex%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/regulator/88pm800.c:141:44: error: array type has incomplete element type
drivers/regulator/88pm800.c:142:2: error: field name not in record or union initializer
drivers/regulator/88pm800.c:142:2: error: field name not in record or union initializer
drivers/regulator/88pm800.c:142:2: error: field name not in record or union initializer
drivers/regulator/88pm800.c:142:2: error: field name not in record or union initializer
drivers/regulator/88pm800.c:143:4: error: field name not in record or union initializer
drivers/regulator/88pm800.c:144:2: error: field name not in record or union initializer
drivers/regulator/88pm800.c:144:2: error: field name not in record or union initializer
drivers/regulator/88pm800.c:144:2: error: field name not in record or union initializer
drivers/regulator/88pm800.c:145:4: error: field name not in record or union initializer
drivers/regulator/88pm800.c:145:4: error: field name not in record or union initializer
drivers/regulator/88pm800.c:149:44: error: array type has incomplete element type
drivers/regulator/88pm800.c:150:2: error: field name not in record or union initializer
drivers/regulator/88pm800.c:150:2: error: field name not in record or union initializer
drivers/regulator/88pm800.c:150:2: error: field name not in record or union initializer
drivers/regulator/88pm800.c:150:2: error: field name not in record or union initializer
drivers/regulator/88pm800.c:151:4: error: field name not in record or union initializer
drivers/regulator/88pm800.c:152:2: error: field name not in record or union initializer
drivers/regulator/88pm800.c:152:2: error: field name not in record or union initializer
drivers/regulator/88pm800.c:152:2: error: field name not in record or union initializer
drivers/regulator/88pm800.c:153:4: error: field name not in record or union initializer
drivers/regulator/88pm800.c:153:4: error: field name not in record or union initializer
drivers/regulator/88pm800.c:184:18: error: 'regulator_list_voltage_linear_range' undeclared here (not in a function)
drivers/regulator/88pm800.c:185:17: error: 'regulator_map_voltage_linear_range' undeclared here (not in a function)
drivers/regulator/88pm800.c:207:128: error: unknown field 'linear_ranges' specified in initializer
drivers/regulator/88pm800.c:207:128: error: unknown field 'n_linear_ranges' specified in initializer
drivers/regulator/88pm800.c:207:270: error: bit-field '<anonymous>' width not an integer constant
drivers/regulator/88pm800.c:208:128: error: unknown field 'linear_ranges' specified in initializer
drivers/regulator/88pm800.c:208:128: error: unknown field 'n_linear_ranges' specified in initializer
drivers/regulator/88pm800.c:208:276: error: bit-field '<anonymous>' width not an integer constant
drivers/regulator/88pm800.c:209:128: error: unknown field 'linear_ranges' specified in initializer
drivers/regulator/88pm800.c:209:128: error: unknown field 'n_linear_ranges' specified in initializer
drivers/regulator/88pm800.c:209:276: error: bit-field '<anonymous>' width not an integer constant
drivers/regulator/88pm800.c:210:128: error: unknown field 'linear_ranges' specified in initializer
drivers/regulator/88pm800.c:210:128: error: unknown field 'n_linear_ranges' specified in initializer
drivers/regulator/88pm800.c:210:276: error: bit-field '<anonymous>' width not an integer constant
drivers/regulator/88pm800.c:211:128: error: unknown field 'linear_ranges' specified in initializer
drivers/regulator/88pm800.c:211:128: error: unknown field 'n_linear_ranges' specified in initializer
drivers/regulator/88pm800.c:211:276: error: bit-field '<anonymous>' width not an integer constant
crypto/built-in.o:(.rodata+0x154a4): undefined reference to `RSA_public_key_algorithm'
(.text+0x132b29): undefined reference to `i2c_smbus_write_byte_data'
(.text+0x132bb7): undefined reference to `i2c_smbus_read_byte_data'
(.text+0x132beb): undefined reference to `i2c_smbus_write_byte_data'
(.text+0x132c73): undefined reference to `i2c_smbus_read_byte_data'
include/linux/export.h:36:30: error: unknown field 'linear_ranges' specified in initializer
include/linux/export.h:36:30: error: unknown field 'n_linear_ranges' specified in initializer
include/linux/bug.h:33:45: error: bit-field '<anonymous>' width not an integer constant
include/linux/export.h:36:30: error: unknown field 'linear_ranges' specified in initializer
include/linux/export.h:36:30: error: unknown field 'n_linear_ranges' specified in initializer
include/linux/bug.h:33:45: error: bit-field '<anonymous>' width not an integer constant
include/linux/export.h:36:30: error: unknown field 'linear_ranges' specified in initializer
include/linux/export.h:36:30: error: unknown field 'n_linear_ranges' specified in initializer
include/linux/bug.h:33:45: error: bit-field '<anonymous>' width not an integer constant
include/linux/export.h:36:30: error: unknown field 'linear_ranges' specified in initializer
include/linux/export.h:36:30: error: unknown field 'n_linear_ranges' specified in initializer
include/linux/bug.h:33:45: error: bit-field '<anonymous>' width not an integer constant
include/linux/export.h:36:30: error: unknown field 'linear_ranges' specified in initializer
include/linux/export.h:36:30: error: unknown field 'n_linear_ranges' specified in initializer
include/linux/bug.h:33:45: error: bit-field '<anonymous>' width not an integer constant

[warnings]
drivers/regulator/88pm800.c:141:44: warning: 'buck1_volt_range' defined but not used [-Wunused-variable]
drivers/regulator/88pm800.c:149:44: warning: 'buck2_5_volt_range' defined but not used [-Wunused-variable]
drivers/mfd/stw481x.c:30:5: warning: unused variable 'regandval' [-Wunused-variable]
drivers/regulator/stw481x-vmmc.c:156:20: warning: ignoring return value of 'sysfs_create_group', declared with attribute warn_unused_result [-Wunused-result]

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
