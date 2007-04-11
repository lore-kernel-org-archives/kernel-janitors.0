From: Alan Cox <alan@redhat.com>
Date: Wed, 11 Apr 2007 15:38:57 +0000
Subject: Re: [KJ] [PATCH] SPIN_LOCK_UNLOCKED cleanup in
Message-Id: <20070411153857.GA19968@devserv.devel.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070411152846.GA11449@arun.site>
In-Reply-To: <20070411152846.GA11449@arun.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Milind Arun Choudhary <milindchoudhary@gmail.com>
Cc: kernel-janitors@lists.osdl.org, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, alan@redhat.com

On Wed, Apr 11, 2007 at 08:58:46PM +0530, Milind Arun Choudhary wrote:
> remove SPIN_LOCK_UNLOCKED, use DEFINE_SPINLOCK instead
> 
> Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>

Acked-by: Alan Cox <alan@redhat.com>
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
