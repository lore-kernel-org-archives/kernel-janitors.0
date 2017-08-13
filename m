From: Joe Perches <joe@perches.com>
Date: Sun, 13 Aug 2017 14:37:43 +0000
Subject: Re: [PATCH] powerpc: store the intended structure
Message-Id: <1502635063.8295.1.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502630663-18599-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502630663-18599-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Sun, 2017-08-13 at 15:24 +0200, Julia Lawall wrote:
> Normally the values in the resource field and the argument to ARRAY_SIZE
> in the num_resources are the same.  In this case, the value in the reousrce
> field is the same as the one in the previous platform_device structure, and
> appears to be a copy-paste error.  Replace the value in the resource field
> with the argument to the local call to ARRAY_SIZE.

found by a script or eyeballs?

