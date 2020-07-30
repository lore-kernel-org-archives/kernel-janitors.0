From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Thu, 30 Jul 2020 10:51:48 +0000
Subject: Re: [PATCH][next] habanalabs: fix incorrect check on failed workqueue create
Message-Id: <CAFCwf101gsf3GK6f_ggNgPeKTFXEDdCYz-LugNq5mY342zc2Hw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200730082022.5557-1-colin.king@canonical.com>
In-Reply-To: <20200730082022.5557-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Tomer Tayar <ttayar@habana.ai>, Omer Shpigelman <oshpigelman@habana.ai>, Ofir Bitton <obitton@habana.ai>, kernel-janitors@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>

On Thu, Jul 30, 2020 at 11:20 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The null check on a failed workqueue create is currently null checking
> hdev->cq_wq rather than the pointer hdev->cq_wq[i] and so the test
> will never be true on a failed workqueue create. Fix this by checking
> hdev->cq_wq[i].
>
> Addresses-Coverity: ("Dereference before null check")
> Fixes: 5574cb2194b1 ("habanalabs: Assign each CQ with its own work queue")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/misc/habanalabs/common/device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/misc/habanalabs/common/device.c b/drivers/misc/habanalabs/common/device.c
> index be16b75bdfdb..35214a186913 100644
> --- a/drivers/misc/habanalabs/common/device.c
> +++ b/drivers/misc/habanalabs/common/device.c
> @@ -288,7 +288,7 @@ static int device_early_init(struct hl_device *hdev)
>         for (i = 0 ; i < hdev->asic_prop.completion_queues_count ; i++) {
>                 snprintf(workq_name, 32, "hl-free-jobs-%u", i);
>                 hdev->cq_wq[i] = create_singlethread_workqueue(workq_name);
> -               if (hdev->cq_wq = NULL) {
> +               if (hdev->cq_wq[i] = NULL) {
>                         dev_err(hdev->dev, "Failed to allocate CQ workqueue\n");
>                         rc = -ENOMEM;
>                         goto free_cq_wq;
> --
> 2.27.0
>

This patch is:
Reviewed-by: Oded Gabbay <oded.gabbay@gmail.com>

Greg, can you please apply it directly to the char-misc-next branch ?
I don't want to send a pull request for 1 patch.

Thanks,
Oded
