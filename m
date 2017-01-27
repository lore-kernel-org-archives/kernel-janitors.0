From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Fri, 27 Jan 2017 00:40:36 +0000
Subject: Re: powerpc/mm: Return directly after a failed __copy_from_user() in sys_subpage_prot()
Message-Id: <3v8g1c1qNZz9tT8@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <5f910c33-c811-2197-0adb-c55f7722c5a7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sat, 2017-01-21 at 15:24:58 UTC, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 21 Jan 2017 16:10:50 +0100
> 
> * Return directly after a call of the function "__copy_from_user"
>   failed here.
> 
>   This issue was detected by using the Coccinelle software.
> 
> * Delete the jump label "out2" which became unnecessary with
>   this refactoring.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/a967f161abc7c4a6936ceb15737f75

cheers
