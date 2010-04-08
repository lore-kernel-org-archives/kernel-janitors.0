From: David Miller <davem@davemloft.net>
Date: Thu, 08 Apr 2010 04:50:16 +0000
Subject: Re: [patch] stmmac: use resource_size()
Message-Id: <20100407.215016.101138529.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100407093546.GF5157@bicker>
In-Reply-To: <20100407093546.GF5157@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: peppe.cavallaro@st.com, joe@perches.com, tj@kernel.org, cl@linux-foundation.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Wed, 7 Apr 2010 12:35:46 +0300

> Resource size should be calculated as end - start + 1 because we start
> counting at zero.  I changed the code to resource_size() to do the 
> calculation.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks Dan.
