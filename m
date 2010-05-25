From: Alan Cox <alan@linux.intel.com>
Date: Tue, 25 May 2010 12:42:58 +0000
Subject: Re: [patch] TTY/n_gsm: potential double lock
Message-Id: <20100525134258.568a600f@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100525093717.GC22515@bicker>
In-Reply-To: <20100525093717.GC22515@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 25 May 2010 11:37:17 +0200
Dan Carpenter <error27@gmail.com> wrote:

> In gsm_dlci_data_kick() we call gsm_dlci_data_sweep() with the
> "gsm->tx_lock" held so we can't lock it again inside
> gsm_dlci_data_sweep().  I removed that lock from and added one to 
> gsmld_write_wakeup() instead.  The sweep function is only called from
> those two places.

Well spotted - I'm surprised that escaped as I've been using the code a
fair bit in that exact form. Not immediately obvious that the case
should be that hard to trigger.

> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Alan Cox <alan@linux.intel.com>

