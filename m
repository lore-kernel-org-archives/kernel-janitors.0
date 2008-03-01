From: Andrew Morton <akpm@linux-foundation.org>
Date: Sat, 01 Mar 2008 01:24:06 +0000
Subject: Re: [PATCH 2/9] /drivers/net/8390.c replaced
Message-Id: <20080229172406.ec0f0cd9.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47C66311.7020000@watson.wustl.edu>
In-Reply-To: <47C66311.7020000@watson.wustl.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon Schindler <jkschind@gmail.com>
Cc: linux-kernel@vger.kernel.org, trivial@kernel.org, kernel-janitors@vger.kernel.org

On Thu, 28 Feb 2008 01:30:25 -0600
Jon Schindler <jkschind@gmail.com> wrote:

> Replaced init_module and cleanup_module with static functions and module_init/module_exit.

I get

drivers/net/8390.c: In function '__inittest':
drivers/net/8390.c:60: error: 'ns8390_init_module' undeclared (first use in this function)
drivers/net/8390.c:60: error: (Each undeclared identifier is reported only once
drivers/net/8390.c:60: error: for each function it appears in.)
drivers/net/8390.c: At top level:
drivers/net/8390.c:60: error: 'init_module' aliased to undefined symbol 'ns8390_init_module'


