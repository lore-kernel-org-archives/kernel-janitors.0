From: Chao Yu <yuchao0@huawei.com>
Date: Tue, 21 Apr 2020 11:35:48 +0000
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove redundant assignment to variable err
Message-Id: <881187e9-68c0-6766-d462-881371973974@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200420220057.98796-1-colin.king@canonical.com>
In-Reply-To: <20200420220057.98796-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2020/4/21 6:00, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being assigned with a value that is never read
> and it is being updated later with a new value. The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,
