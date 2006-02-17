From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 17 Feb 2006 21:53:57 +0000
Subject: Re: [KJ] [PATCH] Fix warning in drivers/usb/media/ov511.c
Message-Id: <20060217220942.GA10418@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37010882957678515=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139970072.25492.4.camel@localhost.localdomain>
In-Reply-To: <1139970072.25492.4.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============37010882957678515==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[jumps from train]

Gentlemen, instead of broke-arounding non-issues, I suggest to
actually read sensor_get_exposure(). You'll notice quite a few strange
things for 1.5-screenful function, I promise:

drivers/usb/media/ov511.c:
  1856	static int
  1857	sensor_get_exposure(struct usb_ov511 *ov, unsigned char *val)
  1858	{
  1859		int rc;
  1860
  1861		switch (ov->sensor) {
  1862		case SEN_OV7610:
  1863		case SEN_OV6620:
  1864		case SEN_OV6630:
  1865		case SEN_OV7620:
  1866		case SEN_OV76BE:
  1867		case SEN_OV8600:
  1868			rc = i2c_r(ov, 0x10);
  1869			if (rc < 0)
  1870				return rc;

Oops, it can return error value. So, instead checking return value of
sensor_get_exposure(), you tell gcc to STFU. Notice that *val is not
touched on this path.

  1871			else
  1872				*val = rc;

It's touched here, but the function will return 0.

  1873			break;
  1874		case SEN_KS0127:
  1875		case SEN_KS0127B:
  1876		case SEN_SAA7111A:
  1877			val = NULL;

Now, who can explain this line? Change of "val" will be forgotten right
after "return".

  1878			PDEBUG(3, "Unsupported with this sensor");
  1879			return -EPERM;

This looks slightly bizarre. -EPERM occurs usually when Joe User tries
to do something not under root.

  1880		default:
  1881			err("Sensor not supported for get_exposure");
  1882			return -EINVAL;

"Invalid argument". So there should be valid argument, right? Wrong.
"Sensor not supported".

  1883		}
  1884
  1885		PDEBUG(3, "%d", *val);
  1886		ov->exposure = *val;
  1887
  1888		return 0;
  1889	}

As was noted, "unsigned char >> 8" somewhere near line 5396 is pretty
funny too.

Resume:
	Patch is rejected because it's very wrong, fixes problem in the
	wrong place and only makes whole situation worse.

	Future "may be used uninitialized" patches must contain
	description of code path that can lead to said uninitialized using.

Fed my pet project to 3.4.4:
	-Wall		-- no warnings
	-Wall -O	-- out little friends and I can prove they are bogus.
	-Wall -O[123s]	-- ditto

	Alexey "warnings by commitee" Dobriyan

On Wed, Feb 15, 2006 at 03:41:25PM -0600, Matthew Martin wrote:
> Gcc 4.0.2 had the warning:

> drivers/usb/media/ov511.c: In function 'show_exposure':
> drivers/usb/media/ov511.c:5642: warning: 'exp' may be used uninitialized
> in this function

> --- orig-linux-2.6.15/drivers/usb/media/ov511.c
> +++ linux-2.6.15/drivers/usb/media/ov511.c
> @@ -5639,7 +5639,7 @@ static CLASS_DEVICE_ATTR(hue, S_IRUGO, s
>  static ssize_t show_exposure(struct class_device *cd, char *buf)
>  {
>  	struct usb_ov511 *ov = cd_to_ov(cd);
> -	unsigned char exp;
> +	unsigned char exp = 0;
>
>  	if (!ov->dev)
>  		return -ENODEV;


--===============37010882957678515==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37010882957678515==--
