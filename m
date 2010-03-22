From: "Darrick J. Wong" <djwong@us.ibm.com>
Date: Mon, 22 Mar 2010 18:13:27 +0000
Subject: Re: [patch] power_meter: acpi_device_class "power_meter_resource"
Message-Id: <20100322181327.GG22820@tux1.beaverton.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100319114920.GP5331@bicker>
In-Reply-To: <20100319114920.GP5331@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Len Brown <lenb@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, =?iso-8859-1?Q?M=E1rton_N=E9meth?= <nm127@freemail.hu>, Lin Ming <ming.m.lin>

On Fri, Mar 19, 2010 at 02:49:20PM +0300, Dan Carpenter wrote:
> acpi_device_class can only be 19 characters and a NULL terminator.
> 
> The current code has a buffer overflow in acpi_power_meter_add():
>        strcpy(acpi_device_class(device), ACPI_POWER_METER_CLASS);
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> Feel free to change the name to anything you like.

How hard would it be to increase the size of that buffer?

(Or, is there a need to have "_resource" in that string at all?)

--D
