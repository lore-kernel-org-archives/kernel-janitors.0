From: Jan Harkes <jaharkes@cs.cmu.edu>
Date: Thu, 14 Feb 2019 17:10:34 +0000
Subject: Re: [PATCH 2] coda: get rid of CODA_FREE()
Message-Id: <20190214171019.fhvwee2ngiqqb3pi@cs.cmu.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.1902140804170.2466@hadrien>
 <20190214083822.GA28623@kadam>
In-Reply-To: <20190214083822.GA28623@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Thu, Feb 14, 2019 at 11:38:22AM +0300, Dan Carpenter wrote:
> The CODA_FREE() macro just calls kvfree().  We can call that directly
> instead.

Added these to my (getting long) list of things that I really should get
upstreamed sometime soon now.

Jan
