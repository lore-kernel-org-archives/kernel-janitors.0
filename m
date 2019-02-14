From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Feb 2019 07:37:31 +0000
Subject: Re: [PATCH] fs/coda: get rid of CODA_ALLOC()
Message-Id: <20190214073731.GB2304@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190214065848.GB21768@kadam>
 <alpine.DEB.2.21.1902140804170.2466@hadrien>
In-Reply-To: <alpine.DEB.2.21.1902140804170.2466@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, codalist@telemann.coda.cs.cmu.edu, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Feb 14, 2019 at 08:04:43AM +0100, Julia Lawall wrote:
> 
> 
> On Thu, 14 Feb 2019, Dan Carpenter wrote:
> 
> > These days we have kvzalloc() so we can delete CODA_ALLOC().
> 
> Maybe it would be better to get rid fo CODA_FREE as well?

I feel like that's a separate issue.  The CODA_FREE() macro already
uses kvfree() so it doesn't bother me as much as the CODA_ALLOC() macro.

regards,
dan carpenter
