From: maowenan <maowenan@huawei.com>
Date: Tue, 28 May 2019 02:09:38 +0000
Subject: =?UTF-8?Q?Re:_[PATCH_-next_v2]_staging:_kpc2000:_Remove_set_but_not?= =?UTF-8?B?IHVzZWQgdmFyaWFibGUg
Message-Id: <69398d9c-68e1-e4c5-35f9-4bf09627e48a@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190525042642.78482-1-maowenan@huawei.com>
 <20190525081321.121294-1-maowenan@huawei.com>
In-Reply-To: <20190525081321.121294-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: gregkh@linuxfoundation.org, jeremy@azazel.net
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Sven Van Asbroeck <thesven73@gmail.com>

please ignore v2 version.
I will send v3 later according to Sven Van Asbroeck 's comments.

On 2019/5/25 16:13, Mao Wenan wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/staging/kpc2000/kpc_spi/spi_driver.c: In function
> ‘kp_spi_transfer_one_message’:
> drivers/staging/kpc2000/kpc_spi/spi_driver.c:282:9: warning: variable
> ‘status’ set but not used [-Wunused-but-set-variable]
>      int status = 0;
>          ^~~~~~
> The variable 'status' is not used any more, remve it.
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  v2: change the subject of the patch.
> ---
>  drivers/staging/kpc2000/kpc_spi/spi_driver.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/kpc2000/kpc_spi/spi_driver.c b/drivers/staging/kpc2000/kpc_spi/spi_driver.c
> index 86df16547a92..16f9518f8d63 100644
> --- a/drivers/staging/kpc2000/kpc_spi/spi_driver.c
> +++ b/drivers/staging/kpc2000/kpc_spi/spi_driver.c
> @@ -279,7 +279,6 @@ kp_spi_transfer_one_message(struct spi_master *master, struct spi_message *m)
>      struct kp_spi       *kpspi;
>      struct spi_transfer *transfer;
>      union kp_spi_config sc;
> -    int status = 0;
>      
>      spidev = m->spi;
>      kpspi = spi_master_get_devdata(master);
> @@ -332,7 +331,6 @@ kp_spi_transfer_one_message(struct spi_master *master, struct spi_message *m)
>      /* do the transfers for this message */
>      list_for_each_entry(transfer, &m->transfers, transfer_list) {
>          if (transfer->tx_buf = NULL && transfer->rx_buf = NULL && transfer->len) {
> -            status = -EINVAL;
>              break;
>          }
>          
> @@ -370,7 +368,6 @@ kp_spi_transfer_one_message(struct spi_master *master, struct spi_message *m)
>              m->actual_length += count;
>              
>              if (count != transfer->len) {
> -                status = -EIO;
>                  break;
>              }
>          }
> 
