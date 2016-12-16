From: Bart Van Assche <bart.vanassche@gmail.com>
Date: Fri, 16 Dec 2016 10:14:12 +0000
Subject: Re: [patch] target/iscsi: double free in lio_target_tiqn_addtpg()
Message-Id: <05d1645d-9618-1702-7b57-3a5f95b54196@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161213122703.GB7519@elgon.mountain>
In-Reply-To: <20161213122703.GB7519@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 12/15/2016 09:31 PM, Dan Carpenter wrote:
> On Thu, Dec 15, 2016 at 04:43:55PM +0100, Bart Van Assche wrote:
>> On 12/13/2016 01:27 PM, Dan Carpenter wrote:
>>> This iscsit_tpg_add_portal_group() function is only called from
>>> lio_target_tiqn_addtpg().  Both functions free the "tpg" pointer on
>>> error so it's a double free bug.  The memory is allocated in the caller
>>> so it should be freed in the caller and not here.
>>>
>>> Fixes: e48354ce078c ("iscsi-target: Add iSCSI fabric support for target v4.1")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> Do you think a "Cc: stable" tag should be added to this patch?
> 
> It will basically only fail for allocation errors.  It's probably not
> super likely.  These are static checker fixes, not something I
> encountered in real life.

Hello Dan,

Thanks for the patch and for the additional clarification. I have queued
your patch for kernel version v4.10.

Bart.
