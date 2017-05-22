From: Dan Carpenter <error27@gmail.com>
Date: Mon, 22 May 2017 14:57:32 +0000
Subject: Re: [PATCH] staging: speakup: Replace simple_strtoul by kstrtoul
Message-Id: <CA+_b7D+9qZkoD_e2ATB4PvO_s27=0zqKas_0CBkkH1anfhPWOg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170427164032.GA1578@gmail.com>
In-Reply-To: <20170427164032.GA1578@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I happened to search my gmail spam box for patches and found this.

On Fri, Apr 28, 2017 at 6:50 AM, Shekhar Bhandakkar
<cs14btech11006@iith.ac.in> wrote:
> The simple_strtoul function is obsolete.
> This patch replaces it with kstrtoul.
>
> Signed-off-by: Shekhar Bhandakkar <cs14btech11006@iith.ac.in>
> ---
>  drivers/staging/speakup/kobjects.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/speakup/kobjects.c b/drivers/staging/speakup/kobjects.c
> index ca85476..8a1ebe6 100644
> --- a/drivers/staging/speakup/kobjects.c
> +++ b/drivers/staging/speakup/kobjects.c
> @@ -127,6 +127,7 @@ static ssize_t chars_chartab_store(struct kobject *kobj,
>         int do_characters = !strcmp(attr->attr.name, "characters");
>         size_t desc_length = 0;
>         int i;
> +       int err;
>
>         spin_lock_irqsave(&speakup_info.spinlock, flags);
>         while (cp < end) {
> @@ -153,7 +154,10 @@ static ssize_t chars_chartab_store(struct kobject *kobj,
>                         continue;
>                 }
>
> -               index = simple_strtoul(cp, &temp, 10);
> +               temp = cp;
> +               err = kstrtoul(temp, 10, &index);
> +               if (err)
> +                       return err;

This is buggy.  "temp" is supposed to point to the end of the number.

regards,
dan carpenter
