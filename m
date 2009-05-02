From: Julia Lawall <julia@diku.dk>
Date: Sat, 02 May 2009 13:19:38 +0000
Subject: ivtv-ioctl.c: possible problem with IVTV_F_I_DMA
Message-Id: <Pine.LNX.4.64.0905021519040.9563@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hverkuil@xs4all.nl, ivtv-devel@ivtvdriver.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The file drivers/media/video/ivtv/ivtv-ioctl.c contains the following code:

(starting at line 183 in a recent linux-next)

		while (itv->i_flags & IVTV_F_I_DMA) {
			got_sig = signal_pending(current);
			if (got_sig)
				break;
			got_sig = 0;
			schedule();
		}

The only possible value of IVTV_F_I_DMA, however, seems to be 0, as defined
in drivers/media/video/ivtv/ivtv-driver.h, and thus the test is never true.
Is this what is intended, or should the test be expressed in another way?

julia

This problem was found using the following semantic match:
(http://www.emn.fr/x-info/coccinelle/)

@r expression@
identifier C;
expression E;
position p;
@@

(
 E & C@p && ...
|
 E & C@p || ...
)

@s@
identifier r.C;
position p1;
@@

#define C 0

@t@
identifier r.C;
expression E != 0;
@@

#define C E

@script:python depends on s && !t@
p << r.p;
C << r.C;
@@

cocci.print_main("and with 0", p)
