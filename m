From: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Wed, 01 Jul 2020 10:50:55 +0000
Subject: Re: [PATCH][next] thunderbolt: ensure left shift of 512 does not overflow a 32 bit int
Message-Id: <20200701105055.GQ5180@lahna.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200630145558.516961-1-colin.king@canonical.com>
In-Reply-To: <20200630145558.516961-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jun 30, 2020 at 03:55:58PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The 32 bit int value 512 is being left shifted and then used in a context
> that expects the expression to be a larger unsigned long. There may be
> a potential integer overflow, so make 512 a UL before shift to avoid
> any such issues.
> 
> Addresses-Coverity: ("Uninintentional integer overflow")
> Fixes: 3b1d8d577ca8 ("thunderbolt: Implement USB3 bandwidth negotiation routines")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks!
