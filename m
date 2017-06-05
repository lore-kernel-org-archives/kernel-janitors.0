From: Jason Gerecke <killertofu@gmail.com>
Date: Mon, 05 Jun 2017 15:29:57 +0000
Subject: Re: [PATCH 1/3] HID: Wacom: Use devm_kcalloc() in two functions
Message-Id: <CANRwn3QbNn4EA-FDmz1jnFUgjJ0tH63MCwOGcTCodvFtaBeeAQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d126aeeb-f7e0-e54b-b874-61d776fe45cb@users.sourceforge.net> <d0224def-26ba-d33b-e9be-a6218259c8e4@users.sourceforge.net>
In-Reply-To: <d0224def-26ba-d33b-e9be-a6218259c8e4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jiri Kosina <jikos@kernel.org>
Cc: Linux Input <linux-input@vger.kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, LKML <linux-kernel@vger.kernel.org>, SF Markus Elfring <elfring@users.sourceforge.net>, kernel-janitors@vger.kernel.org

Going through old mail and noticed that these three patches seem to
have been overlooked (at least, I don't see them in Jiri's
branches...). For the set:

Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>

Jason
---
Now instead of four in the eights place /
you’ve got three, ‘Cause you added one  /
(That is to say, eight) to the two,     /
But you can’t take seven from three,    /
So you look at the sixty-fours....



On Tue, Apr 25, 2017 at 8:13 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 25 Apr 2017 16:06:08 +0200
>
> * Multiplications for the size determination of memory allocations
>   indicated that array data structures should be processed.
>   Thus use the corresponding function "devm_kcalloc".
>
>   This issue was detected by using the Coccinelle software.
>
> * Replace the specification of data structures by pointer dereferences
>   to make the corresponding size determination a bit safer according to
>   the Linux coding style convention.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/hid/wacom_sys.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> index 0022c0dac88a..550faf8819ea 100644
> --- a/drivers/hid/wacom_sys.c
> +++ b/drivers/hid/wacom_sys.c
> @@ -1245,7 +1245,7 @@ static int wacom_led_groups_alloc_and_register_one(struct device *dev,
>         if (!devres_open_group(dev, &wacom->led.groups[group_id], GFP_KERNEL))
>                 return -ENOMEM;
>
> -       leds = devm_kzalloc(dev, sizeof(struct wacom_led) * count, GFP_KERNEL);
> +       leds = devm_kcalloc(dev, count, sizeof(*leds), GFP_KERNEL);
>         if (!leds) {
>                 error = -ENOMEM;
>                 goto err;
> @@ -1345,8 +1345,7 @@ static int wacom_led_groups_allocate(struct wacom *wacom, int count)
>         struct wacom_group_leds *groups;
>         int error;
>
> -       groups = devm_kzalloc(dev, sizeof(struct wacom_group_leds) * count,
> -                             GFP_KERNEL);
> +       groups = devm_kcalloc(dev, count, sizeof(*groups), GFP_KERNEL);
>         if (!groups)
>                 return -ENOMEM;
>
> --
> 2.12.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-input" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
