From: Domen Puncer <domen@coderock.org>
Date: Sun, 30 Jan 2005 12:10:27 +0000
Subject: [KJ] Re: 12/34: cdrom/cdu31a: replace interruptible_sleep_on() with
Message-Id: <20050130121027.GC3835@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============59698879964300122=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============59698879964300122==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 25/01/05 15:14 -0800, Nishanth Aravamudan wrote:
> Hi,
> 
> Please consider applying.
> 
> Description: Use wait_event_interruptible() instead of the deprecated
> interruptible_sleep_on(). The patch is straight-forward as the macros should 
> result in the same execution. Patch is compile-tested (still throws out warnings
> regarding {save,restore}_flags()).

It also indirectly calls schedule() with interrupts disabled... this
can't be right?


	Domen

> 
>  	cli();
> -	while (sony_inuse) {
> -		interruptible_sleep_on(&sony_wait);
> -		if (signal_pending(current)) {
> -			restore_flags(flags);
> -			return -EAGAIN;
> -		}
> +	wait_event_interruptible(sony_wait, sony_inuse);
> +	if (signal_pending(current)) {
> +		restore_flags(flags);
> +		return -EAGAIN;

--===============59698879964300122==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============59698879964300122==--
