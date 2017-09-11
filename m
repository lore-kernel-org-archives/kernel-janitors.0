From: Jens Axboe <axboe@kernel.dk>
Date: Mon, 11 Sep 2017 20:17:09 +0000
Subject: Re: [PATCH] mm/backing-dev.c: fix an error handling path in 'cgwb_create()'
Message-Id: <a0163559-d867-d8e0-d84d-bc99f6f4c43d@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170911194323.17833-1-christophe.jaillet@wanadoo.fr>
 <20170911201506.GA15044@quack2.suse.cz>
In-Reply-To: <20170911201506.GA15044@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: tj@kernel.org, geliangtang@gmail.com, akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 09/11/2017 02:15 PM, Jan Kara wrote:
> On Mon 11-09-17 21:43:23, Christophe JAILLET wrote:
>> If the 'kmalloc' fails, we must go through the existing error handling
>> path.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Looks good to me. You can add:
> 
> Reviewed-by: Jan Kara <jack@suse.cz>

I'll queue it up, with your reviewed-by added. Thanks.

-- 
Jens Axboe

