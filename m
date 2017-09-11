From: Jens Axboe <axboe@kernel.dk>
Date: Mon, 11 Sep 2017 19:52:56 +0000
Subject: Re: [PATCH] mm/backing-dev.c: fix an error handling path in 'cgwb_create()'
Message-Id: <512a90ae-a8bf-7ead-32ba-b4fe36866b20@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170911194323.17833-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170911194323.17833-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, jack@suse.cz, tj@kernel.org, geliangtang@gmail.com, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 09/11/2017 01:43 PM, Christophe JAILLET wrote:
> If the 'kmalloc' fails, we must go through the existing error handling
> path.

Looks good to me, probably wants a

Fixes: 52ebea749aae ("writeback: make backing_dev_info host cgroup-specific bdi_writebacks")

line as well.

-- 
Jens Axboe

