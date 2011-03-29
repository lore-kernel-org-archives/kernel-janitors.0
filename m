From: Ingo Molnar <mingo@elte.hu>
Date: Tue, 29 Mar 2011 07:27:01 +0000
Subject: Re: [PATCH v2] x86: page: get_order() optimization
Message-Id: <20110329072701.GJ27398@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1301215556-8898-1-git-send-email-mcsim.planeta@gmail.com>
 <4D90E5ED.3080604@zytor.com>
In-Reply-To: <4D90E5ED.3080604@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Maksym Planeta <mcsim.planeta@gmail.com>, mingo@redhat.com, kernel-janitors@vger.kernel.org, namhyung@gmail.com, linux-kernel@vger.kernel.org


* H. Peter Anvin <hpa@zytor.com> wrote:

> On 03/27/2011 01:45 AM, Maksym Planeta wrote:
> > For x86 architecture get_order function can be optimized due to
> > assembler instruction bsr.
> > 
> > This is second version of patch where for constants gcc precompute the
> > result.
> > 
> > Signed-off-by: Maksym Planeta <mcsim.planeta@gmail.com>
> 
> gcc 4.x has an intrinsic, __builtin_clz(), which does the opposite of
> the bsr instruction; specifically:
> 
> 	__builtin_clz(x) ^ 31
> 
> ... generates a bsrl instruction if x is variable.  This tends to
> generate much better code than any assembly hacks.

Indeed, that should work better and should be tried - and it can probably 
propagate the flags result sensibly (which GCC's asm() cannot, unfortunately).

Thanks,

	Ingo
