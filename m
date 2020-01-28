From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 28 Jan 2020 21:19:56 +0000
Subject: Re: [PATCH] drm/amd/display: fix spelling mistake link_integiry_check -> link_integrity_check
Message-Id: <CADnq5_O=W6TFFCGZsdvtuLPijanxX4vdkdmedh2OxZauG6M58w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200128112827.43682-1-colin.king@canonical.com>
In-Reply-To: <20200128112827.43682-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Zhou <David1.Zhou@amd.com>, Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <harry.wentland@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Tue, Jan 28, 2020 at 6:28 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake on the struct field name link_integiry_check,
> fix this by renaming it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h           | 2 +-
>  .../gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c    | 8 ++++----
>  .../gpu/drm/amd/display/modules/hdcp/hdcp1_transition.c   | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h
> index f98d3d9ecb6d..af78e4f1be68 100644
> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h
> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h
> @@ -63,7 +63,7 @@ struct mod_hdcp_transition_input_hdcp1 {
>         uint8_t hdcp_capable_dp;
>         uint8_t binfo_read_dp;
>         uint8_t r0p_available_dp;
> -       uint8_t link_integiry_check;
> +       uint8_t link_integrity_check;
>         uint8_t reauth_request_check;
>         uint8_t stream_encryption_dp;
>  };
> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
> index 04845e43df15..37670db64855 100644
> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
> @@ -283,8 +283,8 @@ static enum mod_hdcp_status wait_for_ready(struct mod_hdcp *hdcp,
>                                 hdcp, "bstatus_read"))
>                         goto out;
>                 if (!mod_hdcp_execute_and_set(check_link_integrity_dp,
> -                               &input->link_integiry_check, &status,
> -                               hdcp, "link_integiry_check"))
> +                               &input->link_integrity_check, &status,
> +                               hdcp, "link_integrity_check"))
>                         goto out;
>                 if (!mod_hdcp_execute_and_set(check_no_reauthentication_request_dp,
>                                 &input->reauth_request_check, &status,
> @@ -431,8 +431,8 @@ static enum mod_hdcp_status authenticated_dp(struct mod_hdcp *hdcp,
>                         hdcp, "bstatus_read"))
>                 goto out;
>         if (!mod_hdcp_execute_and_set(check_link_integrity_dp,
> -                       &input->link_integiry_check, &status,
> -                       hdcp, "link_integiry_check"))
> +                       &input->link_integrity_check, &status,
> +                       hdcp, "link_integrity_check"))
>                 goto out;
>         if (!mod_hdcp_execute_and_set(check_no_reauthentication_request_dp,
>                         &input->reauth_request_check, &status,
> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_transition.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_transition.c
> index 21ebc62bb9d9..76edcbe51f71 100644
> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_transition.c
> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_transition.c
> @@ -241,7 +241,7 @@ enum mod_hdcp_status mod_hdcp_hdcp1_dp_transition(struct mod_hdcp *hdcp,
>                 }
>                 break;
>         case D1_A4_AUTHENTICATED:
> -               if (input->link_integiry_check != PASS ||
> +               if (input->link_integrity_check != PASS ||
>                                 input->reauth_request_check != PASS) {
>                         /* 1A-07: restart hdcp on a link integrity failure */
>                         fail_and_restart_in_ms(0, &status, output);
> @@ -249,7 +249,7 @@ enum mod_hdcp_status mod_hdcp_hdcp1_dp_transition(struct mod_hdcp *hdcp,
>                 }
>                 break;
>         case D1_A6_WAIT_FOR_READY:
> -               if (input->link_integiry_check = FAIL ||
> +               if (input->link_integrity_check = FAIL ||
>                                 input->reauth_request_check = FAIL) {
>                         fail_and_restart_in_ms(0, &status, output);
>                         break;
> --
> 2.24.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
