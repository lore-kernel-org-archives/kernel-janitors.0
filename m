From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 19 Nov 2005 13:12:21 +0000
Subject: [KJ] Re: removal of macro duplicates
Message-Id: <20051119131221.GA19097@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4832607800012173=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============4832607800012173==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 17, 2005 at 01:06:20PM +0100, Nicolas Kaiser wrote:
> Hi there! Do you think it would be a good idea to remove
> duplicates of the BCD macros as well?

I think, yes. Be sure to Cc kernel-jantiors mailing list.

> For example this one:
>
> Remove duplicate of BCD macros

> --- a/drivers/i2c/chips/rtc8564.c
> +++ b/drivers/i2c/chips/rtc8564.c
> @@ -14,6 +14,7 @@
>   */
>  #include <linux/module.h>
>  #include <linux/kernel.h>
> +#include <linux/bcd.h>
>  #include <linux/i2c.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> @@ -52,9 +53,6 @@ static inline u8 _rtc8564_ctrl2(struct i
>  #define CTRL1(c) _rtc8564_ctrl1(c)
>  #define CTRL2(c) _rtc8564_ctrl2(c)
>
> -#define BCD_TO_BIN(val) (((val)&15) + ((val)>>4)*10)
> -#define BIN_TO_BCD(val) ((((val)/10)<<4) + (val)%10)
> -
>  static int debug;;
>  module_param(debug, int, S_IRUGO | S_IWUSR);
>
> @@ -225,16 +223,16 @@ static int rtc8564_get_datetime(struct i
>  		return ret;
>
>  	/* century stored in minute alarm reg */
> -	dt->year = BCD_TO_BIN(buf[RTC8564_REG_YEAR]);
> -	dt->year += 100 * BCD_TO_BIN(buf[RTC8564_REG_AL_MIN] & 0x3f);
> -	dt->mday = BCD_TO_BIN(buf[RTC8564_REG_DAY] & 0x3f);
> -	dt->wday = BCD_TO_BIN(buf[RTC8564_REG_WDAY] & 7);
> -	dt->mon = BCD_TO_BIN(buf[RTC8564_REG_MON_CENT] & 0x1f);
> +	dt->year = BCD2BIN(buf[RTC8564_REG_YEAR]);
> +	dt->year += 100 * BCD2BIN(buf[RTC8564_REG_AL_MIN] & 0x3f);
> +	dt->mday = BCD2BIN(buf[RTC8564_REG_DAY] & 0x3f);
> +	dt->wday = BCD2BIN(buf[RTC8564_REG_WDAY] & 7);
> +	dt->mon = BCD2BIN(buf[RTC8564_REG_MON_CENT] & 0x1f);


--===============4832607800012173==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4832607800012173==--
