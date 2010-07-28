From: Borislav Petkov <borislav.petkov@amd.com>
Date: Wed, 28 Jul 2010 16:48:15 +0000
Subject: Re: [PATCH 04/10] x86: mce: fix error handling
Message-Id: <20100728164815.GG16250@aftab>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280335185-23265-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280335185-23265-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Andi Kleen <ak@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Wed, Jul 28, 2010 at 12:39:44PM -0400

> mcheck_init_device() poorly handles errors. If any request fails
> unregister and free everything.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Acked-by: Borislav Petkov <Borislav.Petkov@amd.com>

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
General Managers: Alberto Bozzo, Andrew Bowd
Registration: Dornach, Gemeinde Aschheim, Landkreis Muenchen
Registergericht Muenchen, HRB Nr. 43632

