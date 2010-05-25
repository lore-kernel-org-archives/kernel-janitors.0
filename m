From: David Rientjes <rientjes@google.com>
Date: Tue, 25 May 2010 23:08:55 +0000
Subject: Re: [patch] mempolicy: ERR_PTR dereference in
Message-Id: <alpine.DEB.2.00.1005251608440.10919@chino.kir.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100525215401.GA2506@bicker>
In-Reply-To: <20100525215401.GA2506@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Lee Schermerhorn <lee.schermerhorn@hp.com>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, Christoph Lameter <cl@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On Tue, 25 May 2010, Dan Carpenter wrote:

> The original code called mpol_put(new) while "new" was an ERR_PTR.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: David Rientjes <rientjes@google.com>
