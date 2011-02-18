From: Borislav Petkov <borislav.petkov@amd.com>
Date: Fri, 18 Feb 2011 09:39:57 +0000
Subject: Re: [patch -next] x86, microcode, AMD: signedness bug in
Message-Id: <20110218093957.GA29723@aftab>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110218091716.GA4384@bicker>
In-Reply-To: <20110218091716.GA4384@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Ingo Molnar <mingo@redhat.com>
Cc: Andreas Herrmann <andreas.herrmann3@amd.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>, "open list:AMD MICROCODE UPD..." <amd64-microcode@amd64.org>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Feb 18, 2011 at 04:17:16AM -0500, Dan Carpenter wrote:
> install_equiv_cpu_table() returns type int.  It uses negative error
> codes so using an unsigned type breaks the error handling.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Yes, my bad, sorry.

Acked-by: Borislav Petkov <borislav.petkov@amd.com>

Ingo, this should go ontop of tip/x86/microcode please, for it fixes
10de52d6655e ("x86, microcode, AMD: Simplify install_equiv_cpu_table").

Thanks a bunch.

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
General Managers: Alberto Bozzo, Andrew Bowd
Registration: Dornach, Gemeinde Aschheim, Landkreis Muenchen
Registergericht Muenchen, HRB Nr. 43632

