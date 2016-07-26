From: David Miller <davem@davemloft.net>
Date: Tue, 26 Jul 2016 22:26:07 +0000
Subject: Re: [PATCH 5/5] cmd640: add __init attribute
Message-Id: <20160726.152607.1736959777881968300.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1460991338-9845-1-git-send-email-Julia.Lawall@lip6.fr>
	<1460991338-9845-6-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1460991338-9845-6-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org, josh@joshtriplett.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 18 Apr 2016 16:55:38 +0200

> Add __init attribute on a function that is only called from other __init
> functions and that is not inlined, at least with gcc version 4.8.4 on an
> x86 machine with allyesconfig.  Currently, the function is put in the
> .text.unlikely segment.  Declaring it as __init will cause it to be put in
> the .init.text and to disappear after initialization.
> 
> The result of objdump -x on the function before the change is as follows:
> 
> 0000000000000000 l     F .text.unlikely 00000000000000e4 cmd640x_init_one
> 
> And after the change it is as follows:
> 
> 00000000000000d2 l     F .init.text	00000000000000df cmd640x_init_one
> 
> Done with the help of Coccinelle.  The semantic patch checks for local
> static non-init functions that are called from an __init function and are
> not called from any other function.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
