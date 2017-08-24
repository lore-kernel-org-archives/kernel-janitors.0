From: Borislav Petkov <bp@alien8.de>
Date: Thu, 24 Aug 2017 21:12:05 +0000
Subject: Re: [PATCH v2] x86/microcode: Silence a static checker warning
Message-Id: <20170824211205.jpvmzzrm72vcb4xf@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170822211335.r7wcfcisdlq2xwgz@pd.tnic>
 <20170824201557.ev4ebslf6sg6xmne@mwanda>
 <20170824204714.jedeaphwmou5qafd@pd.tnic>
 <20170824205510.zy574qloxb4tsokq@mwanda>
 <20170824205844.3wkrq6vb7kv45vnv@pd.tnic>
 <20170824210847.hypvvpzf5pjhppyt@mwanda>
In-Reply-To: <20170824210847.hypvvpzf5pjhppyt@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Aug 25, 2017 at 12:08:47AM +0300, Dan Carpenter wrote:
> Sure.  But the point is the same...  The "p" is an error pointer at the
> end of the function.

Of course, that's why I'm still trying to find a solution. I'm just not
happy with what the ones we have now. I'll think about it more tomorrow,
on a clear head.

Thanks.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
