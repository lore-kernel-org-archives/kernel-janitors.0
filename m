From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 16 Dec 2019 11:51:04 +0000
Subject: Re: [RFC PATCH v5] f2fs: support data compression
Message-Id: <0ab8c593-d043-cdf6-7805-f7bceba8e519@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191216062806.112361-1-yuchao0@huawei.com>
In-Reply-To: <20191216062806.112361-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Chao Yu <yuchao0@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

…
> +++ b/fs/f2fs/f2fs.h
…
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +bool f2fs_is_compressed_page(struct page *page);
…

Can the following adjustment make sense?

+bool f2fs_is_compressed_page(const struct page *page);


Would you like to improve const-correctness at any more source code places?

Regards,
Markus
