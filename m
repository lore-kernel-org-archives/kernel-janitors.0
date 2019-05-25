From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Sat, 25 May 2019 12:59:08 +0000
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_net=5D_staging=3A_Remove_set_but_not_used_var?= =?UTF-8?Q?iable_=E2=80=98st
Message-Id: <CAGngYiX04W+-jxqnWUD6CLh8LAr61FhtADGM0zbGcdeArqzC-Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190525042642.78482-1-maowenan@huawei.com>
In-Reply-To: <20190525042642.78482-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Jeremy Sowden <jeremy@azazel.net>, devel@driverdev.osuosl.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Matt Sickler <matt.sickler@daktronics.com>

On Sat, May 25, 2019 at 12:20 AM Mao Wenan <maowenan@huawei.com> wrote:
>
> The variable 'status' is not used any more, remve it.

>      /* do the transfers for this message */
>      list_for_each_entry(transfer, &m->transfers, transfer_list) {
>          if (transfer->tx_buf = NULL && transfer->rx_buf = NULL && transfer->len) {
> -            status = -EINVAL;
>              break;
>          }

This looks like an error condition that's not reported to the spi core.

Instead of removing the status variable (which also removes the error value!),
maybe this should be reported to the spi core instead ?

Other spi drivers appear to do the following on the error path:
m->status = status;
return status;

>
> @@ -370,7 +368,6 @@ kp_spi_transfer_one_message(struct spi_master *master, struct spi_message *m)
>
>              if (count != transfer->len) {
> -                status = -EIO;
>                  break;

Same issue here.
