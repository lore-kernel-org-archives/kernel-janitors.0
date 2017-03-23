From: Christoph Hellwig <hch@infradead.org>
Date: Thu, 23 Mar 2017 14:07:21 +0000
Subject: Re: [PATCH] block: make nr_iovecs unsigned in bio_alloc_bioset()
Message-Id: <20170323140721.GA8416@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170323102455.GA20154@mwanda>
In-Reply-To: <20170323102455.GA20154@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jens Axboe <axboe@fb.com>, Ming Lei <tom.leiming@gmail.com>, Mike Christie <mchristi@redhat.com>, Kent Overstreet <kent.overstreet@gmail.com>, Hannes Reinecke <hare@suse.com>, Chaitanya Kulkarni <chaitanya.kulkarni@hgst.com>, Mike Snitzer <snitzer@redhat.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

Looks fine,

Reviewed-by: Christoph Hellwig <hch@lst.de>
