From: Jean Delvare <khali@linux-fr.org>
Date: Tue, 09 Oct 2012 12:12:20 +0000
Subject: Re: [PATCH 3/13] drivers/media/tuners/qt1010.c: use macros for i2c_msg initialization
Message-Id: <20121009141220.412c15c8@endymion.delvare>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1349624323-15584-1-git-send-email-Julia.Lawall@lip6.fr>
	<1349624323-15584-5-git-send-email-Julia.Lawall@lip6.fr>
	<5071FA5D.30003@gmail.com>
	<alpine.DEB.2.02.1210080704440.1972@localhost6.localdomain6>
	<50726110.5020901@gmail.com>
	<alpine.DEB.2.02.1210080722470.1972@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1210080722470.1972@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Ryan Mallon <rmallon@gmail.com>, Antti Palosaari <crope@iki.fi>, kernel-janitors@vger.kernel.org, shubhrajyoti@ti.com, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Julia,

On Mon, 8 Oct 2012 07:24:11 +0200 (CEST), Julia Lawall wrote:
> > Sorry, I mean either:
> >
> > 	I2C_MSG_WRITE(priv->cfg->i2c_address, &reg, sizeof(reg)),
> > 	I2C_MSG_READ(priv->cfg->i2c_address, val, sizeof(*val)),
> 
> Of course.  Sorry for not having seen that.  I can do that.

Eek, no, you can't, not in the general case at least. sizeof(*val) will
return the size of the _first_ element of the destination buffer, which
has nothing to do with the length of that buffer (which in turn might
be rightfully longer than the read length for this specific message.)

-- 
Jean Delvare
