From: Hans Verkuil <hverkuil@xs4all.nl>
Date: Sat, 02 May 2009 13:32:43 +0000
Subject: Re: ivtv-ioctl.c: possible problem with IVTV_F_I_DMA
Message-Id: <200905021532.43694.hverkuil@xs4all.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0905021519040.9563@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0905021519040.9563@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: ivtv-devel@ivtvdriver.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Saturday 02 May 2009 15:19:38 Julia Lawall wrote:
> The file drivers/media/video/ivtv/ivtv-ioctl.c contains the following
> code:
>
> (starting at line 183 in a recent linux-next)
>
> 		while (itv->i_flags & IVTV_F_I_DMA) {
> 			got_sig = signal_pending(current);
> 			if (got_sig)
> 				break;
> 			got_sig = 0;
> 			schedule();
> 		}
>
> The only possible value of IVTV_F_I_DMA, however, seems to be 0, as
> defined in drivers/media/video/ivtv/ivtv-driver.h, and thus the test is
> never true. Is this what is intended, or should the test be expressed in
> another way?

Hi Julia,

Urgh, that's most definitely not what was intended. Thanks for the report, 
I'll fix this. In fact, I've found several other cases in the ivtv driver 
where these flags were handled incorrectly. Either test_bit or
(1 << IVTV_F_...) should have been used.

Thanks!

	Hans

>
> julia
>
> This problem was found using the following semantic match:
> (http://www.emn.fr/x-info/coccinelle/)
>
> @r expression@
> identifier C;
> expression E;
> position p;
> @@
>
> (
>  E & C@p && ...
>
>  E & C@p || ...
> )
>
> @s@
> identifier r.C;
> position p1;
> @@
>
> #define C 0
>
> @t@
> identifier r.C;
> expression E != 0;
> @@
>
> #define C E
>
> @script:python depends on s && !t@
> p << r.p;
> C << r.C;
> @@
>
> cocci.print_main("and with 0", p)



-- 
Hans Verkuil - video4linux developer - sponsored by TANDBERG Telecom
