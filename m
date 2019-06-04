From: Jens Axboe <axboe@kernel.dk>
Date: Tue, 04 Jun 2019 15:43:28 +0000
Subject: Re: [PATCH][next] blktrace: remove redundant assignment to ret
Message-Id: <f834f32d-ab6e-c429-1a3e-13512583ee08@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190604142744.15330-1-colin.king@canonical.com>
In-Reply-To: <20190604142744.15330-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 6/4/19 8:27 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable ret is being assigned a value that is never read, hence
> the assignment is redundant and can be removed.

This doesn't look correct to me, here's the full code:

	ret = -ENOENT;

	dir = debugfs_lookup(buts->name, blk_debugfs_root);
	if (!dir)
		bt->dir = dir = debugfs_create_dir(buts->name, blk_debugfs_root);
	if (!dir)
		goto err;
	[...]
err:
	[...]
	return ret;

The main issue here, to me, looks like we're not dealing with ERR_PTR
returns from debugfs_create_dir(), just checking for NULL.

-- 
Jens Axboe
