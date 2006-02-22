From: Jean Delvare <khali@linux-fr.org>
Date: Wed, 22 Feb 2006 21:02:55 +0000
Subject: Re: [KJ][Patch] fix coding style in fscpos.c
Message-Id: <20060222220255.927d26f8.khali@linux-fr.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84836054435210062=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140611727.7778.8.camel@localhost.localdomain>
In-Reply-To: <1140611727.7778.8.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============84836054435210062==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Darren,

> Here is a simple one I noticed.
> 
> The CodingStyle document says 
> "Don't put multiple statements on a single line unless you have
> something to hide:"
> 
> The patch below is a very simple change to convert to requisite coding
> style.
> 
> Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
> --- linux-2.6.16-rc3/drivers/hwmon/fscpos.c.orig	2006-02-22 23:14:39.000000000 +1100
> +++ linux-2.6.16-rc3/drivers/hwmon/fscpos.c	2006-02-22 23:22:37.000000000 +1100
> @@ -229,8 +229,10 @@ static ssize_t set_pwm(struct i2c_client
>  	unsigned long v = simple_strtoul(buf, NULL, 10);
>  
>  	/* Range: 0..255 */
> -	if (v < 0) v = 0;
> -	if (v > 255) v = 255;
> +	if (v < 0) 
> +		v = 0;
> +	if (v > 255) 
> +		v = 255;
>  
>  	down(&data->update_lock);
>  	data->pwm[nr - 1] = v;
> 

Not worth the effort IMHO. The original code is pretty readable as it
is so I wouldn't change it.

-- 
Jean Delvare

--===============84836054435210062==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84836054435210062==--
