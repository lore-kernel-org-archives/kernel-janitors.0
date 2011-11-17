From: Marcos Paulo de Souza <marcos.mage@gmail.com>
Date: Thu, 17 Nov 2011 20:41:50 +0000
Subject: Re: [PATCH 2/2] drivers/staging/vt6656/iwctl.c: Remove unnecessary
Message-Id: <alpine.LNX.2.00.1111171840360.2090@darkstar.example.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-740037292-1321562522=:2090"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1320871137-2782-1-git-send-email-marcos.mage@gmail.com>
In-Reply-To: <1320871137-2782-1-git-send-email-marcos.mage@gmail.com>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-740037292-1321562522=:2090
Content-Type: TEXT/PLAIN; format="flowed"; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi to all,

There is any suggestion about patch?

Thanks for your time.

* Uma vida sem desafios =E9 uma vida sem raz=E3o *
* A life without challanges is a non reason life *

On Wed, 9 Nov 2011, Marcos Paulo de Souza wrote:

> Removed the function iwctl_giwnwid, that was used once. Removed too a
> switch/case statement that was ambiguous.
>
> Signed-off-by: Marcos Paulo de Souza <marcos.mage@gmail.com>
> ---
> drivers/staging/vt6656/iwctl.c    |   11 -----------
> drivers/staging/vt6656/iwctl.h    |    5 -----
> drivers/staging/vt6656/main_usb.c |    9 +--------
> 3 files changed, 1 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/staging/vt6656/iwctl.c b/drivers/staging/vt6656/iwct=
l.c
> index 8c1ca49..a9110bf 100644
> --- a/drivers/staging/vt6656/iwctl.c
> +++ b/drivers/staging/vt6656/iwctl.c
> @@ -127,17 +127,6 @@ int iwctl_giwname(struct net_device *dev,
> 	return 0;
> }
>
> -int iwctl_giwnwid(struct net_device *dev,
> -             struct iw_request_info *info,
> -			 struct iw_param *wrq,
> -                   char *extra)
> -{
> - 	//wrq->value =3D 0x100;
> -	//wrq->disabled =3D 0;
> -	//wrq->fixed =3D 1;
> -	//return 0;
> -  return -EOPNOTSUPP;
> -}
> /*
>  * Wireless Handler : set scan
>  */
> diff --git a/drivers/staging/vt6656/iwctl.h b/drivers/staging/vt6656/iwct=
l.h
> index cc48954..10a240e 100644
> --- a/drivers/staging/vt6656/iwctl.h
> +++ b/drivers/staging/vt6656/iwctl.h
> @@ -77,11 +77,6 @@ int iwctl_giwname(struct net_device *dev,
> 			 char *wrq,
> 			 char *extra);
>
> -int iwctl_giwnwid(struct net_device *dev,
> -             struct iw_request_info *info,
> -			 struct iw_param *wrq,
> -                   char *extra) ;
> -
> int iwctl_giwsens(struct net_device *dev,
> 			 struct iw_request_info *info,
> 			 struct iw_param *wrq,
> diff --git a/drivers/staging/vt6656/main_usb.c b/drivers/staging/vt6656/m=
ain_usb.c
> index 27521b6..6f9930a 100644
> --- a/drivers/staging/vt6656/main_usb.c
> +++ b/drivers/staging/vt6656/main_usb.c
> @@ -1618,15 +1618,8 @@ static int  device_ioctl(struct net_device *dev, s=
truct ifreq *rq, int cmd) {
> 		break;
>
> 	case SIOCSIWNWID:
> -        rc =3D -EOPNOTSUPP;
> -		break;
> -
> 	case SIOCGIWNWID:     //0x8b03  support
> -	#ifdef  WPA_SUPPLICANT_DRIVER_WEXT_SUPPORT
> -          rc =3D iwctl_giwnwid(dev, NULL, &(wrq->u.nwid), NULL);
> -	#else
> -        rc =3D -EOPNOTSUPP;
> -	#endif
> +		rc =3D -EOPNOTSUPP;
> 		break;
>
> 		// Set frequency/channel
> --=20
> 1.7.4.4
>
>
--8323328-740037292-1321562522=:2090--
