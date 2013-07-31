From: Vyacheslav Dubeyko <slava@dubeyko.com>
Date: Wed, 31 Jul 2013 10:36:47 +0000
Subject: Re: [PATCH v2] nilfs2: remove double bio_put() in nilfs_end_bio_write() for BIO_EOPNOTSUPP error
Message-Id: <1375267007.2364.7.camel@slavad-ubuntu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1374847154.3671.70.camel@slavad-ubuntu>
	 <20130727.120232.356926182.konishi.ryusuke@lab.ntt.co.jp>
In-Reply-To: <20130727.120232.356926182.konishi.ryusuke@lab.ntt.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
Cc: DanCarpenter <dan.carpenter@oracle.com>, linux-nilfs <linux-nilfs@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, kernel-janitors@vger.kernel.org, akpm@linux-foundation.org, =?ISO-8859-1?Q?J=E9r=F4me?= Poulin <jeromepoulin@gmail.com>

Hi Ryusuke,

On Sat, 2013-07-27 at 12:02 +0900, Ryusuke Konishi wrote:

[snip]
> 
> This decrement looks wrong.
> 
> Otherwise, your change of nilfs_segbuf_submit_bio() is just a
> equivalent transformation and doesn't fix problem, that is, a mismatch
> of the number of calls between complete() and wait_for_completion().
> 
> In your patch, nilfs_end_bio_write() function calls the complete()
> routine as before even if it received an EOPNOTSUPP error.
> 
> In that case, segbuf->sb_nbio must be incremented to call
> wait_for_completion() the right number of times.
> 
> Note that wait_for_completion() is called based on the count of
> segbuf->sb_nbio even if nilfs_segbuf_submit_bio() returns an error.
> This is performed through the following path:
> 
>             nilfs_segbuf_submit_bio
>           nilfs_segbuf_submit_bh
>         nilfs_segbuf_write
>       nilfs_write_logs
>     nilfs_segctor_write
>   nilfs_segctor_do_construct
>     nilfs_segctor_abort_construction
>       nilfs_wait_on_logs
>         nilfs_segbuf_wait
>           wait_for_completion
>             (repeated for the number of times of segbuf->sb_nbio)
> 
> 
> If you think this is a separate problem, then it should be fixed in
> another patch and nilfs_segbuf_submit_bio() should not be touched in
> this patch.
> 

Sorry for delay with working on this patch. Now I am investigating
the issue (Kernel Bug: unable to handle kernel paging request) that it
was reported by Jérôme Poulin <jeromepoulin@gmail.com>. I suspect that
the reported issue is related to this patch. So, I feel a necessity to
investigate the issue more deeply before continuation to work on this
patch.

With the best regards,
Vyacheslav Dubeyko.


