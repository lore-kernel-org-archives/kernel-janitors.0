From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 10 Sep 2012 12:57:59 +0000
Subject: [glommer-memcg:kmemcg-slab 57/62] drivers/video/riva/fbdev.c:281:9: sparse: preprocessor token MAX_L
Message-Id: <20120910125759.GA11808@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120910111638.GC9660@localhost>
In-Reply-To: <20120910111638.GC9660@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glauber Costa <glommer@parallels.com>
Cc: kernel-janitors@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>

Glauber,

The patch entitled

 sl[au]b: Allocate objects from memcg cache

changes

 include/linux/slub_def.h |   15 ++++++++++-----

which triggers this warning:

drivers/video/riva/fbdev.c:281:9: sparse: preprocessor token MAX_LEVEL redefined

It's the MAX_LEVEL that is defined in include/linux/idr.h.

MAX_LEVEL is obviously too generic. Better adding some prefix to it?

Thanks,
Fengguang
