From: Hans de Goede <hdegoede@redhat.com>
Date: Tue, 03 Nov 2020 09:36:01 +0000
Subject: Re: [PATCH] MAINTAINERS: rectify DELL WMI SYSMAN DRIVERS section
Message-Id: <0eea5f3d-b3bc-e3b4-1b7f-d6528f33bd44@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201029114425.22520-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201029114425.22520-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Divya Bharathi <divya.bharathi@dell.com>, platform-driver-x86@vger.kernel.org
Cc: Mario Limonciello <mario.limonciello@dell.com>, Prasanth KSR <prasanth.ksr@dell.com>, Joe Perches <joe@perches.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On 10/29/20 12:44 PM, Lukas Bulwahn wrote:
> Commit e8a60aa7404b ("platform/x86: Introduce support for Systems
> Management Driver over WMI for Dell Systems") added a new section
> DELL WMI SYSMAN DRIVERS in MAINTAINERS, but slipped in a typo.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches    F:    drivers/platform/x86/dell-wmi-syman/*
> 
> Point the file entry to the right location and add an entry for its
> Documentation while at it.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>


> ---
> Divya, please ack.
> 
> Hans, please pick this minor non-urgent patch into your -next x86 platform
> driver tree on top of commit mentioned above.
> 
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b8a905354ee9..a0a86daa9c51 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4974,7 +4974,8 @@ M:	Mario Limonciello <mario.limonciello@dell.com>
>  M:	Prasanth Ksr <prasanth.ksr@dell.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> -F:	drivers/platform/x86/dell-wmi-syman/*
> +F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
> +F:	drivers/platform/x86/dell-wmi-sysman/
>  
>  DELL WMI NOTIFICATIONS DRIVER
>  M:	Matthew Garrett <mjg59@srcf.ucam.org>
> 
