From: Hans de Goede <hdegoede@redhat.com>
Date: Mon, 06 Aug 2012 08:21:35 +0000
Subject: Re: [PATCH] [media] gspca: dubious one-bit signed bitfield
Message-Id: <501F7E8F.1090809@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344170066-19727-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1344170066-19727-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emil Goode <emilgoode@gmail.com>
Cc: mchehab@infradead.org, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

On 08/05/2012 02:34 PM, Emil Goode wrote:
> This patch changes some signed integers to unsigned because
> they are not intended for negative values and sparse
> is making noise about it.
>
> Sparse gives eight of these errors:
> drivers/media/video/gspca/ov519.c:144:29: error: dubious one-bit signed bitfield
>
> Signed-off-by: Emil Goode <emilgoode@gmail.com>

Thanks, I'll add this to my gspca tree.

Regards,

Hans
