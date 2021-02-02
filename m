From: Hans de Goede <hdegoede@redhat.com>
Date: Tue, 02 Feb 2021 14:05:14 +0000
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: rectify length of title underline
Message-Id: <3b91a535-b818-09be-456b-c728838612dc@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210129040849.26740-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210129040849.26740-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Nitin Joshi <njoshi1@lenovo.com>, platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On 1/29/21 5:08 AM, Lukas Bulwahn wrote:
> Commit d7cbe2773aed ("platform/x86: thinkpad_acpi: set keyboard language")
> adds information on keyboard setting to the thinkpad documentation, but
> made the subsection title underline too short.
> 
> Hence, make htmldocs warns:
> 
>   Documentation/admin-guide/laptops/thinkpad-acpi.rst:1472: \
>     WARNING: Title underline too short.
> 
> Rectify length of subsection title underline.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
> applies cleanly on next-20210128
> 
> Nitin, please ack.
> 
> Hans, please pick this minor fixup for your platform/x86 -next tree.
> 
>  Documentation/admin-guide/laptops/thinkpad-acpi.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index b1188f05a99a..0e4c5bb7fb70 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -1469,7 +1469,7 @@ Sysfs notes
>  
>  
>  Setting keyboard language
> --------------------
> +-------------------------
>  
>  sysfs: keyboard_lang
>  
> 
