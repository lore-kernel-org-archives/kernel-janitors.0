From: Yuanhan Liu <yuanhan.liu@intel.com>
Date: Thu, 18 Oct 2012 11:25:47 +0000
Subject: [balbi-usb:i2c-transferred-bytes-on-NACK 7/8] drivers/char/tpm/tpm_i2c_infineon.c:93:9: warning: ini
Message-Id: <20121018112547.GS21995@yliu-dev.sh.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Shubhrajyoti,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git i2c-transferred-bytes-on-NACK
head:   84461dba998a10909ba197fdbb4497e66d331edf
commit: ad5b920b31d68c5970b285136f4dff96612c7a4b [7/8] i2c: add 'transferred' field to struct i2c_msg
config: m68k-allmodconfig # make ARCH=m68k allmodconfig

All warnings:

drivers/char/tpm/tpm_i2c_infineon.c: In function 'iic_tpm_read':
drivers/char/tpm/tpm_i2c_infineon.c:93:9: warning: initialization makes integer from pointer without a cast [enabled by default]
drivers/char/tpm/tpm_i2c_infineon.c:93:9: warning: (near initialization for 'msg1.transferred') [enabled by default]
drivers/char/tpm/tpm_i2c_infineon.c:94:9: warning: initialization makes integer from pointer without a cast [enabled by default]
drivers/char/tpm/tpm_i2c_infineon.c:94:9: warning: (near initialization for 'msg2.transferred') [enabled by default]
drivers/char/tpm/tpm_i2c_infineon.c: In function 'iic_tpm_write_generic':
drivers/char/tpm/tpm_i2c_infineon.c:141:9: warning: initialization makes integer from pointer without a cast [enabled by default]
drivers/char/tpm/tpm_i2c_infineon.c:141:9: warning: (near initialization for 'msg1.transferred') [enabled by default]

vim +93 drivers/char/tpm/tpm_i2c_infineon.c

aad628c1 Peter Huewe 2012-08-07   77   * Read len bytes from TPM register and put them into
aad628c1 Peter Huewe 2012-08-07   78   * buffer (little-endian format, i.e. first byte is put into buffer[0]).
aad628c1 Peter Huewe 2012-08-07   79   *
aad628c1 Peter Huewe 2012-08-07   80   * NOTE: TPM is big-endian for multi-byte values. Multi-byte
aad628c1 Peter Huewe 2012-08-07   81   * values have to be swapped.
aad628c1 Peter Huewe 2012-08-07   82   *
aad628c1 Peter Huewe 2012-08-07   83   * NOTE: We can't unfortunately use the combined read/write functions
aad628c1 Peter Huewe 2012-08-07   84   * provided by the i2c core as the TPM currently does not support the
aad628c1 Peter Huewe 2012-08-07   85   * repeated start condition and due to it's special requirements.
aad628c1 Peter Huewe 2012-08-07   86   * The i2c_smbus* functions do not work for this chip.
aad628c1 Peter Huewe 2012-08-07   87   *
aad628c1 Peter Huewe 2012-08-07   88   * Return -EIO on error, 0 on success.
aad628c1 Peter Huewe 2012-08-07   89   */
aad628c1 Peter Huewe 2012-08-07   90  static int iic_tpm_read(u8 addr, u8 *buffer, size_t len)
aad628c1 Peter Huewe 2012-08-07   91  {
aad628c1 Peter Huewe 2012-08-07   92  
aad628c1 Peter Huewe 2012-08-07  @93  	struct i2c_msg msg1 = { tpm_dev.client->addr, 0, 1, &addr };
aad628c1 Peter Huewe 2012-08-07   94  	struct i2c_msg msg2 = { tpm_dev.client->addr, I2C_M_RD, len, buffer };
aad628c1 Peter Huewe 2012-08-07   95  
aad628c1 Peter Huewe 2012-08-07   96  	int rc;
aad628c1 Peter Huewe 2012-08-07   97  	int count;
aad628c1 Peter Huewe 2012-08-07   98  
aad628c1 Peter Huewe 2012-08-07   99  	/* Lock the adapter for the duration of the whole sequence. */
aad628c1 Peter Huewe 2012-08-07  100  	if (!tpm_dev.client->adapter->algo->master_xfer)
aad628c1 Peter Huewe 2012-08-07  101  		return -EOPNOTSUPP;

The code at line 93 was first introduced by commit:
aad628c char/tpm: Add new driver for Infineon I2C TIS TPM


---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
