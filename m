From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Fri, 09 Feb 2018 04:00:33 +0000
Subject: Re: ocxl: fix signed comparison with less than zero
Message-Id: <3zd1Ys6HkGz9sRm@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20180130151144.32544-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Frederic Barrat <fbarrat@linux.vnet.ibm.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2018-01-30 at 15:11:44 UTC, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the comparison of used < 0 is always false because
> uses is a size_t. Fix this by making used a ssize_t type.
> 
> Detected by Coccinelle:
> drivers/misc/ocxl/file.c:320:6-10: WARNING: Unsigned expression
> compared with zero: used < 0
> 
> Fixes: 5ef3166e8a32 ("ocxl: Driver code for 'generic' opencapi devices")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
> Acked-by: Frederic Barrat <fbarrat@linux.vnet.ibm.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/dedab7f0d3137441a97fe7cf9b9ca5

cheers
