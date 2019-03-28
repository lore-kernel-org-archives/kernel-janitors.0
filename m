From: Mukesh Ojha <mojha@codeaurora.org>
Date: Thu, 28 Mar 2019 19:46:02 +0000
Subject: Re: [PATCH] n_tty: check for negative and zero space return from tty_write_room
Message-Id: <e5f8282c-60e0-cefe-8ee6-2690a24e3b60@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190328171005.5822-1-colin.king@canonical.com>
In-Reply-To: <20190328171005.5822-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 3/28/2019 10:40 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The return from tty_write_room could potentially be negative if
> a tty write_room driver returns an error number (not that any seem
> to do). Rather than just check for a zero return, also check for
> a -ve return. This avoids the unsigned nr being set to a large unsigned
> value on the assignment from variable space and can lead to overflowing
> the buffer buf.  Better to be safe than assume all write_room
> implementations in tty drivers are going to do the right thing.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>


Looks reasonable to me.


Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

-Mukesh.


> ---
>   drivers/tty/n_tty.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/tty/n_tty.c b/drivers/tty/n_tty.c
> index 9cdb0fa3c4bf..66630787fbf9 100644
> --- a/drivers/tty/n_tty.c
> +++ b/drivers/tty/n_tty.c
> @@ -550,7 +550,7 @@ static ssize_t process_output_block(struct tty_struct *tty,
>   	mutex_lock(&ldata->output_lock);
>   
>   	space = tty_write_room(tty);
> -	if (!space) {
> +	if (space <= 0) {
>   		mutex_unlock(&ldata->output_lock);
>   		return 0;
>   	}
