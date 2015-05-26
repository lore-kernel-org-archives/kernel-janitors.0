From: David Matlack <dmatlack@google.com>
Date: Tue, 26 May 2015 16:59:51 +0000
Subject: Re: [patch] staging: slicoss: restore IRQs correctly after slic_cmdq_reset()
Message-Id: <CALzav=c1=FPjMF0c5evHXOBe0Q2WrVNh2Tb1YR5Qe1oxJpZMrg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150519122524.GA2989@mwanda>
In-Reply-To: <20150519122524.GA2989@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, May 19, 2015 at 5:25 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We can't save two different values in "flags" so it means that IRQs are
> not enabled properly at the end of this function.  This isn't a problem
> in the current code because it's always called with IRQs disabled so we
> don't want to enable them at the end.

Nice find. Thanks for fixing it!

>
> This bug is old but it's thanks to David Matlack's recent cleanups that
> Smatch can detect it.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: David Matlack <dmatlack@google.com>

> ---
> The code prior to David Matlack's change was way worse because everyone
> shared the same IRQ flags.  It's hard to imagine how it worked at all.
>
> diff --git a/drivers/staging/slicoss/slicoss.c b/drivers/staging/slicoss/slicoss.c
> index 5f34ebbf..a609f3e 100644
> --- a/drivers/staging/slicoss/slicoss.c
> +++ b/drivers/staging/slicoss/slicoss.c
> @@ -1392,7 +1392,7 @@ static void slic_cmdq_reset(struct adapter *adapter)
>         unsigned long flags;
>
>         spin_lock_irqsave(&adapter->cmdq_free.lock, flags);
> -       spin_lock_irqsave(&adapter->cmdq_done.lock, flags);
> +       spin_lock(&adapter->cmdq_done.lock);
>         outstanding = adapter->cmdq_all.count - adapter->cmdq_done.count;
>         outstanding -= adapter->cmdq_free.count;
>         hcmd = adapter->cmdq_all.head;
> @@ -1423,7 +1423,7 @@ static void slic_cmdq_reset(struct adapter *adapter)
>                         "free_count %d != all count %d\n",
>                         adapter->cmdq_free.count, adapter->cmdq_all.count);
>         }
> -       spin_unlock_irqrestore(&adapter->cmdq_done.lock, flags);
> +       spin_unlock(&adapter->cmdq_done.lock);
>         spin_unlock_irqrestore(&adapter->cmdq_free.lock, flags);
>  }
>
