From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 10 Dec 2005 17:55:38 +0000
Subject: Re: [KJ] [PATCH 5/21] polling loops: change exit condition to
Message-Id: <20051210175538.GB1317@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39369408418717144=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <43923511.1040804@gmail.com>
In-Reply-To: <43923511.1040804@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============39369408418717144==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 04, 2005 at 01:15:13AM +0100, Marcin Slusarz wrote:
> --- linux-2.6.15-rc4-orig/drivers/hwmon/w83l785ts.c
> +++ linux-2.6.15-rc4/drivers/hwmon/w83l785ts.c
> -/* How many retries on register read error */
> -#define MAX_RETRIES	5
> +#define MAX_TIMEOUT	15

This is used only once too.

> static u8 w83l785ts_read_value(struct i2c_client *client, u8 reg, u8 defval)
> {
> -	int value, i;
> +	int value, i = 1;
> +	unsigned long end_time;
> 
> 	/* Frequent read errors have been reported on Asus boards, so we
> 	 * retry on read errors. If it still fails (unlikely), return the
> 	 * default value requested by the caller. */
> -	for (i = 1; i <= MAX_RETRIES; i++) {
> +	end_time = jiffies + msecs_to_jiffies(MAX_TIMEOUT);
> +	while (time_before_eq(jiffies, end_time)) {
> 		value = i2c_smbus_read_byte_data(client, reg);
> 		if (value >= 0) {
> 			dev_dbg(&client->dev, "Read 0x%02x from register "


--===============39369408418717144==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39369408418717144==--
