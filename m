From: Harsh Kumar <harsh1kumar@gmail.com>
Date: Thu, 27 Sep 2012 03:47:56 +0000
Subject: Re: [Patch 1/5] Staging: winbond: Changed c99 comments to c89 comments
Message-Id: <CAFfwLZjCNOY0x0hE8=s4JUApmiMBY--9nb9_JVKziybQM+2TYA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <50634165.3010701@gmail.com>
In-Reply-To: <50634165.3010701@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Don't know why it happened. Either I messed it up while writing the
mail or the email client misbehaved.

On Thu, Sep 27, 2012 at 2:32 AM, Greg KH <greg@kroah.com> wrote:
> On Wed, Sep 26, 2012 at 11:24:45PM +0530, Harsh Kumar wrote:
>> @@ -287,7 +286,7 @@ void Wb35Tx_EP2VM_start(struct wbsoft_pr
>>       struct hw_data * pHwData = &adapter->sHwData;
>>       struct wb35_tx *pWb35Tx = &pHwData->Wb35Tx;
>>
>> -     // Allow only one thread to run into function
>> +     /* Allow only one thread to run into function */
>>       if (atomic_inc_return(&pWb35Tx->TxResultCount) = 1) {
>>               pWb35Tx->EP2vm_state = VM_RUNNING;
>>               Wb35Tx_EP2VM(adapter);Changed c99 comments to c89 comments
>
> What's with that last line?  It's not correct, did your email client get
> messed up?
>
> odd...
>
> greg k-h
