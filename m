From: "H. Peter Anvin" <hpa@zytor.com>
Date: Mon, 28 Mar 2011 19:44:57 +0000
Subject: Re: [PATCH v2] x86: page: get_order() optimization
Message-Id: <4D90E539.7060908@zytor.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1301215556-8898-1-git-send-email-mcsim.planeta@gmail.com>	 <20110327113323.GA27825@elte.hu> <1301246136.2291.49.camel@debian>	 <20110328050844.GC26322@elte.hu> <1301340822.6302.90.camel@debian>
In-Reply-To: <1301340822.6302.90.camel@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maksym Planeta <mcsim.planeta@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>, mingo@redhat.com, kernel-janitors@vger.kernel.org, namhyung@gmail.com, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jan Beulich <JBeulich@novell.com>

On 03/28/2011 12:33 PM, Maksym Planeta wrote:
> 
> Here is disassembly of patched get_order() with "inline" from
> "kernel/kexec.c":
> 
>      a6c:       48 8b 5d c8             mov    -0x38(%rbp),%rbx
>      a70:       e8 0b fd ff ff          callq  780 <get_order.clone.7>
> 
> 0000000000000780 <get_order.clone.7>:
>      780:       55                      push   %rbp
>      781:       b8 01 00 00 00          mov    $0x1,%eax
>      786:       48 89 e5                mov    %rsp,%rbp
>      789:       c9                      leaveq 
>      78a:       c3                      retq   
> 
> My version of gcc is gcc (Debian 4.5.2-4) 4.5.2, probably I should
> upgrade my gcc version for better inline expansions.
> 

With what options?

	-hpa
