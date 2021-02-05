From: Jiri Kosina <jikos@kernel.org>
Date: Fri, 05 Feb 2021 09:13:54 +0000
Subject: Re: [PATCH] HID: lg-g15: make a const array static, makes object smaller
Message-Id: <nycvar.YFH.7.76.2102051013440.28696@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210204172748.107406-1-colin.king@canonical.com>
In-Reply-To: <20210204172748.107406-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 4 Feb 2021, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the const array led_names on the stack but instead make
> it static. Makes the object code smaller by 79 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   19686	   7952	    256	  27894	   6cf6	drivers/hid/hid-lg-g15.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   19543	   8016	    256	  27815	   6ca7	drivers/hid/hid-lg-g15.o
> 
> (gcc version 10.2.0)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.

-- 
Jiri Kosina
SUSE Labs
