From: Ryan Mallon <rmallon@gmail.com>
Date: Mon, 01 Oct 2012 22:24:49 +0000
Subject: Re: [PATCH 1/3] include/linux/i2c.h: introduce macros for i2c_msg initialization
Message-Id: <506A1831.6020101@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1348990388-7413-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1348990388-7413-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 30/09/12 17:33, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> This patch introduces some macros for describing how an i2c_msg is being
> initialized.  There are three macros: I2C_MSG_READ, for a read message,
> I2C_MSG_WRITE, for a write message, and I2C_MSG_OP, for some other kind of
> message, which is expected to be very rarely used.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Looks good to me. You can add:

Reviewed-by: Ryan Mallon <rmallon@gmail.com>

> 
> ---
>  include/linux/i2c.h |    7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 5970266..0990071 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -556,6 +556,13 @@ struct i2c_msg {
>  	__u8 *buf;		/* pointer to msg data			*/
>  };
>  
> +#define I2C_MSG_OP(_addr, _buf, _len, _flags) \
> +	{ .addr = _addr, .buf = _buf, .len = _len, .flags = _flags }
> +
> +#define I2C_MSG_WRITE(addr, buf, len) I2C_MSG_OP(addr, buf, len, 0)
> +#define I2C_MSG_READ(addr, buf, len)  I2C_MSG_OP(addr, buf, len, I2C_M_RD)
> +
> +
>  /* To determine what functionality is present */
>  
>  #define I2C_FUNC_I2C			0x00000001
> 

