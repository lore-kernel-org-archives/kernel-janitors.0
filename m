From: Gilad Ben-Yossef <gilad@benyossef.com>
Date: Thu, 07 Dec 2017 06:57:45 +0000
Subject: Re: [PATCH] staging: ccree: Uninitialized return in ssi_ahash_import()
Message-Id: <CAOtvUMfRt9KU_0J+GTuy4i9SCy0jY8+sPgQXq-KG-MUH2hmUdA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171205143717.gqhyethohcet3fz7@mwanda>
In-Reply-To: <20171205143717.gqhyethohcet3fz7@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Dec 5, 2017 at 4:37 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The return value isn't initialized on some success paths.
>
> Fixes: c5f39d07860c ("staging: ccree: fix leak of import() after init()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/staging/ccree/ssi_hash.c b/drivers/staging/ccree/ssi_hash.c
> index a2e8a9d32e00..3855c42e61af 100644
> --- a/drivers/staging/ccree/ssi_hash.c
> +++ b/drivers/staging/ccree/ssi_hash.c
> @@ -1823,7 +1823,7 @@ static int ssi_ahash_import(struct ahash_request *req, const void *in)
>         struct device *dev = drvdata_to_dev(ctx->drvdata);
>         struct ahash_req_ctx *state = ahash_request_ctx(req);
>         u32 tmp;
> -       int rc;
> +       int rc = 0;
>
>         memcpy(&tmp, in, sizeof(u32));
>         if (tmp != CC_EXPORT_MAGIC) {

Acked-by: Gilad Ben-Yossef <gilad@benyossef.com>

And thanks!
Gilad

-- 
Gilad Ben-Yossef
Chief Coffee Drinker

"If you take a class in large-scale robotics, can you end up in a
situation where the homework eats your dog?"
 -- Jean-Baptiste Queru
