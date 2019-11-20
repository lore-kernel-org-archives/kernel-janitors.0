From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 20 Nov 2019 19:11:03 +0000
Subject: Re: [PATCH][next] drm/dp_mst: fix multiple frees of tx->bytes
Message-Id: <0e6b2b68-2898-213d-3a37-c23d32a97133@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191120173509.347490-1-colin.king@canonical.com>
 <f6c44c85a63c89e548cafa55d89caccd7e868268.camel@redhat.com>
In-Reply-To: <f6c44c85a63c89e548cafa55d89caccd7e868268.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lyude Paul <lyude@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 20/11/2019 18:59, Lyude Paul wrote:
> Heh, surprised I missed this one!
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Do you need me to push this to drm-misc, or do you have commit rights already

I have no commit rights.


> 
> On Wed, 2019-11-20 at 17:35 +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently tx->bytes is being freed r->num_transactions number of
>> times because tx is not being set correctly. Fix this by setting
>> tx to &r->transactions[i] so that the correct objects are being
>> freed on each loop iteration.
>>
>> Addresses-Coverity: ("Double free")
>> Fixes: 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing +
>> selftests")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/gpu/drm/drm_dp_mst_topology.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
>> b/drivers/gpu/drm/drm_dp_mst_topology.c
>> index ae5809a1f19a..2754e7e075e7 100644
>> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
>> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
>> @@ -517,8 +517,10 @@ drm_dp_decode_sideband_req(const struct
>> drm_dp_sideband_msg_tx *raw,
>>  			}
>>  
>>  			if (failed) {
>> -				for (i = 0; i < r->num_transactions; i++)
>> +				for (i = 0; i < r->num_transactions; i++) {
>> +					tx = &r->transactions[i];
>>  					kfree(tx->bytes);
>> +				}
>>  				return -ENOMEM;
>>  			}
>>  
