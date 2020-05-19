From: Divya Indi <divya.indi@oracle.com>
Date: Tue, 19 May 2020 23:27:39 +0000
Subject: Re: [PATCH] IB/sa: Fix use-after-free in ib_nl_send_msg()
Message-Id: <f3eec429-65a7-fbf9-81fa-2df9aa62b98d@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b4b66f61-d49e-fd87-87a5-7f5bfff6fd7f@web.de>
In-Reply-To: <b4b66f61-d49e-fd87-87a5-7f5bfff6fd7f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Doug Ledford <dledford@redhat.com>, Gerd Rausch <gerd.rausch@oracle.com>, =?UTF-8?Q?H=c3=a5kon_Bugge?= <haakon.bugge@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kaike Wan <kaike.wan@intel.com>, Rama Nichanamatlu <rama.nichanamatlu@oracle.com>, Srinivas Eeda <srinivas.eeda@oracle.com>

Hi Markus,

Thanks for taking the time to review.

On 5/15/20 9:25 AM, Markus Elfring wrote:
>> This patch fixes commit -
>> commit 3ebd2fd0d011 ("IB/sa: Put netlink request into the request list before sending")'
>>
>> Above commit adds the query to the request list before ib_nl_snd_msg.
> I suggest to improve also this change description.
>
>   The query to the request list was added before ib_nl_snd_msg()
>   by the commit 3ebd2fd0d011 ("…").
Noted, will make this change.
>
>> This flag Indicates …
> … indicates …
Noted.
>
>> To handle the case where a response is received before we could set this
>> flag, the response handler waits for the flag to be
>> set before proceeding with the query.
> Please reconsider the word wrapping.
>
>   To handle the case where a response is received before we could set
>   this flag, the response handler waits for the flag to be set
>   before proceeding with the query.
>
>
> Would you like to add the tag “Fixes” to the commit message?

Noted!

Thanks,

Divya

>
> Regards,
> Markus
