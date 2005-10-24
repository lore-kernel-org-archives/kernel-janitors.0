From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 24 Oct 2005 21:23:20 +0000
Subject: Re: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/block/swim3.c: replace
Message-Id: <20051024212320.GC7731@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1408633722061019=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023025351.GC2438@poopie.dyndns.org>
In-Reply-To: <20051023025351.GC2438@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============1408633722061019==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 22, 2005 at 09:55:25PM -0500, irwan.djajadi@iname.com wrote:
> --- 2.6.14-rc5/drivers/block/swim3.c
> +++ mod/drivers/block/swim3.c
> @@ -800,7 +800,7 @@ static int grab_drive(struct floppy_stat

        save_flags(flags);
	cli();
	if (fs->state != idle) {
		++fs->wanted;
		while (fs->state != available) {
			if (interruptible && signal_pending(current)) {
>  				restore_flags(flags);
>  				return -EINTR;
>  			}
> -			interruptible_sleep_on(&fs->wait);
> +			wait_event_interruptible(fs->wait, fs->state == available);

Correct me if I'm wrong, but level of bugginess remains the same:
scheduling with interrupts disabled.

>  		}
>  		--fs->wanted;
>  	}


--===============1408633722061019==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1408633722061019==--
