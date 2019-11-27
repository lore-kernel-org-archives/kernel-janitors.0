From: Harry Wentland <hwentlan@amd.com>
Date: Wed, 27 Nov 2019 16:51:33 +0000
Subject: Re: [PATCH][next] drm/amd/display: fix double assignment to msg_id field
Message-Id: <9056b19a-f63c-8fc0-d2f7-6df3a20c95a7@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191120172242.347072-1-colin.king@canonical.com>
In-Reply-To: <20191120172242.347072-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Harry Wentland <harry.wentland-5C7GfCeVMHo@public.gmane.org>, Leo Li <sunpeng.li-5C7GfCeVMHo@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Bhawanpreet Lakha <Bhawanpreet.Lakha-5C7GfCeVMHo@public.gmane.org>, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 2019-11-20 12:22 p.m., Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The msg_id field is being assigned twice. Fix this by replacing the second
> assignment with an assignment to msg_size.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: 11a00965d261 ("drm/amd/display: Add PSP block to verify HDCP2.2 steps")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Harry Wentland <harry.wentland>

Harry

> ---
>  drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> index 2dd5feec8e6c..6791c5844e43 100644
> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> @@ -42,7 +42,7 @@ static void hdcp2_message_init(struct mod_hdcp *hdcp,
>  	in->process.msg2_desc.msg_id = TA_HDCP_HDCP2_MSG_ID__NULL_MESSAGE;
>  	in->process.msg2_desc.msg_size = 0;
>  	in->process.msg3_desc.msg_id = TA_HDCP_HDCP2_MSG_ID__NULL_MESSAGE;
> -	in->process.msg3_desc.msg_id = 0;
> +	in->process.msg3_desc.msg_size = 0;
>  }
>  enum mod_hdcp_status mod_hdcp_remove_display_topology(struct mod_hdcp *hdcp)
>  {
> 
