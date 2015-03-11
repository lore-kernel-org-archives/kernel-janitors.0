From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Date: Wed, 11 Mar 2015 10:27:32 +0000
Subject: Re: [patch 2/2] thinkpad_acpi: off by one in adaptive_keyboard_hotkey_notify_hotkey()
Message-Id: <1426069652.2792036.238809225.344CD11D@webmail.messagingengine.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150311093607.GB3564@mwanda>
In-Reply-To: <20150311093607.GB3564@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Bastien Nocera <hadess@hadess.net>
Cc: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Mar 11, 2015, at 06:36, Dan Carpenter wrote:
> +               if (scancode < FIRST_ADAPTIVE_KEY ||
> +                   scancode >= FIRST_ADAPTIVE_KEY +
> TPACPI_HOTKEY_MAP_LEN -
> +                               ADAPTIVE_KEY_OFFSET) {

Meh, I'd prefer that last linebreak to not be there, the 80-char rule is
meant to be ignored when it causes the code to be less readable.

That said,

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Thanks for the fix!

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
