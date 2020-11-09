From: "Singh, Sandeep" <ssingh1@amd.com>
Date: Mon, 09 Nov 2020 17:20:41 +0000
Subject: Re: [PATCH][next] SFH: fix error return check for -ERESTARTSYS
Message-Id: <9cc9cf14-4f71-c691-caee-268c9f29ac4e@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201030143002.535531-1-colin.king@canonical.com>
In-Reply-To: <20201030143002.535531-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Nehal Shah <nehal-bakulchandra.shah@amd.com>, Sandeep Singh <sandeep.singh@amd.com>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 10/30/2020 8:00 PM, Colin King wrote:
> [CAUTION: External Email]
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the check for the error return code -ERESTARTSYS is dead code
> and never executed because a previous check for ret < 0 is catching this
> and returning -ETIMEDOUT instead.  Fix this by checking for -ERESTARTSYS
> before the more generic negative error code.
>
> Addresses-Coverity: ("Logically dead code")
> Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")

Thank you for the patch ..looks good to me.

Reviewed-by: Sandeep Singh <sandeep.singh@amd.com>

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/hid/amd-sfh-hid/amd_sfh_hid.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
> index a471079a3bd0..4f989483aa03 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
> @@ -88,10 +88,10 @@ static int amdtp_wait_for_response(struct hid_device *hid)
>                  ret = wait_event_interruptible_timeout(hid_data->hid_wait,
>                                                         cli_data->request_done[i],
>                                                         msecs_to_jiffies(AMD_SFH_RESPONSE_TIMEOUT));
> -       if (ret < 0)
> -               return -ETIMEDOUT;
> -       else if (ret = -ERESTARTSYS)
> +       if (ret = -ERESTARTSYS)
>                  return -ERESTARTSYS;
> +       else if (ret < 0)
> +               return -ETIMEDOUT;
>          else
>                  return 0;
>   }
> --
> 2.27.0
>
