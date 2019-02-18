From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Mon, 18 Feb 2019 10:14:07 +0000
Subject: Re: [PATCH -next] platform/chrome: Make function wilco_ec_transfer() static
Message-Id: <05971cf1-433a-3edf-7dc2-8561c41e539a@collabora.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190216060910.139768-1-weiyongjun1@huawei.com>
In-Reply-To: <20190216060910.139768-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Benson Leung <bleung@chromium.org>, Duncan Laurie <dlaurie@google.com>, Nick Crews <ncrews@chromium.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 16/2/19 7:09, Wei Yongjun wrote:
> Fixes the following sparse warning:
> 
> drivers/platform/chrome/wilco_ec/mailbox.c:126:5: warning:
>  symbol 'wilco_ec_transfer' was not declared. Should it be static?
> 
> Fixes: 436dad4fda10 ("platform/chrome: Add new driver for Wilco EC")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/platform/chrome/wilco_ec/mailbox.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Applied for 5.1

Thanks

> diff --git a/drivers/platform/chrome/wilco_ec/mailbox.c b/drivers/platform/chrome/wilco_ec/mailbox.c
> index c7028488e575..f6ff29a11f1a 100644
> --- a/drivers/platform/chrome/wilco_ec/mailbox.c
> +++ b/drivers/platform/chrome/wilco_ec/mailbox.c
> @@ -123,8 +123,9 @@ static void wilco_ec_prepare(struct wilco_ec_message *msg,
>   * Context: ec->mailbox_lock should be held while using this function.
>   * Return: number of bytes received or negative error code on failure.
>   */
> -int wilco_ec_transfer(struct wilco_ec_device *ec, struct wilco_ec_message *msg,
> -		      struct wilco_ec_request *rq)
> +static int wilco_ec_transfer(struct wilco_ec_device *ec,
> +			     struct wilco_ec_message *msg,
> +			     struct wilco_ec_request *rq)
>  {
>  	struct wilco_ec_response *rs;
>  	u8 checksum;
> 
> 
> 
