From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Jul 2013 12:47:12 +0000
Subject: Re: [patch] mtd: use correct error codes in debugfs_create()
Message-Id: <20130722124712.GG5636@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130719054938.GC9729@elgon.mountain>
 <20130722055607.GF5636@mwanda> <51ECE488.1050307@bfs.de>
In-Reply-To: <51ECE488.1050307@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org

The debugfs API is a bit confusing initialy but it's straight
foward to use.  You call:

	dfs_rootdir = debugfs_create_dir(...);

If it returns NULL then you return an error code.  If debugfs is
not enabled then it returns ERR_PTR(-ENODEV) but you don't normally
need to test for it.  After all later when you call:

	debugfs_create_file("wear_report", S_IRUSR,
			    dfs_rootdir, dev, &dfs_fops);

That function is just a no-op because debugfs is disabled.

The problem here is that we test for IS_ERR_OR_NULL() instead of
just if (!dfs_rootdir) which is wrong.  Also if we do hit an error
we return success because the true false bit are reversed.

regards,
dan carpenter
> 
