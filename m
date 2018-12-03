From: Tejun Heo <tj@kernel.org>
Date: Mon, 03 Dec 2018 16:25:55 +0000
Subject: Re: [PATCH -next] cpuset: Remove set but not used variable 'cs'
Message-Id: <20181203162555.GM2509588@devbig004.ftw2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543633976-183380-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1543633976-183380-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Li Zefan <lizefan@huawei.com>, mingo@kernel.org, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Dec 01, 2018 at 03:12:56AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> kernel/cgroup/cpuset.c: In function 'cpuset_cancel_attach':
> kernel/cgroup/cpuset.c:2167:17: warning:
>  variable 'cs' set but not used [-Wunused-but-set-variable]
> 
> It never used since introduction in commit 1f7dd3e5a6e4 ("cgroup: fix handling
> of multi-destination migration from subtree_control enabling")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied to cgroup/for-4.21.

Thanks.

-- 
tejun
