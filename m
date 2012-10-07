From: Joe Perches <joe@perches.com>
Date: Sun, 07 Oct 2012 21:51:58 +0000
Subject: Re: [PATCH 13/13] drivers/media/tuners/e4000.c: use macros for i2c_msg initialization
Message-Id: <1349646718.15802.16.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1349624323-15584-1-git-send-email-Julia.Lawall@lip6.fr>
	 <1349624323-15584-3-git-send-email-Julia.Lawall@lip6.fr>
	 <5071AEF3.6080108@bfs.de>
	 <alpine.DEB.2.02.1210071839040.2745@localhost6.localdomain6>
	 <5071B834.1010200@bfs.de>
	 <alpine.DEB.2.02.1210071917040.2745@localhost6.localdomain6>
	 <1349633780.15802.8.camel@joe-AO722>
	 <alpine.DEB.2.02.1210072053550.2745@localhost6.localdomain6>
	 <1349645970.15802.12.camel@joe-AO722>
	 <alpine.DEB.2.02.1210072342460.2745@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1210072342460.2745@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: walter harms <wharms@bfs.de>, Antti Palosaari <crope@iki.fi>, kernel-janitors@vger.kernel.org, rmallon@gmail.com, shubhrajyoti@ti.com, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2012-10-07 at 23:43 +0200, Julia Lawall wrote:
> On Sun, 7 Oct 2012, Joe Perches wrote:
> >> Are READ and WRITE the action names?  They are really the important
> >> information in this case.
> >
> > Yes, most (all?) uses of _READ and _WRITE macros actually
> > perform some I/O.
> 
> I2C_MSG_READ_DATA?
> I2C_MSG_READ_INFO?
> I2C_MSG_READ_INIT?
> I2C_MSG_PREPARE_READ?

Dunno, naming is hard.  Maybe:

I2C_INPUT_MSG
I2C_OUTPUT_MSG
I2C_OP_MSG

cheers, Joe



