From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Sat, 30 Sep 2017 18:04:35 +0000
Subject: Re: [PATCH] usb: misc: usbtest: Fix overflow in usbtest_do_ioctl()
Message-Id: <CABeXuvpASnm8KZj=_tbvcp-tJJMiJxjER9gHY0860-XzTCPQ8w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170930081529.g3vtwn22yfrjdbjv@mwanda>
In-Reply-To: <20170930081529.g3vtwn22yfrjdbjv@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Sep 30, 2017 at 1:15 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> There used to be a test against "if (param->sglen > MAX_SGLEN)" but it
> was removed during a refactor.  It leads to an integer overflow and a
> stack overflow in test_queue() if we try to create a too large urbs[]
> array on the stack.
>
> There is a second integer overflow in test_queue() as well if
> "param->iterations" is too high.  I don't immediately see that it's
> harmful but I've added a check to prevent it and silence the static
> checker warning.
>
> Fixes: 18fc4ebdc705 ("usb: misc: usbtest: Remove timeval usage")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
> index eee82ca55b7b..113e38bfe0ef 100644
> --- a/drivers/usb/misc/usbtest.c
> +++ b/drivers/usb/misc/usbtest.c
> @@ -1964,6 +1964,9 @@ test_queue(struct usbtest_dev *dev, struct usbtest_param_32 *param,
>         int                     status = 0;
>         struct urb              *urbs[param->sglen];
>
> +       if (!param->sglen || param->iterations > UINT_MAX / param->sglen)

Would adding a comment here that we are checking for overflow of
context.count make sense?
It takes some time to figure out that context.count is unsigned and
hence the check is against UINT_MAX here.

> +               return -EINVAL;
> +
>         memset(&context, 0, sizeof(context));
>         context.count = param->iterations * param->sglen;
>         context.dev = dev;
> @@ -2087,6 +2090,8 @@ usbtest_do_ioctl(struct usb_interface *intf, struct usbtest_param_32 *param)
>
>         if (param->iterations <= 0)
>                 return -EINVAL;
> +       if (param->sglen > MAX_SGLEN)
> +               return -EINVAL;

Right. I seem to have missed this. Thanks.

Acked-by: Deepa Dinamani <deepa.kernel@gmail.com>

-Deepa
