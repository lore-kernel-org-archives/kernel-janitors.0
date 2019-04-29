From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 29 Apr 2019 10:44:59 +0000
Subject: Re: [PATCH -next] memstick: tifm: remove set but not used variable 'data'
Message-Id: <CAPDyKFqEoaNKqz-7RQwaHsWP7L=7rYcwo4=tfhbafZ+NXu3e=Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190425020332.45980-1-yuehaibing@huawei.com>
In-Reply-To: <20190425020332.45980-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 25 Apr 2019 at 03:53, YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/memstick/host/tifm_ms.c: In function 'tifm_ms_issue_cmd':
> drivers/memstick/host/tifm_ms.c:259:17: warning:
>  variable 'data' set but not used [-Wunused-but-set-variable]
>
> It's not used any more since commit 92b22d935fed ("tifm: fix the
> MemoryStick host fifo handling code")
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/memstick/host/tifm_ms.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/memstick/host/tifm_ms.c b/drivers/memstick/host/tifm_ms.c
> index 1bbb2ead9556..6b13ac56eb27 100644
> --- a/drivers/memstick/host/tifm_ms.c
> +++ b/drivers/memstick/host/tifm_ms.c
> @@ -256,7 +256,6 @@ static unsigned int tifm_ms_transfer_data(struct tifm_ms *host)
>  static int tifm_ms_issue_cmd(struct tifm_ms *host)
>  {
>         struct tifm_dev *sock = host->dev;
> -       unsigned char *data;
>         unsigned int data_len, cmd, sys_param;
>
>         host->cmd_flags = 0;
> @@ -265,8 +264,6 @@ static int tifm_ms_issue_cmd(struct tifm_ms *host)
>         host->io_word = 0;
>         host->cmd_flags = 0;
>
> -       data = host->req->data;
> -
>         host->use_dma = !no_dma;
>
>         if (host->req->long_data) {
>
>
>
