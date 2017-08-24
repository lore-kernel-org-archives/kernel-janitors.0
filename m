From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Aug 2017 21:08:47 +0000
Subject: Re: [PATCH v2] x86/microcode: Silence a static checker warning
Message-Id: <20170824210847.hypvvpzf5pjhppyt@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170822211335.r7wcfcisdlq2xwgz@pd.tnic>
 <20170824201557.ev4ebslf6sg6xmne@mwanda>
 <20170824204714.jedeaphwmou5qafd@pd.tnic>
 <20170824205510.zy574qloxb4tsokq@mwanda>
 <20170824205844.3wkrq6vb7kv45vnv@pd.tnic>
In-Reply-To: <20170824205844.3wkrq6vb7kv45vnv@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 24, 2017 at 10:58:44PM +0200, Borislav Petkov wrote:
> On Thu, Aug 24, 2017 at 11:55:10PM +0300, Dan Carpenter wrote:
> > This is just cleanups and doesn't change the behavior.
> 
> You can't return from in the middle of the loop just because the
> allocation fails.
> 

I understand that.

> > The static checker is still going to complain about the error pointer
> > from the loop.
> 
> Please drop this argument about the static checker which you write. I'm
> certainly not changing code just because some tool complains.

Sure.  But the point is the same...  The "p" is an error pointer at the
end of the function.

> 
> > Perhaps we should only set prev_found if the memdup_patch()
> > inside the loop succeeds?
> 
> This not why we set prev_found.

Sure.

regards,
dan carpenter

