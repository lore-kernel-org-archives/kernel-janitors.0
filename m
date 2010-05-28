From: Dan Carpenter <error27@gmail.com>
Date: Fri, 28 May 2010 12:31:23 +0000
Subject: Re: question about leds-88pm860x.c
Message-Id: <20100528123122.GY22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Sorry.  The original email had a mangled subject line.

regards,
dan carpenter

On Fri, May 28, 2010 at 01:46:08PM +0200, Dan Carpenter wrote:
> Hi,
> 
> I was going through some Smatch stuff and it complains about something
> in drivers/leds/leds-88pm860x.c  Could you take a look at it?  I'm not
> sure what was intended there.
> 
> drivers/leds/leds-88pm860x.c +228 __check_device(6) warn: unsigned 'p->flags' is never less than zero.
>    222  static int __check_device(struct pm860x_led_pdata *pdata, char *name)
>    223  {
>    224          struct pm860x_led_pdata *p = pdata;
>    225          int ret = -EINVAL;
>    226
>    227          while (p && p->id) {
>    228                  if ((p->id != PM8606_ID_LED) || (p->flags < 0))
>                                                          ^^^^^^^^^^^^
> 
> 	p->flags is an unsigned int so this condition is never true.
> 
>    229                          break;
>    230
>    231                  if (!strncmp(name, pm860x_led_name[p->flags],
>    232                          MFD_NAME_SIZE)) {
>    233                          ret = (int)p->flags;
>    234                          break;
>    235                  }
>    236                  p++;
>    237          }
>    238          return ret;
>    239  }
> 
> regards,
> dan carpenter
