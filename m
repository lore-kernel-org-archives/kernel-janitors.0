From: David Rientjes <rientjes@google.com>
Date: Sun, 05 Sep 2010 22:04:23 +0000
Subject: Re: [PATCH 13/14] mm: mempolicy: Check return code of check_range
Message-Id: <alpine.DEB.2.00.1009051503580.5003@chino.kir.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283711588-7628-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1283711588-7628-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, Lee Schermerhorn <lee.schermerhorn@hp.com>, Christoph Lameter <cl@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org

On Sun, 5 Sep 2010, Kulikov Vasiliy wrote:

> From: Vasiliy Kulikov <segooon@gmail.com>
> 
> Function check_range may return ERR_PTR(...). Check for it.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Acked-by: David Rientjes <rientjes@google.com>
