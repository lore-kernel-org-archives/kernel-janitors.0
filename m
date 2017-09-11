From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 11 Sep 2017 20:04:42 +0000
Subject: Re: [PATCH] mm/backing-dev.c: fix an error handling path in 'cgwb_create()'
Message-Id: <1c50dbc9-f765-5b90-1f00-7d87205382d7@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170911194323.17833-1-christophe.jaillet@wanadoo.fr>
 <512a90ae-a8bf-7ead-32ba-b4fe36866b20@kernel.dk>
In-Reply-To: <512a90ae-a8bf-7ead-32ba-b4fe36866b20@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jens Axboe <axboe@kernel.dk>, jack@suse.cz, tj@kernel.org, geliangtang@gmail.com, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 11/09/2017 à 21:52, Jens Axboe a écrit :
> On 09/11/2017 01:43 PM, Christophe JAILLET wrote:
>> If the 'kmalloc' fails, we must go through the existing error handling
>> path.
> Looks good to me, probably wants a
>
> Fixes: 52ebea749aae ("writeback: make backing_dev_info host cgroup-specific bdi_writebacks")
>
> line as well.
>
Hi,

do you want me to resend with the Fixes tag? Or will it be added if merged?

CJ

