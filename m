From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 16 Jun 2004 04:02:19 +0000
Subject: Re: [Kernel-janitors] Sparse checks #9
Message-Id: <20040615210219.5ae4ebc6.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12262658727432885=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1087343099.676.115.camel@boxen>
In-Reply-To: <1087343099.676.115.camel@boxen>
To: kernel-janitors@vger.kernel.org

--===============12262658727432885==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Jun 2004 02:15:27 +0200 Alexander Nyberg wrote:

| Sorry, stupid miss at:
| struct lcd_display __user *ubuf = (struct lcd_display __user) arg;
| 
| Could I also have some feedback before I go on with this, right
| way of sending in diffs etc.?

I've looked at all of this sparse series (and I've been doing some
myself recently).

The diffs look fine to me, format-wise.
Content-wise too, with a couple of small exceptions below.


| ===== drivers/char/lcd.c 1.2 vs edited =====
| --- 1.2/drivers/char/lcd.c      2003-09-01 01:14:08 +02:00
| +++ edited/drivers/char/lcd.c   2004-06-16 00:27:01 +02:00
| @@ -63,7 +63,8 @@
|         struct lcd_display button_display;
|         unsigned long address, a;
|         int index;
| -
| +       struct lcd_display __user *ubuf = (struct lcd_display __user *) arg;
#  ^^^^^^
# use tabs, not spaces.  If you used tabs in your editor, something
	converted them to spaces, usually either an email client, or
	using copy-and-paste, or your editor.

| @@ -135,8 +136,8 @@
|                  BusyCheck();
|                 display.cursor_address = ( LCDReadInst );
|                 display.cursor_address = ( display.cursor_address & 0x07F );
| -               if(copy_to_user((struct lcd_display*)arg, &display, sizeof(struct lcd_display)))
| -                 return -EFAULT;
| +               if(copy_to_user(ubuf, &display, sizeof(struct lcd_display)))
| +                       return -EFAULT;

# same comment/problem as above..  This contains spaces (both on the - and
+ lines) where it should contain tabs, so this patch won't apply cleanly
with 'patch'.  Also, I'd prefer to see "if(" changed to "if (" while you
are making changes on that line... but not everyone would agree with that.

# apply these comments many times, not just on the lines above.

Last, FYI, I'm no longer the KJ maintainer, but I do scan over patches
and reply to them when I feel that it's appropriate.

--
~Randy

--===============12262658727432885==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12262658727432885==--
