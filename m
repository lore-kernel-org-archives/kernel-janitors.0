From: Ralph Campbell <rcampbell@nvidia.com>
Date: Sun, 11 Oct 2020 20:58:14 +0000
Subject: Re: [PATCH] mm/hmm/test: Fix an error code in dmirror_allocate_chunk()
Message-Id: <e9a5c5cc-b301-54f0-2200-117a82ae420a@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201010200812.GA1886610@mwanda>
In-Reply-To: <20201010200812.GA1886610@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jason Gunthorpe <jgg@ziepe.ca>, Dan Williams <dan.j.williams@intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org


On 10/10/20 1:08 PM, Dan Carpenter wrote:
> This is supposed to return false on failure, not a negative error code.
> 
> Fixes: 170e38548b81 ("mm/hmm/test: use after free in dmirror_allocate_chunk()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I messed this up earlier...  My devel version of Smatch prints too much
> garbage so I missed the warning when I first wrote the patch.  :/
> Sorry.
> 
>   lib/test_hmm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index e151a7f10519..80a78877bd93 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -461,7 +461,7 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
>   
>   	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
>   	if (!devmem)
> -		return -ENOMEM;
> +		return false;
>   
>   	res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
>   				      "hmm_dmirror");

Thanks for fixing this.
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
