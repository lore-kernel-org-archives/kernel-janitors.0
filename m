From: "Datta, Shubhrajyoti" <shubhrajyoti@ti.com>
Date: Thu, 18 Oct 2012 18:01:45 +0000
Subject: RE: [balbi-usb:i2c-transferred-bytes-on-NACK 7/8] drivers/char/tpm/tpm_i2c_infineon.c:93:9: warning:
Message-Id: <794C9920E947F94A8C01939ECE2B66A8AC68BA@DBDE01.ent.ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121018112547.GS21995@yliu-dev.sh.intel.com>
In-Reply-To: <20121018112547.GS21995@yliu-dev.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


________________________________________
From: Balbi, Felipe
Sent: 18 October 2012 19:14:30
To: Yuanhan Liu
Cc: Datta, Shubhrajyoti; fengguang.wu@intel.com; Balbi, Felipe; kernel-janitors@vger.kernel.org
Subject: Re: [balbi-usb:i2c-transferred-bytes-on-NACK 7/8] drivers/char/tpm/tpm_i2c_infineon.c:93:9: warning: initialization makes integer from pointer without a cast

Hi,

On Thu, Oct 18, 2012 at 07:25:47PM +0800, Yuanhan Liu wrote:
> Hi Shubhrajyoti,
>
> FYI, there are new compile warnings show up in
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git i2c-transferred-bytes-on-NACK
> head:   84461dba998a10909ba197fdbb4497e66d331edf
> commit: ad5b920b31d68c5970b285136f4dff96612c7a4b [7/8] i2c: add 'transferred' field to struct i2c_msg
> config: m68k-allmodconfig # make ARCH=m68k allmodconfig
>
> All warnings:
>
> drivers/char/tpm/tpm_i2c_infineon.c: In function 'iic_tpm_read':
> drivers/char/tpm/tpm_i2c_infineon.c:93:9: warning: initialization makes integer from pointer without a cast [enabled by default]
> drivers/char/tpm/tpm_i2c_infineon.c:93:9: warning: (near initialization for 'msg1.transferred') [enabled by default]
> drivers/char/tpm/tpm_i2c_infineon.c:94:9: warning: initialization makes integer from pointer without a cast [enabled by default]
> drivers/char/tpm/tpm_i2c_infineon.c:94:9: warning: (near initialization for 'msg2.transferred') [enabled by default]
> drivers/char/tpm/tpm_i2c_infineon.c: In function 'iic_tpm_write_generic':
> drivers/char/tpm/tpm_i2c_infineon.c:141:9: warning: initialization makes integer from pointer without a cast [enabled by default]
> drivers/char/tpm/tpm_i2c_infineon.c:141:9: warning: (near initialization for 'msg1.transferred') [enabled by default]
>
> vim +93 drivers/char/tpm/tpm_i2c_infineon.c
>
> aad628c1 Peter Huewe 2012-08-07   77   * Read len bytes from TPM register and put them into
> aad628c1 Peter Huewe 2012-08-07   78   * buffer (little-endian format, i.e. first byte is put into buffer[0]).
> aad628c1 Peter Huewe 2012-08-07   79   *
> aad628c1 Peter Huewe 2012-08-07   80   * NOTE: TPM is big-endian for multi-byte values. Multi-byte
> aad628c1 Peter Huewe 2012-08-07   81   * values have to be swapped.
> aad628c1 Peter Huewe 2012-08-07   82   *
> aad628c1 Peter Huewe 2012-08-07   83   * NOTE: We can't unfortunately use the combined read/write functions
> aad628c1 Peter Huewe 2012-08-07   84   * provided by the i2c core as the TPM currently does not support the
> aad628c1 Peter Huewe 2012-08-07   85   * repeated start condition and due to it's special requirements.
> aad628c1 Peter Huewe 2012-08-07   86   * The i2c_smbus* functions do not work for this chip.
> aad628c1 Peter Huewe 2012-08-07   87   *
> aad628c1 Peter Huewe 2012-08-07   88   * Return -EIO on error, 0 on success.
> aad628c1 Peter Huewe 2012-08-07   89   */
> aad628c1 Peter Huewe 2012-08-07   90  static int iic_tpm_read(u8 addr, u8 *buffer, size_t len)
> aad628c1 Peter Huewe 2012-08-07   91  {
> aad628c1 Peter Huewe 2012-08-07   92
> aad628c1 Peter Huewe 2012-08-07  @93          struct i2c_msg msg1 = { tpm_dev.client->addr, 0, 1, &addr };
> aad628c1 Peter Huewe 2012-08-07   94          struct i2c_msg msg2 = { tpm_dev.client->addr, I2C_M_RD, len, buffer };

missing C99 conversion. Shubhro, I thought you had taken care of all
that during v3.7 merge window.

2 are remaining and 2 are in dimitry tree.

This one :



http://www.spinics.net/lists/linux-i2c/msg10129.html

this one is acked by peter not acceped.

posted and acked
http://www.mail-archive.com/linux-i2c@vger.kernel.org/msg10161.html

2 are in dimitry branch
http://git.kernel.org/?p=linux/kernel/git/dtor/input.git;a=commit;h$e491c21b4e214a980a5daf2a5bc80e8c410ce6




--
balbi