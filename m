From: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Date: Thu, 28 Oct 2010 23:39:17 +0000
Subject: Re: [patch] memcg: null dereference on allocation failure
Message-Id: <20101029083917.610f9b0b.kamezawa.hiroyu@jp.fujitsu.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101028111241.GC6062@bicker>
In-Reply-To: <20101028111241.GC6062@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Balbir Singh <balbir@linux.vnet.ibm.com>, Daisuke Nishimura <nishimura@mxp.nes.nec.co.jp>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 28 Oct 2010 13:12:41 +0200
Dan Carpenter <error27@gmail.com> wrote:

> The original code had a null dereference if alloc_percpu() failed.
> This was introduced in 711d3d2c9bc3 "memcg: cpu hotplug aware percpu
> count updates"
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>


Ah, my fault. Thank you for catching.

Acked-by: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>

