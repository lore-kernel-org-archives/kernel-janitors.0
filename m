From: Ferruh Yigit <fery@cypress.com>
Date: Wed, 03 Jul 2013 12:33:19 +0000
Subject: Re: [patch 2/3] Input: cyttsp4 - silence NULL dereference warning
Message-Id: <51D41A0F.80008@cypress.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130702214107.GB1598@elgon.mountain>
In-Reply-To: <20130702214107.GB1598@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/03/2013 12:41 AM, Dan Carpenter wrote:
> If "cd" were NULL then we would dereference it when we print the error
> message.  Fortunately enough, it can't ever be NULL so we can remove
> those lines.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/input/touchscreen/cyttsp4_core.c b/drivers/input/touchscreen/cyttsp4_core.c
> index 7aa4a34..851e3ff 100644
> --- a/drivers/input/touchscreen/cyttsp4_core.c
> +++ b/drivers/input/touchscreen/cyttsp4_core.c
> @@ -1450,11 +1450,6 @@ static void cyttsp4_watchdog_work(struct work_struct *work)
>       u8 *mode;
>       int retval;
>
> -     if (cd = NULL) {
> -             dev_err(cd->dev, "%s: NULL context pointer\n", __func__);
> -             return;
> -     }
> -
>       mutex_lock(&cd->system_lock);
>       retval = cyttsp4_load_status_regs(cd);
>       if (retval < 0) {
You are right, cd dereference is wrong in error message.
And agree on removing block, cd will not be NULL in this context.

--

Thanks,
ferruh

This message and any attachments may contain Cypress (or its subsidiaries) confidential information. If it has been received in error, please advise the sender and immediately delete this message.
