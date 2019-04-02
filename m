From: Tomas Bortoli <tomasbortoli@gmail.com>
Date: Tue, 02 Apr 2019 18:46:22 +0000
Subject: Re: [PATCH] Bluetooth: hci_event: potential out of bounds parsing ADV events
Message-Id: <c4541728-5dd9-75d5-7d02-6160bfc769e7@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330072511.GA5502@kadam>
 <f1baaa05-bd1d-f2cf-410a-7073e85412d3@gmail.com>
 <CAM_iQpVNqyoBirtKg-rbOHsOZCZ0Oz5PTE2sFQnHQnv6s7g2gg@mail.gmail.com>
 <20190402063313.GA32613@kadam>
 <CAM_iQpW=X2X5A873nSPM7yLBiWZM+rsJk+uMpiOioYPFsFP9vg@mail.gmail.com>
In-Reply-To: <CAM_iQpW=X2X5A873nSPM7yLBiWZM+rsJk+uMpiOioYPFsFP9vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cong Wang <xiyou.wangcong@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Jaganath Kanakkassery <jaganath.k.os@gmail.com>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Cong,

On 4/2/19 7:42 PM, Cong Wang wrote:
> On Mon, Apr 1, 2019 at 11:33 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>>
>> On Mon, Apr 01, 2019 at 11:03:53AM -0700, Cong Wang wrote:
>>> Hi,
>>>
>>> On Sat, Mar 30, 2019 at 2:23 AM Tomas Bortoli <tomasbortoli@gmail.com> wrote:
>>>>
>>>> Hi Dan,
>>>>
>>>> On 3/30/19 8:25 AM, Dan Carpenter wrote:
>>>>> There is a potential out of bounds if "ev->length" is too high or if the
>>>>> number of reports are too many.
>>>>>
>>>>> Fixes: c215e9397b00 ("Bluetooth: Process extended ADV report event")
>>>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>> Reviewed-By: Tomas Bortoli <tomasbortoli@gmail.com>
>>>
>>> I sent a patchset to fix all of this kind of OOB:
>>> https://marc.info/?l=linux-netdev&m5314874622831&w=2

Reviewed-by: Tomas Bortoli <tomasbortoli@gmail.com>

All 3 looks good to me, nice work! Overall, it seems that with these 3
all the RX paths in hci_event.c are bound checked.

>>>
>>> Unfortunately I get no response...
>>>
>>> Does any of you mind to look at them?
>>>
>>
>> I don't know the rules...  When is it ok say:
>>
>>         if (skb->len < sizeof(*ev))
>>                 return;
>>
>> and when must we say:
>>
>>         if (!pskb_may_pull(skb, sizeof(*ev)))
>>                 return;
> 
> 
> The rule is simple: pskb_may_pull() always knows better. In bluetooth
> case, they are actually equivalent, as the skb's in bluetooth are linear.
> 
> 
>>
>> Btw, get rid of all the likely/unlikely() macros.  Then the other style
>> comment would be don't move the "ev = (void *)skb->data;" assignments
>> around.  It's ok to say:
> 
> 
> Similarly, pskb_may_pull() may reallocate skb's, although very unlikely
> for bluetooth case (skb's are linear). At least it doesn't harm anything
> we move the skb->data dereference after pskb_may_pull().
> 
> I think these likely()/unlikely() are reasonable, ill-formatted packets
> are rare cases, normal packets deserve such a special care. We
> use likely()/unlikely() with pskb_may_pull() in many places in
> networking subsystem, at least.
> 
> Anyway, if you don't mind, I can resend my patchset with you Cc'ed.
> 
> Thanks.
> 
