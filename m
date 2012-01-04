From: Tejun Heo <tj@kernel.org>
Date: Wed, 04 Jan 2012 15:38:43 +0000
Subject: Re: [patch] cgroup: move assignement out of condition in
Message-Id: <20120104153843.GM31746@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120104072429.GF30978@elgon.mountain>
In-Reply-To: <20120104072429.GF30978@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jan 04, 2012 at 10:24:29AM +0300, Dan Carpenter wrote:
> Gcc complains about this: "kernel/cgroup.c:2179:4: warning: suggest
> parentheses around assignment used as truth value [-Wparentheses]"
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to cgroup/for-3.3.  Li, applied w/o your ack as it's trivial.

Thanks.

-- 
tejun
