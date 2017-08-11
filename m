From: Tejun Heo <tj@kernel.org>
Date: Fri, 11 Aug 2017 17:33:52 +0000
Subject: Re: [PATCH] cgroup: remove unneeded checks
Message-Id: <20170811173352.GE3005423@devbig577.frc2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170809102521.pizo5vlqhb5unrin@mwanda>
In-Reply-To: <20170809102521.pizo5vlqhb5unrin@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Roman Gushchin <guro@fb.com>, Zefan Li <lizefan@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Aug 09, 2017 at 01:25:21PM +0300, Dan Carpenter wrote:
> "descendants" and "depth" are declared as int, so they can't be larger
> than INT_MAX.  Static checkers complain and it's slightly confusing for
> humans as well so let's just remove these conditions.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to cgroup/for-4.14.

Thanks.

-- 
tejun
