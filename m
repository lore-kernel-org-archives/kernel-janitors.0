From: Christoph Hellwig <hch@infradead.org>
Date: Tue, 15 Oct 2019 07:44:26 +0000
Subject: Re: [PATCH] scsi: fix unintended sign extension on left shifts
Message-Id: <20191015074426.GA8715@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191014121613.21999-1-colin.king@canonical.com>
 <0e2a6d4c-b346-cb1b-7941-e247a0d0f8b2@acm.org>
In-Reply-To: <0e2a6d4c-b346-cb1b-7941-e247a0d0f8b2@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bart Van Assche <bvanassche@acm.org>
Cc: Colin King <colin.king@canonical.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Tomohiro Kusumi <kusumi.tomohiro@jp.fujitsu.com>, Kei Tokunaga <tokunaga.keiich@jp.fujitsu.com>, Xiao Guangrong <xiaoguangrong@cn.fujitsu.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Oct 14, 2019 at 08:58:03AM -0700, Bart Van Assche wrote:
> On 10/14/19 5:16 AM, Colin King wrote:
> >   	const char *ret = trace_seq_buffer_ptr(p);
> >   	sector_t lba = 0, txlen = 0;
> > -	lba |= (cdb[2] << 24);
> > +	lba |= ((u64)cdb[2] << 24);
> >   	lba |= (cdb[3] << 16);
> >   	lba |= (cdb[4] << 8);
> >   	lba |=  cdb[5];
> 
> Have you considered to use get/put_unaligned_be*() instead of making the
> above change?

Agreed, that is the only sensible thing to do here.
