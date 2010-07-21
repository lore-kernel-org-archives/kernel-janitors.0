From: Andreas Gruenbacher <agruen@suse.de>
Date: Wed, 21 Jul 2010 17:57:20 +0000
Subject: [PATCH 0/2] mbcache fixes
Message-Id: <20100721202637.4CC213C539AA@imap.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4C46D1C5.90200@gmail.com> <4C46FD67.8070808@redhat.com>
In-Reply-To: <4C46FD67.8070808@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Eric Sandeen <sandeen@redhat.com>, hch@infradead.org, linux-ext4 <linux-ext4@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel-janitors <kernel-janitors@vger.kernel.org>, Wang Sheng-Hui <crosslonelyover@gmail.com>

Al,

here is an mbcache cleanup and then a fixed version of Shenghui's minor
shrinker function fix.  The patches have survived functional testing
here.

This seems slightly too much for kernel-janitors, so could you please
take the patches?

Thanks,
Andreas

Andreas Gruenbacher (2):
  mbcache: Remove unused features
  mbcache: fix shrinker function return value

 fs/ext2/xattr.c         |   12 ++--
 fs/ext3/xattr.c         |   12 ++--
 fs/ext4/xattr.c         |   12 ++--
 fs/mbcache.c            |  168 ++++++++++++++---------------------------------
 include/linux/mbcache.h |   20 ++----
 5 files changed, 70 insertions(+), 154 deletions(-)

-- 
1.7.2.rc3.57.g77b5b

