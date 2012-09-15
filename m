From: Jeff Layton <jlayton@redhat.com>
Date: Sat, 15 Sep 2012 23:29:45 +0000
Subject: Re: [cifs:for-next 50/66] fs/cifs/file.c:2576:10: warning: 'page' may be used uninitialized in this
Message-Id: <20120915192945.687e774a@corrin.poochiereds.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120914235254.GA32569@localhost>
In-Reply-To: <20120914235254.GA32569@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 15 Sep 2012 07:52:54 +0800
Fengguang Wu <fengguang.wu@intel.com> wrote:

> Hi Jeff,
> 
> FYI, there are new compile warnings show up in
> 
> tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
> head:   c246704dfe86f2c1875b59a8d60ca69c1f48acb4
> commit: d8b9dff6bde7ef0dd13a52e0cdfa998a3545c07f [50/66] cifs: turn the pages list in cifs_readdata into an array
> 
> All error/warnings:
> 
> fs/cifs/file.c: In function 'cifs_uncached_readv_complete':
> fs/cifs/file.c:2576:10: warning: 'page' may be used uninitialized in this function [-Wuninitialized]
> 
> vim +2576 fs/cifs/file.c
>   2566	{
>   2567		struct cifs_readdata *rdata = container_of(work,
>   2568							struct cifs_readdata, work);
>   2569		unsigned int i;
>   2570	
>   2571		/* if the result is non-zero then the pages weren't kmapped */
>   2572		if (rdata->result = 0) {
>   2573			struct page *page;
>   2574	
>   2575			for (i = 0; i < rdata->nr_pages; i++)
> > 2576				kunmap(page);
>   2577		}
>   2578	
>   2579		complete(&rdata->done);
>   2580		kref_put(&rdata->refcount, cifs_uncached_readdata_release);
>   2581	}
>   2582	
>   2583	static int
>   2584	cifs_uncached_read_marshal_iov(struct cifs_readdata *rdata,
>   2585					unsigned int remaining)
>   2586	{
> 

Thanks Wu, good catch...

A stupid error on my part. The main reason I didn't catch it was that
the next patch in that series removes that code altogether. I'll respin
that patch to fix it though so we don't break bisectability.

Thanks!
-- 
Jeff Layton <jlayton@redhat.com>
