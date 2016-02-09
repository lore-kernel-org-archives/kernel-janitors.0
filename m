From: Mike Snitzer <snitzer@redhat.com>
Date: Tue, 09 Feb 2016 15:08:17 +0000
Subject: Re: dm: check for kmalloc failure in dm_init_request_based_blk_mq_queue()
Message-Id: <20160209150817.GA21685@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160209111440.GB23998@mwanda>
In-Reply-To: <20160209111440.GB23998@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alasdair Kergon <agk@redhat.com>, dm-devel@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Feb 09 2016 at  6:14am -0500,
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We can just return -ENOMEM if the kzalloc() fails.
> 
> Fixes: 41b2facaf4ba ('dm: allocate blk_mq_tag_set rather than embed in mapped_device')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, folded in.
