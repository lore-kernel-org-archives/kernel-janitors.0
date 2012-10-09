From: Jean Delvare <khali@linux-fr.org>
Date: Tue, 09 Oct 2012 12:30:35 +0000
Subject: Re: [PATCH 2/13] drivers/media/tuners/mxl5007t.c: use macros for i2c_msg initialization
Message-Id: <20121009143035.557951bb@endymion.delvare>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1349624323-15584-1-git-send-email-Julia.Lawall@lip6.fr>
	<1349624323-15584-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1349624323-15584-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Michael Krufky <mkrufky@linuxtv.org>, kernel-janitors@vger.kernel.org, rmallon@gmail.com, shubhrajyoti@ti.com, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Julia,

On Sun,  7 Oct 2012 17:38:33 +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Introduce use of I2c_MSG_READ/WRITE/OP, for readability.

Next time you send this patch set, please Cc me on every post so that I
don't have to hunt for them on lkml.org.

> In each case, a length expressed as an explicit constant is also
> re-expressed as the size of the buffer, when this is possible.

This is conceptually wrong, please don't do that. It is perfectly valid
to use a buffer which is larger than the message being written or read.
When exchanging multiple messages, it is actually quite common to
declare only 2 buffers and reuse them:

	char reg;
	char val[2];

	struct i2c_msg msg[2] = {
		{ .addr = addr, .flags = 0, .buf = &reg, .len = 1 },
		{ .addr = addr, .flags = I2C_M_RD, .buf = val, .len = 1 },
	};

	reg = 0x04;
	i2c_transfer(i2c_adap, msg, 2);
	/* Do stuff with val */

	reg = 0x06;
	msg[1].len = 2;
	i2c_transfer(i2c_adap, msg, 2);
	/* Do stuff with val */

Your conversion would read 2 bytes from register 0x04 instead of 1 in
the example above.

I am not opposed to the idea of i2c_msg initialization helper macros,
but please don't mix that with actual code changes which could have bad
side effects.

Thanks,
-- 
Jean Delvare
