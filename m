From: Lauri Jakku <ljakku77@gmail.com>
Date: Tue, 04 Feb 2020 07:00:46 +0000
Subject: Re: [PATCH] USB: HID: Fix timeout by adding retry loop
Message-Id: <51d8ee09-7cd6-5304-00b0-99276e67aec1@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi,

I'm quite newbie publicly patching stuff, but at anyway:

On 4.2.2020 8.27, Dan Carpenter wrote:
> Hi Lauri,
>
> There are a bunch of issues with this patch.
>
> 1)  There is no way we're going to add a retry loop to
>     usb_control_msg().  We might add it to a driver, but probably we
>     would suspect that the hardware is bad.  Maybe the cable is faulty?
>     Or I could be wrong on that...

For example there is lot of USB HID related oddities reported

by multiple users, that have said that after (kernel) update

of their system USB devices stopped working or work randomly.


I have problem with my mouse, and the problem went away

with my patch. I think that the change to driver by driver is

just code duplication, and with my patch the 'good' HW still

is not going to sleep even that 20ms, the time that I tought

to be good. Max retry time is 400ms.


>
> 2)  You would need to send this to a different list.  Use
>     ./scripts/get_maintainer.pl to find out who.  The
>     linux-usb@vger.kernel.org is the main USB list.

I'm just beginner,=C2=A0 but the MAINTAINERS list mentiones

linus-usb mailing list.

> 3)  The patch doesn't apply.  Read the first paragraph of
>     Documentation/process/email-clients.rst
Ok, will do just that.
> 4) The subject needs to be formatted slightly differently.
>     [PATCH] USB: HID: Fix timeout by adding retry loop
Ok, modified subject as requested.
> 5) The commit message should be more clear what was affected.  Don't
>    start the commit message in the middle of a sentence.

I try to elaborate bit more.

> regards,
> dan carpenter
>
>
Thank you for commit review. I start to fix patch as you suggested.


Br,

Lauri J.
