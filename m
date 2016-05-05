From: Darren Hart <dvhart@infradead.org>
Date: Thu, 05 May 2016 21:01:29 +0000
Subject: Re: [PATCH] intel_telemetry: constify telemetry_core_ops structures
Message-Id: <20160505210129.GC2113@f23x64.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1462133519-17989-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1462133519-17989-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, platform-driver-x86@vger.kernel.org, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org

On Sun, May 01, 2016 at 10:11:59PM +0200, Julia Lawall wrote:
> The telemetry_core_ops structures are never modified, so declare them as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Queued, thank you.

-- 
Darren Hart
Intel Open Source Technology Center
