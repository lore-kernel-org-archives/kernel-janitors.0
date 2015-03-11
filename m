From: Bastien Nocera <hadess@hadess.net>
Date: Wed, 11 Mar 2015 10:07:51 +0000
Subject: Re: [patch 1/2] thinkpad_acpi: signedness bugs getting current_mode
Message-Id: <1426068471.17946.8.camel@hadess.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150311093450.GA3564@mwanda>
In-Reply-To: <20150311093450.GA3564@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2015-03-11 at 12:34 +0300, Dan Carpenter wrote:
> This needs to be signed for the error handling to work.  Valid modes 
> are small positive integers.
> 
> Fixes: b790ceeb0fd9 ('thinkpad_acpi: Add adaptive_kbd_mode sysfs 
> attr') Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-By: Bastien Nocera <hadess@hadess.net>
