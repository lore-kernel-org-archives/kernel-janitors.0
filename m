From: Matt Fleming <matt.fleming@intel.com>
Date: Fri, 16 Mar 2012 15:20:04 +0000
Subject: Re: [patch v2] x86, efi: fix pointer math issue in handle_ramdisks()
Message-Id: <1331911204.4041.13.camel@mfleming-mobl1.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120305180614.GA26880@elgon.mountain>
In-Reply-To: <20120305180614.GA26880@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Maarten Lankhorst <m.b.lankhorst@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2012-03-05 at 21:06 +0300, Dan Carpenter wrote:
> "filename" is a efi_char16_t string so this check for reaching the end
> of the array doesn't work.  We need to cast the pointer to (u8 *) before
> doing the math.
> 
> This patch changes the "filename" to "filename_16" to avoid confusion in
> the future.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Rename "filename" to "filename_16"
>     Also changed cast from (char *) to (u8 *) because it's not a C
>     character string.  Ingo suggested (void *) but that's a GCCism
>     I think.

Looks good to me. Is someone going to pick this up?

