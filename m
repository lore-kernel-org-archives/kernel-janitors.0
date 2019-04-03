From: Jaganath K <jaganath.k.os@gmail.com>
Date: Wed, 03 Apr 2019 06:55:01 +0000
Subject: Re: [PATCH] Bluetooth: hci_event: potential out of bounds parsing ADV events
Message-Id: <CAJzH+bpwaLhjbUtsCMTzGn6VvAoiSZ3WSAV0exqhteToBuiOVg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330072511.GA5502@kadam> <f1baaa05-bd1d-f2cf-410a-7073e85412d3@gmail.com>
 <b2a2b63a-c5f0-5d03-7516-668df6049c95@gmail.com> <20190401063215.GC32590@kadam>
 <d1b5afe2-8760-55eb-8b6f-28c31b3c3658@gmail.com>
In-Reply-To: <d1b5afe2-8760-55eb-8b6f-28c31b3c3658@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomas Bortoli <tomasbortoli@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi,

On Mon, Apr 1, 2019 at 10:54 PM Tomas Bortoli <tomasbortoli@gmail.com> wrote:
>
> On 4/1/19 8:32 AM, Dan Carpenter wrote:
> > On Sat, Mar 30, 2019 at 11:44:29PM +0100, Tomas Bortoli wrote:
> >> Hi,
> >>
> >> sorry for the multiple emails but I have checked again the code and
> >> looks like process_adv_report() reads from ev->data for a size of
> >> ev->length.
> >>
> >> I attach a patch that applies the bound check to both
> >> hci_le_ext_adv_report_evt() and hci_le_adv_report_evt().
> >>
> >
> > You're right that both need to be fixed.
> >
> >> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> >> index 609fd6871c5a..275926e0753e 100644
> >> --- a/net/bluetooth/hci_event.c
> >> +++ b/net/bluetooth/hci_event.c
> >> @@ -5345,6 +5345,7 @@ static void hci_le_adv_report_evt(struct hci_dev *hdev, struct sk_buff *skb)
> >>  {
> >>      u8 num_reports = skb->data[0];
> >>      void *ptr = &skb->data[1];
> >> +    u8 *end = &skb->data[skb->len - 1];
> >                              ^^^^^^^^^^^^
> >>
> >>      hci_dev_lock(hdev);
> >>
> >> @@ -5352,6 +5353,9 @@ static void hci_le_adv_report_evt(struct hci_dev *hdev, struct sk_buff *skb)
> >>              struct hci_ev_le_advertising_info *ev = ptr;
> >>              s8 rssi;
> >>
> >> +            if (ev->data + ev->length > end)
> >
> > No, this isn't right.  You've removed the + 1 and you've introduced an
> > additional "sbk->len - 1" so we're off by two...  The test is supposed
> > to be:
> >
> >       start + length_read > start + length_of_buffer
> >
>
> afaict: ev->data = start and length_read = ev->length
> and the right side of the condition is the upper limit. "end" as defined
> in my patch is the last readable byte of skb->data (or am I wrong on
> this too?)
>
> > So the end has to be &skb->data[skb->len].  The "+ 1" comes from later
> > in the function when we do:
> >
> >               ptr += sizeof(*ev) + ev->length + 1;
> >                                                ^^^^
> >
> > I don't where the "+ 1" comes from, but I know the condition and the
> > increment should match.  We could use ev->data instead of
> > "ptr + sizeof(*ev)" but to me, because the mysterious "+ 1" then it
> > seems more readable to match the increment exactly...
>
> We really have to first understand why there is that + 1 there. I agree
> that the condition and the increment should match, otherwise or there is
> a mistake in the error condition or the increment just skips 1 byte, not
> reading the last per each cycle, for no reason (very unlikely).
>
> Reading process_adv_report() I spotted some memcpy() and other reads of
> the memory area that begins at data (ev->data) and ends at (ev->data +
> length).
>
> Could anybody clarify the logic of that inc ?
>
"+ 1" is required in adv_report_evt since there is one more field
"rssi" after data
so you need + 1 to point to next report, where as it is not required
in ext_adv_report_evt
since rssi is present before data. I have already raised a patch to
fix it the in ML.

Thanks,
Jaganath
