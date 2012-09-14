From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 14 Sep 2012 23:52:54 +0000
Subject: [cifs:for-next 50/66] fs/cifs/file.c:2576:10: warning: 'page' may be used uninitialized in this func
Message-Id: <20120914235254.GA32569@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Jeff,

FYI, there are new compile warnings show up in

tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
head:   c246704dfe86f2c1875b59a8d60ca69c1f48acb4
commit: d8b9dff6bde7ef0dd13a52e0cdfa998a3545c07f [50/66] cifs: turn the pages list in cifs_readdata into an array

All error/warnings:

fs/cifs/file.c: In function 'cifs_uncached_readv_complete':
fs/cifs/file.c:2576:10: warning: 'page' may be used uninitialized in this function [-Wuninitialized]

vim +2576 fs/cifs/file.c
  2566	{
  2567		struct cifs_readdata *rdata = container_of(work,
  2568							struct cifs_readdata, work);
  2569		unsigned int i;
  2570	
  2571		/* if the result is non-zero then the pages weren't kmapped */
  2572		if (rdata->result = 0) {
  2573			struct page *page;
  2574	
  2575			for (i = 0; i < rdata->nr_pages; i++)
> 2576				kunmap(page);
  2577		}
  2578	
  2579		complete(&rdata->done);
  2580		kref_put(&rdata->refcount, cifs_uncached_readdata_release);
  2581	}
  2582	
  2583	static int
  2584	cifs_uncached_read_marshal_iov(struct cifs_readdata *rdata,
  2585					unsigned int remaining)
  2586	{

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
