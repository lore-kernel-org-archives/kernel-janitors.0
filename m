From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 20 Feb 2006 23:26:13 +0000
Subject: Re: [KJ][Patch] Alter prototypes in adm1026.c
Message-Id: <20060220232613.GK29791@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35086599509549643=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140182240.7789.44.camel@localhost.localdomain>
In-Reply-To: <1140182240.7789.44.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============35086599509549643==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 18, 2006 at 12:17:20AM +1100, Darren Jenkins" wrote:
> from http://linuxicc.sourceforge.net/
>
> ICC complains about : Storage Class is not First
> @ line 301 & 302 of adm1026.c
>
> It appears that the variable in the prototype is named register which
> confuses ICC, it is called (more sensibly) reg in the actual functions.
> This is confusing (as register is a keyword)

Applied. Standard more or less says, if pp-identifier can be converted to
identifier or keyword, it's converted to keyword. So, we have
"u8 [keyword]" oops...

> so the patch below re-names
> the variable in the prototype to match the actual functions. (reg).

> --- linux-2.6.16-rc3/drivers/hwmon/adm1026.c.orig
> +++ linux-2.6.16-rc3/drivers/hwmon/adm1026.c

> -static int adm1026_read_value(struct i2c_client *client, u8 register);
> -static int adm1026_write_value(struct i2c_client *client, u8 register,
> +static int adm1026_read_value(struct i2c_client *client, u8 reg);
> +static int adm1026_write_value(struct i2c_client *client, u8 reg,
>  	int value);


--===============35086599509549643==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35086599509549643==--
