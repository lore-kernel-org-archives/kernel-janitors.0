From: Borislav Petkov <bp@alien8.de>
Date: Fri, 25 Aug 2017 11:41:05 +0000
Subject: Re: [PATCH] x86/microcode/intel: Improve microcode patches saving flow
Message-Id: <20170825114105.5bnxbd6tvucrlnwx@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170824204714.jedeaphwmou5qafd@pd.tnic>
 <20170824205510.zy574qloxb4tsokq@mwanda>
 <20170824205844.3wkrq6vb7kv45vnv@pd.tnic>
 <20170824210847.hypvvpzf5pjhppyt@mwanda>
 <20170824211205.jpvmzzrm72vcb4xf@pd.tnic>
 <20170825090626.okc6reqltb5k4hip@pd.tnic>
 <20170825091228.acxl2pizbqe7ijnf@mwanda>
 <20170825091406.zytkd2pb5v6zxzrz@pd.tnic>
 <20170825100456.n236w3jebteokfd6@pd.tnic>
 <599FFEB6.4070707@bfs.de>
In-Reply-To: <599FFEB6.4070707@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: x86-ml <x86@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Aug 25, 2017 at 12:40:54PM +0200, walter harms wrote:
> just a bit nitpicking,
>  i would expect something like that:

Apply the patch and look at the whole function. Then you'll see why.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
