From: "=?utf-8?B?RGF2aWQgSMOkcmRlbWFu?=" <david@hardeman.nu>
Date: Wed, 19 Oct 2016 13:07:32 +0000
Subject: Re: [PATCH 3/5] [media] winbond-cir: Move assignments for three variables in wbcir_shutdown()
Message-Id: <327f6034db9ce0c0a72947e47daf344a@hardeman.nu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <285954ec-280f-8a5a-5189-eb2471b4339c@users.sourceforge.net>
 <566ABCD9.1060404@users.sourceforge.net>
 <1d7d6a2c-0f1e-3434-9023-9eab25bb913f@users.sourceforge.net>
In-Reply-To: <285954ec-280f-8a5a-5189-eb2471b4339c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

October 14, 2016 1:43 PM, "SF Markus Elfring" <elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 14 Oct 2016 10:40:12 +0200
> 
> Move the setting for the local variables "mask", "match" and "rc6_csl"
> behind the source code for a condition check by this function
> at the beginning.
 
Again, I can't see what the point is?

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> drivers/media/rc/winbond-cir.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/rc/winbond-cir.c b/drivers/media/rc/winbond-cir.c
> index fd997f0..9d05e17 100644
> --- a/drivers/media/rc/winbond-cir.c
> +++ b/drivers/media/rc/winbond-cir.c
> @@ -702,17 +702,17 @@ wbcir_shutdown(struct pnp_dev *device)
> bool do_wake = true;
> u8 match[11];
> u8 mask[11];
> - u8 rc6_csl = 0;
> + u8 rc6_csl;
> int i;
> 
> - memset(match, 0, sizeof(match));
> - memset(mask, 0, sizeof(mask));
> -
> if (wake_sc == INVALID_SCANCODE || !device_may_wakeup(dev)) {
> do_wake = false;
> goto finish;
> }
> 
> + rc6_csl = 0;
> + memset(match, 0, sizeof(match));
> + memset(mask, 0, sizeof(mask));
> switch (protocol) {
> case IR_PROTOCOL_RC5:
> if (wake_sc > 0xFFF) {
> -- 
> 2.10.1
