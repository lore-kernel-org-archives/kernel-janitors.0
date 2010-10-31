From: Ralf Baechle <ralf@linux-mips.org>
Date: Sun, 31 Oct 2010 18:00:06 +0000
Subject: Re: [PATCH 1/3] net: ax25: fix information leak to userland
Message-Id: <20101031180005.GA26588@linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288545022-16393-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1288545022-16393-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Joerg Reuter <jreuter@yaina.de>, "David S. Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Oct 31, 2010 at 08:10:22PM +0300, Vasiliy Kulikov wrote:

> Sometimes ax25_getname() doesn't initialize all members of fsa_digipeater
> field of fsa struct.  This structure is then copied to userland.  It leads to
> leaking of contents of kernel stack memory.  We have to initialize them to zero.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Acked-by: Ralf Baechle <ralf@linux-mips.org>

  Ralf
