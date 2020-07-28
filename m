From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 28 Jul 2020 13:19:00 +0000
Subject: Re: [PATCH] usb: hso: check for return value in hso_serial_common_create()
Message-Id: <a42328b6-6d45-577f-f605-337b91c19f1a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Rustam Kovhaev <rkovhaev@gmail.com>, linux-usb@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jakub Kicinski <kuba@kernel.org>, syzbot+67b2bd0e34f952d0321e@syzkaller.appspotmail.com

> in case of an error tty_register_device_attr() returns ERR_PTR(),
> add IS_ERR() check

I suggest to improve this change description a bit.

Will the tag “Fixes” become helpful for the commit message?


…
> +++ b/drivers/net/usb/hso.c
…
> @@ -2311,6 +2313,7 @@  static int hso_serial_common_create(struct hso_serial *serial, int num_urbs,
>  	return 0;
>  exit:
>  	hso_serial_tty_unregister(serial);
> +exit2:
>  	hso_serial_common_free(serial);
>  	return -1;
>  }

Can other labels (like “unregister_serial” and “free_serial”) be preferred here?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=92ed301919932f777713b9172e525674157e983d#n485

Regards,
Markus
