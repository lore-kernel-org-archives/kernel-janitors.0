From: Hemant Kumar <hemantk@codeaurora.org>
Date: Fri, 17 Apr 2020 03:37:16 +0000
Subject: Re: [bug report] bus: mhi: core: Add support for data transfer
Message-Id: <d30c7648-b657-d8b2-ba64-71f1178b4a68@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407135559.GA109574@mwanda>
 <20200407143304.GH2442@Mani-XPS-13-9360>
In-Reply-To: <20200407143304.GH2442@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org


On 4/7/20 7:33 AM, Manivannan Sadhasivam wrote:
> Hi Dan,
>
> On Tue, Apr 07, 2020 at 04:55:59PM +0300, Dan Carpenter wrote:
>> Hello Manivannan Sadhasivam,
>>
>> The patch 189ff97cca53: "bus: mhi: core: Add support for data
>> transfer" from Feb 20, 2020, leads to the following static checker
>> warning:
>>
>> 	drivers/bus/mhi/core/main.c:1153 mhi_queue_buf()
>> 	error: double locked 'mhi_chan->lock' (orig line 1110)
>>
>> drivers/bus/mhi/core/main.c
>>    1142          }
>>    1143
>>    1144          /* Toggle wake to exit out of M2 */
>>    1145          mhi_cntrl->wake_toggle(mhi_cntrl);
>>    1146
>>    1147          if (mhi_chan->dir = DMA_TO_DEVICE)
>>    1148                  atomic_inc(&mhi_cntrl->pending_pkts);
>>    1149
>>    1150          if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))) {
>>    1151                  unsigned long flags;
>>    1152
>>    1153                  read_lock_irqsave(&mhi_chan->lock, flags);

parse_xfer_event is taking read lock : read_lock_bh(&mhi_chan->lock); 
first and later

mhi_queue_buf takes read lock: read_lock_irqsave(&mhi_chan->lock, flags);

Both are read locks which are recursive, is this problematic ?

>>                                            ^^^^^^^^^^^^^^^
>> The caller is already holding this lock.
>>
> Hmm. We have one internal user of this function and that's where the locking
> has gone wrong. Will fix it.
>
> Thanks for reporting!
>
> Regards,
> Mani
>
>>    1154                  mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>>    1155                  read_unlock_irqrestore(&mhi_chan->lock, flags);
>>    1156          }
>>    1157
>>    1158          read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
>>    1159
>>    1160          return 0;
>>    1161  }
>>    1162  EXPORT_SYMBOL_GPL(mhi_queue_buf);
>>
>> regards,
>> dan carpenter

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
