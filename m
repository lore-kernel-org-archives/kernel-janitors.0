From: Patrick Boettcher <patrick.boettcher@desy.de>
Date: Fri, 11 Mar 2005 15:41:09 +0000
Subject: [KJ] Re: [linux-dvb-maintainer] [PATCH] 2/3 unified spinlock
Message-Id: <Pine.LNX.4.61.0503111640370.30058@pub6.ifh.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26569655134227932=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============26569655134227932==
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Fri, 11 Mar 2005, Amit Gud wrote:

> Hi,
>
>  Unify the spinlock initialization as far as possible.
>
>  Do consider applying.
>
> Signed-off-by: Amit Gud <gud@eth.net>
>
> --- ../kernels/linux-2.6.11/drivers/media/dvb/b2c2/skystar2.c   2005-03-10 
> 12:03:49.000000000 +0530
> +++ kj-2.6.11/drivers/media/dvb/b2c2/skystar2.c 2005-03-11 19:23:22.773932112 
> +0530
> @@ -1968,7 +1968,7 @@ static int driver_initialize(struct pci_
>               ctrl_enable_mac(adapter, 1);
>       }
>
> -       adapter->lock = SPIN_LOCK_UNLOCKED;
> +       spin_lock_init(&adapter->lock);

Applied to linuxtv CVS. Thanks.

regards,
Patrick.

--===============26569655134227932==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26569655134227932==--
