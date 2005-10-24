From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 24 Oct 2005 21:25:21 +0000
Subject: Re: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/block/swim_iop.c: replace
Message-Id: <20051024212521.GD7731@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84083406955083362=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023025351.GC2438@poopie.dyndns.org>
In-Reply-To: <20051023025351.GC2438@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============84083406955083362==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 22, 2005 at 09:56:31PM -0500, irwan.djajadi@iname.com wrote:
> --- 2.6.14-rc5/drivers/block/swim_iop.c
> +++ mod/drivers/block/swim_iop.c
> @@ -436,7 +436,7 @@ static int grab_drive(struct floppy_stat
>  				local_irq_restore(flags);
>  				return -EINTR;
>  			}
> -			interruptible_sleep_on(&fs->wait);
> +			wait_event_interruptible(fs->wait, fs->state == available);
>  		}
>  		--fs->wanted;
>  	}

Ditto. local_irq_save().


--===============84083406955083362==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84083406955083362==--
