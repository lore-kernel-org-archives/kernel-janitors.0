From: Andreas Gruenbacher <agruen@suse.de>
Date: Mon, 19 Jul 2010 18:40:08 +0000
Subject: Re: [PATCH] fix return value for mb_cache_shrink_fn when nr_to_scan > 0
Message-Id: <201007192040.09062.agruen@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4C425273.5000702@gmail.com> <20100718060106.GA579@infradead.org> <4C42A10B.2080904@gmail.com>
In-Reply-To: <4C42A10B.2080904@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wang Sheng-Hui <crosslonelyover@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Eric Sandeen <sandeen@redhat.com>, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, linux-mm@kvack.org, linux-ext4 <linux-ext4@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, a.gruenbacher@computer.org

On Sunday 18 July 2010 08:36:59 Wang Sheng-Hui wrote:
> 于 2010-7-18 14:01, Christoph Hellwig 写道:
> > This should be using list_for_each_entry.

It would make sense to change this throughout the whole file.

Thanks,
Andreas
