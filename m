From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 08 Oct 2012 05:24:11 +0000
Subject: Re: [PATCH 3/13] drivers/media/tuners/qt1010.c: use macros for i2c_msg initialization
Message-Id: <alpine.DEB.2.02.1210080722470.1972@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1349624323-15584-1-git-send-email-Julia.Lawall@lip6.fr> <1349624323-15584-5-git-send-email-Julia.Lawall@lip6.fr> <5071FA5D.30003@gmail.com> <alpine.DEB.2.02.1210080704440.1972@localhost6.localdomain6> <50726110.5020901@gmail.com>
In-Reply-To: <50726110.5020901@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ryan Mallon <rmallon@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Antti Palosaari <crope@iki.fi>, kernel-janitors@vger.kernel.org, shubhrajyoti@ti.com, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

> Sorry, I mean either:
>
> 	I2C_MSG_WRITE(priv->cfg->i2c_address, &reg, sizeof(reg)),
> 	I2C_MSG_READ(priv->cfg->i2c_address, val, sizeof(*val)),

Of course.  Sorry for not having seen that.  I can do that.

julia
