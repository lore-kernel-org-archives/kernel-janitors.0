From: Felipe W Damasio <felipewd@terra.com.br>
Date: Mon, 26 Apr 2004 12:23:01 +0000
Subject: Re: [Kernel-janitors] [PATCH] Replaces yield() with schedule_timeout()
Message-Id: <408CFF25.2060802@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28786174127570985=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <408AB344.6010000@acm.org>
In-Reply-To: <408AB344.6010000@acm.org>
To: kernel-janitors@vger.kernel.org

--===============28786174127570985==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

	Hi,

Gustavo Franco wrote:
> I guess that it's ok, please apply.
> 
> Thanks,
> Gustavo Franco
> 
> 
> --- drivers/cdrom/sonycd535.c.orig    2004-04-24 13:46:28.000000000 -0300
> +++ drivers/cdrom/sonycd535.c 2004-04-24 13:47:38.000000000 -0300
> @@ -342,7 +342,7 @@
> sony_sleep(void)
> {
>        if (sony535_irq_used <= 0) {    /* poll */
> -               yield();
> +               schedule_timeout(1);

	I don't think it's that cut-and-dry...shouldn't you use something 
relevant to HZ on this? Please see the patch maximilian sent on sis900 
net driver.

	Also, don't forget to use TASK_INTERRUPTITBLE (with a set_current_state 
that uses a memory barrier) before using schedule_timeout, please.

	Cheers,

Felipe

--===============28786174127570985==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28786174127570985==--
