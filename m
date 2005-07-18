From: Domen Puncer <domen@coderock.org>
Date: Mon, 18 Jul 2005 14:29:38 +0000
Subject: Re: [KJ] [PATCH] drivers/scsi/eata.c : Use of the time_before() macro
Message-Id: <20050718142938.GB2457@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============076194461826996296=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42D8B2A7.4040808@feitoza.com.br>
In-Reply-To: <42D8B2A7.4040808@feitoza.com.br>
To: kernel-janitors@vger.kernel.org

--===============076194461826996296==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 16/07/05 04:09 -0300, Marcelo Feitoza Parisi wrote:
> 

> Use of the time_before() macro, defined at linux/jiffies.h, which deal
> with wrapping correctly and are nicer to read.
> 
> Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
> 
> --- linux/drivers/scsi/eata.c	2005-07-13 17:53:34.000000000 -0300
> +++ linux-kj/drivers/scsi/eata.c	2005-07-15 16:21:24.558718384 -0300
> @@ -1939,7 +1939,8 @@
>  
>  static int eata2x_eh_host_reset(struct scsi_cmnd *SCarg)
>  {
> -	unsigned int i, time, k, c, limit = 0;
> +	unsigned int i, k, c, limit = 0;
> +	unsigned long time;
>  	int arg_done = 0;
>  	struct scsi_cmnd *SCpnt;
>  	struct Scsi_Host *shost = SCarg->device->host;
> @@ -2033,7 +2034,7 @@
>  
>  	/* FIXME: use a sleep instead */
>  	time = jiffies;
> -	while ((jiffies - time) < (10 * HZ) && limit++ < 200000)
> +	while (time_before(jiffies, time + (10 * HZ)) && limit++ < 200000)
>  		udelay(100L);

	ssleep(10); like the comment suggests?
Is there a higher meaning for limit? First we check we're under 10
seconds (real time) and then check we haven't slept more than 20
seconds, just to make sure? Interrupts can't be disabled,
spin_unlock_irq() takes care of that.

Am I confuzed or the author of code? ;-)


[Marcelo:
 drivers/net/hamradio/dmascc.c and drivers/net/e1000/e1000_ethtool.c
 also assume some value for HZ.
 And could you make bigger patches (per subsystem, like hamradio,
 tokenring...) in the future, please? ]


	Domen

--===============076194461826996296==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============076194461826996296==--
