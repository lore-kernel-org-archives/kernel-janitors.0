From: William Kucharski <william.kucharski@oracle.com>
Date: Thu, 01 Nov 2018 08:28:55 +0000
Subject: Re: [PATCH] mm/gup_benchmark: prevent integer overflow in ioctl
Message-Id: <E7641C0F-C619-4054-BD14-685E8D448F49@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181025061546.hnhkv33diogf2uis@kili.mountain>
 <CF4F3932-68A1-4D92-9E4F-6DCD3A3A0447@oracle.com>
 <20181101071613.7x3smxwz5wo57n2m@mwanda>
In-Reply-To: <20181101071613.7x3smxwz5wo57n2m@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Keith Busch <keith.busch@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Kees Cook <keescook@chromium.org>, YueHaibing <yuehaibing@huawei.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org



> On Nov 1, 2018, at 1:16 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> My patch lets people allocate 4MB.  (U32_MAX / 4096 * sizeof(void *)).
> Surely, that's enough?  I liked my check because it avoids the divide so
> it's faster and it is a no-op on 64bit systems.

It should be enough, and you're right, it does avoid extra math.

However, in that case I'd like to see a comment added so that anyone looking
at the code in the future knows why you limited the allocation to ULONG_MAX
bytes.

Thanks,
    William Kucharski
