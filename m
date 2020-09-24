From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Sep 2020 13:47:09 +0000
Subject: Re: [PATCH] mm/hmm/test: use after free in dmirror_allocate_chunk()
Message-Id: <20200924134709.GK4282@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200922081234.GA1274646@mwanda>
 <c25729e4-8a53-07e3-ae98-d77919f3ac21@nvidia.com>
In-Reply-To: <c25729e4-8a53-07e3-ae98-d77919f3ac21@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Wei Yongjun <weiyongjun1@huawei.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Sep 22, 2020 at 10:31:01AM -0700, Ralph Campbell wrote:
> > @@ -471,30 +487,16 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
> >   				sizeof(new_chunks[0]) * new_capacity,
> >   				GFP_KERNEL);
> >   		if (!new_chunks)
> 
> Need to call mutex_unlock(&mdevice->devmem_lock).
> In fact, why not make this goto err_unlock and add
> err_unlock: mutex_unlock() before the err_release:.

Ugh...  Thanks for catching that.

regards,
dan carpenter
