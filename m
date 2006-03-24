From: Jean Delvare <khali@linux-fr.org>
Date: Fri, 24 Mar 2006 19:31:35 +0000
Subject: [KJ] Re: [PATCH] Clean up magic numbers in i2c_parport.h
Message-Id: <20060324203135.bfcaac45.khali@linux-fr.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90070997728939339=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060323205617.38e02afe.khali@linux-fr.org>
	<000e01c64efd$cae7f750$8401000a@fakie>
	<20060324082600.ca9f9796.khali@linux-fr.org>
	<20060324174901.GA27881@kroah.com>
In-Reply-To: <20060324174901.GA27881@kroah.com>
To: Greg KH <greg@kroah.com>, Christopher Hoover <ch@murgatroid.com>
Cc: Andrew Morton <akpm@osdl.org>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, lm-sensors@lm-sensors.org

--===============90070997728939339==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Greg, Christpher,

> > I don't think C99 initializers are needed here, the structure is pretty
> > simple and is also defined in the same file, a few lines above all its
> > instance declarations. So I am indeed asking for a patch w/o macros and
> > w/o C99 structure initializers, unless someone objects.
> 
> You should use structure initializers whereever possible, as it makes
> future changes much easier and safer (reorder the fields and things
> don't break in odd ways.)  So I would encourage this kind of change.

Oh well, if Greg says so...

Christopher, can you please respin a patch with C99 initializers, which
would look a bit better than your original one? I'd suggest a single,
straightforward macro (no needless underscores please):

#define LINEOP(val, port, inverted) \
    { .val = (val), .port = (port), .inverted = (inverted) }

Hopefully this will keep all lines within a reasonable length and won't
hurt the readability too much.

Also, I just noticed in your original patch: please preserve the comma
at the end of the last line of struct declarations. It's not needed,
sure, but it makes later changes easier.

Thanks,
-- 
Jean Delvare

--===============90070997728939339==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90070997728939339==--
