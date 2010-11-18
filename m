From: Alan Cox <alan@linux.intel.com>
Date: Thu, 18 Nov 2010 20:19:28 +0000
Subject: Re: [PATCH 1/4] x86: platform: mrst: check
Message-Id: <20101118201928.50e249fb@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290104207-31279-1-git-send-email-segoon@openwall.com>
In-Reply-To: <1290104207-31279-1-git-send-email-segoon@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: kernel-janitors@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Feng Tang <feng.tang@intel.com>, Arjan van de Ven <arjan@linux.intel.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, linux-kernel@vger.kernel.org

On Thu, 18 Nov 2010 21:16:45 +0300
Vasiliy Kulikov <segoon@openwall.com> wrote:

> platform_device_register() may fail, if so propagate the return
> code from mrst_device_create().
> 
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>

Signed-off-by: Alan Cox <alan@linux.intel.com>

On further inspection this fix is actually correct as the other
cleanup got moved to the arch/x86 driver.

Alan
