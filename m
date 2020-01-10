From: Jonathan Corbet <corbet@lwn.net>
Date: Fri, 10 Jan 2020 17:14:03 +0000
Subject: Re: [PATCH] devices.txt: fix spelling mistake: "shapshot" -> "snapshot"
Message-Id: <20200110101403.67edea17@lwn.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200110100427.236530-1-colin.king@canonical.com>
In-Reply-To: <20200110100427.236530-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 10 Jan 2020 10:04:27 +0000
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Fix spelling mistake in text.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  Documentation/admin-guide/devices.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
> index 1c5d2281efc9..2a97aaec8b12 100644
> --- a/Documentation/admin-guide/devices.txt
> +++ b/Documentation/admin-guide/devices.txt
> @@ -319,7 +319,7 @@
>  		182 = /dev/perfctr	Performance-monitoring counters
>  		183 = /dev/hwrng	Generic random number generator
>  		184 = /dev/cpu/microcode CPU microcode update interface
> -		186 = /dev/atomicps	Atomic shapshot of process state data
> +		186 = /dev/atomicps	Atomic snapshot of process state data
>  		187 = /dev/irnet	IrNET device
>  		188 = /dev/smbusbios	SMBus BIOS
>  		189 = /dev/ussp_ctl	User space serial port control

Applied, thanks.

jon
