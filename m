From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 02 Jul 2018 13:15:04 +0000
Subject: Re: [PATCH] platform/x86: dell-smbios-wmi: make function dell_smbios_wmi_call static
Message-Id: <CAHp75Vf8AAnmvdWsUPyRY+13vi43Ta=FiaVEhNwn1+QyN88K0A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180630121024.18993-1-colin.king@canonical.com>
In-Reply-To: <20180630121024.18993-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Jun 30, 2018 at 3:10 PM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The function dell_smbios_wmi_call is local to the source and does not
> need to be in global scope, so make it static.
>
> Cleans up sparse warning:
> symbol 'dell_smbios_wmi_call' was not declared. Should it be static?
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/platform/x86/dell-smbios-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell-smbios-wmi.c
> index fbefedb1c172..88afe5651d24 100644
> --- a/drivers/platform/x86/dell-smbios-wmi.c
> +++ b/drivers/platform/x86/dell-smbios-wmi.c
> @@ -82,7 +82,7 @@ static int run_smbios_call(struct wmi_device *wdev)
>         return 0;
>  }
>
> -int dell_smbios_wmi_call(struct calling_interface_buffer *buffer)
> +static int dell_smbios_wmi_call(struct calling_interface_buffer *buffer)
>  {
>         struct wmi_smbios_priv *priv;
>         size_t difference;
> --
> 2.17.1
>



-- 
With Best Regards,
Andy Shevchenko
