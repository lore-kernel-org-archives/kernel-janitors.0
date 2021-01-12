From: Chao Yu <yuchao0@huawei.com>
Date: Tue, 12 Jan 2021 07:18:59 +0000
Subject: Re: [PATCH -next] f2fs: docs: rectify the table header in sysfs-fs-f2fs
Message-Id: <4d28715d-74ed-2ca2-ae4c-d5e88731e5c6@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210112063930.20525-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210112063930.20525-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Cc: linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2021/1/12 14:39, Lukas Bulwahn wrote:
> Commit 969945899a35 ("f2fs: introduce sb_status sysfs node") documents the
> sb_status values in a table in ./Documentation/ABI/testing/sysfs-fs-f2fs,
> but the table header of the first column has a wrong length.
Thanks for fixing this, however original patch was still in dev branch of
f2fs, so I prefer to fix original patch rather than adding a new fixing patch.

Would you mind merging this into original patch?

Thanks,
