From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 10 Sep 2019 17:02:27 +0000
Subject: Re: [PATCH] NTB: ntb_transport: remove redundant assignment to rc
Message-Id: <CAPoiz9z-e_oK2urbkWcoa2qqybAFbR54SR7gGzU1EA19zrxc=A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190818185349.15275-1-colin.king@canonical.com>
In-Reply-To: <20190818185349.15275-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, linux-ntb <linux-ntb@googlegroups.com>, kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Sun, Aug 18, 2019 at 7:53 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Variable rc is initialized to a value that is never read and it
> is re-assigned later. The initialization is redundant and can be
> removed.

Applied to ntb-next, thanks

> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/ntb/ntb_transport.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/ntb/ntb_transport.c b/drivers/ntb/ntb_transport.c
> index 40c90ca10729..00a5d5764993 100644
> --- a/drivers/ntb/ntb_transport.c
> +++ b/drivers/ntb/ntb_transport.c
> @@ -292,7 +292,7 @@ static int ntb_transport_bus_match(struct device *dev,
>  static int ntb_transport_bus_probe(struct device *dev)
>  {
>         const struct ntb_transport_client *client;
> -       int rc = -EINVAL;
> +       int rc;
>
>         get_device(dev);
>
> --
> 2.20.1
>
