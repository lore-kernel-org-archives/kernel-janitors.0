From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sat, 07 Jul 2018 15:32:55 +0000
Subject: Re: [PATCH] mei: bus: type promotion bug in mei_nfc_if_version()
Message-Id: <20180707153255.GA29925@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704093449.vryluk7khaudstgp@kili.mountain>
In-Reply-To: <20180704093449.vryluk7khaudstgp@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tomas Winkler <tomas.winkler@intel.com>, Alexander Usyskin <alexander.usyskin@intel.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jul 04, 2018 at 12:34:49PM +0300, Dan Carpenter wrote:
> We accidentally removed the check for negative returns without
> considering the issue of type promotion.  The "if_version_length"
> variable is type size_t so if __mei_cl_recv() returns a negative then
> "bytes_recv" is type promoted to a high positive value and treated as
> success.
> 
> Fixes: 582ab27a063a ("mei: bus: fix received data size check in NFC fixup")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Didn't apply to my tree at all :(
