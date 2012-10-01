From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Mon, 01 Oct 2012 22:47:27 +0000
Subject: Re: [PATCH 1/3] include/linux/i2c.h: introduce macros for i2c_msg initialization
Message-Id: <201210020047.27541.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1348990388-7413-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1348990388-7413-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Am Dienstag, 2. Oktober 2012, 00:24:49 schrieb Ryan Mallon:
> On 30/09/12 17:33, Julia Lawall wrote:
> > From: Julia Lawall <Julia.Lawall@lip6.fr>
> > 
> > This patch introduces some macros for describing how an i2c_msg is being
> > initialized.  There are three macros: I2C_MSG_READ, for a read message,
> > I2C_MSG_WRITE, for a write message, and I2C_MSG_OP, for some other kind
> > of message, which is expected to be very rarely used.
> > 
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
Cool.
Especially as there is no i2c flag for write this makes code more readable.

Reviewed-by: Peter Huewe <peterhuewe@gmx.de>

