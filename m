From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 24 Jun 2019 16:13:34 +0000
Subject: Re: [PATCH] drm/vmwgfx: fix memory leak when too many retries have occurred
Message-Id: <82a6382b-6c9d-5c7f-b411-243cb31b2c16@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190621223534.14283-1-colin.king@canonical.com>
 <7b8430b3809eff2341d3e82c398038c1a9a0cc06.camel@vmware.com>
In-Reply-To: <7b8430b3809eff2341d3e82c398038c1a9a0cc06.camel@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Deepak Singh Rawat <drawat@vmware.com>, Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 24/06/2019 17:10, Deepak Singh Rawat wrote:
> Hi Colin,
> 
> Thanks for doing this.
> 
> Reviewed-by: Deepak Rawat <drawat@vmware.com>
> 
> Do you want me to include this in vmwgfx-next or will you submit this
> via drm-mics?

Can you include it into vmwgfx-next?

Thanks

Colin

> 
> On Fri, 2019-06-21 at 23:35 +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently when too many retries have occurred there is a memory
>> leak on the allocation for reply on the error return path. Fix
>> this by kfree'ing reply before returning.
>>
>> Addresses-Coverity: ("Resource leak")
>> Fixes: a9cd9c044aa9 ("drm/vmwgfx: Add a check to handle host message
>> failure")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
>> b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
>> index 8b9270f31409..8b61f16f50cf 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
>> @@ -301,8 +301,10 @@ static int vmw_recv_msg(struct rpc_channel
>> *channel, void **msg,
>>  		break;
>>  	}
>>  
>> -	if (retries = RETRIES)
>> +	if (retries = RETRIES) {
>> +		kfree(reply);
>>  		return -EINVAL;
>> +	}
>>  
>>  	*msg_len = reply_len;
>>  	*msg     = reply;
> 
