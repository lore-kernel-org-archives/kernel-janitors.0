From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 26 Dec 2015 20:24:48 +0000
Subject: Re: [PATCH] coccinelle: api: check for propagation of error from platform_get_irq
Message-Id: <alpine.DEB.2.02.1512262123500.2070@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451157891-24881-1-git-send-email-Julia.Lawall@lip6.fr>
 <567EF188.7020203@cogentembedded.com>
 <alpine.DEB.2.02.1512262107340.2070@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1512262107340.2070@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

The conclusion seems to be that it is useful to override the value, so we 
can just drop this semantic patch.

julia
