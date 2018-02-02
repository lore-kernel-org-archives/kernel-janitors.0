From: jiangyiwen <jiangyiwen@huawei.com>
Date: Fri, 02 Feb 2018 13:31:37 +0000
Subject: [V9fs-developer] [RFC] why set SB_NOATIME in v9fs_fill_super by default
Message-Id: <5A746839.9020602@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Van Hensbergen <ericvh@gmail.com>, Ron Minnich <rminnich@sandia.gov>, Latchesar Ionkov <lucho@ionkov.net>, v9fs-developer@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Eduard Shishkin <Eduard.Shishkin@huawei.com>, "Wangguoli (Andy)" <andy.wangguoli@huawei.com>

Hi all,

I found v9fs always set SB_NOATIME into sb->s_flags in v9fs_fill_super,
even if user use mount option relatime, I am very curious about this
thing, can anyone tell me?

Thanks,
Yiwen Jiang.

