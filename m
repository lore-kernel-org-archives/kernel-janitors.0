From: Michael Chan <michael.chan@broadcom.com>
Date: Fri, 08 May 2020 23:04:50 +0000
Subject: Re: [PATCH] net: tg3: tidy up loop, remove need to compute off with a multiply
Message-Id: <CACKFLinpQFupdmq63RH527sDrAj4nrV4vcR+eDy5zh4KqLh8Dg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508225301.484094-1-colin.king@canonical.com>
In-Reply-To: <20200508225301.484094-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Siva Reddy Kallam <siva.kallam@broadcom.com>, Prashant Sreedharan <prashant@broadcom.com>, Michael Chan <mchan@broadcom.com>, "David S . Miller" <davem@davemloft.net>, Netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org, open list <linux-kernel@vger.kernel.org>

On Fri, May 8, 2020 at 3:53 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the value for 'off' is computed using a multiplication and
> a couple of statements later off is being incremented by len and
> this value is never read.  Clean up the code by removing the
> multiplication and just increment off by len on each iteration. Also
> use len instead of TG3_OCIR_LEN.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/broadcom/tg3.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
> index ff98a82b7bc4..9dd9bd506bcc 100644
> --- a/drivers/net/ethernet/broadcom/tg3.c
> +++ b/drivers/net/ethernet/broadcom/tg3.c
> @@ -10798,16 +10798,14 @@ static int tg3_init_hw(struct tg3 *tp, bool reset_phy)
>  static void tg3_sd_scan_scratchpad(struct tg3 *tp, struct tg3_ocir *ocir)
>  {
>         int i;
> +       u32 off, len = TG3_OCIR_LEN;

Please use reverse X-mas tree style variable declarations.  Other than
that, it looks good.

Thanks.

>
> -       for (i = 0; i < TG3_SD_NUM_RECS; i++, ocir++) {
> -               u32 off = i * TG3_OCIR_LEN, len = TG3_OCIR_LEN;
> -
> +       for (i = 0, off = 0; i < TG3_SD_NUM_RECS; i++, ocir++, off += len) {
>                 tg3_ape_scratchpad_read(tp, (u32 *) ocir, off, len);
> -               off += len;
>
>                 if (ocir->signature != TG3_OCIR_SIG_MAGIC ||
>                     !(ocir->version_flags & TG3_OCIR_FLAG_ACTIVE))
> -                       memset(ocir, 0, TG3_OCIR_LEN);
> +                       memset(ocir, 0, len);
>         }
>  }
>
> --
> 2.25.1
>
