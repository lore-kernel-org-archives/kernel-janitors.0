From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 09 May 2020 11:35:36 +0000
Subject: Re: [PATCH 1/3] seq_file: Introduce DEFINE_SEQ_ATTRIBUTE() helper macro
Message-Id: <050ec4c0-1bf0-3880-e368-41d9dc7a3f7f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Kefeng Wang <wangkefeng.wang@huawei.com>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>

…
> +++ b/include/linux/seq_file.h
> @@ -145,6 +145,25 @@ void *__seq_open_private(struct file *, const struct seq_operations *, int);
> int seq_open_private(struct file *, const struct seq_operations *, int);
> int seq_release_private(struct inode *, struct file *);
>
> +#define DEFINE_SEQ_ATTRIBUTE(__name)					\
> +static int __name ## _open(struct inode *inode, struct file *file)	\
…

Can such a macro work also with an identifier which does not contain
double underscores?

Regards,
Markus
