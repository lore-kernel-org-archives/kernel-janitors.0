From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Sun, 16 Jan 2005 21:10:57 +0000
Subject: [KJ] Re: [PATCH 3/13] ftape: remove cli()/sti() in
Message-Id: <1105908296.12196.9.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73536425407020023=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050116135223.30109.26479.55757@localhost.localdomain>
	 <20050116135244.30109.69180.33718@localhost.localdomain>
In-Reply-To: <20050116135244.30109.69180.33718@localhost.localdomain>
To: James Nelson <james4765@cwazy.co.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@lists.osdl.org, akpm@osdl.org

--===============73536425407020023==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sul, 2005-01-16 at 13:52, James Nelson wrote:
> Signed-off-by: James Nelson <james4765@gmail.com>
> 
> diff -urN --exclude='*~' linux-2.6.11-rc1-mm1-original/drivers/char/ftape/lowlevel/ftape-format.c linux-2.6.11-rc1-mm1/drivers/char/ftape/lowlevel/ftape-format.c
> --- linux-2.6.11-rc1-mm1-original/drivers/char/ftape/lowlevel/ftape-format.c	2004-12-24 16:34:45.000000000 -0500
> +++ linux-2.6.11-rc1-mm1/drivers/char/ftape/lowlevel/ftape-format.c	2005-01-16 07:32:19.293557207 -0500
> @@ -132,7 +132,7 @@
>  	TRACE_CATCH(ftape_seek_head_to_track(track),);
>  	TRACE_CATCH(ftape_command(QIC_LOGICAL_FORWARD),);
>  	spin_lock_irqsave(&ftape_format_lock, flags);
> -	TRACE_CATCH(fdc_setup_formatting(head), restore_flags(flags));
> +	TRACE_CATCH(fdc_setup_formatting(head),);
>  	spin_unlock_irqrestore(&ftape_format_lock, flags);

This is wrong (the original is too). TRACE_CATCH expands into code
including a return so you need to replace the retore_flags(flags) with a
copy of the spin_unlock_irqrestore line below


--===============73536425407020023==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73536425407020023==--
