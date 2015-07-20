From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Jul 2015 14:59:09 +0000
Subject: re: block: make /sys/block/<dev>/queue/discard_max_bytes writeable
Message-Id: <20150720145909.GA1765@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <55AD0CA2.30400@fb.com>
In-Reply-To: <55AD0CA2.30400@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Jens Axboe,

The patch d45a0f150e9d: "block: make
/sys/block/<dev>/queue/discard_max_bytes writeable" from Jul 16,
2015, leads to the following static checker warning:

	block/blk-sysfs.c:152 queue_discard_max_hw_show()
	warn: should 'q->limits.max_hw_discard_sectors << 9' be a 64 bit type?

block/blk-sysfs.c
   148  static ssize_t queue_discard_max_hw_show(struct request_queue *q, char *page)
   149  {
   150          unsigned long long val;
   151  
   152          val = q->limits.max_hw_discard_sectors << 9;
                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
It definitely looks like this can wrap.

   153          return sprintf(page, "%llu\n", val);
   154  }

regards,
dan carpenter
