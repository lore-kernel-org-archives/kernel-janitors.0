From: Willy Tarreau <w@1wt.eu>
Date: Sat, 25 Oct 2008 05:40:19 +0000
Subject: Re: [PATCH 00/12] x86: Cleanup idt, gdt/ldt/tss structs
Message-Id: <20081025054018.GU24654@1wt.eu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1224904532-9586-1-git-send-email-ice799@gmail.com>
In-Reply-To: <1224904532-9586-1-git-send-email-ice799@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Damato <ice799@gmail.com>
Cc: linux-x86_64@vger.kernel.org, linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Oct 24, 2008 at 08:15:20PM -0700, Joe Damato wrote:
> Hi -
> 
> This is my first submission to the kernel, so (beware!) please let me know if I can make any improvements on these patches.

It looks like you provide one patch per file. You should group some of them
together so that each patch does a functional change and everything still
builds after incrementally applying that patch. The way you have splitted
them will break builds if someone tries to build after patch 1 for instance.

Willy

