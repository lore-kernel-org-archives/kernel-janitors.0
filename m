From: Dominique Martinet <asmadeus@codewreck.org>
Date: Tue, 01 Dec 2020 07:20:13 +0000
Subject: Re: [PATCH 1/2] 9p: Uninitialized variable in v9fs_writeback_fid()
Message-Id: <20201201072013.GA3587@nautica>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8Xq7JvqR/LKzjB2@mwanda>
In-Reply-To: <X8Xq7JvqR/LKzjB2@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter wrote on Mon, Nov 30, 2020:
> If v9fs_fid_lookup_with_uid() fails then "fid" is not initialized.
> 
> The v9fs_fid_lookup_with_uid() can't return NULL.  If it returns an
> error pointer then we can still pass that to clone_fid() and it will
> return the error pointer back again.
> 
> Fixes: 6636b6dcc3db ("9p: add refcount to p9_fid struct")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, taken both.

-- 
Dominique
