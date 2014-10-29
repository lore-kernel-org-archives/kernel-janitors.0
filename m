From: Tejun Heo <tj@kernel.org>
Date: Wed, 29 Oct 2014 14:35:23 +0000
Subject: Re: [patch] percpu: off by one in BUG_ON()
Message-Id: <20141029143523.GB25226@htj.dyndns.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141029084504.GD8939@mwanda>
In-Reply-To: <20141029084504.GD8939@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On Wed, Oct 29, 2014 at 11:45:04AM +0300, Dan Carpenter wrote:
> The unit_map[] array has "nr_cpu_ids" number of elements.  It's
> allocated a few lines earlier in the function.  So this test should be
> >= instead of >.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to percpu/for-3.19.

Thanks.

-- 
tejun
