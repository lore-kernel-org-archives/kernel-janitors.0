From: Domen Puncer <domen@coderock.org>
Date: Tue, 20 Jul 2004 18:45:10 +0000
Subject: [Kernel-janitors] Re: bluetooth: replace schedule_timeout() with
Message-Id: <20040720184510.GA2445@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47545384832066784=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============47545384832066784==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 20/07/04 18:18 +0000, Nishanth Aravamudan wrote:
...
> --- linux-vanilla/drivers/bluetooth/bluecard_cs.c	2004-06-16 05:19:22.000000000 +0000
> +++ linux-dev/drivers/bluetooth/bluecard_cs.c	2004-07-10 18:22:58.000000000 +0000
> @@ -776,8 +776,7 @@ int bluecard_open(bluecard_info_t *info)
>  	outb(0x80, iobase + 0x30);
>  
>  	/* Wait some time */
> -	set_current_state(TASK_INTERRUPTIBLE);
> -	schedule_timeout(HZ / 100);
> +	msleep(100);

This should be 10.


	Domen

--===============47545384832066784==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47545384832066784==--
