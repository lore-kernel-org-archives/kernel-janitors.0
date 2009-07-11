From: Jiri Slaby <jirislaby@gmail.com>
Date: Sat, 11 Jul 2009 08:17:24 +0000
Subject: Re: [PATCH 5/5] staging/otus: Move a dereference below a NULL test
Message-Id: <4A584A94.5010105@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907110950510.29592@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907110950510.29592@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: gregkh@suse.de, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/11/2009 09:51 AM, Julia Lawall wrote:
> diff -u -p a/drivers/staging/otus/wwrap.c b/drivers/staging/otus/wwrap.c
> --- a/drivers/staging/otus/wwrap.c
> +++ b/drivers/staging/otus/wwrap.c
> @@ -1016,12 +1016,13 @@ void kevent(struct work_struct *work)
>  {
>      struct usbdrv_private *macp >                 container_of(work, struct usbdrv_private, kevent);
> -    zdev_t *dev = macp->device;
> +    zdev_t *dev;
>  
>      if (macp = NULL)
>      {
>          return;
>      }

The test is rather useless here.

> +    dev = macp->device;


