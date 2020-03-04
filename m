From: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Wed, 04 Mar 2020 09:38:29 +0000
Subject: Re: [PATCH] thunderbolt: Fix error code in tb_port_is_width_supported()
Message-Id: <20200304093829.GJ2540@lahna.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200303101716.uf6l62oavfqmf6hm@kili.mountain>
In-Reply-To: <20200303101716.uf6l62oavfqmf6hm@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Mar 03, 2020 at 01:17:16PM +0300, Dan Carpenter wrote:
> This function is type bool, and it's supposed to return true on success. 
> Unfortunately, this path takes negative error codes and casts them to
> bool (true) so it's treated as success instead of failure.
> 
> Fixes: 91c0c12080d0 ("thunderbolt: Add support for lane bonding")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to fixes, thanks!
