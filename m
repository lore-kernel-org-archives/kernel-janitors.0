From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Date: Thu, 14 Jul 2016 02:10:45 +0000
Subject: Re: [patch] kconfig: Add some missing curly braces
Message-Id: <20160714021045.GG6239@wotan.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160713223433.GA20475@mwanda>
In-Reply-To: <20160713223433.GA20475@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, "Luis R. Rodriguez" <mcgrof@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Michal Marek <mmarek@suse.com>

On Thu, Jul 14, 2016 at 01:34:33AM +0300, Dan Carpenter wrote:
> There are missing curly braces here so we print some stuff to stderr
> which we hadn't intended.
> 
> Fixes: 1c199f2878f6 ('kbuild: document recursive dependency limitation / resolution')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Luis R. Rodriguez <mcgrof@kernel.org>

  Luis
