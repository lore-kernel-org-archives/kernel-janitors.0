From: Stephen Hemminger <shemminger@vyatta.com>
Date: Wed, 30 Jun 2010 20:49:34 +0000
Subject: Re: [PATCH 02/16] trivial: use ARRAY_SIZE
Message-Id: <20100630134934.74f4e269@nehalam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1277726089-24467-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1277726089-24467-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: trivial@kernel.org, Kernel Janitors <kernel-janitors@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Paul Fulghum <paulkf@microgate.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org

On Mon, 28 Jun 2010 15:54:48 +0400
Kulikov Vasiliy <segooon@gmail.com> wrote:

>  	static unsigned short patterns[] >  		{0x0000, 0xffff, 0xaaaa, 0x5555, 0x6969, 0x9696};

Unrelated, but these patterns should be const.
