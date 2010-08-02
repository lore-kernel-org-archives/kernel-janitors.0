From: Vasiliy Kulikov <segooon@gmail.com>
Date: Mon, 02 Aug 2010 12:47:04 +0000
Subject: Re: [PATCH] cris: gpio: do not call
Message-Id: <20100802124704.GA6050@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280410338-21501-1-git-send-email-segooon@gmail.com>
 <20100802113316.GJ9784@axis.com>
In-Reply-To: <20100802113316.GJ9784@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesper Nilsson <Jesper.Nilsson@axis.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Mikael Starvik <mikael.starvik@axis.com>, linux-cris-kernel <linux-cris-kernel@axis.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Aug 02, 2010 at 13:33 +0200, Jesper Nilsson wrote:
> On Thu, Jul 29, 2010 at 03:32:18PM +0200, Kulikov Vasiliy wrote:
> > copy_to_user()/copy_from_user() must not be used with spinlocks held.
> > Move all cases of interaction with userspace out of global switch and
> > lock spinlocks only where they are needed.
> 
> Thanks, but I'm thinking we should move the spinlock inside each case instead,
> as in the below patch.
> Unless there's any protests I'll add it to the cris-tree in the next couple of days:

I'm fine with this.

> 
> CRIS: gpio: don't call copy_to_user()/copy_from_user() while holding spinlocks
> 
> copy_to_user()/copy_from_user() must not be used with spinlocks held.
> Move locks inside each case so we have better control of when the locks
> are held.
> 
> Also, since we use spinlocks, we don't need to hold the BKL, so remove it.
> 
> Reported-by: Kulikov Vasiliy <segooon@gmail.com>
> Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>
...
