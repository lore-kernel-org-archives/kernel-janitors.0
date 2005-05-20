From: Greg KH <greg@kroah.com>
Date: Fri, 20 May 2005 05:10:59 +0000
Subject: Re: [KJ] [PATCH] Fix gcc4 error incomplete array element type
Message-Id: <20050520051059.GB10292@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67683867519852559=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <428D6C84.8070708@cs.pdx.edu>
In-Reply-To: <428D6C84.8070708@cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

--===============67683867519852559==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 19, 2005 at 09:50:12PM -0700, Jesse Millan wrote:
> --- linux-2.6.11.10/include/linux/i2c.h.orig	2005-05-19 21:14:35.566833035 -0700
> +++ linux-2.6.11.10/include/linux/i2c.h	2005-05-19 21:15:28.920114967 -0700
> @@ -55,7 +55,7 @@ extern int i2c_master_recv(struct i2c_cl
> 
>  /* Transfer num messages.
>   */
> -extern int i2c_transfer(struct i2c_adapter *adap, struct i2c_msg msg[],int num);
> +extern int i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs,int num);

Oh, and in the future, if you change a header file, you better change
where the function is defined, otherwise you get a compiler error.

>   * Some adapter types (i.e. PCF 8584 based ones) may support slave behaviuor.
> @@ -194,7 +194,7 @@ struct i2c_algorithm {
>  	   to NULL. If an adapter algorithm can do SMBus access, set
>  	   smbus_xfer. If set to NULL, the SMBus protocol is simulated
>  	   using common I2C messages */
> -	int (*master_xfer)(struct i2c_adapter *adap,struct i2c_msg msgs[],
> +	int (*master_xfer)(struct i2c_adapter *adap,struct i2c_msg *msgs,
>  	                   int num);

You would have gotten compiler warnings for not fixing up all of the i2c
drivers that provide a master_xfer() function pointer, right?

See the 2.6.12-rc4 kernel for the real full fix for this.

thanks,

greg k-h

--===============67683867519852559==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67683867519852559==--
