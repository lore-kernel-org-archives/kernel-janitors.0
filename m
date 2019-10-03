From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 03 Oct 2019 16:05:52 +0000
Subject: Re: [PATCH][drm-next] drm/amd/display: fix spelling mistake AUTHENICATED -> AUTHENTICATED
Message-Id: <CADnq5_OAoct7q-CQQ=aLoUXpGcJa8qf=P7V1g=FS9Z6wiPhGog@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191003082232.4136-1-colin.king@canonical.com>
 <125634cd-b636-c4dc-4e05-bc5c543b7230@amd.com>
In-Reply-To: <125634cd-b636-c4dc-4e05-bc5c543b7230-5C7GfCeVMHo@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <hwentlan-5C7GfCeVMHo@public.gmane.org>
Cc: "Zhou, David(ChunMing)" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Li,
 Sun peng (Leo)" <Sunpeng.Li-5C7GfCeVMHo@public.gmane.org>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha-5C7GfCeVMHo@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9/EVdHwE84te@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9/EVdHwE84te@public.gmane.org>, "Liu,
 Wenjing" <Wenjing.Liu-5C7GfCeVMHo@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, "Deucher,
 Alexander" <Alexander.Deucher-5C7GfCeVMHo@public.gmane.org>, Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, "Wentland, Harry" <Harry.Wentland-5C7GfCeVMHo@public.gmane.org>, "Koenig,
 Christian" <Christian.Koenig-5C7GfCeVMHo@public.gmane.org>

On Thu, Oct 3, 2019 at 9:27 AM Harry Wentland <hwentlan@amd.com> wrote:
>
> On 2019-10-03 4:22 a.m., Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > There is a spelling mistake in the macros H1_A45_AUTHENICATED and
> > D1_A4_AUTHENICATED, fix these by adding the missing T.
> >
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>

Applied.  thanks!

Alex

> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h      |  4 ++--
> >  .../drm/amd/display/modules/hdcp/hdcp1_execution.c   |  4 ++--
> >  .../drm/amd/display/modules/hdcp/hdcp1_transition.c  | 12 ++++++------
> >  drivers/gpu/drm/amd/display/modules/hdcp/hdcp_log.c  |  8 ++++----
> >  4 files changed, 14 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h
> > index 402bb7999093..5664bc0b5bd0 100644
> > --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h
> > +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h
> > @@ -176,7 +176,7 @@ enum mod_hdcp_hdcp1_state_id {
> >       H1_A0_WAIT_FOR_ACTIVE_RX,
> >       H1_A1_EXCHANGE_KSVS,
> >       H1_A2_COMPUTATIONS_A3_VALIDATE_RX_A6_TEST_FOR_REPEATER,
> > -     H1_A45_AUTHENICATED,
> > +     H1_A45_AUTHENTICATED,
> >       H1_A8_WAIT_FOR_READY,
> >       H1_A9_READ_KSV_LIST,
> >       HDCP1_STATE_END = H1_A9_READ_KSV_LIST
> > @@ -188,7 +188,7 @@ enum mod_hdcp_hdcp1_dp_state_id {
> >       D1_A1_EXCHANGE_KSVS,
> >       D1_A23_WAIT_FOR_R0_PRIME,
> >       D1_A2_COMPUTATIONS_A3_VALIDATE_RX_A5_TEST_FOR_REPEATER,
> > -     D1_A4_AUTHENICATED,
> > +     D1_A4_AUTHENTICATED,
> >       D1_A6_WAIT_FOR_READY,
> >       D1_A7_READ_KSV_LIST,
> >       HDCP1_DP_STATE_END = D1_A7_READ_KSV_LIST,
> > diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
> > index 9e7302eac299..3db4a7da414f 100644
> > --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
> > +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
> > @@ -476,7 +476,7 @@ enum mod_hdcp_status mod_hdcp_hdcp1_execution(struct mod_hdcp *hdcp,
> >               status = computations_validate_rx_test_for_repeater(hdcp,
> >                               event_ctx, input);
> >               break;
> > -     case H1_A45_AUTHENICATED:
> > +     case H1_A45_AUTHENTICATED:
> >               status = authenticated(hdcp, event_ctx, input);
> >               break;
> >       case H1_A8_WAIT_FOR_READY:
> > @@ -513,7 +513,7 @@ extern enum mod_hdcp_status mod_hdcp_hdcp1_dp_execution(struct mod_hdcp *hdcp,
> >               status = computations_validate_rx_test_for_repeater(
> >                               hdcp, event_ctx, input);
> >               break;
> > -     case D1_A4_AUTHENICATED:
> > +     case D1_A4_AUTHENTICATED:
> >               status = authenticated_dp(hdcp, event_ctx, input);
> >               break;
> >       case D1_A6_WAIT_FOR_READY:
> > diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_transition.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_transition.c
> > index 1d187809b709..136b8011ff3f 100644
> > --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_transition.c
> > +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_transition.c
> > @@ -81,11 +81,11 @@ enum mod_hdcp_status mod_hdcp_hdcp1_transition(struct mod_hdcp *hdcp,
> >                       set_state_id(hdcp, output, H1_A8_WAIT_FOR_READY);
> >               } else {
> >                       callback_in_ms(0, output);
> > -                     set_state_id(hdcp, output, H1_A45_AUTHENICATED);
> > +                     set_state_id(hdcp, output, H1_A45_AUTHENTICATED);
> >                       HDCP_FULL_DDC_TRACE(hdcp);
> >               }
> >               break;
> > -     case H1_A45_AUTHENICATED:
> > +     case H1_A45_AUTHENTICATED:
> >               if (input->link_maintenance != PASS) {
> >                       /* 1A-07: consider invalid ri' a failure */
> >                       /* 1A-07a: consider read ri' not returned a failure */
> > @@ -129,7 +129,7 @@ enum mod_hdcp_status mod_hdcp_hdcp1_transition(struct mod_hdcp *hdcp,
> >                       break;
> >               }
> >               callback_in_ms(0, output);
> > -             set_state_id(hdcp, output, H1_A45_AUTHENICATED);
> > +             set_state_id(hdcp, output, H1_A45_AUTHENTICATED);
> >               HDCP_FULL_DDC_TRACE(hdcp);
> >               break;
> >       default:
> > @@ -224,11 +224,11 @@ enum mod_hdcp_status mod_hdcp_hdcp1_dp_transition(struct mod_hdcp *hdcp,
> >                       set_watchdog_in_ms(hdcp, 5000, output);
> >                       set_state_id(hdcp, output, D1_A6_WAIT_FOR_READY);
> >               } else {
> > -                     set_state_id(hdcp, output, D1_A4_AUTHENICATED);
> > +                     set_state_id(hdcp, output, D1_A4_AUTHENTICATED);
> >                       HDCP_FULL_DDC_TRACE(hdcp);
> >               }
> >               break;
> > -     case D1_A4_AUTHENICATED:
> > +     case D1_A4_AUTHENTICATED:
> >               if (input->link_integiry_check != PASS ||
> >                               input->reauth_request_check != PASS) {
> >                       /* 1A-07: restart hdcp on a link integrity failure */
> > @@ -295,7 +295,7 @@ enum mod_hdcp_status mod_hdcp_hdcp1_dp_transition(struct mod_hdcp *hdcp,
> >                       fail_and_restart_in_ms(0, &status, output);
> >                       break;
> >               }
> > -             set_state_id(hdcp, output, D1_A4_AUTHENICATED);
> > +             set_state_id(hdcp, output, D1_A4_AUTHENTICATED);
> >               HDCP_FULL_DDC_TRACE(hdcp);
> >               break;
> >       default:
> > diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_log.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_log.c
> > index d868f556d180..3982ced5f969 100644
> > --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_log.c
> > +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_log.c
> > @@ -136,8 +136,8 @@ char *mod_hdcp_state_id_to_str(int32_t id)
> >               return "H1_A1_EXCHANGE_KSVS";
> >       case H1_A2_COMPUTATIONS_A3_VALIDATE_RX_A6_TEST_FOR_REPEATER:
> >               return "H1_A2_COMPUTATIONS_A3_VALIDATE_RX_A6_TEST_FOR_REPEATER";
> > -     case H1_A45_AUTHENICATED:
> > -             return "H1_A45_AUTHENICATED";
> > +     case H1_A45_AUTHENTICATED:
> > +             return "H1_A45_AUTHENTICATED";
> >       case H1_A8_WAIT_FOR_READY:
> >               return "H1_A8_WAIT_FOR_READY";
> >       case H1_A9_READ_KSV_LIST:
> > @@ -150,8 +150,8 @@ char *mod_hdcp_state_id_to_str(int32_t id)
> >               return "D1_A23_WAIT_FOR_R0_PRIME";
> >       case D1_A2_COMPUTATIONS_A3_VALIDATE_RX_A5_TEST_FOR_REPEATER:
> >               return "D1_A2_COMPUTATIONS_A3_VALIDATE_RX_A5_TEST_FOR_REPEATER";
> > -     case D1_A4_AUTHENICATED:
> > -             return "D1_A4_AUTHENICATED";
> > +     case D1_A4_AUTHENTICATED:
> > +             return "D1_A4_AUTHENTICATED";
> >       case D1_A6_WAIT_FOR_READY:
> >               return "D1_A6_WAIT_FOR_READY";
> >       case D1_A7_READ_KSV_LIST:
> >
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
