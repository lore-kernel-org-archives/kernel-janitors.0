From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Nov 2013 07:57:52 +0000
Subject: Re: [patch 1/2]bluetooth:bfusb.c whitespace cleaning (with some questions).
Message-Id: <20131111075752.GD5302@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAAL8FfATS2ub-ZFL+pPvj-3dcsmV4DiyZX3UOft41568LvqZTQ@mail.gmail.com>
In-Reply-To: <CAAL8FfATS2ub-ZFL+pPvj-3dcsmV4DiyZX3UOft41568LvqZTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Nov 11, 2013 at 12:52:06AM -0200, Luca Bartolacci wrote:
> The thing is this one, for example i already read about kerneljanitors
> and the we are "cleaning" the code with checkpatch. I put next here
> some "clean" of a whitespace on bluetooth/bfusb.c. The thing is: "Its
> ok to make a big patch, cleaning all the warnings?"
> We must do it all at once ?
> Example:
> total: 2 errors, 13 warnings, 742 lines checked
> If i clean all in one patch, its ok?.
> Im asking this because i know its a pain in the *ss to be
> cherrypicking from all the clean, not in this case. But there are code
> with 200 warnings (of line over 80 characters).

It's easiest to start in staging/.  Staging is less picky.

Generally the rule in staging is to pick one kind of white space problem
and fix it throughout the file.  But really just consider it from a
reviewer perspective and do something that makes sense.

Sign up for the staging email list and review other newbie patches.

> Beside this, the other thing the is bothering me is: "Should i do this
> kind of patch or should i focus on find bugs in the code?"(Like
> locking bugs, security bugs, etc)

It's more interesting to focus on bugs.

> 
> I apologize if I made/asked something wrong.
> 
> 

The patch is white space damaged and doesn't apply.  I have no idea what
you were fixing.

regards,
dan carpenter

> diff --git a/drivers/bluetooth/bfusb.c b/drivers/bluetooth/bfusb.c
> index 3138699..cc8a707 100644
> --- a/drivers/bluetooth/bfusb.c
> +++ b/drivers/bluetooth/bfusb.c
> @@ -145,8 +145,8 @@ static int bfusb_send_bulk(struct bfusb_data *data, struct s
> 
>         err = usb_submit_urb(urb, GFP_ATOMIC);
>         if (err) {
> -               BT_ERR("%s bulk tx submit failed urb %p err %d",
> -                                       data->hdev->name, urb, err);
> +               BT_ERR("%s bulk tx submit failed urb %p err %d",
> +                                        data->hdev->name, urb, err);
>                 skb_unlink(skb, &data->pending_q);
>                 usb_free_urb(urb);
>         } else
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
