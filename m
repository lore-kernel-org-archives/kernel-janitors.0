From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 03 Jun 2020 06:30:48 +0000
Subject: Re: [PATCH v2] exfat: fix memory leak in exfat_parse_param()
Message-Id: <d0ba7af9-acd4-b5f5-8e34-9ef4af83f458@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, stable@vger.kernel.org, syzkaller@googlegroups.com, Al Viro <viro@zeniv.linux.org.uk>, Sungjong Seo <sj1557.seo@samsung.com>, Xiaolong Huang <butterflyhuangxx@gmail.com>

> Additionally, there's no point copying param->string in
> exfat_parse_param() - just steal it, leaving NULL in param->string.
> That's independent from the leak or fix thereof - it's simply
> avoiding an extra copy.

I find it clearer to provide such a source code adjustment
by a separate update step.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=d6f9469a03d832dcd17041ed67774ffb5f3e73b3#n138

Please move it into another patch.


…
> +++ b/fs/exfat/super.c
…
> @@ -686,7 +685,12 @@  static int exfat_get_tree(struct fs_context *fc)
>
>  static void exfat_free(struct fs_context *fc)
>  {
> -	kfree(fc->s_fs_info);
> +	struct exfat_sb_info *sbi = fc->s_fs_info;
> +
> +	if (sbi) {
> +		exfat_free_iocharset(sbi);
> +		kfree(sbi);
> +	}
>  }
…

Can it be helpful to annotate the added check according to branch prediction?
Are valid pointers likely at this place?

Regards,
Markus
