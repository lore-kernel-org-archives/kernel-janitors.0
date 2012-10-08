From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 08 Oct 2012 08:31:33 +0000
Subject: Re: [PATCH 13/13] drivers/media/tuners/e4000.c: use macros for i2c_msg initialization
Message-Id: <alpine.DEB.2.02.1210081028340.1989@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1349624323-15584-1-git-send-email-Julia.Lawall@lip6.fr> <1349624323-15584-3-git-send-email-Julia.Lawall@lip6.fr> <5071AEF3.6080108@bfs.de> <alpine.DEB.2.02.1210071839040.2745@localhost6.localdomain6> <5071B834.1010200@bfs.de>
 <alpine.DEB.2.02.1210071917040.2745@localhost6.localdomain6> <1349633780.15802.8.camel@joe-AO722> <alpine.DEB.2.02.1210072053550.2745@localhost6.localdomain6> <1349645970.15802.12.camel@joe-AO722> <alpine.DEB.2.02.1210072342460.2745@localhost6.localdomain6>
 <1349646718.15802.16.camel@joe-AO722> <20121007225639.364a41b4@infradead.org> <50723661.6040107@gmail.com>
In-Reply-To: <50723661.6040107@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ryan Mallon <rmallon@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Joe Perches <joe@perches.com>, Julia Lawall <julia.lawall@lip6.fr>, walter harms <wharms@bfs.de>, Antti Palosaari <crope@iki.fi>, kernel-janitors@vger.kernel.org, shubhrajyoti@ti.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

I found only 15 uses of I2C_MSG_OP, out of 653 uses of one of the three
macros.  Since I2C_MSG_OP has the complete set of flags, I think it should
be OK?

One of the uses, in drivers/media/i2c/adv7604.c, is as follows:

       struct i2c_msg msg[2] = { { client->addr, 0, 1, msgbuf0 },
                                 { client->addr, 0 | I2C_M_RD, len, msgbuf1 }

I'm not sure what was intended, but I guess the second structure is
supposed to only do a read?

julia
