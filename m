From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Date: Sun, 22 Mar 2015 18:58:15 +0000
Subject: Re: [ibm-acpi-devel] [patch 1/2] thinkpad_acpi: signedness bugs getting current_mode
Message-Id: <1427050695.3946436.243707926.7D5B2C74@webmail.messagingengine.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150311093450.GA3564@mwanda>
In-Reply-To: <20150311093450.GA3564@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Bastien Nocera <hadess@hadess.net>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net

On Wed, Mar 11, 2015, at 06:34, Dan Carpenter wrote:
> This needs to be signed for the error handling to work.  Valid modes are
> small positive integers.
> 
> Fixes: b790ceeb0fd9 ('thinkpad_acpi: Add adaptive_kbd_mode sysfs attr')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
