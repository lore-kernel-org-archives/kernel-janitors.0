From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 20 Feb 2006 22:00:42 +0000
Subject: Re: [KJ][Patch] remove second masking instance of variable in
Message-Id: <20060220220042.GH29791@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============076150268911060026=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139492214.17930.41.camel@localhost.localdomain>
In-Reply-To: <1139492214.17930.41.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============076150268911060026==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 10, 2006 at 11:58:19PM +1100, Darren Jenkins" wrote:
> --- linux-2.6.16-rc2/drivers/atm/firestream.c.orig
> +++ linux-2.6.16-rc2/drivers/atm/firestream.c	
> @@ -615,11 +615,11 @@ static void submit_qentry (struct fs_dev
>  			{
> -				int rp, wp;
> +				int rp, wptr;
>  				rp =  read_fs (dev, Q_RP(q->offset));
> -				wp =  read_fs (dev, Q_WP(q->offset));
> +				wptr =  read_fs (dev, Q_WP(q->offset));
>  				fs_dprintk (FS_DEBUG_TXQ, "q at %d: %x-%x: %x entries.\n", 
> -					    q->offset, rp, wp, wp-rp);
> +					    q->offset, rp, wptr, wptr-rp);

It's not a pointer, so ending it with "ptr" is not good.


--===============076150268911060026==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============076150268911060026==--
