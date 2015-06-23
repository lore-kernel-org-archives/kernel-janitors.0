From: Joe Perches <joe@perches.com>
Date: Tue, 23 Jun 2015 22:11:23 +0000
Subject: Re: [PATCH 01/12] staging: lustre: fid: Use !x to check for kzalloc failure
Message-Id: <1435097483.2504.10.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr>
	 <1434819550-3193-2-git-send-email-Julia.Lawall@lip6.fr>
	 <D1AECA61.F8DE5%andreas.dilger@intel.com> <20150623092303.GN28762@mwanda>
In-Reply-To: <20150623092303.GN28762@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Dilger, Andreas" <andreas.dilger@intel.com>, Julia Lawall <Julia.Lawall@lip6.fr>, "Drokin, Oleg" <oleg.drokin@intel.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "lustre-devel@lists.lustre.org" <lustre-devel@lists.lustre.org>

On Tue, 2015-06-23 at 12:23 +0300, Dan Carpenter wrote:
> people decided that
> Yoda code was a good idea based on their gut instead of using statistics
> and measurements and science.

I think that style exists because compilers
disallow CONST = val assignment typos.


