From: Domen Puncer <domen@coderock.org>
Date: Mon, 24 Jan 2005 16:41:24 +0000
Subject: Re: [KJ] [PATCH] unified spinlock initialization
Message-Id: <20050124164124.GA4462@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31216442407519773=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
To: kernel-janitors@vger.kernel.org

--===============31216442407519773==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Already done in 2.6.11-rc2, look below for some comments.

On 24/01/05 21:00 +0530, Amit Gud wrote:
> Unify the spinlock initialization as far as possible.
> 
> Do consider applying.
> 
> Signed-off-by: Amit Gud <gud@eth.net>
> 
> --- vanilla-2.6.10/drivers/char/drm/drm_auth.h	2004-10-19 03:25:07.000000000 +0530
> +++ linux-2.6.10/drivers/char/drm/drm_auth.h	2005-01-24 20:07:39.000000000 +0530
> @@ -174,11 +174,12 @@ int DRM(getmagic)(struct inode *inode, s
>  		  unsigned int cmd, unsigned long arg)
>  {
>  	static drm_magic_t sequence = 0;
> -	static spinlock_t  lock	    = SPIN_LOCK_UNLOCKED;
> +	static spinlock_t  lock;
>  	drm_file_t	   *priv    = filp->private_data;
>  	drm_device_t	   *dev	    = priv->dev;
>  	drm_auth_t	   auth;
> -
> +	

You added whitespace.


> +	spin_lock_init(&lock);

This changes behaviour, because of static lock wasn't initialized on
every function run, now it is, which makes it rather useless.

Correct way to do this seems to be what is already in 2.6.11-rc2 in
drm_auth.c:

	static drm_magic_t sequence = 0;
	static DEFINE_SPINLOCK(lock);
	drm_file_t         *priv    = filp->private_data;



	Domen

--===============31216442407519773==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31216442407519773==--
