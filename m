From: Mark Hollomon <markhollomon@comcast.net>
Date: Sat, 24 Jul 2004 01:12:25 +0000
Subject: Re: [Kernel-janitors] [PATCH] saa7146_i2c: replace schedule_timeout()
Message-Id: <4101B779.4050107@comcast.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15380256585009322=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040723220936.GQ2675@us.ibm.com>
In-Reply-To: <20040723220936.GQ2675@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============15380256585009322==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

I think this patch will result in delays 10 times too long.


Nishanth Aravamudan wrote:
>  
> -/* helper function */
> -static void my_wait(struct saa7146_dev *dev, long ms)
> -{
> -	set_current_state(TASK_INTERRUPTIBLE);
> -	schedule_timeout((((ms+10)/10)*HZ)/1000);
> -}

ms seems to be a number that expresses an interval in units of 1/10 of a 
millisecond.

> -
>  u32 saa7146_i2c_func(struct i2c_adapter *adapter)
>  {
>  //fm	DEB_I2C(("'%s'.\n", adapter->name));
> @@ -136,12 +129,12 @@ static int saa7146_i2c_reset(struct saa7
>  		/* set "ABORT-OPERATION"-bit (bit 7)*/
>  		saa7146_write(dev, I2C_STATUS, (dev->i2c_bitrate | MASK_07));
>  		saa7146_write(dev, MC2, (MASK_00 | MASK_16));
> -		my_wait(dev,SAA7146_I2C_DELAY);
> +		msleep(SAA7146_I2C_DELAY);

But this would use it as a delay in milliseconds.



-- 
--------------------------
Mark Hollomon

--===============15380256585009322==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15380256585009322==--
