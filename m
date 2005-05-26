From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 26 May 2005 17:58:14 +0000
Subject: Re: [KJ] [PATCH 2.6.11.10] arch/cris: fixes static strings declaration
Message-Id: <200505262200.34471.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050526122502.7aa13915.rnsanchez@terra.com.br>
In-Reply-To: <20050526122502.7aa13915.rnsanchez@terra.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thursday 26 May 2005 21:21, Ricardo Nabinger Sanchez wrote:
> Quoting  Alexey Dobriyan <adobriyan@gmail.com>
> Sent on  Thu, 26 May 2005 20:35:55 +0400
> 
> > What's the difference in .text and .data sizes?
> 
> It's small,

I want to see size(1) output on cross-compiled .o

IIRC the difference depends on gcc version and can even be positive.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
