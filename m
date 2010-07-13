From: =?ISO-8859-1?Q?=22Tegawend=E9_F=2E_Bissyand=E9=22?=
Date: Tue, 13 Jul 2010 10:50:40 +0000
Subject: Empty critical section issue in Bluetooth Linux driver code
Message-Id: <4C3C4500.3090302@labri.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi,

I have been using Coccinelle to validate some trivial rules of kernel
API use by device drivers.
I came accross the definition of an empty critical section in the
'bfusb_close' function in file drivers/bluetooth/bfusb.c

static int bfusb_close(struct hci_dev *hdev)
{
     ...
     write_lock_irqsave(&data->lock, flags);
     write_unlock_irqrestore(&data->lock, flags);

     bfusb_unlink_urbs(data);
     bfusb_flush(hdev);

     return 0;
}
This excerpt is from Linux 2.6.34, but the same code has been prevailing
long before (I've seen it in 2.6.5)
So I was wondering if there is some code that is supposed to go between
write_lock_irqsave and write_unlock_irqsave,
or if the two statements should simply removed?
I also supposed that this was just meant to allow to wait for a release of =
the lock by another thread.
In this case, wouldn't spin_lock or mutex_lock be more appropriate as write=
_lock can be confusing even though
I suppose it has the same effect?? but I am not sure.

best regards,

--=20
Tegawend=E9 F. Bissyand=E9
PhD student at LaBRI - France


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
