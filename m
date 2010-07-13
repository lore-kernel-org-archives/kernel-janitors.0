From: Dan Carpenter <error27@gmail.com>
Date: Tue, 13 Jul 2010 11:38:51 +0000
Subject: Re: Empty critical section issue in Bluetooth Linux driver code
Message-Id: <20100713113851.GJ5658@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4C3C4500.3090302@labri.fr>
In-Reply-To: <4C3C4500.3090302@labri.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Tue, Jul 13, 2010 at 12:50:40PM +0200, "Tegawend=E9 F. Bissyand=E9" wrot=
e:
> Hi,
>
> I have been using Coccinelle to validate some trivial rules of kernel
> API use by device drivers.
> I came accross the definition of an empty critical section in the
> 'bfusb_close' function in file drivers/bluetooth/bfusb.c
>
> static int bfusb_close(struct hci_dev *hdev)
> {
>     ...
>     write_lock_irqsave(&data->lock, flags);
>     write_unlock_irqrestore(&data->lock, flags);
>

This is in the _close() function.  It's waiting for all the readers to
finish.  Presumably it's already ensured that no new reader threads will
launch.

regards,
dan carpenter

>     bfusb_unlink_urbs(data);
>     bfusb_flush(hdev);
>
>     return 0;
> }


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
