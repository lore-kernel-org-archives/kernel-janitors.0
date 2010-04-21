From: Rik van Riel <riel@redhat.com>
Date: Wed, 21 Apr 2010 15:24:24 +0000
Subject: Re: [patch] ksm: check for ERR_PTR from follow_page()
Message-Id: <4BCF18A8.8080809@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100421102759.GA29647@bicker>
In-Reply-To: <20100421102759.GA29647@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Izik Eidus <ieidus@redhat.com>, Hugh Dickins <hugh.dickins@tiscali.co.uk>, Andrea Arcangeli <aarcange@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On 04/21/2010 06:27 AM, Dan Carpenter wrote:
> The follow_page() function can potentially return -EFAULT so I added
> checks for this.
>
> Also I silenced an uninitialized variable warning on my version of gcc
> (version 4.3.2).
>
> Signed-off-by: Dan Carpenter<error27@gmail.com>

Acked-by: Rik van Riel <riel@redhat.com>
