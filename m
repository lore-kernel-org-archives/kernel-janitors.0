From: Ingo Molnar <mingo@elte.hu>
Date: Mon, 27 Oct 2008 10:57:08 +0000
Subject: Re: [PATCH 00/12] x86: Cleanup idt, gdt/ldt/tss structs
Message-Id: <20081027105708.GB13895@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1224904532-9586-1-git-send-email-ice799@gmail.com> <20081025054018.GU24654@1wt.eu>
In-Reply-To: <20081025054018.GU24654@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Willy Tarreau <w@1wt.eu>
Cc: Joe Damato <ice799@gmail.com>, linux-x86_64@vger.kernel.org, linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


* Willy Tarreau <w@1wt.eu> wrote:

> On Fri, Oct 24, 2008 at 08:15:20PM -0700, Joe Damato wrote:
> > Hi -
> > 
> > This is my first submission to the kernel, so (beware!) please let me know if I can make any improvements on these patches.
> 
> It looks like you provide one patch per file. You should group some 
> of them together so that each patch does a functional change and 
> everything still builds after incrementally applying that patch. The 
> way you have splitted them will break builds if someone tries to 
> build after patch 1 for instance.

yes, at every step the kernel is expected to build and boot fine.

	Ingo
