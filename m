From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Fri, 07 Sep 2012 16:21:16 +0000
Subject: Re: [PATCH 11/14] drivers/media/usb/stk1160/stk1160-i2c.c: fix error return code
Message-Id: <CALF0-+Wy47kwSLnQtktXwi_JQ86b6-9RjL02hu5W9xYtqaYi6g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346945041-26676-3-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1346945041-26676-3-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, kernel-janitors@vger.kernel.org, Julia.Lawall@lip6.fr, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 6, 2012 at 12:23 PM, Peter Senna Tschudin
<peter.senna@gmail.com> wrote:
> From: Peter Senna Tschudin <peter.senna@gmail.com>
>
> Convert a nonnegative error return code to a negative one, as returned
> elsewhere in the function.
>
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>
> // <smpl>
> (
> if@p1 (\(ret < 0\|ret != 0\))
>  { ... return ret; }
> |
> ret@p1 = 0
> )
> ... when != ret = e1
>     when != &ret
> *if(...)
> {
>   ... when != ret = e2
>       when forall
>  return ret;
> }
>
> // </smpl>
>
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
>
> ---
>  drivers/media/usb/stk1160/stk1160-i2c.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/stk1160/stk1160-i2c.c b/drivers/media/usb/stk1160/stk1160-i2c.c
> index 176ac93..850cf28 100644
> --- a/drivers/media/usb/stk1160/stk1160-i2c.c
> +++ b/drivers/media/usb/stk1160/stk1160-i2c.c
> @@ -116,7 +116,7 @@ static int stk1160_i2c_read_reg(struct stk1160 *dev, u8 addr,
>         if (rc < 0)
>                 return rc;
>
> -       stk1160_read_reg(dev, STK1160_SBUSR_RD, value);
> +       rc = stk1160_read_reg(dev, STK1160_SBUSR_RD, value);
>         if (rc < 0)
>                 return rc;
>
>
> --

Acked-by: Ezequiel Garcia <elezegarcia@gmail.com>
