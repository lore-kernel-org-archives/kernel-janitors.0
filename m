From: Domen Puncer <domen@coderock.org>
Date: Tue, 20 Jul 2004 22:39:19 +0000
Subject: [Kernel-janitors] Re: sis-agp: replace schedule_timeout() with
Message-Id: <20040720223919.GA2447@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68358985494907198=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============68358985494907198==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 20/07/04 21:01 +0000, Nishanth Aravamudan wrote:
...
> --- linux-vanilla/drivers/char/agp/sis-agp.c	2004-06-16 05:18:56.000000000 +0000
...
> -			set_current_state(TASK_UNINTERRUPTIBLE);
> -			schedule_timeout (1+(HZ*10)/1000);
> +			msleep(HZ);		/* sleep 1s */

Umm... what?
I mean... HZ jiffies is one second, but HZ miliseconds is not necessary 1 s.
And that delay looks wierd, what was the point of HZ*10/1000 in the first
place? Why not HZ/100?

Anyway, IMO msleep(10) seems right.


	Domen

--===============68358985494907198==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68358985494907198==--
