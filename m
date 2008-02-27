From: Karol Kozimor <sziwan@hell.org.pl>
Date: Wed, 27 Feb 2008 17:03:16 +0000
Subject: Re: [PATCH 2/9] drivers/acpi/asus_acpi.c: Correct use of.and &
Message-Id: <7C626792-02A6-4BE6-B5F2-D75899F3990C@hell.org.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802262142120.18200@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0802262142120.18200@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: corentincj@iksaif.net, sziwan@users.sourceforge.net, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 26-02-2008, at 21:42, Julia Lawall wrote:
>  	if (invert)		/* invert target value */
> -		led_out = !led_out & 0x1;
> +		led_out = !(led_out & 0x1);
>
>  	if (!write_acpi_int(hotk->handle, ledname, led_out, NULL))
>  		printk(KERN_WARNING "Asus ACPI: LED (%s) write failed\n",


IIRC we're just supposed to flip the last bit here, so the original  
code is correct.
Best regards,

-- 
Karol Kozimor
sziwan@hell.org.pl


