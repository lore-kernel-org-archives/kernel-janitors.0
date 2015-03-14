From: Darren Hart <dvhart@infradead.org>
Date: Sat, 14 Mar 2015 19:03:06 +0000
Subject: Re: [patch 1/2] thinkpad_acpi: signedness bugs getting current_mode
Message-Id: <20150314190306.GE16816@fury.dvhart.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150311093450.GA3564@mwanda>
In-Reply-To: <20150311093450.GA3564@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Bastien Nocera <hadess@hadess.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Mar 11, 2015 at 12:34:50PM +0300, Dan Carpenter wrote:
> This needs to be signed for the error handling to work.  Valid modes are
> small positive integers.
> 
> Fixes: b790ceeb0fd9 ('thinkpad_acpi: Add adaptive_kbd_mode sysfs attr')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Queued, thanks Dan!

-- 
Darren Hart
Intel Open Source Technology Center
