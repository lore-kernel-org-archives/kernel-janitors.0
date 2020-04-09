From: Tejun Heo <tj@kernel.org>
Date: Thu, 09 Apr 2020 19:34:10 +0000
Subject: Re: [PATCH] xattr: fix uninitialized out-param
Message-Id: <20200409193410.GD37608@mtj.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200409062729.1658747-1-dxu@dxuuu.xyz>
In-Reply-To: <20200409062729.1658747-1-dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: viro@zeniv.linux.org.uk, cgroups@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>

On Wed, Apr 08, 2020 at 11:27:29PM -0700, Daniel Xu wrote:
> `removed_sized` isn't correctly initialized (as the doc comment
> suggests) on memory allocation failures. Fix by moving initialization up
> a bit.
> 
> Fixes: 0c47383ba3bd ("kernfs: Add option to enable user xattrs")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>

Appiled to cgroup/for-5.7-fixes.

Thanks.

-- 
tejun
