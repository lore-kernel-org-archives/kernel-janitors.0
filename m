From: Vikram Dhillon <dhillonv10@gmail.com>
Date: Sat, 06 Mar 2010 21:30:33 +0000
Subject: Re: [patch] security: ima_file_mmap() don't just return zero
Message-Id: <ea6602021003061330j56132f8er73e27f017e6b9d09@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100306112125.GN4958@bicker>
In-Reply-To: <20100306112125.GN4958@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>, Mimi Zohar <zohar@us.ibm.com>, James Morris <jmorris@namei.org>, Eric Paris <eparis@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, "J.R. Okajima" <hooanon05@yahoo.co.jp>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Mar 6, 2010 at 6:21 AM, Dan Carpenter <error27@gmail.com> wrote:
> It seems like we should return an error here.  That's what the comment
> says we should do.
>
> I also removed an out of date comment.  It wasn't needed and seemed likely
> to get out of date again.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> This was found with a static checker and I have only compile tested it.
> The callers all seem to use the return code, but please review carefully.
> The code has been like this since the module was merged.
>
> diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
> index 294b005..90d5314 100644
> --- a/security/integrity/ima/ima_main.c
> +++ b/security/integrity/ima/ima_main.c
> @@ -260,18 +260,17 @@ out:
>  * policy decision.
>  *
>  * Return 0 on success, an error code on failure.
> - * (Based on the results of appraise_measurement().)
>  */
>  int ima_file_mmap(struct file *file, unsigned long prot)
>  {
> -       int rc;
> +       int rc = 0;
>
>        if (!file)
>                return 0;
>        if (prot & PROT_EXEC)
>                rc = process_measurement(file, file->f_dentry->d_name.name,
>                                         MAY_EXEC, FILE_MMAP);
> -       return 0;
> +       return rc;
>  }
>
>  /**
> --
> To unsubscribe from this list: send the line "unsubscribe linux-security-module" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

Looks good, and nice work here :)

Acked-by: Vikram Dhillon <dhillonv10@gmail.com>

-- 
Regards,
Vikram Dhillon

~~~
There are lots of Linux users who don't care how the kernel works, but
only want to use it. That is a tribute to how good Linux is.
-- Linus Torvalds
