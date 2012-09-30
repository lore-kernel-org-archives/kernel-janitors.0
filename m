From: Samuel Ortiz <sameo@linux.intel.com>
Date: Sun, 30 Sep 2012 22:55:11 +0000
Subject: Re: nfc_llc_init: undefined reference to `nfc_llc_shdlc_register'
Message-Id: <20120930225511.GC12231@sortiz-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120930073504.GA32353@localhost>
In-Reply-To: <20120930073504.GA32353@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Fengguang,

On Sun, Sep 30, 2012 at 03:35:04PM +0800, Fengguang Wu wrote:
> Hi Samuel,
> 
> FYI, kernel build failed on
> 
> commit f4f20d0650e9cd13f65b5e7f93af126b526af721
> 
>     NFC: Remove unneeded LLC symbols export
> 
> All error/warnings:
> 
> net/built-in.o: In function `nfc_llc_init':
> (.text+0x100058): undefined reference to `nfc_llc_shdlc_register'
This one should be fixed by commit 8a14e8bf386434732eed6678120fe52acee6244a
from wireless-next. Please let me know if that's not the case.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
