From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Sep 2017 23:40:52 +0000
Subject: Re: [PATCH] tty: vt: keyboard: add range check to kbs->kb_func index
Message-Id: <20170920234052.euqzh6opnn27nxth@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170920213828.5563-1-colin.king@canonical.com>
In-Reply-To: <20170920213828.5563-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Ingo Molnar <mingo@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 20, 2017 at 10:38:28PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> A value outside the range 0..MAX_NR_FUNC-1 in kbs->kb_func will
> cause an array bounds overflow on func_table. Fix this by adding
> a range check.
> 
> Detected by CoverityScan, CID#401961 ("Untrusted array index read")
> 
> Fixes: 079c9534a96d ("vt:tackle kbd_table")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/tty/vt/keyboard.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/tty/vt/keyboard.c b/drivers/tty/vt/keyboard.c
> index f4166263bb3a..1ecf545a96a8 100644
> --- a/drivers/tty/vt/keyboard.c
> +++ b/drivers/tty/vt/keyboard.c
> @@ -1982,6 +1982,11 @@ int vt_do_kdgkb_ioctl(int cmd, struct kbsentry __user *user_kdgkb, int perm)
>  	kbs->kb_string[sizeof(kbs->kb_string)-1] = '\0';
>  	i = kbs->kb_func;
>  
> +	if (i < 0 || i >= MAX_NR_FUNC) {

kbs->kb_func is an unsigned char and MAX_NR_FUNC is 256 so this check
will never be true.

regards,
dan carpenter


