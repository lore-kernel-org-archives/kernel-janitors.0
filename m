From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Wed, 16 Aug 2017 12:29:55 +0000
Subject: Re: powerpc: store the intended structure
Message-Id: <3xXTFH6cfyz9t5T@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1502630663-18599-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>, kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Sun, 2017-08-13 at 13:24:23 UTC, Julia Lawall wrote:
> Normally the values in the resource field and the argument to ARRAY_SIZE
> in the num_resources are the same.  In this case, the value in the reousrce
> field is the same as the one in the previous platform_device structure, and
> appears to be a copy-paste error.  Replace the value in the resource field
> with the argument to the local call to ARRAY_SIZE.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/36992606eee8016c36ad2576687e97

cheers
