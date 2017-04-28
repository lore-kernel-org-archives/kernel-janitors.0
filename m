From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 28 Apr 2017 05:26:50 +0000
Subject: Re: [PATCH] staging: speakup: Replace simple_strtoul by kstrtoul
Message-Id: <alpine.DEB.2.20.1704280722210.2028@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170427164032.GA1578@gmail.com>
In-Reply-To: <20170427164032.GA1578@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Fri, 28 Apr 2017, Shekhar Bhandakkar wrote:

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
>  	int do_characters = !strcmp(attr->attr.name, "characters");
>  	size_t desc_length = 0;
>  	int i;
> +	int err;
>
>  	spin_lock_irqsave(&speakup_info.spinlock, flags);
>  	while (cp < end) {
> @@ -153,7 +154,10 @@ static ssize_t chars_chartab_store(struct kobject *kobj,
>  			continue;
>  		}
>
> -		index = simple_strtoul(cp, &temp, 10);
> +		temp = cp;
> +		err = kstrtoul(temp, 10, &index);

I haven't looked at how temp is used, but I doubt that this is the
correct fix, because it doesn't make the distinction between cp and temp
meaningful.  In my experience, all of the remaining uses of
simple_strtoul cannot be converted to kstrtoul because they use the second
argument of simple_strtoul in some important way.  The checkpatch warning
is more intended to suggest that people avoid adding new uses of
simple_strtoul rather than an indication that it is possible to convert
all the old ones.

In any case, when you make a change in a patch, it should becomes [PATCH
v2] and under the --- you should explain what is new in the v2.  In a case
like this where the change is complex, above the --- you should also
explain why all aspects of your change are correct, in particular about
the corrcetness of the use of temp.

julia

> +		if (err)
> +			return err;
>  		if (index > 255) {
>  			rejected++;
>  			cp = linefeed + 1;
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
