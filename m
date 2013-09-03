From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Date: Tue, 03 Sep 2013 15:58:57 +0000
Subject: Re: [v4:No,Change] xHCI:Fixing xhci_readl definition and function call
Message-Id: <20130903155857.GA2657@xanatos>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5223383f.hCMXrpqEq1AlVw9b%wangshilong1991@gmail.com>
In-Reply-To: <5223383f.hCMXrpqEq1AlVw9b%wangshilong1991@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wang Shilong <wangshilong1991@gmail.com>
Cc: kumargauravgupta3@gmail.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Sep 01, 2013 at 08:51:11PM +0800, Wang Shilong wrote:
> Hello, Using checkpatch.pl, i get the following warnings(errors):
> WARNING: Avoid CamelCase: <port_array[wIndex]>
> #272: FILE: drivers/usb/host/xhci-hub.c:725:
> +		temp = xhci_readl(port_array[wIndex]);
> 
> total: 0 errors, 1 warnings, 826 lines checked
> 
> patch has style problems, please review.
> 
> If any of these errors are false positives, please report
> them to the maintainer, see CHECKPATCH in MAINTAINERS.

Ignore this warning.  The variable is called wIndex because it
corresponds to a field in a USB control transfer, and that's what it's
called in the spec.  In this case, wIndex is the index into the hub's
port array, so it's perfectly valid to use it as an array index here.

In general, if checkpatch.pl complains about a variable a patch
introduces that's CamelCase, you should pay attention to it.  If it's a
variable that already present in USB code, it's probably used to match
the spec.

Sarah Sharp
