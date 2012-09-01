From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Date: Sat, 01 Sep 2012 20:16:46 +0000
Subject: Re: [patch] thinkpad_acpi: buffer overflow in fan_get_status()
Message-Id: <20120901201646.GA5422@khazad-dum.debian.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120901195407.GF20741@mwanda>
In-Reply-To: <20120901195407.GF20741@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Matthew Garrett <mjg@redhat.com>, "open list:THINKPAD ACPI EXT..." <ibm-acpi-devel@lists.sourceforge.net>, "open list:THINKPAD ACPI EXT..." <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, 01 Sep 2012, Dan Carpenter wrote:
> The acpi_evalf() function modifies four bytes of data but in
> fan_get_status() we pass a pointer to u8.  I have modified the
> function to use type checking now.

This makes the function unextensible to return other ACPI object types, but
it can be changed back to void* later if required.

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Thanks for noticing this problem, fortunately it affects only _really_
ancient thinkpads, which are extremely rare.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
