From: Alan Cox <alan@linux.intel.com>
Date: Thu, 18 Nov 2010 18:18:14 +0000
Subject: Re: [PATCH 1/4] x86: platform: mrst: check
Message-Id: <20101118181814.290811f0@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290104207-31279-1-git-send-email-segoon@openwall.com>
In-Reply-To: <1290104207-31279-1-git-send-email-segoon@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: kernel-janitors@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Feng Tang <feng.tang@intel.com>, Arjan van de Ven <arjan@linux.intel.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, linux-kernel@vger.kernel.org

>  I cannot compile this driver in next-20101117, so it is not tested
> at all.

Compile or test - if it bombs out compiling for you please send me (off
list the .config that fails so I can fix that

Otherwise NAK the patch because it needs to do the cleanup but thanks
for finding the bug - you've done the hard 99%

Alan
