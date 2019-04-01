From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 01 Apr 2019 17:41:56 +0000
Subject: Re: [PATCH] Bluetooth: hci_event: potential out of bounds parsing ADV events
Message-Id: <20190401174156.GZ32613@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330072511.GA5502@kadam>
 <f1baaa05-bd1d-f2cf-410a-7073e85412d3@gmail.com>
 <b2a2b63a-c5f0-5d03-7516-668df6049c95@gmail.com>
 <20190401063215.GC32590@kadam>
 <d1b5afe2-8760-55eb-8b6f-28c31b3c3658@gmail.com>
In-Reply-To: <d1b5afe2-8760-55eb-8b6f-28c31b3c3658@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomas Bortoli <tomasbortoli@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Jaganath Kanakkassery <jaganath.k.os@gmail.com>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Apr 01, 2019 at 07:24:47PM +0200, Tomas Bortoli wrote:
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
> >>  	u8 num_reports = skb->data[0];
> >>  	void *ptr = &skb->data[1];
> >> +	u8 *end = &skb->data[skb->len - 1];
> >                              ^^^^^^^^^^^^
> >>  
> >>  	hci_dev_lock(hdev);
> >>  
> >> @@ -5352,6 +5353,9 @@ static void hci_le_adv_report_evt(struct hci_dev *hdev, struct sk_buff *skb)
> >>  		struct hci_ev_le_advertising_info *ev = ptr;
> >>  		s8 rssi;
> >>  
> >> +		if (ev->data + ev->length > end)
> > 
> > No, this isn't right.  You've removed the + 1 and you've introduced an
> > additional "sbk->len - 1" so we're off by two...  The test is supposed
> > to be:
> > 
> > 	start + length_read > start + length_of_buffer
> > 
> 
> afaict: ev->data = start and length_read = ev->length
> and the right side of the condition is the upper limit. "end" as defined
> in my patch is the last readable byte of skb->data (or am I wrong on
> this too?)
> 

You have:

	ptr + length > &skb->data[skb->len - 1];

Imagine we "ptr = &skb->data[skb->len - 1]" that means we can read one
more byte.  But in that case "if (ptr + 1 > &skb->data[skb->len - 1])"
is true so we break instead of allowing the read.  Idiomatically > is
for length and >= is for indexes...

Btw, unrelated but in hci_le_adv_report_evt() if we hit the
HCI_MAX_AD_LENGTH condition we should just break as well.  Everything
after that is going to be guess work and garbage.  No point in trying to
parse it.  IOW:

		if (ptr + sizeof(*ev) + ev->length + 1 > end ||
		    ev->length > HCI_MAX_AD_LENGTH)
			break;

I was planning to resend my patch and the fixes to hci_le_adv_report_evt()
with your Reported-by tonight as two separate patches.  It just makes it
easier to backport if we have a different Fixes tag for both functions.
But then I decided to wait until tomorrow to see if anyone knew what the
+ 1 was about...

regards,
dan carpenter
 
