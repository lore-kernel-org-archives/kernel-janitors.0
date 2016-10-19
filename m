From: "=?utf-8?B?RGF2aWQgSMOkcmRlbWFu?=" <david@hardeman.nu>
Date: Wed, 19 Oct 2016 13:04:26 +0000
Subject: Re: [PATCH 2/5] [media] winbond-cir: Move a variable assignment in wbcir_tx()
Message-Id: <78ddb54d61d871ad4b81c986dd9a32d4@hardeman.nu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <26ee4adb-2637-52c3-ac83-ae121bed5eff@users.sourceforge.net>
 <566ABCD9.1060404@users.sourceforge.net>
 <1d7d6a2c-0f1e-3434-9023-9eab25bb913f@users.sourceforge.net>
In-Reply-To: <26ee4adb-2637-52c3-ac83-ae121bed5eff@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

October 14, 2016 1:42 PM, "SF Markus Elfring" <elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 14 Oct 2016 07:34:46 +0200
> 
> Move the assignment for the local variable "data" behind the source code
> for a memory allocation by this function.

Sorry, I can't see what the point is?


> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> drivers/media/rc/winbond-cir.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/rc/winbond-cir.c b/drivers/media/rc/winbond-cir.c
> index 59050f5..fd997f0 100644
> --- a/drivers/media/rc/winbond-cir.c
> +++ b/drivers/media/rc/winbond-cir.c
> @@ -655,7 +655,7 @@ wbcir_txmask(struct rc_dev *dev, u32 mask)
> static int
> wbcir_tx(struct rc_dev *dev, unsigned *b, unsigned count)
> {
> - struct wbcir_data *data = dev->priv;
> + struct wbcir_data *data;
> unsigned *buf;
> unsigned i;
> unsigned long flags;
> @@ -668,6 +668,7 @@ wbcir_tx(struct rc_dev *dev, unsigned *b, unsigned count)
> for (i = 0; i < count; i++)
> buf[i] = DIV_ROUND_CLOSEST(b[i], 10);
> 
> + data = dev->priv;
> /* Not sure if this is possible, but better safe than sorry */
> spin_lock_irqsave(&data->spinlock, flags);
> if (data->txstate != WBCIR_TXSTATE_INACTIVE) {
> -- 
> 2.10.1
