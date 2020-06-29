From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 29 Jun 2020 06:26:27 +0000
Subject: Re: [PATCH v2] ext4: fix direct I/O read error
Message-Id: <22f650fd-6348-30d8-763a-8e03b0772f10@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593400165-114818-1-git-send-email-jiangying8582@126.com>
In-Reply-To: <1593400165-114818-1-git-send-email-jiangying8582@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jiang Ying <jiangying8582@126.com>, Wang Long <wanglong19@meituan.com>, linux-ext4@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, Theodore Ts'o <tytso@mit.edu>

> Fixes: 9fe55eea7e4b ("Fix race when checking i_size on direct i/o read").

* I suggest to move this tag to the bottom of the commit message.

* This specification is usually preferred without a dot at the line end.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=9ebcfadb0610322ac537dd7aa5d9cbc2b2894c68#n183


> This commit caused ext4 direct I/O read error when the read size is not
> alignment with block size.

Wording alternative:
aligned …


> (1) Make the file that is not alignment with block size:

… a file … aligned …


> (3) Compiling the script:

(3) Compile the source file:


> (4) Exec the script:

(4) Run the test program:


> … Thanks.

I propose to omit this word here.


> ---
>  fs/ext4/inode.c | 6 ++++++

Would you like to add patch version descriptions here?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=9ebcfadb0610322ac537dd7aa5d9cbc2b2894c68#n751


…
> @@ -3821,6 +3821,12 @@ static ssize_t ext4_direct_IO_read(struct kiocb *iocb, struct iov_iter *iter)
>  	struct inode *inode = mapping->host;
>  	size_t count = iov_iter_count(iter);
>  	ssize_t ret;
> +	loff_t offset = iocb->ki_pos;
> +	loff_t size;
> +
> +	size = i_size_read(inode);

How do you think about to use the following source code variant?

+	loff_t size = i_size_read(inode);


> +	if (offset >= size)
> +		return 0;

Will any further fine-tuning matter for this function implementation?

Regards,
Markus
