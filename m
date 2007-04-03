From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Date: Tue, 03 Apr 2007 14:09:04 +0000
Subject: [KJ] roundup_pow_of_two()
Message-Id: <Pine.LNX.4.62.0704031607110.14732@pademelon.sonytel.be>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


JFYI...

While looking for a nice and fast way to round up a value to the next power of
two, I stumbled upon roundup_pow_of_two(), and to a lot of ugly and slow inline
variants (search for `round' and `power of'). Probably they can be
consolidated.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- Sony Network and Software Technology Center Europe (NSCE)
Geert.Uytterhoeven@sonycom.com ------- The Corporate Village, Da Vincilaan 7-D1
Voice +32-2-7008453 Fax +32-2-7008622 ---------------- B-1935 Zaventem, Belgium
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
