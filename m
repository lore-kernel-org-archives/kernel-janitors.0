From: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Thu, 10 Sep 2020 16:42:20 +0000
Subject: Re: [PATCH] thunderbolt: debugfs: Fix uninitialized return in counters_write()
Message-Id: <20200910164220.GW2495@lahna.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200910100805.GB79916@mwanda>
In-Reply-To: <20200910100805.GB79916@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, Gil Fine <gil.fine@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Sep 10, 2020 at 01:08:05PM +0300, Dan Carpenter wrote:
> If the first line is in an invalid format then the "ret" value is
> uninitialized.  We should return -EINVAL instead.
> 
> Fixes: 54e418106c76 ("thunderbolt: Add debugfs interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!
