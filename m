From: Domen Puncer <domen@coderock.org>
Date: Thu, 05 May 2005 17:20:37 +0000
Subject: Re: [KJ] [PATCH] drivers/block/paride/pcd.c : replace direct
Message-Id: <20050505172037.GC3917@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53802681193746071=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050504094530.GM8647@rhum.iomeda.fr>
In-Reply-To: <20050504094530.GM8647@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============53802681193746071==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 04/05/05 11:45 +0200, Christophe Lucas wrote:
> description:
> Use set_current_state() instead of direct assignment of
> current->state.
> 
> Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

> diff -urpNX dontdiff a/drivers/block/paride/pcd.c b/drivers/block/paride/pcd.c
> --- a/drivers/block/paride/pcd.c	2005-04-21 02:03:13.000000000 +0200
> +++ b/drivers/block/paride/pcd.c	2005-04-29 09:53:18.000000000 +0200
> @@ -516,7 +516,7 @@ static int pcd_tray_move(struct cdrom_de
>  
>  static void pcd_sleep(int cs)
>  {
> -	current->state = TASK_INTERRUPTIBLE;
> +	set_current_state(TASK_INTERRUPTIBLE);
>  	schedule_timeout(cs);

nacc already did these (at least paride ones seem to be in -kj) in IMHO
more correct way: converted *_sleep calls to msleep.


	Domen

--===============53802681193746071==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53802681193746071==--
