From: Andrea Arcangeli <aarcange@redhat.com>
Date: Wed, 21 Apr 2010 17:46:15 +0000
Subject: Re: [patch] ksm: check for ERR_PTR from follow_page()
Message-Id: <20100421174615.GO32034@random.random>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100421102759.GA29647@bicker>
 <4BCF18A8.8080809@redhat.com>
In-Reply-To: <4BCF18A8.8080809@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@redhat.com>
Cc: Dan Carpenter <error27@gmail.com>, Izik Eidus <ieidus@redhat.com>, Hugh Dickins <hugh.dickins@tiscali.co.uk>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Wed, Apr 21, 2010 at 11:24:24AM -0400, Rik van Riel wrote:
> On 04/21/2010 06:27 AM, Dan Carpenter wrote:
> > The follow_page() function can potentially return -EFAULT so I added
> > checks for this.
> >
> > Also I silenced an uninitialized variable warning on my version of gcc
> > (version 4.3.2).
> >
> > Signed-off-by: Dan Carpenter<error27@gmail.com>
> 
> Acked-by: Rik van Riel <riel@redhat.com>

  	    	while (!(page = follow_page(vma, start, foll_flags)))
  	    	{

gup only checks for null, so when exactly is follow_page going to
return -EFAULT? It's not immediately clear.
