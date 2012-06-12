From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Tue, 12 Jun 2012 17:52:44 +0000
Subject: [Q] Cleaning string whitespace trimming. Does it make any sense?
Message-Id: <CALF0-+V15wjFhZH5P1C+4sJ9QSw7QY5Rk383S4XhVVCBsnXUQw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

If you grep "isspace" through the code you will find lots of places
using, most of them
for removing leading and/or whitespace from a string.

Examples:

* sound/usb/card.c -> has a function of its own
http://tomoyo.sourceforge.jp/cgi-bin/lxr/ident?i=remove_trailing_spaces
* sound/pci/hda/hda_hwdep.c -> also! has a function of its own
http://tomoyo.sourceforge.jp/cgi-bin/lxr/ident?i=remove_trail_spaces
* drivers/char/ipmi/ipmi_si_intf.c -> embeds a custom algorithm ->
http://tomoyo.sourceforge.jp/cgi-bin/lxr/source/drivers/char/ipmi/ipmi_si_intf.c#L1690

As we have a special function for this (or could create in case there
isn't one already)
I wonder if it makes any sense to do some patches for this, since it
won't fix anything
and it's just to improve readability.

What do you think?

Thanks,
Ezequiel.

PD: Am I too pretty-code paranoid?
