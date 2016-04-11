From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Apr 2016 06:07:46 +0000
Subject: Re: Widespread misuse of GFP_ATOMIC
Message-Id: <20160411060746.GA4298@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160410233205.GA19912@SDF.ORG>
In-Reply-To: <20160410233205.GA19912@SDF.ORG>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

GFP_NOWAIT is when you have a somewhat painless backup plan in case the
allocation fails.  If you're worried that there are too many
GFP_ATOMICs, then it's better to re-arrange the code so the allocation
can sleep.

regards,
dan carpenter

