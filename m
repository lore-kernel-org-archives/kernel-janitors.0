From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Tue, 12 May 2020 20:00:01 +0000
Subject: Re: [PATCH] mm/hmm/test: Fix some copy_to_user() error handling
Message-Id: <20200512200001.GC9154@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200511183704.GA225608@mwanda>
In-Reply-To: <20200511183704.GA225608@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On Mon, May 11, 2020 at 09:37:04PM +0300, Dan Carpenter wrote:
> The copy_to_user() function returns the number of bytes which weren't
> copied but we want to return negative error codes.  Also in dmirror_write()
> if the copy_from_user() fails then there is some cleanup needed before
> we can return so I fixed that as well.
> 
> Fixes: 5d5e54be8a1e3 ("mm/hmm/test: add selftest driver for HMM")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  lib/test_hmm.c | 41 +++++++++++++++++++++++++----------------
>  1 file changed, 25 insertions(+), 16 deletions(-)

Thank you, I squashed this into the original commit.

Jason
