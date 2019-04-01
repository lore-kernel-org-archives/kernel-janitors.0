From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 01 Apr 2019 06:32:15 +0000
Subject: Re: [PATCH] Bluetooth: hci_event: potential out of bounds parsing ADV events
Message-Id: <20190401063215.GC32590@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330072511.GA5502@kadam>
 <f1baaa05-bd1d-f2cf-410a-7073e85412d3@gmail.com>
 <b2a2b63a-c5f0-5d03-7516-668df6049c95@gmail.com>
In-Reply-To: <b2a2b63a-c5f0-5d03-7516-668df6049c95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomas Bortoli <tomasbortoli@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Jaganath Kanakkassery <jaganath.k.os@gmail.com>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Mar 30, 2019 at 11:44:29PM +0100, Tomas Bortoli wrote:
> Hi,
> 
> sorry for the multiple emails but I have checked again the code and
> looks like process_adv_report() reads from ev->data for a size of
> ev->length.
> 
> I attach a patch that applies the bound check to both
> hci_le_ext_adv_report_evt() and hci_le_adv_report_evt().
> 

You're right that both need to be fixed.

> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> index 609fd6871c5a..275926e0753e 100644
> --- a/net/bluetooth/hci_event.c
> +++ b/net/bluetooth/hci_event.c
> @@ -5345,6 +5345,7 @@ static void hci_le_adv_report_evt(struct hci_dev *hdev, struct sk_buff *skb)
>  {
>  	u8 num_reports = skb->data[0];
>  	void *ptr = &skb->data[1];
> +	u8 *end = &skb->data[skb->len - 1];
                             ^^^^^^^^^^^^
>  
>  	hci_dev_lock(hdev);
>  
> @@ -5352,6 +5353,9 @@ static void hci_le_adv_report_evt(struct hci_dev *hdev, struct sk_buff *skb)
>  		struct hci_ev_le_advertising_info *ev = ptr;
>  		s8 rssi;
>  
> +		if (ev->data + ev->length > end)

No, this isn't right.  You've removed the + 1 and you've introduced an
additional "sbk->len - 1" so we're off by two...  The test is supposed
to be:

	start + length_read > start + length_of_buffer

So the end has to be &skb->data[skb->len].  The "+ 1" comes from later
in the function when we do:

		ptr += sizeof(*ev) + ev->length + 1;
                                               ^^^^

I don't where the "+ 1" comes from, but I know the condition and the
increment should match.  We could use ev->data instead of
"ptr + sizeof(*ev)" but to me, because the mysterious "+ 1" then it
seems more readable to match the increment exactly...

regards,
dan carpenter
