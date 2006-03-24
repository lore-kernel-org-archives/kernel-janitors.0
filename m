From: Greg KH <greg@kroah.com>
Date: Fri, 24 Mar 2006 17:49:01 +0000
Subject: Re: [KJ] Re: [PATCH] Clean up magic numbers in i2c_parport.h
Message-Id: <20060324174901.GA27881@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============026895940276686403=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060323205617.38e02afe.khali@linux-fr.org> <000e01c64efd$cae7f750$8401000a@fakie> <20060324082600.ca9f9796.khali@linux-fr.org>
In-Reply-To: <20060324082600.ca9f9796.khali@linux-fr.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: Christopher Hoover <ch@murgatroid.com>, Andrew Morton <akpm@osdl.org>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, lm-sensors@lm-sensors.org

--===============026895940276686403==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 24, 2006 at 08:26:00AM +0100, Jean Delvare wrote:
> Hi Christopher,
> 
> > > Beeuh. These macros don't really help. They actually make the lines
> > > longer! I'm not taking this change, sorry.
> > 
> > If I kill off the macros but continue to use C99 structure initializers,
> > which is I believe is the proper kernel coding style today, the lines are
> > going to get even longer.  Is that OK?
> > 
> > Or are you asking for the patch w/o macros and w/o C99 structure
> > initializers?
> > 
> > I can/will do either.  Just let me know what is acceptable a priori.
> 
> I don't think C99 initializers are needed here, the structure is pretty
> simple and is also defined in the same file, a few lines above all its
> instance declarations. So I am indeed asking for a patch w/o macros and
> w/o C99 structure initializers, unless someone objects.

You should use structure initializers whereever possible, as it makes
future changes much easier and safer (reorder the fields and things
don't break in odd ways.)  So I would encourage this kind of change.

thanks,

greg k-h

--===============026895940276686403==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============026895940276686403==--
