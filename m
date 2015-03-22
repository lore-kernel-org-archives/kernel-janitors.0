From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Date: Sun, 22 Mar 2015 19:01:09 +0000
Subject: Re: [ibm-acpi-devel] [patch 2/2] thinkpad_acpi: off by one in adaptive_keyboard_hotkey_notify_hotkey
Message-Id: <1427050869.3946795.243708250.7D9CBED0@webmail.messagingengine.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150311093607.GB3564@mwanda>
In-Reply-To: <20150311093607.GB3564@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Bastien Nocera <hadess@hadess.net>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net

On Wed, Mar 11, 2015, at 06:36, Dan Carpenter wrote:
> This should be >= instead of > because otherwise we read one element
> past the end of the hotkey_keycode_map[] array.
> 
> The hotkey_keycode_map[] array has TPACPI_HOTKEY_MAP_LEN elements.
> 
> Fixes: 6a68d8557084 ('thinkpad_acpi: Add support for more adaptive kbd
> buttons')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>


-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
