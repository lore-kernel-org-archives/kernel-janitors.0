From: Ben Myers <bpm@sgi.com>
Date: Thu, 12 Sep 2013 14:50:42 +0000
Subject: Re: [patch] xfs: = vs == typo in ASSERT()
Message-Id: <20130912145042.GB1935@sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130911211731.GA10527@elgon.mountain>
In-Reply-To: <20130911211731.GA10527@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: xfs@oss.sgi.com, Alex Elder <elder@kernel.org>, kernel-janitors@vger.kernel.org, Dave Chinner <dchinner@redhat.com>

On Thu, Sep 12, 2013 at 12:17:31AM +0300, Dan Carpenter wrote:
> There is a '=' vs '=' typo so the ASSERT()s are always true.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
