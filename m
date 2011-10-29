From: David Herrmann <dh.herrmann@googlemail.com>
Date: Sat, 29 Oct 2011 10:53:29 +0000
Subject: Re: [PATCH 3/5] drivers/hid/hid-roccat.c: eliminate a null pointer dereference
Message-Id: <CANq1E4QJoM+NYub9hfs3KnL1w212FK0MHo8ez2p1nyGmNVb-=A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1319846297-2985-3-git-send-email-julia@diku.dk>
	<20111029062412.GG14881@longonot.mountain>
	<4EABC937.60600@broadcom.com>
In-Reply-To: <4EABC937.60600@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Arend van Spriel <arend@broadcom.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Julia Lawall <julia@diku.dk>, Jiri Kosina <jkosina@suse.cz>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Oct 29, 2011 at 11:36 AM, Arend van Spriel <arend@broadcom.com> wro=
te:
> On 10/29/2011 08:24 AM, Dan Carpenter wrote:
>> On Sat, Oct 29, 2011 at 01:58:15AM +0200, Julia Lawall wrote:
>>> diff --git a/drivers/hid/hid-roccat.c b/drivers/hid/hid-roccat.c
>>> index 2596321..36a28b8 100644
>>> --- a/drivers/hid/hid-roccat.c
>>> +++ b/drivers/hid/hid-roccat.c
>>> @@ -163,14 +163,15 @@ static int roccat_open(struct inode *inode, struc=
t file *file)
>>>
>>> =A0 =A0 =A0device =3D devices[minor];
>>>
>>> - =A0 =A0mutex_lock(&device->readers_lock);
>>> -
>>> =A0 =A0 =A0if (!device) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_emerg("roccat device with minor %d doesn'=
t exist\n", minor);
>>> - =A0 =A0 =A0 =A0 =A0 =A0error =3D -ENODEV;
>>> - =A0 =A0 =A0 =A0 =A0 =A0goto exit_err;
>>> + =A0 =A0 =A0 =A0 =A0 =A0kfree(reader);
>>> + =A0 =A0 =A0 =A0 =A0 =A0mutex_lock(&devices_lock);
>>
>> Typo. =A0mutex_unlock() instead of mutex_lock().
>
> This is no typo, but simply wrong. Remove the mutex_lock() as we are
> leaving the function here in error flow.

No, this one is definitely needed. Its devices_lock, not
device->readers_lock! And devices_lock is locked before so we need to
unlock it if we return in this branch.

>>> + =A0 =A0 =A0 =A0 =A0 =A0return -ENODEV;
>>> =A0 =A0 =A0}
>>>
>>> + =A0 =A0mutex_lock(&device->readers_lock);
>>> +
>>> =A0 =A0 =A0if (!device->open++) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0/* power on device on adding first reader */
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0error =3D hid_hw_power(device->hid, PM_HINT_=
FULLON);
>>>
>>
>> regards,
>> dan carpenter
>
> Gr. AvS

Regards
David
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
