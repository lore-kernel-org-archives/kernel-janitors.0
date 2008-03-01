From: Jon Schindler <jkschind@gmail.com>
Date: Sat, 01 Mar 2008 02:32:50 +0000
Subject: Re: [PATCH 2/9] /drivers/net/8390.c replaced init_module&cleanup_module
Message-Id: <47C8C052.2040509@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47C66311.7020000@watson.wustl.edu> <20080229172406.ec0f0cd9.akpm@linux-foundation.org>
In-Reply-To: <20080229172406.ec0f0cd9.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, trivial@kernel.org, kernel-janitors@vger.kernel.org

I'm sorry, ns8390_init_module should be ns8390_module_init.  I'll resend it in the next reply.
Andrew Morton wrote:
> On Thu, 28 Feb 2008 01:30:25 -0600
> Jon Schindler <jkschind@gmail.com> wrote:
> 
>> Replaced init_module and cleanup_module with static functions and module_init/module_exit.
> 
> I get
> 
> drivers/net/8390.c: In function '__inittest':
> drivers/net/8390.c:60: error: 'ns8390_init_module' undeclared (first use in this function)
> drivers/net/8390.c:60: error: (Each undeclared identifier is reported only once
> drivers/net/8390.c:60: error: for each function it appears in.)
> drivers/net/8390.c: At top level:
> drivers/net/8390.c:60: error: 'init_module' aliased to undefined symbol 'ns8390_init_module'
> 
> 

