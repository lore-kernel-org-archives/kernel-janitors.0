From: "=?utf-8?B?RGF2aWQgSMOkcmRlbWFu?=" <david@hardeman.nu>
Date: Wed, 19 Oct 2016 13:10:52 +0000
Subject: Re: [PATCH 5/5] [media] winbond-cir: Move a variable assignment in two functions
Message-Id: <ecd1ac487c0cfe2080c9477408258e25@hardeman.nu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0b6de919-35a0-8ee3-9ea7-907c9b9a36f2@users.sourceforge.net>
 <566ABCD9.1060404@users.sourceforge.net>
 <1d7d6a2c-0f1e-3434-9023-9eab25bb913f@users.sourceforge.net>
In-Reply-To: <0b6de919-35a0-8ee3-9ea7-907c9b9a36f2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

October 14, 2016 1:45 PM, "SF Markus Elfring" <elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 14 Oct 2016 13:13:11 +0200
> 
> Move the assignment for the local variable "data" behind the source code
> for condition checks by these functions.

Why?

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> drivers/media/rc/winbond-cir.c | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/rc/winbond-cir.c b/drivers/media/rc/winbond-cir.c
> index 3d286b9..716b1fe 100644
> --- a/drivers/media/rc/winbond-cir.c
> +++ b/drivers/media/rc/winbond-cir.c
> @@ -566,7 +566,7 @@ wbcir_set_carrier_report(struct rc_dev *dev, int enable)
> static int
> wbcir_txcarrier(struct rc_dev *dev, u32 carrier)
> {
> - struct wbcir_data *data = dev->priv;
> + struct wbcir_data *data;
> unsigned long flags;
> u8 val;
> u32 freq;
> @@ -592,6 +592,7 @@ wbcir_txcarrier(struct rc_dev *dev, u32 carrier)
> break;
> }
> 
> + data = dev->priv;
> spin_lock_irqsave(&data->spinlock, flags);
> if (data->txstate != WBCIR_TXSTATE_INACTIVE) {
> spin_unlock_irqrestore(&data->spinlock, flags);
> @@ -611,7 +612,7 @@ wbcir_txcarrier(struct rc_dev *dev, u32 carrier)
> static int
> wbcir_txmask(struct rc_dev *dev, u32 mask)
> {
> - struct wbcir_data *data = dev->priv;
> + struct wbcir_data *data;
> unsigned long flags;
> u8 val;
> 
> @@ -637,6 +638,7 @@ wbcir_txmask(struct rc_dev *dev, u32 mask)
> return -EINVAL;
> }
> 
> + data = dev->priv;
> spin_lock_irqsave(&data->spinlock, flags);
> if (data->txstate != WBCIR_TXSTATE_INACTIVE) {
> spin_unlock_irqrestore(&data->spinlock, flags);
> -- 
> 2.10.1
