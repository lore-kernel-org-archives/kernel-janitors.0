From: Mathias Nyman <mathias.nyman@linux.intel.com>
Date: Mon, 26 Oct 2020 13:46:20 +0000
Subject: Re: [PATCH] xhci: Fix sizeof() mismatch
Message-Id: <43dc0950-c76e-713d-8d51-cdc3be9c9f46@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201008171151.198996-1-colin.king@canonical.com>
In-Reply-To: <20201008171151.198996-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 8.10.2020 20.11, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> An incorrect sizeof() is being used, sizeof(rhub->ports) is not
> correct, it should be sizeof(*rhub->ports).  This bug did not
> cause any issues because it just so happens the sizes are the same.
> 
> Addresses-Coverity: ("Sizeof not portable (SIZEOF_MISMATCH)")
> Fixes: bcaa9d5c5900 ("xhci: Create new structures to store xhci port information")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Thanks, added

-Mathias
