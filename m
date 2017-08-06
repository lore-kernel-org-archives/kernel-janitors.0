From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 06 Aug 2017 09:54:17 +0000
Subject: Re: [PATCH 0/7] cfag12864b: Fine-tuning for cfag12864b_init()
Message-Id: <176b6eff-252e-2b2c-7130-ecbd7ebe21d3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <3d24b514-4e99-86ea-d69e-49a0b1edd286@users.sourceforge.net>
In-Reply-To: <3d24b514-4e99-86ea-d69e-49a0b1edd286@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

> Date: Sat, 10 Sep 2016 16:17:01 +0200
> 
> Some update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (7):
>   Use kmalloc_array()
>   Delete an error message for a failed kmalloc_array() call
>   Return directly if the driver "ks0108" was not initialized
>   Return directly after a failed get_zeroed_page()
>   Rename jump labels
>   Return an error code only as a constant
>   Adjust two checks for null pointers
> 
>  drivers/auxdisplay/cfag12864b.c | 37 +++++++++++++------------------------
>  1 file changed, 13 insertions(+), 24 deletions(-)

Would you like to take another look at change possibilities
for this software module?

Regards,
Markus
