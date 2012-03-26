From: Michal Marek <mmarek@suse.cz>
Date: Mon, 26 Mar 2012 20:51:10 +0000
Subject: Re: [PATCH] scripts/coccinelle/api/simple_open.cocci: semantic patch for simple_open()
Message-Id: <4F70D6BE.6000202@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331657917-4552-1-git-send-email-Julia.Lawall@lip6.fr> <20120326204407.GC10259@sepie.suse.cz> <20120326134821.fb74a5b4.akpm@linux-foundation.org>
In-Reply-To: <20120326134821.fb74a5b4.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, sboyd@codeaurora.org, kernel-janitors@vger.kernel.org, gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org

Dne 26.3.2012 22:48, Andrew Morton napsal(a):
> On Mon, 26 Mar 2012 22:44:07 +0200
> Michal Marek <mmarek@suse.cz> wrote:
> 
>> On Tue, Mar 13, 2012 at 05:58:37PM +0100, Julia Lawall wrote:
>>> From: Julia Lawall <Julia.Lawall@lip6.fr>
>>>
>>> Find instances of an open-coded simple_open() and replace them
>>> with calls to simple_open().
>>>
>>> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>>> Reported-by: Stephen Boyd <sboyd@codeaurora.org>
>>
>> Thanks, applied to kbuild.git#misc now.
>>
> 
> That's a bit premature, as simple_open() isn't upstream yet.

Oops, sorry. I haven't pushed the branch yet, so I will remove the patch
again.

Michal
